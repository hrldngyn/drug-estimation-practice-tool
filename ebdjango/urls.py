"""ebdjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from pharmaceutics.views import Pharm_Toys, manySVG, quiz1, quiz1post, quiz2, quiz2post, pkasolvepost, fgsolvepost, rotbsolvepost, mapmodesolvepost, subjectivepost

urlpatterns = [
    path('', Pharm_Toys, name="Pharm Toys"),
    path('manySVG', manySVG, name="Pharm Toys"),
    path('quiz1', quiz1, name="Quiz 1"),
    path('quiz1post', quiz1post, name="Quiz 1"),
    path('quiz2', quiz2, name="Quiz 2"),
    path('quiz2post', quiz2post, name="Quiz 2"),
    path('pkasolvepost', pkasolvepost, name="pkaincrement"),
    path('fgsolvepost', fgsolvepost, name="fgincrement"),
    path('rotbsolvepost', rotbsolvepost, name="rotbincrement"),
    path('mapmodesolvepost', mapmodesolvepost, name="mapmodeincrement"),
    
    path('subjectivepost', subjectivepost, name="subjectivepost"),

    path('admin/', admin.site.urls),
    path('pharmaceutics', Pharm_Toys, name="Pharm Toys"),

]
