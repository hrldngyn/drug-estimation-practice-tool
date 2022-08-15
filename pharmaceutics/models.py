from django.db import models
from django.db.models.base import Model
from django.db.models.fields import BooleanField

# Create your models here.

class Molecule(models.Model):

    Molecule_Name = models.CharField(max_length=50, blank=False, null=False)
    # LogP = models.FloatField(max_length=4, blank=True, null=True)
    # FunctionalGroups = models.ManyToManyField("FunctionalGroup", blank=True)
    SMILES = models.CharField(max_length=200)
    LiteraturePka = models.FloatField(max_length=5, blank=False, null=True)
    difficulty_choices = (
        ("easy","easy"),
        ("hard","hard"),
    ) 
    Difficulty = models.CharField(max_length = 9, choices=difficulty_choices, default="easy")
    Reference = models.CharField(max_length=1000, blank=True)
    
    


    def __str__(self):
        return self.Molecule_Name

class FunctionalGroup(models.Model):
    Name = models.CharField(max_length=15, blank=False)
    ionizable = models.BooleanField(default=False)
    polar = models.BooleanField(default=False)
    parent_pKa = models.FloatField(max_length = 4, blank = False)
    aromatic = models.BooleanField(default=False)


    def __str__(self):
        return self.Name

class Molecule_FG_pKa(models.Model):
    Molecule = models.ForeignKey("Molecule", on_delete=models.CASCADE)
    FunctionalGroup = models.ForeignKey("FunctionalGroup", on_delete=models.CASCADE) #"functionalgroup" refers to model above
    index = models.IntegerField(max_length=3, blank=False)
    pKa = models.FloatField(max_length=4, blank=False)
    pKa_type_choices = (
        ("acidic","acidic"),
        ("basic","basic")
    )
    pKa_type = models.CharField(max_length = 7, choices=pKa_type_choices, default="acidic")


    def __str__(self):
        return self.Molecule.Name + " " + self.FunctionalGroup.Name

class AminoAcid(models.Model):
    Molecule = models.OneToOneField("Molecule", on_delete=models.CASCADE)
    ionizable = models.BooleanField(default=False)
    polar = models.BooleanField(default=False)
    aromatic = models.BooleanField(default=False)
    full_carbon_count = models.IntegerField(max_length=2, default=1)
    branched = models.BooleanField(default=False)
    essential = models.BooleanField(default=False)
    singlet_code = models.CharField(max_length=1, default="")
    triplet_code = models.CharField(max_length=3, default="")
    charge_choices = (
        ("positive","positive"),
        ("negative","negative"),
        ("neutral","neutral")
    ) 
    charge = models.CharField(max_length = 9, choices=charge_choices, default="neutral")
    #implement sizes 5 categories link in google doc
    #IMGT categories
    volume_choices = (
        ("Very Large", "Very Large"),
        ("Large","Large"),
        ("Medium","Medium"),
        ("Small","Small"),
        ("Very Small","Very Small")
    )
    sulfur = models.BooleanField(default=False)
    volume = models.CharField(max_length = 11, choices=volume_choices, default="Medium")


    def __str__(self):
        return self.Molecule.Name

class Protein(models.Model):
    Name = models.CharField(max_length=50, blank=False)
    
    def __str__(self):
        return self.Name