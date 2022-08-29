from django.contrib import admin

# Register your models here.
from .models import *

from django.contrib.sessions.models import Session

class SessionAdmin(admin.ModelAdmin):
    def _session_data(self, obj):
        return obj.get_decoded()
    list_display = ['session_key', '_session_data', 'expire_date']
admin.site.register(Session, SessionAdmin)

class Molecule_FG_pKaList(admin.TabularInline):
    extra = 0
    model = Molecule_FG_pKa

class AminoAcidList(admin.TabularInline):
    extra = 0
    model = AminoAcid

@admin.register(Molecule)
class MoleculeAdmin(admin.ModelAdmin):
    inlines = [Molecule_FG_pKaList]
    
    list_display = ['Molecule_Name', "SMILES", "LiteraturePka", "Reference", "Ion_Type"]
    list_editable = ['SMILES', "LiteraturePka", "Ion_Type"]

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

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ['Key']
@admin.register(Query)
class QueryAdmin(admin.ModelAdmin):
    list_display = ['User', 'Molecules', 'MapMode', 'Time']
@admin.register(Quiz1Attempt)
class Quiz1AttemptAdmin(admin.ModelAdmin):
    list_display = ['User', 'Timestamp', 'Secs_Taken', "Answer1", "Answer2", "Answer3", "Answer4", "Answer5"]
@admin.register(Quiz2Attempt)
class Quiz2AttemptAdmin(admin.ModelAdmin):
    list_display = ['User', 'Timestamp', 'Secs_Taken', "Answer1", "Answer2", "Answer3", "Answer4", "Answer5"]
