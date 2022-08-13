from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
# Create your views here.
# from .pharm import svg
from rdkit import Chem
from .estimator import *

import json

def Pharm_Toys(req):
    # print("THIS IS THE REQ", req)
    # context = {"svg": svg}
    # print(req)
    
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
        return JsonResponse({'molsvg': molsvg, 'invertmolsvg': invertmolsvg, 'estimates': estimates, 'props': props, 'rotbs': rotbs, 'fglist': fglist}, status=200)
    return render(req, "Pharmaceutics/base.html")


def pka(req):
    print(req)
    if req.method == "POST":
        return "pka post request"