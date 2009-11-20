; Installer script for Taverna
; Compile with NSI



; Human readable product name
!define PRODUCT_NAME "Taverna Workbench 2.1 beta 2"
; Who is publishing the software
!define PUBLISHER "myGrid"
!define COPYRIGHT "University of Manchester"
; Short-version of version 
!define VERSION "2.1.b2"

; Short name used for registry keys
!define SHORT_NAME "Taverna Workbench ${VERSION}"

; Folder containing the source files to copy, relative to the .nsi file
!define SOURCE "Taverna 2.1 beta 2"

!define HELP_URL "http://www.mygrid.org.uk/tools/taverna/taverna-mailing-lists/"
!define ABOUT_URL "http://www.taverna.org.uk/"


!include MUI2.nsh


;--------------------------------

; The name of the installer
Name "${PRODUCT_NAME}"

; The file to write
OutFile "taverna-workbench-${VERSION}-installer.exe"

; The default installation directory
InstallDir "$PROGRAMFILES\${SHORT_NAME}"


; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\${SHORT_NAME}" "Install_Dir"

; Request application privileges for Windows Vista
; admin needed for writing to Program files and registry
RequestExecutionLevel admin
;RequestExecutionLevel user

; solid LZMA turned out to be the best compressor
SetCompressor /SOLID LZMA


!define MUI_ICON "${SOURCE}\lib\launcher_logo.ico"
!define MUI_UNICON "${SOURCE}\lib\launcher_logo.ico"
Icon "${SOURCE}\lib\launcher_logo.ico"


VIAddVersionKey "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey "Comments" "${ABOUT_URL}"
VIAddVersionKey "CompanyName" "${PUBLISHER}"
; VIAddVersionKey "LegalTrademarks" "Taverna is a trademark of University of Manchester"
VIAddVersionKey "LegalCopyright" "${COPYRIGHT}"
VIAddVersionKey "FileDescription" "${PRODUCT_NAME}"
VIAddVersionKey "FileVersion" "${VERSION}"
VIProductVersion "0.0.0.0"
 


;--------------------------------

; Pages

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

; The stuff to install
Section "${PRODUCT_NAME} (required)"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r `${SOURCE}\*.*`

  
  ; Write the installation path into the registry
  WriteRegStr HKLM "SOFTWARE\${SHORT_NAME}" "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "DisplayVersion" "${VERSION}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "DisplayIcon" "$INSTDIR\taverna.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "HelpLink" "${HELP_URL}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "Publisher" "${PUBLISHER}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "Readme" "$INSTDIR\readme.txt"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "URLInfoAbout" "${ABOUT_URL}"

  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Taverna"
  ; We don't create the uninstall shortcut
  ;CreateShortCut "$SMPROGRAMS\Taverna\Uninstall ${PRODUCT_NAME}.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\Taverna\${PRODUCT_NAME}.lnk" "$INSTDIR\taverna.exe" "" "$INSTDIR\taverna.exe" 0
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${SHORT_NAME}"
  DeleteRegKey HKLM "SOFTWARE\${SHORT_NAME}"

  ; Just a plain recursive deletion of the installation folder
  RMDir /r "$INSTDIR"

  ; Remove start menu items
  Delete "$SMPROGRAMS\Taverna\Uninstall ${PRODUCT_NAME}.lnk"
  Delete "$SMPROGRAMS\Taverna\${PRODUCT_NAME}.lnk" 
   
  ; Delete if empty
  RMDir "$SMPROGRAMS\Taverna"

SectionEnd



; -------------- Java installation

; Java Launcher with automatic JRE installation
;-----------------------------------------------
 
 
 
; Minimum 5.0
!define JRE_VERSION "5.0"

; Should download at least 6.0 u14 - check link at
; http://www.java.com/en/download/manual.jsp#win
!define JRE_URL "http://javadl.sun.com/webapps/download/AutoDL?BundleId=32267"
 
!define JAVAEXE "javaw.exe"
 
 
!include "FileFunc.nsh"
!insertmacro GetFileVersion
!insertmacro GetParameters
!include "WordFunc.nsh"
!insertmacro VersionCompare
 
Section ""
  Call GetJRE
  Pop $R0
