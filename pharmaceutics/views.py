from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
# Create your views here.
# from .pharm import svg
from rdkit import Chem
from .estimator import *
from .models import *
import json

empty = []

def Pharm_Toys(req):
    # print("THIS IS THE REQ", req)
    # context = {"svg": svg}
    # print(req)

    #if user doesnt exist make a new user
    # if req.session.test_cookie_worked():
    #     req.session.delete_test_cookie()
    #     return HttpResponse("You're logged in.")
    
    if not req.session.exists(req.session.session_key):
        print("making session")
        req.session.create()
    if(not User.objects.filter(Key = req.session.session_key).exists()):
        print("making a user")
        User.objects.create(Key = req.session.session_key)

    print(req.session.session_key)
    molecule_list = Molecule.objects.all()
    # num_drugs_viewed = req.session.get('num_drugs_viewed', 0)
    # num_pkas_solved = req.session.get('num_pkas_solved', 0)
    # num_fgs_solved = req.session.get('num_fgs_solved', 0)
    # num_rotbs_solved = req.session.get('num_rotbs_solved', 0)
    # num_maps_solved = req.session.get('num_maps_solved', 0)
    if req.headers.get('x-requested-with') == 'XMLHttpRequest':
        # Scraper()
        print("attempting svg get")
        m = Chem.MolFromSmiles(req.GET['smiles'])
        estimates = estimateMolecule(m) #estimates is a list [id, index, estpka, type]
        props = json.dumps(getProperties(m))
        print(props)
        fglist = getIDgroups(m)
        print(fglist)
        #print(estimates)
        molsvg = getSVG(req.GET['smiles'], estimates = estimates, showanswers=(req.GET['desccheck']=="true"), maptag=req.GET['maptag'])
        invertmolsvg = getRandomMap(req.GET['smiles'], maptag=req.GET['maptag'])
        rotbs = getRotatableBonds(m)
        try:
            datamol = Molecule.objects.filter(Molecule_Name = req.GET['mol'].strip().capitalize())[0]
            # visited_drugs.append(datamol.Molecule_Name)
            litpka = datamol.LiteraturePka
            reference = datamol.Reference
        except:
            datamol = Molecule.objects.create(
                Molecule_Name = req.GET['mol'].strip().capitalize(),
                SMILES = req.GET['smiles']
                )
            print(req.GET['mol'] + " not found in database.")
            litpka = 0
            reference = ""

        #save the query
        user=User.objects.get(Key = req.session.session_key)
        print(user)
        mode = req.GET['mapmodecheck'] == "true"
        q = Query(
            User=user,
            Molecules=datamol,
            Time= req.GET['timestamp'], 
            MapMode=mode
        )
        # q.save()

        iontype = datamol.Ion_Type

        return JsonResponse({'molsvg': molsvg, 'invertmolsvg': invertmolsvg, 'estimates': estimates, 'props': props, 'rotbs': rotbs, 'fglist': fglist, 'litpka': litpka, 'reference': reference, 'iontype': iontype }, status=200)
    
    req.session.set_test_cookie()
    return render(req, "pharmaceutics/base.html", {'molecule_list':molecule_list})

