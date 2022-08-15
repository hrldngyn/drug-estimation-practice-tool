from django.contrib import admin

# Register your models here.
from .models import *

class Molecule_FG_pKaList(admin.TabularInline):
    extra = 0
    model = Molecule_FG_pKa

class AminoAcidList(admin.TabularInline):
    extra = 0
    model = AminoAcid

@admin.register(Molecule)
class MoleculeAdmin(admin.ModelAdmin):
    inlines = [Molecule_FG_pKaList]
    
    list_display = ['Molecule_Name', "SMILES", "LiteraturePka", "Reference"]
    list_editable = ['SMILES', "LiteraturePka"]

@admin.register(FunctionalGroup)
class FunctionalGroupAdmin(admin.ModelAdmin):
    list_display = ['Name', 'ionizable', 'polar']

@admin.register(Molecule_FG_pKa)
class Molecule_FG_pKaAdmin(admin.ModelAdmin):
    list_display = ['Molecule', 'FunctionalGroup', 'index', 'pKa', 'pKa_type']

@admin.register(AminoAcid)
class AminoAcidAdmin(admin.ModelAdmin):
    inlines = []
    list_display = ['Molecule', 'singlet_code', 'triplet_code', 'ionizable', 'polar', 'aromatic', 'full_carbon_count', 'branched', 'essential', 'sulfur', 'volume']
    list_editable = ['ionizable', 'polar', 'full_carbon_count']