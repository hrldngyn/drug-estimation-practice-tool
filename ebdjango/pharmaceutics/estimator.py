<<<<<<< Updated upstream:ebdjango/pharmaceutics/estimator.py
import urllib

from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit.Chem import rdchem
from rdkit.Chem import Draw
from rdkit.Chem.Draw import rdMolDraw2D
from rdkit.Chem.Draw import SimilarityMaps
from rdkit.Chem import Fragments
from rdkit.Chem import Descriptors
from rdkit.Chem import rdMolDescriptors

# import matplotlib.pyplot as pyplot
# import matplotlib.image as mpimg

import requests
import random


from collections.abc import Iterable

import os


os.chdir(os.path.dirname(__file__))

SP3 = Chem.rdchem.HybridizationType.SP3

groups = {
        "amide": "C(=O)-N",
        "resonance_amine_pattern": "C=C-N-C=C",
        "amidine": "C(=N)(-N)-[!#7]",
        "amine_primary": "[NH2,nH2]",
        "amine_secondary": "[NH1,nH1]",
        "amine_tertiary": "[NH,nH]",
        "aniline": "c-[NX3;!$(N=*)]",
        #"beta_lactam": "N1C(=O)CC1",
        "oxygen": "[#8]",
        "COOH": "C(=O)[O;H1,-]",
        #"COOH_al": "C-C(=O)[O;H1,-]",
        #"COOH_ar": "c-C(=O)[O;H1,-]",
        "carbonyl": "[CX3]=[OX1]" ,
        "C_aromatic": "[$([cX3](:*):*),$([cX2+](:*):*)]",
        "ester": "[#6][CX3](=O)[OX2H0][#6]",
        "guanidine": "C(=N)(N)N",
        "nitrile": "[NX1]#[CX2]",
        "nitro": "[$([NX3](=O)=O),$([NX3+](=O)[O-])][!#8]",
        "phenol": "[OX2H]-c1ccccc1",
        "pyridine": "n1ccccc1",
        "sulfur": "[S]",
        "sulfenamide": "S-N",
        "sulfonamide": "N-S(=,-[OX1;+0,-1])(=,-[OX1;+0,-1])-[#6]",
        "sulfoxide": "[$([#16X3](=[OX1])([#6])[#6]),$([#16X3+]([OX1-])([#6])[#6])]",
        "tetrazole": "c1nnnn1",
        "phosphorous": "[P]",
        "halogen": "[F,Cl,Br,I]",
}

IDgroups = {
    "Amide": "C(=O)-N",
    "Ester": "[#6][CX3](=O)[OX2H0][#6]",
    "Ether": "[OD2]([#6])[#6]",
    "Ketone": "[#6][CX3](=O)[#6]",
    "Nitrile": "[NX1]#[CX2]",
    "Sulfonamide": "N-S(=,-[OX1;+0,-1])(=,-[OX1;+0,-1])-[#6]",
    "Sulfonylurea": "[#6](=[#8])(-[#7])-[#7]-[#16](=[#8])=[#8]",
    "Sulfoxide": "[$([#16X3](=[OX1])([#6])[#6]),$([#16X3+]([OX1-])([#6])[#6])]",
    "Tetrazole": "c1nnnn1",
    "NSAA": "[$([NX3,NX4+][CX4H]([*])[CX3](=[OX1])[O,N]);!$([$([$([NX3H,NX4H2+]),$([NX3](C)(C)(C))]1[CX4H]([CH2][CH2][CH2]1)[CX3](=[OX1])[OX2H,OX1-,N]),$([$([NX3H2,NX4H3+]),$([NX3H](C)(C))][CX4H2][CX3](=[OX1])[OX2H,OX1-,N]),$([$([NX3H2,NX4H3+]),$([NX3H](C)(C))][CX4H]([$([CH3X4]),$([CH2X4][CH2X4][CH2X4][NHX3][CH0X3](=[NH2X3+,NHX2+0])[NH2X3]),$([CH2X4][CX3](=[OX1])[NX3H2]),$([CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][SX2H,SX1H0-]),$([CH2X4][CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][#6X3]1:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]1),$([CHX4]([CH3X4])[CH2X4][CH3X4]),$([CH2X4][CHX4]([CH3X4])[CH3X4]),$([CH2X4][CH2X4][CH2X4][CH2X4][NX4+,NX3+0]),$([CH2X4][CH2X4][SX2][CH3X4]),$([CH2X4][cX3]1[cX3H][cX3H][cX3H][cX3H][cX3H]1),$([CH2X4][OX2H]),$([CHX4]([CH3X4])[OX2H]),$([CH2X4][cX3]1[cX3H][nX3H][cX3]2[cX3H][cX3H][cX3H][cX3H][cX3]12),$([CH2X4][cX3]1[cX3H][cX3H][cX3]([OHX2,OH0X1-])[cX3H][cX3H]1),$([CHX4]([CH3X4])[CH3X4])])[CX3](=[OX1])[OX2H,OX1-,N])])]",
    #"SAA": "[$([CH3X4]),$([CH2X4][CH2X4][CH2X4][NHX3][CH0X3](=[NH2X3+,NHX2+0])[NH2X3]),$([CH2X4][CX3](=[OX1])[NX3H2]),$([CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][SX2H,SX1H0-]),$([CH2X4][CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][#6X3]1:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]1),$([CHX4]([CH3X4])[CH2X4][CH3X4]),$([CH2X4][CHX4]([CH3X4])[CH3X4]),$([CH2X4][CH2X4][CH2X4][CH2X4][NX4+,NX3+0]),$([CH2X4][CH2X4][SX2][CH3X4]),$([CH2X4][cX3]1[cX3H][cX3H][cX3H][cX3H][cX3H]1),$([CH2X4][OX2H]),$([CHX4]([CH3X4])[OX2H]),$([CH2X4][cX3]1[cX3H][nX3H][cX3]2[cX3H][cX3H][cX3H][cX3H][cX3]12),$([CH2X4][cX3]1[cX3H][cX3H][cX3]([OHX2,OH0X1-])[cX3H][cX3H]1),$([CHX4]([CH3X4])[CH3X4])]"
    "GAA": "[NX3,NX4+][CX4H]([*])[CX3](=[OX1])[O,N]",
}


exclude_groups = groups.copy()
keep_groups = (
        "amine_primary",
        "amine_secondary",
        "amine_tertiary",
        "COOH",
        "oxygen",
        "phenol"
    )

for k in keep_groups:
    exclude_groups.pop(k)

#chem.fragments docs
acids = {
    "COOH_al": "C-C(=O)[O;H1,-]",
    "COOH_ar": "c-C(=O)[O;H1,-]",

}

bases = {

}

def flatten(l):
    for el in l:
        if isinstance(el, Iterable) and not isinstance(el, (str, bytes)):
            yield from flatten(el)
        else:
            yield el

def getEWGs(mol):
    EWGindices = []
    for key in groups:
        patt = Chem.MolFromSmarts(groups[key])
        EWGindices.append(mol.GetSubstructMatches(patt))
    print(EWGindices)
    return set(flatten(EWGindices))

def draw(m):    
    d = rdMolDraw2D.MolDraw2DCairo(1000, 1000) # or MolDraw2DSVG to get SVGs

    d.drawOptions().addStereoAnnotation = True
    d.drawOptions().addAtomIndices = True
    d.DrawMolecule(m)
    d.FinishDrawing()
    d.WriteDrawingText('atom_annotation_1.png')

#ALGORITHM CODE

def setMol(smiles):
    m = Chem.MolFromSmiles(smiles)

#implement hierarchical acid/base identification, i.e. benzoic acid recognized before normal acid, amide recognized before amine?
    #id groups, exclude
        #check if acidic or basic based on above dictionaries
            #estimate(index, true)
    #also create array of groups with output estimation data