SectionEnd
 
;  returns the full path of a valid java.exe
;  looks in:
;  1 - .\jre directory (JRE Installed with application)
;  2 - JAVA_HOME environment variable
;  3 - the registry
;  4 - hopes it is in current dir or PATH
Function GetJRE
    Push $R0
    Push $R1
    Push $2
 
  ; 1) Check local JRE
  CheckLocal:
    ClearErrors
    StrCpy $R0 "$EXEDIR\jre\bin\${JAVAEXE}"
    IfFileExists $R0 JreFound
 
  ; 2) Check for JAVA_HOME
  CheckJavaHome:
    ClearErrors
    ReadEnvStr $R0 "JAVA_HOME"
    StrCpy $R0 "$R0\bin\${JAVAEXE}"
    IfErrors CheckRegistry     
    IfFileExists $R0 0 CheckRegistry
    Call CheckJREVersion
    IfErrors CheckRegistry JreFound
 
  ; 3) Check for registry
  CheckRegistry:
    ClearErrors
    ReadRegStr $R1 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" "CurrentVersion"
    ReadRegStr $R0 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\$R1" "JavaHome"
    StrCpy $R0 "$R0\bin\${JAVAEXE}"
    IfErrors DownloadJRE
    IfFileExists $R0 0 DownloadJRE
    Call CheckJREVersion
    IfErrors DownloadJRE JreFound
 
  DownloadJRE:
;    Call ElevateToAdmin
    MessageBox MB_ICONINFORMATION "${PRODUCT_NAME} uses Java Runtime Environment ${JRE_VERSION}, it will now be downloaded and installed."
    StrCpy $2 "$TEMP\Java Runtime Environment.exe"
    nsisdl::download /TIMEOUT=30000 ${JRE_URL} $2
    Pop $R0 ;Get the return value
    StrCmp $R0 "success" +3
      MessageBox MB_ICONSTOP "Download failed: $R0"
      Abort
    ExecWait $2
    Delete $2
 
    ReadRegStr $R1 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" "CurrentVersion"
    ReadRegStr $R0 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\$R1" "JavaHome"
    StrCpy $R0 "$R0\bin\${JAVAEXE}"
    IfFileExists $R0 0 GoodLuck
    Call CheckJREVersion
    IfErrors GoodLuck JreFound
 
  ; 4) wishing you good luck
  GoodLuck:
    StrCpy $R0 "${JAVAEXE}"
    ; MessageBox MB_ICONSTOP "Cannot find appropriate Java Runtime Environment."
    ; Abort
 
  JreFound:
    Pop $2
    Pop $R1
    Exch $R0
FunctionEnd
 
; Pass the "javaw.exe" path by $R0
Function CheckJREVersion
    Push $R1
 
    ; Get the file version of javaw.exe
    ${GetFileVersion} $R0 $R1
    ${VersionCompare} ${JRE_VERSION} $R1 $R1
 
    ; Check whether $R1 != "1"
    ClearErrors
    StrCmp $R1 "1" 0 CheckDone
    SetErrors
 
  CheckDone:
    Pop $R1
FunctionEnd
 
; Attempt to give the UAC plug-in a user process and an admin process.
; Function ElevateToAdmin
;   UAC_Elevate:
;     UAC::RunElevated
;     StrCmp 1223 $0 UAC_ElevationAborted ; UAC dialog aborted by user?
;     StrCmp 0 $0 0 UAC_Err ; Error?
;     StrCmp 1 $1 0 UAC_Success ;Are we the real deal or just the wrapper?
;     Quit
;  
;   UAC_ElevationAborted:
;     # elevation was aborted, run as normal?
;     MessageBox MB_ICONSTOP "This installer requires admin access, aborting!"
;     Abort
;  
;   UAC_Err:
;     MessageBox MB_ICONSTOP "Unable to elevate, error $0"
;     Abort
;  
;   UAC_Success:
;     StrCmp 1 $3 +4 ;Admin?
;     StrCmp 3 $1 0 UAC_ElevationAborted ;Try again?
;     MessageBox MB_ICONSTOP "This installer requires admin access, try again"
;     goto UAC_Elevate 
; FunctionEnd


; ---------------------------------