def manySVG(req):
    if not req.session.session_key:
        req.session.create()
    if req.headers.get('x-requested-with') == 'XMLHttpRequest':
        if(len(req.GET['mols'].split(',')) > 4):
            print("too many drugs, limit to 4")
            return
        # Scraper()
        retsvgs = []
        retprops = []
        retlitpkas = []
        retreferences = []
        print(req)
        for name in req.GET['mols'].split(','): #mols is list of names
            try:
                smiles = nameToSMILES(name.strip())
                m = Chem.MolFromSmiles(nameToSMILES(name))
                estimates = estimateMolecule(m)
                svg = getSVG(smiles, estimates = estimates, showanswers=(req.GET['desccheck']=="true"), maptag=req.GET['maptag'])
                prop = json.dumps(getProperties(m))
            except Exception as e:
                print(e)
                print("invalid mol name")
                continue
        # print("attempting svg get" + i)
        # m = Chem.MolFromSmiles(req.GET['smiles'])
        # estimates = estimateMolecule(m) #estimates is a list [id, index, estpka, type]
        # props = json.dumps(getProperties(m))
        # print(props)
        # fglist = getIDgroups(m)
        # print(fglist)
        # #print(estimates)
        # molsvg = getSVG(req.GET['smiles'], estimates = estimates, showanswers=(req.GET['desccheck']=="true"), maptag=req.GET['maptag'])
        # invertmolsvg = getRandomMap(req.GET['smiles'], maptag=req.GET['maptag'])
        # rotbs = getRotatableBonds(m)
            try:
                datamol = Molecule.objects.filter(Molecule_Name = name.strip().capitalize())[0]
                litpka = datamol.LiteraturePka
                reference = datamol.Reference
                #build the response arrays, need svgs, props
                retsvgs.append(svg)
                retprops.append(prop)
                retlitpkas.append(litpka)
                retreferences.append(reference)

            except:
                datamol = Molecule.objects.create(
                    Molecule_Name = name.strip().capitalize(),
                    SMILES = smiles
                    )
                print(name + " not found in database.")
                litpka = 0
                reference = ""

            #save the query
            user=User.objects.get(Key = req.session.session_key)
            q = Query(
                User=user,
                Molecules=datamol,
                Time= req.GET['timestamp'], 
                MapMode=False
            )
            # q.save()





        return JsonResponse({'svgs': retsvgs, 'props': retprops, 'litpka': retlitpkas, 'reference': retreferences }, status=200)

def quiz1(req):
    if not req.session.session_key:
        req.session.create()
    if(not User.objects.filter(Key = req.session.session_key).exists()):
        print("making a user")
        newuser = User(Key = req.session.session_key)
        newuser.save()
    quiz1_solve_time = req.session.get('quiz1_solve_time', 0)
    return render(req, "pharmaceutics/quiz1.html")
def quiz2(req):
    if not req.session.session_key:
        req.session.create()
    if(not User.objects.filter(Key = req.session.session_key).exists()):
        print("making a user")
        newuser = User(Key = req.session.session_key)
        newuser.save()
    quiz2_solve_time = req.session.get('quiz2_solve_time', 0)
    return render(req, "pharmaceutics/quiz2.html")

def quiz1post(req):
    if req.method == "POST":
        print(req.POST)
        user=User.objects.get(Key = req.session.session_key)
        q = Quiz1Attempt(
            User=user, 
            Timestamp = req.POST.get('timestamp'), 
            Secs_Taken = req.POST.get('seconds'),
            Answer1= req.POST.get('q1'), 
            Answer2= req.POST.get('q2'),
            Answer3= req.POST.get('q3'),
            Answer4= req.POST.get('q4'),
            Answer5= req.POST.get('q5'),
        )
        q.save()
        return HttpResponse(status=200)

def quiz2post(req):
    if req.method == "POST":
        q = Quiz2Attempt(
            User=User.objects.get(Key = req.session.session_key), 
            Timestamp = req.POST.get('timestamp'), 
            Secs_Taken = req.POST.get('seconds'),
            Answer1=req.POST.get('q1'), 
            Answer2=req.POST.get('q2'),
            Answer3=req.POST.get('q3'),
            Answer4=req.POST.get('q4'),
            Answer5=req.POST.get('q5'),
        )
        q.save()
        return HttpResponse(status=200)

#pkasolvepost, fgsolvepost, rotbsolvepost, mapmodesolvepost
def pkasolvepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        user.Pkas_Solved.add(datamol)
        return HttpResponse(status=200)
def fgsolvepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        user.FGs_Solved.add(datamol)
        return HttpResponse(status=200)
def rotbsolvepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        user.Rotbs_Solved.add(datamol)
        return HttpResponse(status=200)
def mapmodesolvepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        user.Maps_Solved.add(datamol)
        return HttpResponse(status=200)
def qb2solvepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        user.Qb2s_solved.add(datamol)
        return HttpResponse(status=200)
def subjectivepost(req):
    if req.method == "POST":
        datamol = Molecule.objects.get(Molecule_Name = req.POST.get('mol').strip().capitalize())
        user = User.objects.get(Key = req.session.session_key)
        difficulty = req.POST.get('difficulty')
        sf = SubjectiveFeedback(
            User = user,
            Molecule = datamol,
            Difficulty = difficulty,
        )
        sf.save()
        return HttpResponse(status=200)