#make below nicer with enums and generator expressions
#basic: bool

def isAliphaticCarbon(atom):
    return (atom.GetHybridization() == SP3 and atom.GetSymbol() == 'C')

#deprecated
def estimate(index, ewgids, parent, basic=False): #index is the 0 atom to draw distance from
    searched = [index]
    b = int(basic) + 1
    subtracted = []
    subtraction = 0

    #find carbonyl locations
        #check if aliphatic carbon
    #if in searched, check that path is shortest

    for c in m.GetAtomWithIdx(index).GetNeighbors(): #for the neighbors of the 0 atom (c is 0 away)
        print("Searching " + str(c.GetIdx()))
        searched.append(c.GetIdx())
        # print(c.GetHybridization() == SP3)
        # print(c.GetSymbol() == 'C')
        if(c.GetHybridization() == SP3 and c.GetSymbol() == 'C'):
            #for d in (d for d in c.GetNeighbors() if d.GetIdx() not in searched): #d is 1 away
            for d in c.GetNeighbors():
                if d.GetIdx() not in searched:   
                    print("Searching " + str(d.GetIdx()))
                    searched.append(d.GetIdx())
                    if(d.GetHybridization() == SP3 and d.GetSymbol() == 'C'):
                        for e in (e for e in d.GetNeighbors() if e.GetIdx() not in searched): #e is 2 away
                            print("Searching " + str(e.GetIdx()))
                            searched.append(e.GetIdx())
                            if(e.GetHybridization() == SP3 and e.GetSymbol() == 'C'):
                                for f in (f for f in e.GetNeighbors() if f.GetIdx() not in searched): #f is 3 away
                                    print("Searching " + str(f.GetIdx()))
                                    searched.append(f.GetIdx())
                                    if(f.GetHybridization() == SP3 and f.GetSymbol() == 'C'):
                                        for g in (g for g in f.GetNeighbors() if g.GetIdx() not in searched): #g is 4 away
                                            print("Searching " + str(g.GetIdx()))
                                            searched.append(g.GetIdx())
                                            if g.GetIdx() in ewgids:
                                                if (g.GetIsAromatic()):
                                                    subtraction += 0.075*b
                                                else:
                                                    subtraction += 0.15*b
                                                subtracted.append(g.GetIdx())
                                    elif(f.GetIdx() in ewgids):
                                        if(f.GetIsAromatic()):
                                            subtraction += 0.2*b
                                        else:
                                            subtraction += 0.4*b
                                        subtracted.append(f.GetIdx())
                            elif e.GetIdx() in ewgids:
                                if (e.GetIsAromatic()):
                                    subtraction += 0.45*b
                                else:
                                    subtraction += 0.9*b
                                subtracted.append(e.GetIdx())
                    elif d.GetIdx() in ewgids:
                        if (d.GetIsAromatic()):
                            subtraction += 0.45*b
                        else:
                            subtraction += 0.9*b
                        subtracted.append(d.GetIdx())
    #add in check for amine in ring
    if m.GetAtomWithIdx(index).GetSymbol() == 'N' and m.GetAtomWithIdx(index).IsInRing():
        subtraction += 1


    print("Setting prop for index " + str(index) + " as " + str(round(parent - subtraction, 4)))
    print(m.GetAtomWithIdx(index).SetProp("atomNote", "\nEst. pKa = " + str(round(parent - subtraction, 4))))
    print("Subtracted indices from " + str(index) + ": " + str(subtracted))
    return round(parent - subtraction, 4)

def BFestimate(m, index, ewgids, parent, basic=False): #breadth-first algorithm
    searched = [index]
    bval = int(basic) + 1
    subtracted = []
    subtraction = 0
    zeroaway, oneaway, twoaway, threeaway, fouraway = [], [], [], [], []

    for a in m.GetAtomWithIdx(index).GetNeighbors():
        searched.append(a.GetIdx())
        if(isAliphaticCarbon(a)):
            zeroaway.append(a.GetIdx())

    for a in zeroaway:
        for b in m.GetAtomWithIdx(a).GetNeighbors():
            if b.GetIdx() not in searched:
                searched.append(b.GetIdx())
                if(isAliphaticCarbon(b)):
                    oneaway.append(b.GetIdx())
                elif b.GetIdx() in ewgids:
                    if (b.GetIsAromatic()):
                        subtraction += 0.45*bval
                    else:
                        subtraction += 0.9*bval
                    subtracted.append(b.GetIdx())
    print("oneaway")
    print(oneaway)
    for b in oneaway:
        for c in m.GetAtomWithIdx(b).GetNeighbors():
            if c.GetIdx() not in searched:
                searched.append(c.GetIdx())
                if(isAliphaticCarbon(c)):
                    twoaway.append(c.GetIdx())
                elif c.GetIdx() in ewgids:
                    if (c.GetIsAromatic()):
                        subtraction += 0.45*bval
                    else:
                        subtraction += 0.9*bval
                    subtracted.append(c.GetIdx())
    print("twoaway")
    print(twoaway)
    for c in twoaway:
        for d in m.GetAtomWithIdx(c).GetNeighbors():
            if d.GetIdx() not in searched:
                searched.append(d.GetIdx())
                if(isAliphaticCarbon(d)):
                    threeaway.append(d.GetIdx())
                elif d.GetIdx() in ewgids:
                    if (d.GetIsAromatic()):
                        subtraction += 0.2*bval
                    else:
                        subtraction += 0.4*bval
                    subtracted.append(d.GetIdx())
    for d in threeaway:
        for e in m.GetAtomWithIdx(d).GetNeighbors():
            if e.GetIdx() not in searched:
                searched.append(e.GetIdx())
                if(isAliphaticCarbon(e)):
                    fouraway.append(e.GetIdx())
                elif e.GetIdx() in ewgids:
                    if (e.GetIsAromatic()):
                        subtraction += 0.075*bval
                    else:
                        subtraction += 0.15*bval
                    subtracted.append(e.GetIdx())
        
    if m.GetAtomWithIdx(index).GetSymbol() == 'N' and m.GetAtomWithIdx(index).IsInRing():
        subtraction += 1

    print("searched:")
    print(searched)
    print("Setting prop for index " + str(index) + " as " + str(round(parent - subtraction, 4)))
    print(m.GetAtomWithIdx(index).SetProp("atomNote", "\nEst. pKa = " + str(round(parent - subtraction, 4))))
    print("Subtracted indices from " + str(index) + ": " + str(subtracted))
    return [round(parent - subtraction, 4), subtracted]

