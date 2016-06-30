;recup taille ecran et ne depasse pas objets ...
;repositionner / optimiser les objets dans les ecrans suivant dimensions
;pb fenetre sec.
;affecter annul, valid, print, help
;
;
;
#TitleFor =  "Snack Break"
#TitleForm = "Snack Break - Gestion des commandes"
#versio =    "V1.0"
#passwrd =   "REMY"

#NbParamProd = 4

#LibLib = "Libellé"
#LibQ =   "Qté"
#LibHT =  "Prix HT"
#LibTVA = "TVA"
#LibTTC = "Prix TTC"

#PersoExt = "prefs"
#BarreBas = 72 ;*******************voir si barre et taille barre******************

Enumeration Window
  #MainForm ;IDentifiant fenetre principale
  #SecForm  ;IDentifiant fenetre secondaire
EndEnumeration
  
  
  
Enumeration Gadget
    #ButtonLogo
    
    #Button1 ;#ButtonImage1 = "Sandwish"
    #Button2 ;#ButtonImage2 = "Boisson"
    #Button3 ;#ButtonImage3 = "Patisserie"
    #Button4 ;#ButtonImage4 = "Divers" ; chips, barre choco...
    
    #BtAnnuler
    #BtValider
    #BtImprim
    #BtAide
    
    #buttonplus1
    #buttonplus2
    #buttonplus3
    #buttonplus4
    
    #NbTotalPROD
    #NbTotalHT
    #NbTotalTTC

    #AffichageTxt  ;bandeau informations
    #AffichageTxt2 ;intitulé du tableau
  
    #SupprList01
    #SupprList02
    #SupprList03
    #SupprList04
    #SupprList05
    #SupprList06
    #SupprList07
    #SupprList08
    #SupprList09
    #SupprList10
    #SupprList11
    #SupprList12
    #SupprList13
    #SupprList14
    #SupprList15
    #SupprList16
    #SupprList17
    #SupprList18
    #SupprList19
    #SupprList20
    
    #LienInternet 
    
    #GadgetListSecond ;liste des produits pour sélection
EndEnumeration



Enumeration Images
  #ImageLogo  ;logo
  
  #Image1     ;images principales
  #Image2 
  #Image3 
  #Image4
  
  #ImageAnnul ;image commandes
  #ImageValid
  #ImagePrint
  #ImageHelp
  
  #Imageplus1 ;imagesplus commandes
  #Imageplus2
  #Imageplus3
  #Imageplus4
EndEnumeration 
  
 


UseJPEGImageDecoder()




