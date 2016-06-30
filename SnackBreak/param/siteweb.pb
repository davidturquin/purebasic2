#TitleFor = "Snack Break"
#TitleForm = "Snack Break - Gestion des commandes"

#PersoExt = "prefs"





;repertoire en cours
Buffer.s = Space(256)
Buf_Len = 256
GetCurrentDirectory_(Buf_Len, @Buffer)
NomChemin$ = PeekS(@Buffer)


EcrL= GetSystemMetrics_(#SM_CXSCREEN) -50
EcrH = GetSystemMetrics_(#SM_CYSCREEN) -100


CheminFichier.s = NomChemin$ + "\siteweb."+#PersoExt






If ReadFile(0, CheminFichier)
  While Eof(0) = 0
    siteweb$ = ReadString(0)   
   Wend
  CloseFile(0)
;MessageRequester(#TitleFor + " - Information", "", #MB_ICONINFORMATION)
Else
     resultat$="non"
  End
 EndIf


 
 
 
 

 If resultat$<>"non"
   
   If OpenWindow(0,0,0,EcrL, EcrH, #TitleFor, #PB_Window_SystemMenu | #PB_Window_ScreenCentered);#PB_Window_Tool  ) 
              WebGadget(0,0,0,EcrL,EcrH, siteweb$ )
    ; Note: si vous désirez utiliser un fichier local, changez le dernier paramètre en "file://" + chemin + nomdufichier
    Repeat 
   Until WaitWindowEvent() = #PB_Event_CloseWindow
  EndIf
  
EndIf

; IDE Options = PureBasic 5.22 LTS (Windows - x86)
; CursorPosition = 46
; FirstLine = 1
; EnableUnicode
; EnableXP
; Executable = siteweb.exe