def estimateMolecule(m):
    EWGindices = getEWGs(m)
    
    estimates = [[],[]] #most acidic, most basic
  
    excludeindices = [] #amide Ns, etc.

    for e in exclude_groups:
        for x in m.GetSubstructMatches(Chem.MolFromSmarts(exclude_groups[e])):
            excludeindices.append(x)

    excludeindices = set(flatten(excludeindices))
    print("excludeindices")
    print(excludeindices)
    # amideNindices = []
    # for x in m.GetSubstructMatches(Chem.MolFromSmarts(groups["amide"])):
    #     amideNindices.append(x[2])
    # print("amide Ns")
    # print(amideNindices)
    COOHindices = []
    acidlist = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts(acids["COOH_al"])):
        COOHindices.append(x[1]) #the C of the cooh
        excludeindices.add(x[3])
        print(str(x[3]) + "this is x 3 of cooh")
    benzoicindices = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts(acids["COOH_ar"])):
        benzoicindices.append(x[1]) #the C of the cooh
        excludeindices.add(x[3])
    Nindices = []
    aminelist =[]
    for x in m.GetSubstructMatches(Chem.MolFromSmarts('N')):
        if x[0] not in excludeindices:
            Nindices.append(x[0])
    
    phenolindices = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts('[OX2H]-c1ccccc1')):
        if x[0] not in excludeindices:
            phenolindices.append(x[0])
            excludeindices.add(x[0])
    # alcoholindices = []
    # for x in m.GetSubstructMatches(Chem.MolFromSmarts('[#6][OX2H]')):
    #     if x[1] not in excludeindices:
    #         alcoholindices.append(x[1])


    id = 1
    mostAcidic = [-1, 1000, "", []] #idx, pka, type = (acid, amine, etc), subtracted indices[]
    mostBasic = [-1, -1000, "", []]
    for i in COOHindices:
        est = BFestimate(m, i, EWGindices, 4.8) #[est, subtracted idxs]
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "Acid", est[1]]
            estimates[0] = mostAcidic

            # estimates.append([id, i, BFestimate(m, i, EWGindices, 4.8), "Acid"])
            # id += 1
    for i in benzoicindices:
        est = BFestimate(m, i, EWGindices, 4.2)
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "BAcid", est[1]]
            estimates[0] = mostAcidic

            # estimates.append([id, i, BFestimate(m, i, EWGindices, 4.2), "BAcid"])
            # id += 1
    # for i in alcoholindices:
    #     estimates.append([id, i, BFestimate(m, i, EWGindices, 14), "Alcohol"])
    #     id += 1
    for i in phenolindices:
        est = BFestimate(m, i, EWGindices, 10)
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "Phenol", est[1]]
            estimates[0] = mostAcidic

        # estimates.append([id, i, BFestimate(m, i, EWGindices, 10), "Phenol"])
        # id += 1
    for i in Nindices:
        est = BFestimate(m, i, EWGindices, 10.6, True)
        if(est[0] > mostBasic[1]):
            mostBasic = [i, est[0], "Amine", est[1]]
            estimates[1] = mostBasic

        # estimates.append([id, i, BFestimate(m, i, EWGindices, 10.6, True), "Amine"])
        # id += 1
    
    strippedEsts = [x for x in estimates if x != []]
    print("THESE ARE THE ESTIMATES PASSED TO JS")
    print(strippedEsts)
    return strippedEsts

def nameToSMILES(name):
    properties = 'Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    titleindex = properties.split(",").index("Title") - 1 #subtract 1 because CID always shows
    smilesindex = properties.split(",").index("CanonicalSMILES") + 1
    url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/" + name + "/property/" + properties + "/csv"
    
    if name == "":
        return Chem.MolFromSmiles("")
    try:
        u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
        response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
        response = requests.get(url)
        response.raise_for_status()
        
        data = response.text.splitlines()
        title = response.text.splitlines()[0].split(",")[titleindex]
        
        smiles = response.text.splitlines()[1].split(",")[smilesindex].strip('"')
        for l in data:
            if name.capitalize() in l:
                smiles = l.split(",")[smilesindex].strip('"')
        print(smiles)
        return smiles

    except requests.exceptions.HTTPError as errh:
        print(errh)
    except requests.exceptions.ConnectionError as errc:
        print(errc)
    except requests.exceptions.Timeout as errt:
        print(errt)
    except requests.exceptions.RequestException as err:
        print(err)

def SMILESToName(SMILES):
    properties = 'Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    titleindex = properties.split(",").index("Title") + 1 #add 1 because CID always shows
    url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/smiles/" + SMILES + "/property/" + properties + "/csv"
    
    if SMILES == "":
        return Chem.MolFromSmiles("")
    try:
        u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
        response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
        response = requests.get(url)
        response.raise_for_status()
        
        data = response.text.splitlines()
        name = data[1].split(",")[titleindex].strip('"')
        print(name)
        return(name)

    except requests.exceptions.HTTPError as errh:
        print(errh)
    except requests.exceptions.ConnectionError as errc:
        print(errc)
    except requests.exceptions.Timeout as errt:
        print(errt)
    except requests.exceptions.RequestException as err:
        print(err)

def getProperties(m):
    #MW, LogP, TPSA, HBD, HBA, RotB
    properties = {
        "molw": round(Chem.Descriptors.ExactMolWt(m), 3),
        "logp": round(Chem.Crippen.MolLogP(m), 3),
        "tpsa": Chem.MolSurf.TPSA(m),
        "hbd": Chem.Lipinski.NumHDonors(m),
        "hba": Chem.Lipinski.NOCount(m),
        "rotb": Chem.Lipinski.NumRotatableBonds(m)
    }

    print(properties)
    return properties

def getMap(m, type, d):
    if type == "logp":
        contribs = rdMolDescriptors._CalcCrippenContribs(m)
        SimilarityMaps.GetSimilarityMapFromWeights(m,[x for (x,y) in contribs], contourLines=10, draw2d = d)
    if type == "electron":
        AllChem.ComputeGasteigerCharges(m)
        contribs = [m.GetAtomWithIdx(i).GetDoubleProp('_GasteigerCharge') for i in range(m.GetNumAtoms())]
        SimilarityMaps.GetSimilarityMapFromWeights(m, contribs, contourLines=10, draw2d = d)

    print("THESE ARE CONTRIBS:")
    print(contribs)
    print(Chem.MolToSmarts(m))

def getSVG(urlsmiles, maptag = "logp", showanswers = True, estimates = []): #takes smiles and gets tagged svg

    smiles = urllib.parse.unquote(urlsmiles)
    print ("attempting to generate svg for: " + smiles)
    
    m = Chem.MolFromSmiles(smiles)
    if showanswers:
        for idx, e in enumerate(estimates):
            m.GetAtomWithIdx(e[1]).SetProp("atomNote", "Group " + str(idx + 1) +  "\nEst. pKa = " + str(e[2]))
    d = rdMolDraw2D.MolDraw2DSVG(650, 650) # or MolDraw2DSVG to get SVGs
        # if overlay != 'None':
        #     e.getMap(mol, overlay, d)

    # if showanswers:
    #     for e in estimates:
    #         m.GetAtomWithIdx(e[0]).SetProp("atomNote", "\nEst. pKa = " + e[1])

    getMap(m, maptag, d)     
    
    d.DrawMolecule(m)           

    d.TagAtoms(m)
    d.FinishDrawing()
    im = d.GetDrawingText()
    
    return im

#3 maps: normal, random1, random2
def getRandomMap(urlsmiles, maptag):
    smiles = urllib.parse.unquote(urlsmiles)
    print ("attempting to generate random svg for: " + smiles)
    
    m = Chem.MolFromSmiles(smiles)
    
    d = rdMolDraw2D.MolDraw2DSVG(650, 650)
    
    type = maptag

    if type == "logp":
        contribs = [x for (x,y) in rdMolDescriptors._CalcCrippenContribs(m)]
        negcontribs = [-x for x in contribs]
        outcontribs = contribs
        for i in range(len(contribs)):
            if random.randint(1,2) == 1:
                outcontribs[i] = negcontribs[i]
        SimilarityMaps.GetSimilarityMapFromWeights(m, outcontribs, contourLines=10, draw2d = d)
    if type == "electron":
        AllChem.ComputeGasteigerCharges(m)
        contribs = [m.GetAtomWithIdx(i).GetDoubleProp('_GasteigerCharge') for i in range(m.GetNumAtoms())]
        negcontribs = [ -x for x in contribs]
        outcontribs = contribs
        for i in range(len(contribs)):
            if random.randint(1,2) == 1:
                outcontribs[i] = negcontribs[i]
        SimilarityMaps.GetSimilarityMapFromWeights(m, outcontribs, contourLines=10, draw2d = d)

    print("THESE ARE CONTRIBS:")
    print(negcontribs)
    print(Chem.MolToSmarts(m))

    d.DrawMolecule(m)           

    d.TagAtoms(m)
    d.FinishDrawing()
    im = d.GetDrawingText()
    
    return im