;acces variable dans procedures
Global NomChemin$
Global EcrL= GetSystemMetrics_(#SM_CXSCREEN), EcrH = GetSystemMetrics_(#SM_CYSCREEN)- #BarreBas
Global TailleButtonImage = EcrH/2.8

Global nbClic1 ,nbClic2, nbClic3, nbClic4
Global nbClic5 ;gère les annulations... / posi= nbClic1 + nbClic2 + nbClic3 + nbClic4 + nbClic5 (négatif)
Global Date$, Time$ , NumCmde
Global Temps_DoubleClic , double
Global password.s = #passwrd, IsMaster = 0, uuser.s
Global NbProd01, NbProd02, NbProd03, NbProd04



;repertoire en cours
Buffer.s = Space(256)
Buf_Len = 256
GetCurrentDirectory_(Buf_Len, @Buffer)
NomChemin$ = PeekS(@Buffer)


;-initialisation variables générales
Date$ = FormatDate("%dd/%mm/%yyyy", Date())
Time$ = FormatDate("%hh:%ii:%ss", Date())
NumCmde = 1
Temps_DoubleClic = GetDoubleClickTime_ ()
uuser = GetEnvironmentVariable("USERNAME")


;-initialisation variables liste commandes
   #ValStringList01 ="" : #ValStringList02 ="" : #ValStringList03 ="" : #ValStringList04 ="" : #ValStringList05 =""
   #ValStringList06 ="" : #ValStringList07 ="" : #ValStringList08 ="" : #ValStringList09 ="" : #ValStringList10 =""
   #ValStringList11 ="" : #ValStringList12 ="" : #ValStringList13 ="" : #ValStringList14 ="" : #ValStringList15 =""
   #ValStringList16 ="" : #ValStringList17 ="" : #ValStringList18 ="" : #ValStringList19 ="" : #ValStringList20 =""
   
   #ValStringNb01 ="" : #ValStringNb02 ="" : #ValStringNb03 ="" : #ValStringNb04 ="" : #ValStringNb05 =""
   #ValStringNb06 ="" : #ValStringNb07 ="" : #ValStringNb08 ="" : #ValStringNb09 ="" : #ValStringNb10 =""
   #ValStringNb11 ="" : #ValStringNb12 ="" : #ValStringNb13 ="" : #ValStringNb14 ="" : #ValStringNb15 =""
   #ValStringNb16 ="" : #ValStringNb17 ="" : #ValStringNb18 ="" : #ValStringNb19 ="" : #ValStringNb20 =""
   
   #ValStringHT01 ="" : #ValStringHT02 ="" : #ValStringHT03 ="" : #ValStringHT04 ="" : #ValStringHT05 =""
   #ValStringHT06 ="" : #ValStringHT07 ="" : #ValStringHT08 ="" : #ValStringHT09 ="" : #ValStringHT10 =""
   #ValStringHT11 ="" : #ValStringHT12 ="" : #ValStringHT13 ="" : #ValStringHT14 ="" : #ValStringHT15 =""
   #ValStringHT16 ="" : #ValStringHT17 ="" : #ValStringHT18 ="" : #ValStringHT19 ="" : #ValStringHT20 =""
   
   #ValStringTVA01 ="" : #ValStringTVA02 ="" : #ValStringTVA03 ="" : #ValStringTVA04 ="" : #ValStringTVA05 =""
   #ValStringTVA06 ="" : #ValStringTVA07 ="" : #ValStringTVA08 ="" : #ValStringTVA09 ="" : #ValStringTVA10 =""
   #ValStringTVA11 ="" : #ValStringTVA12 ="" : #ValStringTVA13 ="" : #ValStringTVA14 ="" : #ValStringTVA15 =""
   #ValStringTVA16 ="" : #ValStringTVA17 ="" : #ValStringTVA18 ="" : #ValStringTVA19 ="" : #ValStringTVA20 =""
   
   #ValStringTTC01 ="" : #ValStringTTC02 ="" : #ValStringTTC03 ="" : #ValStringTTC04 ="" : #ValStringTTC05 =""
   #ValStringTTC06 ="" : #ValStringTTC07 ="" : #ValStringTTC08 ="" : #ValStringTTC09 ="" : #ValStringTTC10 =""
   #ValStringTTC11 ="" : #ValStringTTC12 ="" : #ValStringTTC13 ="" : #ValStringTTC14 ="" : #ValStringTTC15 =""
   #ValStringTTC16 ="" : #ValStringTTC17 ="" : #ValStringTTC18 ="" : #ValStringTTC19 ="" : #ValStringTTC20 =""
   
;    
   
   
 ;-initialisation variables affichage
#MargeLogo = 180 ;tout se place en dessous

#TailleButtonSuppr = 20
#TListX = 200
#TListY = 20



;{-initialise nb de produits
CheminFichier.s = NomChemin$ + "\produits\Prod01."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    ReadString(0):NbProd01=NbProd01+1 
  Wend 
  CloseFile(0)
NbProd01=(NbProd01-6)/#NbParamProd
Else
  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf

CheminFichier.s = NomChemin$ + "\produits\Prod02."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    ReadString(0):NbProd02=NbProd02+1 
  Wend 
  CloseFile(0)
NbProd02=(NbProd02-6)/#NbParamProd
Else
  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf

CheminFichier.s = NomChemin$ + "\produits\Prod03."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    ReadString(0):NbProd03=NbProd03+1 
  Wend 
  CloseFile(0)
NbProd03=(NbProd03-6)/#NbParamProd
Else
  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf

CheminFichier.s = NomChemin$ + "\produits\Prod04."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    ReadString(0):NbProd04=NbProd04+1 
  Wend 
  CloseFile(0)
NbProd04=(NbProd04-6)/#NbParamProd
Else
  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf
 
 
   

Global Dim ProdLib1.s (NbProd01) ,Dim ProdHT1.s  (NbProd01) ,Dim ProdTTC1.s  (NbProd01), Dim ProdTVA1.s (NbProd01) ,Dim ProdMENU1.s (NbProd01)
Global Dim ProdLib2.s (NbProd02) ,Dim ProdHT2.s  (NbProd02) ,Dim ProdTTC2.s  (NbProd01), Dim ProdTVA2.s (NbProd02) ,Dim ProdMENU2.s (NbProd02)
Global Dim ProdLib3.s (NbProd03) ,Dim ProdHT3.s  (NbProd03) ,Dim ProdTTC3.s  (NbProd01), Dim ProdTVA3.s (NbProd03) ,Dim ProdMENU3.s (NbProd03)
Global Dim ProdLib4.s (NbProd04) ,Dim ProdHT4.s  (NbProd04) ,Dim ProdTTC4.s  (NbProd01), Dim ProdTVA4.s (NbProd04) ,Dim ProdMENU4.s (NbProd04)
;}-






;declare procedures
Declare Start()
Declare AlertThread(Parameter)
Declare WindowProd(NumProdList)


;{-chargement des images, param, produits
;-*** Charge Images 
CheminFichier.s = NomChemin$ + "\images\LOGO.jpg"
Resultat = LoadImage(#ImageLogo, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
     
     
     CheminFichier.s = NomChemin$ + "\images\Image1.jpg"
Resultat = LoadImage(#Image1,    CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
CheminFichier.s = NomChemin$ + "\images\Image2.jpg"
Resultat = LoadImage(#Image2,    CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
CheminFichier.s = NomChemin$ + "\images\Image3.jpg"
Resultat = LoadImage(#Image3,    CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
CheminFichier.s = NomChemin$ + "\images\Image4.jpg"
Resultat = LoadImage(#Image4,    CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
     
     
     CheminFichier.s = NomChemin$ + "\images\annule.jpg"
Resultat = LoadImage(#ImageAnnul, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
  CheminFichier.s = NomChemin$ + "\images\valide.jpg"
Resultat = LoadImage(#ImageValid, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
 CheminFichier.s = NomChemin$ + "\images\imprimer.jpg"
Resultat = LoadImage(#ImagePrint, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
      CheminFichier.s = NomChemin$ + "\images\aide.jpg"
Resultat = LoadImage(#ImageHelp, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
     
     
   CheminFichier.s = NomChemin$ + "\images\imgplus1.jpg"
Resultat = LoadImage(#Imageplus1, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
   CheminFichier.s = NomChemin$ + "\images\imgplus2.jpg"
Resultat = LoadImage(#Imageplus2, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
   CheminFichier.s = NomChemin$ + "\images\imgplus3.jpg"
Resultat = LoadImage(#Imageplus3, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
   CheminFichier.s = NomChemin$ + "\images\imgplus4.jpg"
Resultat = LoadImage(#Imageplus4, CheminFichier)
     If Resultat=0 : MessageRequester(#TitleFor + " - Erreur", CheminFichier+" n'a pas pu être chargée !", #MB_ICONERROR):End: EndIf
     
     
     
     
;redimensionne images
 ResizeImage(#ImageAnnul, TailleButtonImage/4, TailleButtonImage/4)
 ResizeImage(#ImageValid, TailleButtonImage/4, TailleButtonImage/4)
 ResizeImage(#ImagePrint, TailleButtonImage/4, TailleButtonImage/4)
 ResizeImage(#ImageHelp,  TailleButtonImage/4, TailleButtonImage/4)
 
 ResizeImage(#Imageplus1, TailleButtonImage/4, TailleButtonImage/6)
 ResizeImage(#Imageplus2, TailleButtonImage/4, TailleButtonImage/6)
 ResizeImage(#Imageplus3, TailleButtonImage/4, TailleButtonImage/6)
 ResizeImage(#Imageplus4,  TailleButtonImage/4, TailleButtonImage/6)
 
 
     

 ;-*** Charge fichiers
 CheminFichier.s = NomChemin$ + "\param\tva."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    For i=1 To 5 : vide$   = ReadString(0) : Next i
    ligne1$ = ReadString(0)   ;work$ = Right(ligne1$, 1)       = Mid(ligne1$, 16, 8) 
      taux1$ = ReadString(0) 
    ligne2$ = ReadString(0)
      taux2$   = ReadString(0)
    ligne3$ = ReadString(0)
      taux3$ = ReadString(0)
   Wend
  CloseFile(0)
;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
EndIf


;charge prod1
CheminFichier.s = NomChemin$ + "\produits\Prod01."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    For a=1 To 6 : vide$   = ReadString(0) : Next a
   
    For i=1 To NbProd01
    ProdLib1.s(i) = ReadString(0)
    ProdHT1.s(i) = ReadString(0)
    ProdTVA1.s(i) = ReadString(0) 
    
    If ProdTVA1(i)="1" : ProdTVA1(i)=taux1$ 
     Else 
      If ProdTVA1(i)="2" : ProdTVA1(i)= taux2$
       Else 
        If ProdTVA1(i)="3" : ProdTVA1(i)=taux3$ 
        EndIf
      EndIf
    EndIf
    
    ProdMENU1.s(i) = ReadString(0) ; o/n si est composante d'un menu
   
    ProdTTC1.s(i)  = StrF(ValF(ProdHT1(i)) * (1+ ValF(ProdTVA1(i)) / 100),  2)
    
 Next i
    
   Wend
  CloseFile(0)
;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
;  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf
  
       
 
 ;charge prod2
CheminFichier.s = NomChemin$ + "\produits\Prod02."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    For a=1 To 6 : vide$   = ReadString(0) : Next a
   
    For i=1 To NbProd02
    ProdLib2.s(i) = ReadString(0)
    ProdHT2.s(i) = ReadString(0)
    ProdTVA2.s(i) = ReadString(0) 
    
    If ProdTVA2(i)="1" : ProdTVA2(i)=taux1$ 
     Else 
      If ProdTVA2(i)="2" : ProdTVA2(i)= taux2$
       Else 
        If ProdTVA2(i)="3" : ProdTVA2(i)=taux3$ 
        EndIf
      EndIf
    EndIf
    
    ProdMENU2.s(i) = ReadString(0) ; o/n si est composante d'un menu
   
    ProdTTC2.s(i)  = StrF(ValF(ProdHT2(i)) * (1+ ValF(ProdTVA2(i)) / 100),  2)
    
 Next i
    
   Wend
  CloseFile(0)
;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
;  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf
  
 
 
 ;charge prod3
CheminFichier.s = NomChemin$ + "\produits\Prod03."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    For a=1 To 6 : vide$   = ReadString(0) : Next a
   
    For i=1 To NbProd03
    ProdLib3.s(i) = ReadString(0)
    ProdHT3.s(i) = ReadString(0)
    ProdTVA3.s(i) = ReadString(0) 
    
    If ProdTVA3(i)="1" : ProdTVA3(i)=taux1$ 
     Else 
      If ProdTVA3(i)="2" : ProdTVA3(i)= taux2$
       Else 
        If ProdTVA3(i)="3" : ProdTVA3(i)=taux3$ 
        EndIf
      EndIf
    EndIf
    
    ProdMENU3.s(i) = ReadString(0) ; o/n si est composante d'un menu
   
    ProdTTC3.s(i)  = StrF(ValF(ProdHT3(i)) * (1+ ValF(ProdTVA3(i)) / 100),  2)
    
 Next i
    
   Wend
  CloseFile(0)
;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
;  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf
  
 
 
 ;charge prod4
CheminFichier.s = NomChemin$ + "\produits\Prod04."+#PersoExt
If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    For a=1 To 6 : vide$   = ReadString(0) : Next a
   
    For i=1 To NbProd04
    ProdLib4.s(i) = ReadString(0)
    ProdHT4.s(i) = ReadString(0)
    ProdTVA4.s(i) = ReadString(0) 
    
    If ProdTVA4(i)="1" : ProdTVA4(i)=taux1$ 
     Else 
      If ProdTVA4(i)="2" : ProdTVA4(i)= taux2$
       Else 
        If ProdTVA4(i)="3" : ProdTVA4(i)=taux3$ 
        EndIf
      EndIf
    EndIf
    
    ProdMENU4.s(i) = ReadString(0) ; o/n si est composante d'un menu
   
    ProdTTC4.s(i)  = StrF(ValF(ProdHT4(i)) * (1+ ValF(ProdTVA4(i)) / 100),  2)
    
 Next i
    
   Wend
  CloseFile(0)
  ;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
;  MessageRequester(#TitleFor + " - Erreur", CheminFichier +"n'a pas pu être chargé !", #MB_ICONERROR)
  End
 EndIf
  

;}-






Start()

;Affichage de la fenetre Menu Systeme et centrée 
Procedure Start()
  Date$ = FormatDate("%dd/%mm/%yyyy", Date())
  Time$ = FormatDate("%hh:%ii:%ss", Date())
  TextAffichage.s 
  
  OpenWindow(#MainForm, 2, 0, EcrL-10, EcrH, #TitleForm, #PB_Window_SystemMenu );| #PB_Window_Maximize)
  
  
  
 
 ;Affichage des boutons image
  ButtonImageGadget(#ButtonLogo, 0, 0, EcrL, #MargeLogo-10, ImageID(#ImageLogo))

 ButtonImageGadget(#Button1, 10,                     10 + #MargeLogo, TailleButtonImage, TailleButtonImage, ImageID(#Image1))
 ButtonImageGadget(#Button2, 10+ TailleButtonImage, 10 + #MargeLogo, TailleButtonImage, TailleButtonImage, ImageID(#Image2))
 ButtonImageGadget(#Button3, 10,                     10 + #MargeLogo+ TailleButtonImage, TailleButtonImage, TailleButtonImage, ImageID(#Image3))
 ButtonImageGadget(#Button4, 10+TailleButtonImage,  10 + #MargeLogo + TailleButtonImage, TailleButtonImage, TailleButtonImage, ImageID(#Image4))

 
  ;Affichage de la ligne d'information
  TextGadget(#AffichageTxt, TailleButtonImage * 2+ 20,  #MargeLogo, 400,20, TextAffichage)
    SetGadgetColor(#AffichageTxt, #PB_Gadget_FrontColor     , $386133)
  TextGadget(#AffichageTxt2, TailleButtonImage * 2+ 190,  28+#MargeLogo, 400,20, #LibLib+"           "+#LibQ+"         "+#LibHT+"         "+#LibTVA+"        "+#LibTTC)
    SetGadgetColor(#AffichageTxt2, #PB_Gadget_FrontColor     , $A5A59B)
    
    
    ;Affichage des boutons effacement ligne
  ButtonGadget(#SupprList01, TailleButtonImage * 2+ 20, #MargeLogo + 20 *2, #TailleButtonSuppr, #TailleButtonSuppr, "01")
  ButtonGadget(#SupprList02, TailleButtonImage * 2+ 20, #MargeLogo + 20 *3, #TailleButtonSuppr, #TailleButtonSuppr, "02")
  ButtonGadget(#SupprList03, TailleButtonImage * 2+ 20, #MargeLogo + 20 *4, #TailleButtonSuppr, #TailleButtonSuppr, "03")
  ButtonGadget(#SupprList04, TailleButtonImage * 2+ 20, #MargeLogo + 20 *5, #TailleButtonSuppr, #TailleButtonSuppr, "04")
  ButtonGadget(#SupprList05, TailleButtonImage * 2+ 20, #MargeLogo + 20 *6, #TailleButtonSuppr, #TailleButtonSuppr, "05")
  ButtonGadget(#SupprList06, TailleButtonImage * 2+ 20, #MargeLogo + 20 *7, #TailleButtonSuppr, #TailleButtonSuppr, "06")
  ButtonGadget(#SupprList07, TailleButtonImage * 2+ 20, #MargeLogo + 20 *8, #TailleButtonSuppr, #TailleButtonSuppr, "07")
  ButtonGadget(#SupprList08, TailleButtonImage * 2+ 20, #MargeLogo + 20 *9, #TailleButtonSuppr, #TailleButtonSuppr, "08")
  ButtonGadget(#SupprList09, TailleButtonImage * 2+ 20, #MargeLogo + 20*10, #TailleButtonSuppr, #TailleButtonSuppr, "09")
  ButtonGadget(#SupprList10, TailleButtonImage * 2+ 20, #MargeLogo + 20*11, #TailleButtonSuppr, #TailleButtonSuppr, "10")
  ButtonGadget(#SupprList11, TailleButtonImage * 2+ 20, #MargeLogo + 20*12, #TailleButtonSuppr, #TailleButtonSuppr, "11")
  ButtonGadget(#SupprList12, TailleButtonImage * 2+ 20, #MargeLogo + 20*13, #TailleButtonSuppr, #TailleButtonSuppr, "12")
  ButtonGadget(#SupprList13, TailleButtonImage * 2+ 20, #MargeLogo + 20*14, #TailleButtonSuppr, #TailleButtonSuppr, "13")
  ButtonGadget(#SupprList14, TailleButtonImage * 2+ 20, #MargeLogo + 20*15, #TailleButtonSuppr, #TailleButtonSuppr, "14")
  ButtonGadget(#SupprList15, TailleButtonImage * 2+ 20, #MargeLogo + 20*16, #TailleButtonSuppr, #TailleButtonSuppr, "15")
  ButtonGadget(#SupprList16, TailleButtonImage * 2+ 20, #MargeLogo + 20*17, #TailleButtonSuppr, #TailleButtonSuppr, "16")
  ButtonGadget(#SupprList17, TailleButtonImage * 2+ 20, #MargeLogo + 20*18, #TailleButtonSuppr, #TailleButtonSuppr, "17")
  ButtonGadget(#SupprList18, TailleButtonImage * 2+ 20, #MargeLogo + 20*19, #TailleButtonSuppr, #TailleButtonSuppr, "18")
  ButtonGadget(#SupprList19, TailleButtonImage * 2+ 20, #MargeLogo + 20*20, #TailleButtonSuppr, #TailleButtonSuppr, "19")
  ButtonGadget(#SupprList20, TailleButtonImage * 2+ 20, #MargeLogo + 20*21, #TailleButtonSuppr, #TailleButtonSuppr, "20")
  
  
      ;Affichage des boutons Annuler, Valider, Imprimer, aide
  ButtonImageGadget(#BtAnnuler, TailleButtonImage * 2+ 20,                        #MargeLogo + #TListX * 2 +100, TailleButtonImage/4, TailleButtonImage/4, ImageID(#ImageAnnul))
  ButtonImageGadget(#BtValider, TailleButtonImage * 2+ 15 + #TailleButtonSuppr*6, #MargeLogo + #TListX * 2 +100, TailleButtonImage/4, TailleButtonImage/4,  ImageID(#ImageValid))
  ButtonImageGadget(#BtImprim,  TailleButtonImage * 2+ 10+ #TailleButtonSuppr*12, #MargeLogo + #TListX * 2 +100, TailleButtonImage/4, TailleButtonImage/4,  ImageID(#ImagePrint))
  ButtonImageGadget(#BtAide,    TailleButtonImage * 2+ 5+ #TailleButtonSuppr*18, #MargeLogo + #TListX * 2  +100, TailleButtonImage/4, TailleButtonImage/4,  ImageID(#ImageHelp))
  
  ButtonImageGadget(#buttonplus1,  TailleButtonImage * 2+ 20,                        #MargeLogo + #TListX * 2 +110+TailleButtonImage/4, TailleButtonImage/4, TailleButtonImage/6, ImageID(#Imageplus1))
  ButtonImageGadget(#buttonplus2,  TailleButtonImage * 2+ 15 + #TailleButtonSuppr*6, #MargeLogo + #TListX * 2 +110+TailleButtonImage/4, TailleButtonImage/4, TailleButtonImage/6,  ImageID(#Imageplus2))
  ButtonImageGadget(#buttonplus3,  TailleButtonImage * 2+ 10+ #TailleButtonSuppr*12, #MargeLogo + #TListX * 2 +110+TailleButtonImage/4, TailleButtonImage/4, TailleButtonImage/6,  ImageID(#Imageplus3))
  ButtonImageGadget(#buttonplus4,  TailleButtonImage * 2+ 5+ #TailleButtonSuppr*18, #MargeLogo + #TListX * 2  +110+TailleButtonImage/4, TailleButtonImage/4, TailleButtonImage/6,  ImageID(#Imageplus4))

  
  
  
  ;affichage lien internet
  HyperLinkGadget(#LienInternet ,TailleButtonImage * 2.8,  #MargeLogo + #TListX * 3 +TailleButtonImage/4, 150, 20,  "www.SnackBreak.com", RGB(0,255,0), #PB_Font_Underline)
;#LienInternet
  
     ;Affichage   Nb produits, total HT, total TTC ((et vérouillage))
  StringGadget(#NbTotalPROD, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX,    #MargeLogo + #TListX * 2 +50, 30,#TListY, #ValStringNb20)
  DisableGadget(#NbTotalPROD, 1)
  StringGadget(#NbTotalHT,   TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + #TListX * 2 +50, 60,#TListY, #ValStringHT20)
  DisableGadget(#NbTotalHT, 1)
  StringGadget(#NbTotalTTC,  TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150,#MargeLogo + #TListX * 2 +50, 60,#TListY, #ValStringTTC20)
  DisableGadget(#NbTotalTTC, 1)
    
  
  ;Affichage des champs de liste Libellé
  StringGadget(101, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 2, #TListX, #TListY, #ValStringList01)
  StringGadget(102, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 3, #TListX, #TListY, #ValStringList02)
  StringGadget(103, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 4, #TListX, #TListY, #ValStringList03)
  StringGadget(104, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 5, #TListX, #TListY, #ValStringList04)
  StringGadget(105, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 6, #TListX, #TListY, #ValStringList05)
  StringGadget(106, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 7, #TListX, #TListY, #ValStringList06)
  StringGadget(107, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 8, #TListX, #TListY, #ValStringList07)
  StringGadget(108, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 * 9, #TListX, #TListY, #ValStringList08)
  StringGadget(109, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *10, #TListX, #TListY, #ValStringList09)
  StringGadget(110, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *11, #TListX, #TListY, #ValStringList10)
  StringGadget(111, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *12, #TListX, #TListY, #ValStringList11)
  StringGadget(112, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *13, #TListX, #TListY, #ValStringList12)
  StringGadget(113, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *14, #TListX, #TListY, #ValStringList13)
  StringGadget(114, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *15, #TListX, #TListY, #ValStringList14)
  StringGadget(115, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *16, #TListX, #TListY, #ValStringList15)
  StringGadget(116, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *17, #TListX, #TListY, #ValStringList16)
  StringGadget(117, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *18, #TListX, #TListY, #ValStringList17)
  StringGadget(118, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *19, #TListX, #TListY, #ValStringList18)
  StringGadget(119, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *20, #TListX, #TListY, #ValStringList19)
  StringGadget(120, TailleButtonImage * 2+ #TailleButtonSuppr * 2, #MargeLogo + 20 *21, #TListX, #TListY, #ValStringList20)
  
  ;Affichage des champs de liste Qté
  StringGadget(121, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 2, 30, #TListY, #ValStringNb01)
  StringGadget(122, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 3, 30, #TListY, #ValStringNb02)
  StringGadget(123, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 4, 30, #TListY, #ValStringNb03)
  StringGadget(124, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 5, 30, #TListY, #ValStringNb04)
  StringGadget(125, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 6, 30, #TListY, #ValStringNb05)
  StringGadget(126, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 7, 30, #TListY, #ValStringNb06)
  StringGadget(127, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 8, 30, #TListY, #ValStringNb07)
  StringGadget(128, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 9, 30, #TListY, #ValStringNb08)
  StringGadget(129, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 10, 30,#TListY, #ValStringNb09)
  StringGadget(130, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 11, 30,#TListY, #ValStringNb10)
  StringGadget(131, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 12, 30,#TListY, #ValStringNb11)
  StringGadget(132, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 13, 30,#TListY, #ValStringNb12)
  StringGadget(133, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 14, 30,#TListY, #ValStringNb13)
  StringGadget(134, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 15, 30,#TListY, #ValStringNb14)
  StringGadget(135, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 16, 30,#TListY, #ValStringNb15)
  StringGadget(136, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 17, 30,#TListY, #ValStringNb16)
  StringGadget(137, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 18, 30,#TListY, #ValStringNb17)
  StringGadget(138, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 19, 30,#TListY, #ValStringNb18)
  StringGadget(139, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 20, 30,#TListY, #ValStringNb19)
  StringGadget(140, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX, #MargeLogo + 20 * 21, 30,#TListY, #ValStringNb20)
  
  ;Affichage des champs de liste HT
  StringGadget(141, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 2, 60, #TListY, #ValStringHT01)
  StringGadget(142, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 3, 60, #TListY, #ValStringHT02)
  StringGadget(143, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 4, 60, #TListY, #ValStringHT03)
  StringGadget(144, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 5, 60, #TListY, #ValStringHT04)
  StringGadget(145, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 6, 60, #TListY, #ValStringHT05)
  StringGadget(146, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 7, 60, #TListY, #ValStringHT06)
  StringGadget(147, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 8, 60, #TListY, #ValStringHT07)
  StringGadget(148, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 9, 60, #TListY, #ValStringHT08)
  StringGadget(149, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 10, 60,#TListY, #ValStringHT09)
  StringGadget(150, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 11, 60,#TListY, #ValStringHT10)
  StringGadget(151, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 12, 60,#TListY, #ValStringHT11)
  StringGadget(152, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 13, 60,#TListY, #ValStringHT12)
  StringGadget(153, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 14, 60,#TListY, #ValStringHT13)
  StringGadget(154, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 15, 60,#TListY, #ValStringHT14)
  StringGadget(155, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 16, 60,#TListY, #ValStringHT15)
  StringGadget(156, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 17, 60,#TListY, #ValStringHT16)
  StringGadget(157, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 18, 60,#TListY, #ValStringHT17)
  StringGadget(158, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 19, 60,#TListY, #ValStringHT18)
  StringGadget(159, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 20, 60,#TListY, #ValStringHT19)
  StringGadget(160, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+30, #MargeLogo + 20 * 21, 60,#TListY, #ValStringHT20)
  
  ;Affichage des champs de liste TVA
  StringGadget(161, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 2, 60, #TListY, #ValStringTVA01)
  StringGadget(162, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 3, 60, #TListY, #ValStringTVA02)
  StringGadget(163, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 4, 60, #TListY, #ValStringTVA03)
  StringGadget(164, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 5, 60, #TListY, #ValStringTVA04)
  StringGadget(165, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 6, 60, #TListY, #ValStringTVA05)
  StringGadget(166, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 7, 60, #TListY, #ValStringTVA06)
  StringGadget(167, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 8, 60, #TListY, #ValStringTVA07)
  StringGadget(168, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 9, 60, #TListY, #ValStringTVA08)
  StringGadget(169, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 10, 60,#TListY, #ValStringTVA09)
  StringGadget(170, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 11, 60,#TListY, #ValStringTVA10)
  StringGadget(171, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 12, 60,#TListY, #ValStringTVA11)
  StringGadget(172, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 13, 60,#TListY, #ValStringTVA12)
  StringGadget(173, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 14, 60,#TListY, #ValStringTVA13)
  StringGadget(174, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 15, 60,#TListY, #ValStringTVA14)
  StringGadget(175, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 16, 60,#TListY, #ValStringTVA15)
  StringGadget(176, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 17, 60,#TListY, #ValStringTVA16)
  StringGadget(177, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 18, 60,#TListY, #ValStringTVA17)
  StringGadget(178, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 19, 60,#TListY, #ValStringTVA18)
  StringGadget(179, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 20, 60,#TListY, #ValStringTVA19)
  StringGadget(180, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+90, #MargeLogo + 20 * 21, 60,#TListY, #ValStringTVA20)
  
  ;Affichage des champs de liste TTC
  StringGadget(181, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 2, 60, #TListY, #ValStringTTC01)
  StringGadget(182, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 3, 60, #TListY, #ValStringTTC02)
  StringGadget(183, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 4, 60, #TListY, #ValStringTTC03)
  StringGadget(184, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 5, 60, #TListY, #ValStringTTC04)
  StringGadget(185, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 6, 60, #TListY, #ValStringTTC05)
  StringGadget(186, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 7, 60, #TListY, #ValStringTTC06)
  StringGadget(187, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 8, 60, #TListY, #ValStringTTC07)
  StringGadget(188, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 9, 60, #TListY, #ValStringTTC08)
  StringGadget(189, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 10, 60,#TListY, #ValStringTTC09)
  StringGadget(190, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 11, 60,#TListY, #ValStringTTC10)
  StringGadget(191, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 12, 60,#TListY, #ValStringTTC11)
  StringGadget(192, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 13, 60,#TListY, #ValStringTTC12)
  StringGadget(193, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 14, 60,#TListY, #ValStringTTC13)
  StringGadget(194, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 15, 60,#TListY, #ValStringTTC14)
  StringGadget(195, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 16, 60,#TListY, #ValStringTTC15)
  StringGadget(196, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 17, 60,#TListY, #ValStringTTC16)
  StringGadget(197, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 18, 60,#TListY, #ValStringTTC17)
  StringGadget(198, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 19, 60,#TListY, #ValStringTTC18)
  StringGadget(199, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 20, 60,#TListY, #ValStringTTC19)
  StringGadget(200, TailleButtonImage * 2+ #TailleButtonSuppr * 2 + #TListX+150, #MargeLogo + 20 * 21, 60,#TListY, #ValStringTTC20)
  
  
  
  ;Désactivation (hors Master des GadgetText   [0 = activé" / 1 = désactivé]  
  For i=101 To 120
    DisableGadget(i, 1) ; libellé
   ; DisableGadget(i+20, 0) ; quantité
    DisableGadget(i+40, 1) ; px HT
    DisableGadget(i+60, 1) ; TVA
    DisableGadget(i+80, 1) ; px TTC
  Next i
  
  
  ;création du thread (MAJ TextAffichage) 
Delay(500) ;bug si va trop vite pour MAJ parès ini  
CreateThread(@AlertThread(), 154)
 
  
  
   
  ;Boucle evenementielle jusqu'à fermeture de la fenetre
  Repeat 
    double=-1
  
    Event = WaitWindowEvent(10)
    
    
;actualise date et heure et num commande dans la fenetre
   Date$ = FormatDate("%dd/%mm/%yyyy", Date())
   Time$ = FormatDate("%hh:%ii:%ss", Date())
  ; TextAffichage.s = Date$ + LSet("", 10, " ")  + Time$ + LSet("", 10, " ") +"Commande : " + Str(NumCmde) + LSet("", 30, " ") + uuser
   ;SetGadgetText (#AffichageTxt, TextAffichage)
    
  
    

  Select Event
    
      Case #PB_Event_Gadget
        
         Select EventGadget()
             
             
;-Case Button 
;{-

           Case #ButtonLogo
             mdp.s =InputRequester (#TitleFor,"Entrez le mode de passe Admin","", #PB_InputRequester_Password)
             If mdp = password : IsMaster = 1 :uuser = "*** MASTER ***" : EndIf
             
             
           Case #Button1: nbClic1 = nbClic1+1
              ;MessageRequester("", Str(nbClic1))
                WindowProd(1)
             
           Case #Button2:  nbClic2= nbClic2+1
             ;MessageRequester("", Str(nbClic2))
                 WindowProd(2)
             
           Case #Button3:  nbClic3 = nbClic3+1
              ;MessageRequester("", Str(nbClic3))
                 WindowProd(3)
             
           Case #Button4:  nbClic4 = nbClic4+1
              ;MessageRequester("", Str(nbClic4))
                 WindowProd(4)
             
             
             
           Case #BtAnnuler
             Resultat = MessageRequester(#TitleFor + " - Important!","Voulez-vous vraiment effacer la commande ?",#PB_MessageRequester_YesNo)
             If Resultat = 6 : quitter=1 ;OUI
                For i=101 To 200
                 SetGadgetText(i, "") ;vider les champs 
                 DisableGadget(i, 1)  ;rebloquer les champs (si débloqués par MASTER)
                 nbClic1= 0: nbClic2= 0: nbClic3= 0: nbClic4= 0 : nbClic5= 0
               Next i
             EndIf  
            
           Case #BtValider
             Resultat = MessageRequester(#TitleFor + " - Important!","Voulez-vous valider la commande ?",#PB_MessageRequester_YesNo)
             If Resultat = 6 : quitter=1 ;OUI
               For i=101 To 200
                SetGadgetText(i, "") ;vider les champs 
                DisableGadget(i, 1)  ;rebloquer les champs (si débloqués par MASTER)
               Next i
               NumCmde=NumCmde+1    ;incrémenter NumCde
               nbClic1= 0: nbClic2= 0: nbClic3= 0: nbClic4= 0: nbClic5= 0
            EndIf
             
             
           Case #BtImprim
               MessageRequester("","imprimer")
               
             Case #BtAide 
             MessageRequester("","aide")
             
           Case #LienInternet 
            CheminFichier.s = NomChemin$ + "\param\siteweb.dt";calc.dt"
                       
            Debug CheminFichier
              resultat = RunProgram(CheminFichier)
              Debug resultat
             
             
               
           Case #buttonplus1
             MessageRequester("","plus1")    
           Case #buttonplus2
             MessageRequester("","plus2")  
           Case #buttonplus3
             MessageRequester("","plus3")   
           Case #buttonplus4
             MessageRequester("","plus4")   

             
 ;}-            
             
  
             
 ;-Case Suppr 
;{- 
           Case #SupprList01
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=101 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(101, 0) :DisableGadget(121, 0): DisableGadget(141, 0):DisableGadget(161, 0):DisableGadget(181, 0):EndIf
             EndIf 
             
             
           Case #SupprList02
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=102 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(102, 0) :DisableGadget(122, 0): DisableGadget(142, 0):DisableGadget(162, 0):DisableGadget(182, 0):EndIf
             EndIf 
              
             
           Case #SupprList03
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=103 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(103, 0) :DisableGadget(123, 0): DisableGadget(143, 0):DisableGadget(163, 0):DisableGadget(183, 0):EndIf
             EndIf                  
                
             
           Case #SupprList04
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=104 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(104, 0) :DisableGadget(124, 0): DisableGadget(144, 0):DisableGadget(164, 0):DisableGadget(184, 0):EndIf
             EndIf          
             
             
           Case #SupprList05
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=105 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(105, 0) :DisableGadget(125, 0): DisableGadget(145, 0):DisableGadget(165, 0):DisableGadget(185, 0):EndIf
             EndIf               
              
             
           Case #SupprList06
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=106 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(106, 0) :DisableGadget(126, 0): DisableGadget(146, 0):DisableGadget(166, 0):DisableGadget(186, 0):EndIf
             EndIf        
              
             
           Case #SupprList07
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=107 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(107, 0) :DisableGadget(127, 0): DisableGadget(147, 0):DisableGadget(167, 0):DisableGadget(187, 0):EndIf
             EndIf              
              
             
           Case #SupprList08
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=108 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(108, 0) :DisableGadget(128, 0): DisableGadget(148, 0):DisableGadget(168, 0):DisableGadget(188, 0):EndIf
             EndIf            
             
             
           Case #SupprList09
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=109 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(109, 0) :DisableGadget(129, 0): DisableGadget(149, 0):DisableGadget(169, 0):DisableGadget(189, 0):EndIf
             EndIf             
             
             
           Case #SupprList10
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=110 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(110, 0) :DisableGadget(130, 0): DisableGadget(150, 0):DisableGadget(170, 0):DisableGadget(190, 0):EndIf
             EndIf             
             
             
           Case #SupprList11
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=111 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(111, 0) :DisableGadget(131, 0): DisableGadget(151, 0):DisableGadget(171, 0):DisableGadget(191, 0):EndIf
             EndIf             
              
             
           Case #SupprList12
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=112 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(112, 0) :DisableGadget(132, 0): DisableGadget(152, 0):DisableGadget(172, 0):DisableGadget(192, 0):EndIf
             EndIf            
             
             
           Case #SupprList13
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=113 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(113, 0) :DisableGadget(133, 0): DisableGadget(153, 0):DisableGadget(173, 0):DisableGadget(193, 0):EndIf
             EndIf             
               
             
           Case #SupprList14
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=114 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(114, 0) :DisableGadget(134, 0): DisableGadget(154, 0):DisableGadget(174, 0):DisableGadget(194, 0):EndIf
             EndIf           
              
             
           Case #SupprList15
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=115 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(115, 0) :DisableGadget(135, 0): DisableGadget(155, 0):DisableGadget(175, 0):DisableGadget(195, 0):EndIf
             EndIf            
               
             
           Case #SupprList16
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=116 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(116, 0) :DisableGadget(136, 0): DisableGadget(156, 0):DisableGadget(176, 0):DisableGadget(196, 0):EndIf
             EndIf           
              
             
           Case #SupprList17
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=117 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(117, 0) :DisableGadget(137, 0): DisableGadget(157, 0):DisableGadget(177, 0):DisableGadget(197, 0):EndIf
             EndIf
              
             
           Case #SupprList18
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             For i=118 To 119
               SetGadgetText(i, GetGadgetText(i+1)):SetGadgetText(i+20, GetGadgetText(i+21)):SetGadgetText(i+40, GetGadgetText(i+41)):SetGadgetText(i+60, GetGadgetText(i+61)):SetGadgetText(i+80, GetGadgetText(i+1))
             Next i:   SetGadgetText(120, "")
             nbClic5= nbClic5-1
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(118, 0) :DisableGadget(138, 0): DisableGadget(158, 0):DisableGadget(178, 0):DisableGadget(198, 0):EndIf
             EndIf            
              
             
           Case #SupprList19
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             SetGadgetText(119, GetGadgetText(120)):SetGadgetText(139, GetGadgetText(140)):SetGadgetText(159, GetGadgetText(160)):SetGadgetText(179, GetGadgetText(180)):SetGadgetText(199, GetGadgetText(200))
             SetGadgetText(120, ""):SetGadgetText(140, ""):SetGadgetText(160, ""):SetGadgetText(180, ""):SetGadgetText(200, "")
            nbClic5= nbClic5-1 
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(119, 0) :DisableGadget(139, 0): DisableGadget(159, 0):DisableGadget(179, 0):DisableGadget(199, 0):EndIf
             EndIf            
              
             
           Case #SupprList20
               double = 0 : Temps = GetTickCount_ () : Repeat : Event = WindowEvent () : If Event = #WM_LBUTTONDBLCLK : double = 1 : EndIf : Until GetTickCount_ () - Temps >= Temps_DoubleClic Or DoubleClic = 1 
       ;ACTION DOUBLE CLIC
               If double=1 
             Resultat = MessageRequester(#TitleFor + " - Important","Voulez-vous vraiment supprimer cette ligne?",#PB_MessageRequester_YesNo)
             If Resultat = 6 ;OUI
             
             SetGadgetText(120, ""):SetGadgetText(140, ""):SetGadgetText(160, ""):SetGadgetText(180, ""):SetGadgetText(200, "")
            nbClic5= nbClic5-1 
           EndIf
           
       ;ACTION SIMPLE CLIC (master uniquement)
             ElseIf double=0 
               If IsMaster=1 : DisableGadget(120, 0) :DisableGadget(140, 0): DisableGadget(160, 0):DisableGadget(180, 0):DisableGadget(200, 0):EndIf
             EndIf            
             
;}-             
             
             
           


          
          
             
         EndSelect ;fin select si cliqué button
         
         
          Case #PB_Event_CloseWindow 
           Resultat = MessageRequester(#TitleFor + " - Important!","Voulez-vous vraiment quitter le programme ?"+Chr(10)+Chr(10)+"Toutes les informations non enregistrées seront perdues",#PB_MessageRequester_YesNo)
             If Resultat = 6 : quitter=1 ;OUI
               MessageRequester(#versio, "Merci d'avoir utilisé "+ #TitleFor )
               End
             EndIf 
             quitter=0
             
             
     EndSelect    ;fin select si action
     
  
   Until Event =#PB_Event_CloseWindow And quitter=1
   
           
 EndProcedure
 
 

Procedure WindowProd(NumProdList)

If OpenWindow(#SecForm, 100, 200,  420, 400, "Double-clic pour VALIDER le produit", #PB_Window_SystemMenu | #PB_Window_MinimizeGadget)

  ListIconGadget(#GadgetListSecond, 10, 10, 400, 200, #LibLib, 200)
  AddGadgetColumn(#GadgetListSecond, 1, #LibTTC, 98)
  AddGadgetColumn(#GadgetListSecond, 2, #LibTVA, 98)
  
  If NumProdList= 1: ChxProdNb = NbProd01 :EndIf
  If NumProdList= 2: ChxProdNb = NbProd02 :EndIf
  If NumProdList= 3: ChxProdNb = NbProd03 :EndIf
  If NumProdList= 4: ChxProdNb = NbProd04 :EndIf
  
  
  For i=1 To ChxProdNb
    If NumProdList= 1: AddGadgetItem(#GadgetListSecond, -1, ProdLib1(i) +Chr(10)+ ProdTTC1(i) +Chr(10)+ ProdTVA1(i)) :EndIf
    If NumProdList= 2: AddGadgetItem(#GadgetListSecond, -1, ProdLib2(i) +Chr(10)+ ProdTTC2(i) +Chr(10)+ ProdTVA2(i)) :EndIf
    If NumProdList= 3: AddGadgetItem(#GadgetListSecond, -1, ProdLib3(i) +Chr(10)+ ProdTTC3(i) +Chr(10)+ ProdTVA3(i)) :EndIf
    If NumProdList= 4: AddGadgetItem(#GadgetListSecond, -1, ProdLib4(i) +Chr(10)+ ProdTTC4(i) +Chr(10)+ ProdTVA4(i)) :EndIf
  Next 
  
  SetGadgetState(#GadgetListSecond, 8)
  
  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Gadget
      
      Select EventGadget()

          
        Case #GadgetListSecond
          
          If EventType() = 2 ;double clic
            NumItemSel = GetGadgetState(#GadgetListSecond)
            NameItemSel.s = GetGadgetText(#GadgetListSecond)
            
            If NumItemSel<> -1
              MessageRequester("Information", "item: "+Str(NumItemSel)+" / "+NameItemSel, 0)
              CloseWindow(#SecForm)
              
              
              
            EndIf  
          EndIf
          
     EndSelect

    EndIf
    
  Until Event = #PB_Event_CloseWindow
EndIf

End 
   
EndProcedure



 Procedure AlertThread(Parameter)
;va réactualiser TextAffichage
  Repeat
   TextAffichage.s = Date$ + LSet("", 10, " ")  + Time$ + LSet("", 10, " ") +"Commande : " + Str(NumCmde) + LSet("", 30, " ") + uuser
   SetGadgetText (#AffichageTxt, TextAffichage)
    Delay(1000)
  ForEver

EndProcedure


; IDE Options = PureBasic 5.22 LTS (Windows - x86)
; CursorPosition = 1241
; FirstLine = 1212
; Folding = --
; EnableUnicode
; EnableXP