from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
# Create your views here.
# from .pharm import svg
from rdkit import Chem
from .estimator import *
from .models import *
import json

def Pharm_Toys(req):
    # print("THIS IS THE REQ", req)
    # context = {"svg": svg}
    # print(req)

    molecule_list = Molecule.objects.all()
    num_drugs_viewed = req.session.get('num_drugs_viewed', 0)
    num_pkas_solved = req.session.get('num_pkas_solved', 0)
    num_fgs_solved = req.session.get('num_fgs_solved', 0)
    num_rotbs_solved = req.session.get('num_rotbs_solved', 0)
    num_maps_solved = req.session.get('num_maps_solved', 0)
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
            datamol = Molecule.objects.filter(Molecule_Name = req.GET['mol'])[0]
            litpka = datamol.LiteraturePka
            reference = datamol.Reference
        except:
            print(req.GET['mol'] + " not found in database.")
            litpka = 0
            reference = ""
        return JsonResponse({'molsvg': molsvg, 'invertmolsvg': invertmolsvg, 'estimates': estimates, 'props': props, 'rotbs': rotbs, 'fglist': fglist, 'litpka': litpka, 'reference': reference }, status=200)
    return render(req, "pharmaceutics/base.html", {'molecule_list':molecule_list})

def manySVG(req):
    if req.headers.get('x-requested-with') == 'XMLHttpRequest':
        if(len(req.GET['mols'].split(',')) > 4):
            print("too many drugs")
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
                svg = getSVG(smiles, showanswers=(req.GET['desccheck']=="true"), maptag=req.GET['maptag'])
                prop = json.dumps(getProperties(m))
            except:
                print("invalid mol name")
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
                print(name + " not found in database.")
                litpka = 0
                reference = ""



        return JsonResponse({'svgs': retsvgs, 'props': retprops, 'litpka': retlitpkas, 'reference': retreferences }, status=200)

def quiz1(req):
    quiz1_solve_time = req.session.get('quiz1_solve_time', 0)
    return render(req, "pharmaceutics/quiz1.html")
def quiz2(req):
    quiz2_solve_time = req.session.get('quiz2_solve_time', 0)
    return render(req, "pharmaceutics/quiz2.html")

def quiz1post(req):
    if req.method == "POST":
        req.session['quiz1_1']= req.POST['q1']
        req.session['quiz1_2']= req.POST['q2']
        req.session['quiz1_3']= req.POST['q3']
        req.session['quiz1_4']= req.POST['q4']
        req.session['quiz1_5']= req.POST['q5']

        return HttpResponse(status=200)

def quiz2post(req):
    if req.method == "POST":
        req.session['quiz2_1']= req.POST['q1']
        req.session['quiz2_2']= req.POST['q2']
        req.session['quiz2_3']= req.POST['q3']
        req.session['quiz2_4']= req.POST['q4']
        req.session['quiz2_5']= req.POST['q5']

        return HttpResponse(status=200)