def smilesToEst(smiles):
    ests = estimateMolecule(Chem.MolFromSmiles(smiles))
    ret = []
    for x in ests:
        ret.append(x[1:3])
    return(ret)

def getIDgroups(m):
    fglist = [] #[[fg, ((pts), (pts), (pts))], [fg, ((pts), (pts))]]
    pairs = [] #unbranched paired fg list
    for g in IDgroups:
        tup = m.GetSubstructMatches(Chem.MolFromSmarts(IDgroups[g]))
        if (tup):
            fglist.append([g, tup])
    print("THIS IS THE FGLIST")
    print(fglist)
    for tree in fglist:
        for pts in tree[1]:
            pairs.append([tree[0], pts])
    return pairs

import csv
import os
import requests

dirname = os.path.dirname(__file__)
os.chdir(os.path.join(dirname, '..'))
dirname = os.path.dirname(__file__)
os.chdir(os.path.join(dirname, '..'))

def Scraper():
    url = ""
    properties = 'Title,CanonicalSMILES'#,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    smilesindex = properties.split(",").index("CanonicalSMILES") + 1


    smileslist = []
    #input
    #drugs = "Acetaminophen,Allopurinol,Amitriptyline"
    #drugs = "Acetaminophen,Allopurinol,Amitriptyline,Amlodipine,Amphetamine,Aspirin,Atenolol,Atomoxetine,Atorvastatin,Azelastine,Benztropine,Bisoprolol,Buspirone,Celecoxib,Chlorhexidine,Chlorpheniramine,Cimetidine,Citalopram,Clarithromycin,Clindamycin,Clonidine,Clotrimazole,Clozapine,Codeine,Colchicine,Cyclobenzaprine,Cyclosporin,Dextromethorphan,Diazepam,Diclofenac,Dicyclomine,Diphenhydramine,Doxepin,Erythromycin,Escitalopram,Ethinyl estradiol,Ezetimibe,Famotidine,Fentanyl,Fluconazole,Fluvoxamine,Furosemide,Glimepiride,Glipizide,Glyburide,Haloperidol,Hydrocodone,Hydromorphone,Hyoscyamine,Ibuprofen,Imipramine,Indomethacin,Lamotrigine,Lidocaine,Lisinopril,Loperamide,Losartan,Metformin,Methadone,Methylphenidate,Metoprolol,Metronidazole,Minoxidil,Mirtazepine,Morphine,Naloxone,Naltrexone,Naproxen,Nitrofurantoin,Nortriptyline,Ondansetron,Oxybutynin,Oxycodone,Paroxetine,Penicillin,Phenazopyridine,Phentermine,Phenytoin,Promethazine,Propranolol,Pseudoephedrine,Risperidone,Scopolamine,Sertraline,Sildenafil,Solifenacin ,Sumatriptan,Tamoxifen,Temazepam,Terazosin,Terazosin,Tramadol,Trazodone,Triamterene,Valproate,Venlafaxine,Verapamil,Warfarin,Zolmitriptan,Zolpidem"

    #drugs = "Citalopram,Escitalopram,Amitriptyline,Cyclobenzaprine,Doxepin,Nortriptyline,Mirtazepine,Hydrocodone,Clozapine,Dextromethorphan,Benztropine,Diphenhydramine,Sertraline,Azelastine,Zolmitriptan,Chlorpheniramine,Imipramine,Acetaminophen,Aspirin,Methylphenidate,Phentermine,Atomoxetine,Ethinyl estradiol,Ibuprofen,Haloperidol,Furosemide,Hydromorphone,Hyoscyamine,Temazepam,Atorvastatin,Naproxen,Risperidone,Scopolamine,Cimetidine,Buspirone,Promethazine,Sumatriptan,Atenolol,Metoprolol,Propranolol,Tramadol,Venlafaxine,Penicillin,Tamoxifen,Solifenacin ,Paroxetine,Dicyclomine,Lidocaine,Morphine,Codeine,Loperamide,Fluconazole,Bisoprolol,Oxycodone,Warfarin,Indomethacin,Clindamycin,Naloxone,Naltrexone,Oxybutynin,Sildenafil,Lisinopril,Ezetimibe,Losartan,Diazepam,Trazodone,Erythromycin,Clarithromycin,Cyclosporin,Phenazopyridine,Fluvoxamine,Nitrofurantoin,Diclofenac,Valproate,Verapamil,Amlodipine,Metronidazole,Fentanyl,Methadone,Minoxidil,Pseudoephedrine,Amphetamine ,Allopurinol,Celecoxib,Chlorhexidine,Clonidine,Clotrimazole,Colchicine,Famotidine,Glimepiride,Glipizide,Glyburide,Lamotrigine,Metformin,Ondansetron,Phenytoin,Terazosin,Triamterene,Zolpidem,Benazepril"
    drugs="Acetaminophen,Allopurinol,Amitriptyline,Amlodipine,Amphetamine ,Aspirin,Atenolol,Atomoxetine,Atorvastatin,Azelastine,Benazepril,Benztropine,Bisoprolol,Buspirone,Celecoxib,Chlorhexidine,Chlorpheniramine,Cimetidine,Citalopram,Clarithromycin,Clindamycin,Clonidine,Clotrimazole,Clozapine,Codeine,Colchicine,Cyclobenzaprine,Cyclosporin,Dextromethorphan,Diazepam,Diclofenac,Dicyclomine,Diphenhydramine,Doxepin,Erythromycin,Escitalopram,Ethinyl estradiol,Ezetimibe,Famotidine,Fentanyl,Fluconazole,Fluvoxamine,Furosemide,Glimepiride,Glipizide,Glyburide,Haloperidol,Hydrocodone,Hydromorphone,Hyoscyamine,Ibuprofen,Imipramine,Indomethacin,Lamotrigine,Lidocaine,Lisinopril,Loperamide,Losartan,Metformin,Methadone,Methylphenidate,Metoprolol,Metronidazole,Minoxidil,Mirtazepine,Morphine,Naloxone,Naltrexone,Naproxen,Nitrofurantoin,Nortriptyline,Ondansetron,Oxybutynin,Oxycodone,Paroxetine,Penicillin,Phenazopyridine,Phentermine,Phenytoin,Promethazine,Propranolol,Pseudoephedrine,Risperidone,Scopolamine,Sertraline,Sildenafil,Solifenacin ,Sumatriptan,Tamoxifen,Temazepam,Terazosin,Tramadol,Trazodone,Triamterene,Valproate,Venlafaxine,Verapamil,Warfarin,Zolmitriptan,Zolpidem"
    druglist = drugs.split(',')
    print(druglist)

    for name in druglist:
        url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/" + name + "/property/Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount/csv" #,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount/"
        try:
            u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
            response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
            response = requests.get(url)
            response.raise_for_status()
            smiles = response.text.splitlines()[1].split(",")[smilesindex].strip('"')
            print(smiles)
            smileslist.append(smiles)
        except requests.exceptions.HTTPError as errh:
            print(errh)
        except requests.exceptions.ConnectionError as errc:
            print(errc)
        except requests.exceptions.Timeout as errt:
            print(errt)
        except requests.exceptions.RequestException as err:
            print(err)
    
    with open('topdrugssmiles.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',')

        for idx, s in enumerate(smileslist):
            writer.writerow([druglist[idx]] + [s] + [smilesToEst(s)])


=======
import urllib

from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit.Chem import rdchem
from rdkit.Chem import Draw
from rdkit.Chem.Draw import rdMolDraw2D
from rdkit.Chem.Draw import SimilarityMaps
from rdkit.Chem import Fragments
from rdkit.Chem import Descriptors
from rdkit.Chem import rdMolDescriptors

# import matplotlib.pyplot as pyplot
# import matplotlib.image as mpimg

import requests
import random


from collections.abc import Iterable

import os


os.chdir(os.path.dirname(__file__))

SP3 = Chem.rdchem.HybridizationType.SP3

groups = {
        "amide": "C(=O)-N",
        "resonance_amine_pattern": "C=C-N-C=C",
        "amidine": "C(=N)(-N)-[!#7]",
        "amine_primary": "[NH2,nH2]",
        "amine_secondary": "[NH1,nH1]",
        "amine_tertiary": "[NH,nH]",
        "aniline": "c-[NX3;!$(N=*)]",
        #"beta_lactam": "N1C(=O)CC1",
        "oxygen": "[#8]",
        "COOH": "C(=O)[O;H1,-]",
        #"COOH_al": "C-C(=O)[O;H1,-]",
        #"COOH_ar": "c-C(=O)[O;H1,-]",
        "carbonyl": "[CX3]=[OX1]" ,
        "C_aromatic": "[$([cX3](:*):*),$([cX2+](:*):*)]",
        "ester": "[#6][CX3](=O)[OX2H0][#6]",
        "guanidine": "C(=N)(N)N",
        "nitrile": "[NX1]#[CX2]",
        "nitro": "[$([NX3](=O)=O),$([NX3+](=O)[O-])][!#8]",
        "phenol": "[OX2H]-c1ccccc1",
        "pyridine": "n1ccccc1",
        "sulfur": "[S]",
        "sulfenamide": "S-N",
        "sulfonamide": "N-S(=,-[OX1;+0,-1])(=,-[OX1;+0,-1])-[#6]",
        "sulfoxide": "[$([#16X3](=[OX1])([#6])[#6]),$([#16X3+]([OX1-])([#6])[#6])]",
        "tetrazole": "c1nnnn1",
        "phosphorous": "[P]",
        "halogen": "[F,Cl,Br,I]",
}

IDgroups = {
    "Amide": "C(=O)-N",
    "Ester": "[#6][CX3](=O)[OX2H0][#6]",
    "Ether": "[OD2]([#6])[#6]",
    "Ketone": "[#6][CX3](=O)[#6]",
    "Nitrile": "[NX1]#[CX2]",
    "Sulfonamide": "N-S(=,-[OX1;+0,-1])(=,-[OX1;+0,-1])-[#6]",
    "Sulfonylurea": "[#6](=[#8])(-[#7])-[#7]-[#16](=[#8])=[#8]",
    "Sulfoxide": "[$([#16X3](=[OX1])([#6])[#6]),$([#16X3+]([OX1-])([#6])[#6])]",
    "Tetrazole": "c1nnnn1",
    "NSAA": "[$([NX3,NX4+][CX4H]([*])[CX3](=[OX1])[O,N]);!$([$([$([NX3H,NX4H2+]),$([NX3](C)(C)(C))]1[CX4H]([CH2][CH2][CH2]1)[CX3](=[OX1])[OX2H,OX1-,N]),$([$([NX3H2,NX4H3+]),$([NX3H](C)(C))][CX4H2][CX3](=[OX1])[OX2H,OX1-,N]),$([$([NX3H2,NX4H3+]),$([NX3H](C)(C))][CX4H]([$([CH3X4]),$([CH2X4][CH2X4][CH2X4][NHX3][CH0X3](=[NH2X3+,NHX2+0])[NH2X3]),$([CH2X4][CX3](=[OX1])[NX3H2]),$([CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][SX2H,SX1H0-]),$([CH2X4][CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][#6X3]1:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]1),$([CHX4]([CH3X4])[CH2X4][CH3X4]),$([CH2X4][CHX4]([CH3X4])[CH3X4]),$([CH2X4][CH2X4][CH2X4][CH2X4][NX4+,NX3+0]),$([CH2X4][CH2X4][SX2][CH3X4]),$([CH2X4][cX3]1[cX3H][cX3H][cX3H][cX3H][cX3H]1),$([CH2X4][OX2H]),$([CHX4]([CH3X4])[OX2H]),$([CH2X4][cX3]1[cX3H][nX3H][cX3]2[cX3H][cX3H][cX3H][cX3H][cX3]12),$([CH2X4][cX3]1[cX3H][cX3H][cX3]([OHX2,OH0X1-])[cX3H][cX3H]1),$([CHX4]([CH3X4])[CH3X4])])[CX3](=[OX1])[OX2H,OX1-,N])])]",
    #"SAA": "[$([CH3X4]),$([CH2X4][CH2X4][CH2X4][NHX3][CH0X3](=[NH2X3+,NHX2+0])[NH2X3]),$([CH2X4][CX3](=[OX1])[NX3H2]),$([CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][SX2H,SX1H0-]),$([CH2X4][CH2X4][CX3](=[OX1])[OH0-,OH]),$([CH2X4][#6X3]1:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]:[$([#7X3H+,#7X2H0+0]:[#6X3H]:[#7X3H]),$([#7X3H])]:[#6X3H]1),$([CHX4]([CH3X4])[CH2X4][CH3X4]),$([CH2X4][CHX4]([CH3X4])[CH3X4]),$([CH2X4][CH2X4][CH2X4][CH2X4][NX4+,NX3+0]),$([CH2X4][CH2X4][SX2][CH3X4]),$([CH2X4][cX3]1[cX3H][cX3H][cX3H][cX3H][cX3H]1),$([CH2X4][OX2H]),$([CHX4]([CH3X4])[OX2H]),$([CH2X4][cX3]1[cX3H][nX3H][cX3]2[cX3H][cX3H][cX3H][cX3H][cX3]12),$([CH2X4][cX3]1[cX3H][cX3H][cX3]([OHX2,OH0X1-])[cX3H][cX3H]1),$([CHX4]([CH3X4])[CH3X4])]"
    "GAA": "[NX3,NX4+][CX4H]([*])[CX3](=[OX1])[O,N]",
}


exclude_groups = groups.copy()
keep_groups = (
        "amine_primary",
        "amine_secondary",
        "amine_tertiary",
        "COOH",
        "oxygen",
        "phenol"
    )

for k in keep_groups:
    exclude_groups.pop(k)

#chem.fragments docs
acids = {
    "COOH_al": "C-C(=O)[O;H1,-]",
    "COOH_ar": "c-C(=O)[O;H1,-]",

}

bases = {

}

def flatten(l):
    for el in l:
        if isinstance(el, Iterable) and not isinstance(el, (str, bytes)):
            yield from flatten(el)
        else:
            yield el

def getEWGs(mol):
    EWGindices = []
    for key in groups:
        patt = Chem.MolFromSmarts(groups[key])
        EWGindices.append(mol.GetSubstructMatches(patt))
    print(EWGindices)
    return set(flatten(EWGindices))

def draw(m):    
    d = rdMolDraw2D.MolDraw2DCairo(1000, 1000) # or MolDraw2DSVG to get SVGs

    d.drawOptions().addStereoAnnotation = True
    d.drawOptions().addAtomIndices = True
    d.DrawMolecule(m)
    d.FinishDrawing()
    d.WriteDrawingText('atom_annotation_1.png')

#ALGORITHM CODE

def setMol(smiles):
    m = Chem.MolFromSmiles(smiles)

#implement hierarchical acid/base identification, i.e. benzoic acid recognized before normal acid, amide recognized before amine?
    #id groups, exclude
        #check if acidic or basic based on above dictionaries
            #estimate(index, true)
    #also create array of groups with output estimation data

#make below nicer with enums and generator expressions
#basic: bool

def isAliphaticCarbon(atom):
    return (atom.GetHybridization() == SP3 and atom.GetSymbol() == 'C')

#deprecated
def estimate(index, ewgids, parent, basic=False): #index is the 0 atom to draw distance from
    searched = [index]
    b = int(basic) + 1
    subtracted = []
    subtraction = 0

    #find carbonyl locations
        #check if aliphatic carbon
    #if in searched, check that path is shortest

    for c in m.GetAtomWithIdx(index).GetNeighbors(): #for the neighbors of the 0 atom (c is 0 away)
        print("Searching " + str(c.GetIdx()))
        searched.append(c.GetIdx())
        # print(c.GetHybridization() == SP3)
        # print(c.GetSymbol() == 'C')
        if(c.GetHybridization() == SP3 and c.GetSymbol() == 'C'):
            #for d in (d for d in c.GetNeighbors() if d.GetIdx() not in searched): #d is 1 away
            for d in c.GetNeighbors():
                if d.GetIdx() not in searched:   
                    print("Searching " + str(d.GetIdx()))
                    searched.append(d.GetIdx())
                    if(d.GetHybridization() == SP3 and d.GetSymbol() == 'C'):
                        for e in (e for e in d.GetNeighbors() if e.GetIdx() not in searched): #e is 2 away
                            print("Searching " + str(e.GetIdx()))
                            searched.append(e.GetIdx())
                            if(e.GetHybridization() == SP3 and e.GetSymbol() == 'C'):
                                for f in (f for f in e.GetNeighbors() if f.GetIdx() not in searched): #f is 3 away
                                    print("Searching " + str(f.GetIdx()))
                                    searched.append(f.GetIdx())
                                    if(f.GetHybridization() == SP3 and f.GetSymbol() == 'C'):
                                        for g in (g for g in f.GetNeighbors() if g.GetIdx() not in searched): #g is 4 away
                                            print("Searching " + str(g.GetIdx()))
                                            searched.append(g.GetIdx())
                                            if g.GetIdx() in ewgids:
                                                if (g.GetIsAromatic()):
                                                    subtraction += 0.075*b
                                                else:
                                                    subtraction += 0.15*b
                                                subtracted.append(g.GetIdx())
                                    elif(f.GetIdx() in ewgids):
                                        if(f.GetIsAromatic()):
                                            subtraction += 0.2*b
                                        else:
                                            subtraction += 0.4*b
                                        subtracted.append(f.GetIdx())
                            elif e.GetIdx() in ewgids:
                                if (e.GetIsAromatic()):
                                    subtraction += 0.45*b
                                else:
                                    subtraction += 0.9*b
                                subtracted.append(e.GetIdx())
                    elif d.GetIdx() in ewgids:
                        if (d.GetIsAromatic()):
                            subtraction += 0.45*b
                        else:
                            subtraction += 0.9*b
                        subtracted.append(d.GetIdx())
    #add in check for amine in ring
    if m.GetAtomWithIdx(index).GetSymbol() == 'N' and m.GetAtomWithIdx(index).IsInRing():
        subtraction += 1


    print("Setting prop for index " + str(index) + " as " + str(round(parent - subtraction, 4)))
    print(m.GetAtomWithIdx(index).SetProp("atomNote", "\nEst. pKa = " + str(round(parent - subtraction, 4))))
    print("Subtracted indices from " + str(index) + ": " + str(subtracted))
    return round(parent - subtraction, 4)

def BFestimate(m, index, ewgids, parent, basic=False): #breadth-first algorithm
    searched = [index]
    bval = int(basic) + 1
    subtracted = []
    subtraction = 0
    zeroaway, oneaway, twoaway, threeaway, fouraway = [], [], [], [], []

    for a in m.GetAtomWithIdx(index).GetNeighbors():
        searched.append(a.GetIdx())
        if(isAliphaticCarbon(a)):
            zeroaway.append(a.GetIdx())

    for a in zeroaway:
        for b in m.GetAtomWithIdx(a).GetNeighbors():
            if b.GetIdx() not in searched:
                searched.append(b.GetIdx())
                if(isAliphaticCarbon(b)):
                    oneaway.append(b.GetIdx())
                elif b.GetIdx() in ewgids:
                    if (b.GetIsAromatic()):
                        subtraction += 0.45*bval
                    else:
                        subtraction += 0.9*bval
                    subtracted.append(b.GetIdx())
    print("oneaway")
    print(oneaway)
    for b in oneaway:
        for c in m.GetAtomWithIdx(b).GetNeighbors():
            if c.GetIdx() not in searched:
                searched.append(c.GetIdx())
                if(isAliphaticCarbon(c)):
                    twoaway.append(c.GetIdx())
                elif c.GetIdx() in ewgids:
                    if (c.GetIsAromatic()):
                        subtraction += 0.45*bval
                    else:
                        subtraction += 0.9*bval
                    subtracted.append(c.GetIdx())
    print("twoaway")
    print(twoaway)
    for c in twoaway:
        for d in m.GetAtomWithIdx(c).GetNeighbors():
            if d.GetIdx() not in searched:
                searched.append(d.GetIdx())
                if(isAliphaticCarbon(d)):
                    threeaway.append(d.GetIdx())
                elif d.GetIdx() in ewgids:
                    if (d.GetIsAromatic()):
                        subtraction += 0.2*bval
                    else:
                        subtraction += 0.4*bval
                    subtracted.append(d.GetIdx())
    for d in threeaway:
        for e in m.GetAtomWithIdx(d).GetNeighbors():
            if e.GetIdx() not in searched:
                searched.append(e.GetIdx())
                if(isAliphaticCarbon(e)):
                    fouraway.append(e.GetIdx())
                elif e.GetIdx() in ewgids:
                    if (e.GetIsAromatic()):
                        subtraction += 0.075*bval
                    else:
                        subtraction += 0.15*bval
                    subtracted.append(e.GetIdx())
        
    if m.GetAtomWithIdx(index).GetSymbol() == 'N' and m.GetAtomWithIdx(index).IsInRing():
        subtraction += 1

    print("searched:")
    print(searched)
    print("Setting prop for index " + str(index) + " as " + str(round(parent - subtraction, 4)))
    print(m.GetAtomWithIdx(index).SetProp("atomNote", "\nEst. pKa = " + str(round(parent - subtraction, 4))))
    print("Subtracted indices from " + str(index) + ": " + str(subtracted))
    return [round(parent - subtraction, 4), subtracted]

def estimateMolecule(m):
    EWGindices = getEWGs(m)
    
    estimates = [[],[]] #most acidic, most basic
  
    excludeindices = [] #amide Ns, etc.

    for e in exclude_groups:
        for x in m.GetSubstructMatches(Chem.MolFromSmarts(exclude_groups[e])):
            excludeindices.append(x)

    excludeindices = set(flatten(excludeindices))
    print("excludeindices")
    print(excludeindices)
    # amideNindices = []
    # for x in m.GetSubstructMatches(Chem.MolFromSmarts(groups["amide"])):
    #     amideNindices.append(x[2])
    # print("amide Ns")
    # print(amideNindices)
    COOHindices = []
    acidlist = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts(acids["COOH_al"])):
        COOHindices.append(x[1]) #the C of the cooh
        excludeindices.add(x[3])
        print(str(x[3]) + "this is x 3 of cooh")
    benzoicindices = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts(acids["COOH_ar"])):
        benzoicindices.append(x[1]) #the C of the cooh
        excludeindices.add(x[3])
    Nindices = []
    aminelist =[]
    for x in m.GetSubstructMatches(Chem.MolFromSmarts('N')):
        if x[0] not in excludeindices:
            Nindices.append(x[0])
    
    phenolindices = []
    for x in m.GetSubstructMatches(Chem.MolFromSmarts('[OX2H]-c1ccccc1')):
        if x[0] not in excludeindices:
            phenolindices.append(x[0])
            excludeindices.add(x[0])
    # alcoholindices = []
    # for x in m.GetSubstructMatches(Chem.MolFromSmarts('[#6][OX2H]')):
    #     if x[1] not in excludeindices:
    #         alcoholindices.append(x[1])


    id = 1
    mostAcidic = [-1, 1000, "", []] #idx, pka, type = (acid, amine, etc), subtracted indices[]
    mostBasic = [-1, -1000, "", []]
    for i in COOHindices:
        est = BFestimate(m, i, EWGindices, 4.8) #[est, subtracted idxs]
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "Acid", est[1]]
            estimates[0] = mostAcidic

            # estimates.append([id, i, BFestimate(m, i, EWGindices, 4.8), "Acid"])
            # id += 1
    for i in benzoicindices:
        est = BFestimate(m, i, EWGindices, 4.2)
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "BAcid", est[1]]
            estimates[0] = mostAcidic

            # estimates.append([id, i, BFestimate(m, i, EWGindices, 4.2), "BAcid"])
            # id += 1
    # for i in alcoholindices:
    #     estimates.append([id, i, BFestimate(m, i, EWGindices, 14), "Alcohol"])
    #     id += 1
    for i in phenolindices:
        est = BFestimate(m, i, EWGindices, 10)
        if(est[0] < mostAcidic[1]):
            mostAcidic = [i, est[0], "Phenol", est[1]]
            estimates[0] = mostAcidic

        # estimates.append([id, i, BFestimate(m, i, EWGindices, 10), "Phenol"])
        # id += 1
    for i in Nindices:
        est = BFestimate(m, i, EWGindices, 10.6, True)
        if(est[0] > mostBasic[1]):
            mostBasic = [i, est[0], "Amine", est[1]]
            estimates[1] = mostBasic

        # estimates.append([id, i, BFestimate(m, i, EWGindices, 10.6, True), "Amine"])
        # id += 1
    
    strippedEsts = [x for x in estimates if x != []]
    print("THESE ARE THE ESTIMATES PASSED TO JS")
    print(strippedEsts)
    return strippedEsts

def nameToSMILES(name):
    properties = 'Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    titleindex = properties.split(",").index("Title") - 1 #subtract 1 because CID always shows
    smilesindex = properties.split(",").index("CanonicalSMILES") + 1
    url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/" + name + "/property/" + properties + "/csv"
    
    if name == "":
        return Chem.MolFromSmiles("")
    try:
        u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
        response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
        response = requests.get(url)
        response.raise_for_status()
        
        data = response.text.splitlines()
        title = response.text.splitlines()[0].split(",")[titleindex]
        
        smiles = response.text.splitlines()[1].split(",")[smilesindex].strip('"')
        for l in data:
            if name.capitalize() in l:
                smiles = l.split(",")[smilesindex].strip('"')
        print(smiles)
        return smiles

    except requests.exceptions.HTTPError as errh:
        print(errh)
    except requests.exceptions.ConnectionError as errc:
        print(errc)
    except requests.exceptions.Timeout as errt:
        print(errt)
    except requests.exceptions.RequestException as err:
        print(err)

def SMILESToName(SMILES):
    properties = 'Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    titleindex = properties.split(",").index("Title") + 1 #add 1 because CID always shows
    url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/smiles/" + SMILES + "/property/" + properties + "/csv"
    
    if SMILES == "":
        return Chem.MolFromSmiles("")
    try:
        u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
        response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
        response = requests.get(url)
        response.raise_for_status()
        
        data = response.text.splitlines()
        name = data[1].split(",")[titleindex].strip('"')
        print(name)
        return(name)

    except requests.exceptions.HTTPError as errh:
        print(errh)
    except requests.exceptions.ConnectionError as errc:
        print(errc)
    except requests.exceptions.Timeout as errt:
        print(errt)
    except requests.exceptions.RequestException as err:
        print(err)

def getProperties(m):
    #MW, LogP, TPSA, HBD, HBA, RotB
    properties = {
        "molw": round(Chem.Descriptors.ExactMolWt(m), 3),
        "logp": round(Chem.Crippen.MolLogP(m), 3),
        "tpsa": Chem.MolSurf.TPSA(m),
        "hbd": Chem.Lipinski.NumHDonors(m),
        "hba": Chem.Lipinski.NOCount(m),
        "rotb": Chem.Lipinski.NumRotatableBonds(m)
    }

    print(properties)
    return properties

def getMap(m, type, d):
    if type == "logp":
        contribs = rdMolDescriptors._CalcCrippenContribs(m)
        SimilarityMaps.GetSimilarityMapFromWeights(m,[x for (x,y) in contribs], contourLines=10, draw2d = d)
    if type == "electron":
        AllChem.ComputeGasteigerCharges(m)
        contribs = [m.GetAtomWithIdx(i).GetDoubleProp('_GasteigerCharge') for i in range(m.GetNumAtoms())]
        SimilarityMaps.GetSimilarityMapFromWeights(m, contribs, contourLines=10, draw2d = d)

    print("THESE ARE CONTRIBS:")
    print(contribs)
    print(Chem.MolToSmarts(m))

def getSVG(urlsmiles, maptag = "logp", showanswers = True, estimates = []): #takes smiles and gets tagged svg

    smiles = urllib.parse.unquote(urlsmiles)
    print ("attempting to generate svg for: " + smiles)
    
    m = Chem.MolFromSmiles(smiles)
    if showanswers:
        for idx, e in enumerate(estimates):
            m.GetAtomWithIdx(e[1]).SetProp("atomNote", "Group " + str(idx + 1) +  "\nEst. pKa = " + str(e[2]))
    d = rdMolDraw2D.MolDraw2DSVG(650, 650) # or MolDraw2DSVG to get SVGs
        # if overlay != 'None':
        #     e.getMap(mol, overlay, d)

    # if showanswers:
    #     for e in estimates:
    #         m.GetAtomWithIdx(e[0]).SetProp("atomNote", "\nEst. pKa = " + e[1])

    getMap(m, maptag, d)     
    
    d.DrawMolecule(m)           

    d.TagAtoms(m)
    d.FinishDrawing()
    im = d.GetDrawingText()
    
    return im

#3 maps: normal, random1, random2
def getRandomMap(urlsmiles, maptag):
    smiles = urllib.parse.unquote(urlsmiles)
    print ("attempting to generate random svg for: " + smiles)
    
    m = Chem.MolFromSmiles(smiles)
    
    d = rdMolDraw2D.MolDraw2DSVG(650, 650)
    
    type = maptag

    if type == "logp":
        contribs = [x for (x,y) in rdMolDescriptors._CalcCrippenContribs(m)]
        negcontribs = [-x for x in contribs]
        outcontribs = contribs
        for i in range(len(contribs)):
            if random.randint(1,2) == 1:
                outcontribs[i] = negcontribs[i]
        SimilarityMaps.GetSimilarityMapFromWeights(m, outcontribs, contourLines=10, draw2d = d)
    if type == "electron":
        AllChem.ComputeGasteigerCharges(m)
        contribs = [m.GetAtomWithIdx(i).GetDoubleProp('_GasteigerCharge') for i in range(m.GetNumAtoms())]
        negcontribs = [ -x for x in contribs]
        outcontribs = contribs
        for i in range(len(contribs)):
            if random.randint(1,2) == 1:
                outcontribs[i] = negcontribs[i]
        SimilarityMaps.GetSimilarityMapFromWeights(m, outcontribs, contourLines=10, draw2d = d)

    print("THESE ARE CONTRIBS:")
    print(negcontribs)
    print(Chem.MolToSmarts(m))

    d.DrawMolecule(m)           

    d.TagAtoms(m)
    d.FinishDrawing()
    im = d.GetDrawingText()
    
    return im

def smilesToEst(smiles):
    ests = estimateMolecule(Chem.MolFromSmiles(smiles))
    ret = []
    for x in ests:
        ret.append(x[1:3])
    return(ret)

def getIDgroups(m):
    fglist = [] #[[fg, ((pts), (pts), (pts))], [fg, ((pts), (pts))]]
    pairs = [] #unbranched paired fg list
    for g in IDgroups:
        tup = m.GetSubstructMatches(Chem.MolFromSmarts(IDgroups[g]))
        if (tup):
            fglist.append([g, tup])
    print("THIS IS THE FGLIST")
    print(fglist)
    for tree in fglist:
        for pts in tree[1]:
            pairs.append([tree[0], pts])
    return pairs

import csv
import os
import requests

dirname = os.path.dirname(__file__)
os.chdir(os.path.join(dirname, '..'))
dirname = os.path.dirname(__file__)
os.chdir(os.path.join(dirname, '..'))

def Scraper():
    url = ""
    properties = 'Title,CanonicalSMILES'#,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount'
    smilesindex = properties.split(",").index("CanonicalSMILES") + 1


    smileslist = []
    #input
    #drugs = "Acetaminophen,Allopurinol,Amitriptyline"
    #drugs = "Acetaminophen,Allopurinol,Amitriptyline,Amlodipine,Amphetamine,Aspirin,Atenolol,Atomoxetine,Atorvastatin,Azelastine,Benztropine,Bisoprolol,Buspirone,Celecoxib,Chlorhexidine,Chlorpheniramine,Cimetidine,Citalopram,Clarithromycin,Clindamycin,Clonidine,Clotrimazole,Clozapine,Codeine,Colchicine,Cyclobenzaprine,Cyclosporin,Dextromethorphan,Diazepam,Diclofenac,Dicyclomine,Diphenhydramine,Doxepin,Erythromycin,Escitalopram,Ethinyl estradiol,Ezetimibe,Famotidine,Fentanyl,Fluconazole,Fluvoxamine,Furosemide,Glimepiride,Glipizide,Glyburide,Haloperidol,Hydrocodone,Hydromorphone,Hyoscyamine,Ibuprofen,Imipramine,Indomethacin,Lamotrigine,Lidocaine,Lisinopril,Loperamide,Losartan,Metformin,Methadone,Methylphenidate,Metoprolol,Metronidazole,Minoxidil,Mirtazepine,Morphine,Naloxone,Naltrexone,Naproxen,Nitrofurantoin,Nortriptyline,Ondansetron,Oxybutynin,Oxycodone,Paroxetine,Penicillin,Phenazopyridine,Phentermine,Phenytoin,Promethazine,Propranolol,Pseudoephedrine,Risperidone,Scopolamine,Sertraline,Sildenafil,Solifenacin ,Sumatriptan,Tamoxifen,Temazepam,Terazosin,Terazosin,Tramadol,Trazodone,Triamterene,Valproate,Venlafaxine,Verapamil,Warfarin,Zolmitriptan,Zolpidem"

    #drugs = "Citalopram,Escitalopram,Amitriptyline,Cyclobenzaprine,Doxepin,Nortriptyline,Mirtazepine,Hydrocodone,Clozapine,Dextromethorphan,Benztropine,Diphenhydramine,Sertraline,Azelastine,Zolmitriptan,Chlorpheniramine,Imipramine,Acetaminophen,Aspirin,Methylphenidate,Phentermine,Atomoxetine,Ethinyl estradiol,Ibuprofen,Haloperidol,Furosemide,Hydromorphone,Hyoscyamine,Temazepam,Atorvastatin,Naproxen,Risperidone,Scopolamine,Cimetidine,Buspirone,Promethazine,Sumatriptan,Atenolol,Metoprolol,Propranolol,Tramadol,Venlafaxine,Penicillin,Tamoxifen,Solifenacin ,Paroxetine,Dicyclomine,Lidocaine,Morphine,Codeine,Loperamide,Fluconazole,Bisoprolol,Oxycodone,Warfarin,Indomethacin,Clindamycin,Naloxone,Naltrexone,Oxybutynin,Sildenafil,Lisinopril,Ezetimibe,Losartan,Diazepam,Trazodone,Erythromycin,Clarithromycin,Cyclosporin,Phenazopyridine,Fluvoxamine,Nitrofurantoin,Diclofenac,Valproate,Verapamil,Amlodipine,Metronidazole,Fentanyl,Methadone,Minoxidil,Pseudoephedrine,Amphetamine ,Allopurinol,Celecoxib,Chlorhexidine,Clonidine,Clotrimazole,Colchicine,Famotidine,Glimepiride,Glipizide,Glyburide,Lamotrigine,Metformin,Ondansetron,Phenytoin,Terazosin,Triamterene,Zolpidem,Benazepril"
    drugs="Acetaminophen,Allopurinol,Amitriptyline,Amlodipine,Amphetamine ,Aspirin,Atenolol,Atomoxetine,Atorvastatin,Azelastine,Benazepril,Benztropine,Bisoprolol,Buspirone,Celecoxib,Chlorhexidine,Chlorpheniramine,Cimetidine,Citalopram,Clarithromycin,Clindamycin,Clonidine,Clotrimazole,Clozapine,Codeine,Colchicine,Cyclobenzaprine,Cyclosporin,Dextromethorphan,Diazepam,Diclofenac,Dicyclomine,Diphenhydramine,Doxepin,Erythromycin,Escitalopram,Ethinyl estradiol,Ezetimibe,Famotidine,Fentanyl,Fluconazole,Fluvoxamine,Furosemide,Glimepiride,Glipizide,Glyburide,Haloperidol,Hydrocodone,Hydromorphone,Hyoscyamine,Ibuprofen,Imipramine,Indomethacin,Lamotrigine,Lidocaine,Lisinopril,Loperamide,Losartan,Metformin,Methadone,Methylphenidate,Metoprolol,Metronidazole,Minoxidil,Mirtazepine,Morphine,Naloxone,Naltrexone,Naproxen,Nitrofurantoin,Nortriptyline,Ondansetron,Oxybutynin,Oxycodone,Paroxetine,Penicillin,Phenazopyridine,Phentermine,Phenytoin,Promethazine,Propranolol,Pseudoephedrine,Risperidone,Scopolamine,Sertraline,Sildenafil,Solifenacin ,Sumatriptan,Tamoxifen,Temazepam,Terazosin,Tramadol,Trazodone,Triamterene,Valproate,Venlafaxine,Verapamil,Warfarin,Zolmitriptan,Zolpidem"
    druglist = drugs.split(',')
    print(druglist)

    for name in druglist:
        url = "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/" + name + "/property/Title,CanonicalSMILES,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount/csv" #,MolecularWeight,XLogP,TPSA,HBondDonorCount,HBondAcceptorCount,RotatableBondCount/"
        try:
            u_a = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0"
            response = requests.get(url, headers={"USER-AGENT":u_a, "Accept": "application/xml"})
            response = requests.get(url)
            response.raise_for_status()
            smiles = response.text.splitlines()[1].split(",")[smilesindex].strip('"')
            print(smiles)
            smileslist.append(smiles)
        except requests.exceptions.HTTPError as errh:
            print(errh)
        except requests.exceptions.ConnectionError as errc:
            print(errc)
        except requests.exceptions.Timeout as errt:
            print(errt)
        except requests.exceptions.RequestException as err:
            print(err)
    
    with open('topdrugssmiles.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',')

        for idx, s in enumerate(smileslist):
            writer.writerow([druglist[idx]] + [s] + [smilesToEst(s)])


>>>>>>> Stashed changes:pharmaceutics/estimator.py
