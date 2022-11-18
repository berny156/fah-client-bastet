; Defines
!define PRODUCT_NAME            "FAHClient"
!define PROJECT_NAME            "Folding@home"
!define DISPLAY_NAME            "Folding@home Client"

!define WEB_CLIENT_URL          "https://app.foldingathome.org/"

!define CLIENT_NAME             "FAHClient"
!define CLIENT_EXE              "FAHClient.exe"
!define CLIENT_ICON             "FAHClient.ico"
!define CLIENT_HOME             "..\.."

!define MENU_PATH               "$SMPROGRAMS\${PROJECT_NAME}"

!define UNINSTALLER             "Uninstall.exe"

!define PRODUCT_CONFIG          "config.xml"
!define PRODUCT_LICENSE         "${CLIENT_HOME}\LICENSE"
!define PRODUCT_VENDOR          "foldingathome.org"
!define PRODUCT_TARGET          "${CLIENT_HOME}\%(package)s"
!define PRODUCT_VERSION         "%(version)s"
!define PRODUCT_WEBSITE         "https://foldingathome.org/"
!define PRODUCT_UNINST_KEY \
  "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_DIR_REGKEY \
  "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}"

; Language page settings
!define MUI_LANGDLL_ALWAYSSHOW
!define MUI_LANGDLL_ALLLANGUAGES
!define MUI_LANGDLL_REGISTRY_ROOT "HKLM"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_DIR_REGKEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

; Installer settings
!define MUI_ABORTWARNING
!define MUI_ICON "${CLIENT_HOME}\images\fahlogo.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "Resources\Header-150x57.bmp"
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_WELCOMEFINISHPAGE_BITMAP "Resources\Side-164x314.bmp"

; Uninstaller settings
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define MUI_UNHEADERIMAGE
!define MUI_UNHEADERIMAGE_BITMAP "Resources\Header-150x57.bmp"
!define MUI_UNHEADERIMAGE_BITMAP_NOSTRETCH

; Additional Plugins and Include support
!addincludedir "Include"
!addplugindir "plugins\x86-unicode"
Unicode true ; For all languages to display correctly


; Variables
Var AutoStart
Var UninstDir
Var DataDir
Var InstallDirText
Var DataDirText


; Includes
!include MUI2.nsh
!include nsDialogs.nsh
!include LogicLib.nsh
!include EnvVarUpdate.nsh
!include WinVer.nsh
!include FileFunc.nsh ; File Functions Header used by RefreshShellIcons
!insertmacro RefreshShellIcons
!insertmacro un.RefreshShellIcons


; Config
Name "${DISPLAY_NAME} v${PRODUCT_VERSION}"
BrandingText "${DISPLAY_NAME} v${PRODUCT_VERSION}"
OutFile "${PRODUCT_TARGET}"
InstallDir "$PROGRAMFILES%(PACKAGE_ARCH)s\${PRODUCT_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
SetCompressor lzma


; Pages
!insertmacro MUI_PAGE_WELCOME

!insertmacro MUI_PAGE_LICENSE "${PRODUCT_LICENSE}"
Page custom OnInstallPageEnter OnInstallPageLeave
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Start Folding@home"
!define MUI_FINISHPAGE_RUN_FUNCTION OnRunFAH
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!insertmacro MUI_PAGE_FINISH

!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_TITLE "Instructions"
!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_INFO \
  "You may choose to save your configuration and work unit data for later \
   use or completely uninstall."
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English" ; (default language listed first)
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "SpanishInternational"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Korean"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Dutch"
!insertmacro MUI_LANGUAGE "Danish"
!insertmacro MUI_LANGUAGE "Swedish"
!insertmacro MUI_LANGUAGE "Norwegian"
!insertmacro MUI_LANGUAGE "NorwegianNynorsk"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "Greek"
!insertmacro MUI_LANGUAGE "Russian"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "Polish"
!insertmacro MUI_LANGUAGE "Ukrainian"
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "Slovak"
!insertmacro MUI_LANGUAGE "Croatian"
!insertmacro MUI_LANGUAGE "Bulgarian"
!insertmacro MUI_LANGUAGE "Hungarian"
!insertmacro MUI_LANGUAGE "Thai"
!insertmacro MUI_LANGUAGE "Romanian"
!insertmacro MUI_LANGUAGE "Latvian"
!insertmacro MUI_LANGUAGE "Macedonian"
!insertmacro MUI_LANGUAGE "Estonian"
!insertmacro MUI_LANGUAGE "Turkish"
!insertmacro MUI_LANGUAGE "Lithuanian"
!insertmacro MUI_LANGUAGE "Slovenian"
!insertmacro MUI_LANGUAGE "Serbian"
!insertmacro MUI_LANGUAGE "SerbianLatin"
!insertmacro MUI_LANGUAGE "Arabic"
!insertmacro MUI_LANGUAGE "Farsi"
!insertmacro MUI_LANGUAGE "Hebrew"
!insertmacro MUI_LANGUAGE "Indonesian"
!insertmacro MUI_LANGUAGE "Mongolian"
!insertmacro MUI_LANGUAGE "Luxembourgish"
!insertmacro MUI_LANGUAGE "Albanian"
!insertmacro MUI_LANGUAGE "Breton"
!insertmacro MUI_LANGUAGE "Belarusian"
!insertmacro MUI_LANGUAGE "Icelandic"
!insertmacro MUI_LANGUAGE "Malay"
!insertmacro MUI_LANGUAGE "Bosnian"
!insertmacro MUI_LANGUAGE "Kurdish"
!insertmacro MUI_LANGUAGE "Irish"
!insertmacro MUI_LANGUAGE "Uzbek"
!insertmacro MUI_LANGUAGE "Galician"
!insertmacro MUI_LANGUAGE "Afrikaans"
!insertmacro MUI_LANGUAGE "Catalan"
!insertmacro MUI_LANGUAGE "Esperanto"
;!insertmacro MUI_LANGUAGE "Asturian" ; Disabled due to NSIS compiler v3.08 warning
!insertmacro MUI_LANGUAGE "Basque"
!insertmacro MUI_LANGUAGE "Pashto"
!insertmacro MUI_LANGUAGE "ScotsGaelic"
!insertmacro MUI_LANGUAGE "Georgian"
!insertmacro MUI_LANGUAGE "Vietnamese"
!insertmacro MUI_LANGUAGE "Welsh"
!insertmacro MUI_LANGUAGE "Armenian"
!insertmacro MUI_LANGUAGE "Corsican"
!insertmacro MUI_LANGUAGE "Tatar"
!insertmacro MUI_LANGUAGE "Hindi"
!insertmacro MUI_RESERVEFILE_LANGDLL

RequestExecutionLevel admin


; Sections
Section -Install
  ReadRegStr $UninstDir HKLM "${PRODUCT_DIR_REGKEY}" "Path"

  ; Remove from PATH and Registry (FAH v7.x uninstaller was not run)
  IfFileExists "$UninstDir\FAHControl.exe" 0 skip_remove
    ${EnvVarUpdate} $0 "PATH" "R" "HKCU" $INSTDIR
    DeleteRegKey HKLM "${PRODUCT_UNINST_KEY}"
    DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  ; Remove service (FAH Client v7.x only commands)
  IfFileExists "$UninstDir\${CLIENT_EXE}" 0 skip_remove
    DetailPrint "Removing service, if previously installed. (This can take awhile)"
    nsExec::Exec '"$UninstDir\${CLIENT_EXE}" --stop-service'
    nsExec::Exec '"$UninstDir\${CLIENT_EXE}" --uninstall-service'
skip_remove:

  ; Terminate
  Call CloseApps

  ; Remove Autostart
  Delete "$SMSTARTUP\${CLIENT_NAME}.lnk"
  Delete "$SMSTARTUP\FAHControl.lnk"

  ; Uninstall old software
  ; Avoid simply removing the whole directory as that causes subsequent file
  ; writes to fail for several seconds.
  DetailPrint "Uninstalling any conflicting Folding@home software"
  Push $INSTDIR
  Call EmptyDir

  ; Install files
install_files:
  ClearErrors
  SetOverwrite try
  SetOutPath "$INSTDIR"
  File /oname=${CLIENT_EXE}  "${CLIENT_HOME}\fah-client.exe"
  File "${CLIENT_HOME}\HideConsole.exe"
  File /oname=${CLIENT_ICON} "${CLIENT_HOME}\images\fahlogo.ico"
  File /oname=README.txt     "${CLIENT_HOME}\README.md"
  File /oname=License.txt    "${CLIENT_HOME}\LICENSE"
  File /oname=ChangeLog.txt  "${CLIENT_HOME}\CHANGELOG.md"
  %(NSIS_INSTALL_FILES)s

  IfErrors 0 +2
    MessageBox MB_RETRYCANCEL "Failed to install files.  Most likely some \
        software, possibly Folding@home is currently using one or more files \
        that the installer is trying to upgrade.  Please stop all running \
        Folding@home software and quit any applications that are using files \
        from the Folding@home installation.  Note, complete shutdown can take \
        a little while after the application has closed." \
        IDRETRY install_files IDCANCEL abort

  ; Add to PATH
  ${EnvVarUpdate} $0 "PATH" "A" "HKCU" $INSTDIR

  ; Data directory
  CreateDirectory $DataDir
  ; Set working directory for shortcuts, etc. Do before AccessControl::GrantOnFile
  SetOutPath $DataDir
  AccessControl::GrantOnFile "$DataDir" "(S-1-5-32-545)" "FullAccess"

  ; Delete old desktop links for Current and All Users
  SetShellVarContext current
  Delete "$DESKTOP\FAHControl.lnk"
  Delete "$DESKTOP\Folding@home.lnk"
  Delete "$DESKTOP\Folding @Home.lnk"
  SetShellVarContext all
  Delete "$DESKTOP\FAHControl.lnk"
  Delete "$DESKTOP\Folding@home.lnk"
  Delete "$DESKTOP\Folding @Home.lnk"

  ; Desktop link
  CreateShortCut "$DESKTOP\Folding @Home.lnk" "$INSTDIR\HideConsole.exe" \
    '"$INSTDIR\${CLIENT_EXE}" --open-web-control' "$INSTDIR\${CLIENT_ICON}"

  ; Write uninstaller
write_uninstaller:
  ClearErrors
  WriteUninstaller "$INSTDIR\${UNINSTALLER}"
  IfErrors 0 +2
    MessageBox MB_ABORTRETRYIGNORE "Failed to create uninstaller" \
      IDABORT abort IDRETRY write_uninstaller

  ; Save uninstall information
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\${UNINSTALLER}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\${CLIENT_ICON}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEBSITE}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_VENDOR}"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\${CLIENT_EXE}"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "Path" "$INSTDIR"
  WriteRegStr HKLM "${PRODUCT_UNINST_KEY}" "DataDirectory" $DataDir

  ; Delete old installed Start Menu links for Current and All Users
  ; Current User, C:\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
  SetShellVarContext current
  RMDir /r "$SMPROGRAMS\${PRODUCT_NAME}"
  RMDir /r "$SMPROGRAMS\${PROJECT_NAME}"
  ; All Users, C:\ProgramData\Microsoft\Windows\Start Menu\Programs
  SetShellVarContext all
  RMDir /r "$SMPROGRAMS\${PRODUCT_NAME}"
  RMDir /r "$SMPROGRAMS\${PROJECT_NAME}" ; = ${MENU_PATH}
  ; Start Menu
  CreateDirectory "${MENU_PATH}"
  CreateShortCut "${MENU_PATH}\Folding@home.lnk" "$INSTDIR\HideConsole.exe" \
    '"$INSTDIR\${CLIENT_EXE}" --open-web-control' "$INSTDIR\${CLIENT_ICON}"
  CreateShortCut "${MENU_PATH}\Data Directory.lnk" "$DataDir"
  CreateShortCut "${MENU_PATH}\Homepage.lnk" "$INSTDIR\Homepage.url"
  CreateShortCut "${MENU_PATH}\Uninstall.lnk" "$INSTDIR\${UNINSTALLER}"

  ; Internet shortcuts
  WriteIniStr "$INSTDIR\Homepage.url" "InternetShortcut" "URL" \
    "${PRODUCT_WEBSITE}"

  ; Delete old Autostart link for Current and All Users
  SetShellVarContext current
  Delete "$SMSTARTUP\Folding@home.lnk"
  Delete "$SMSTARTUP\${CLIENT_NAME}.lnk"
  SetShellVarContext all
  Delete "$SMSTARTUP\Folding@home.lnk"
  Delete "$SMSTARTUP\${CLIENT_NAME}.lnk"
  ; Autostart
  ${If} $AutoStart == ${BST_CHECKED}
    CreateShortCut "$SMSTARTUP\Folding@home.lnk" "$INSTDIR\HideConsole.exe" \
      "$INSTDIR\${CLIENT_EXE}" "$INSTDIR\${CLIENT_ICON}"
  ${EndIf}

  ; Refresh desktop to cleanup any deleted desktop icons
  ${RefreshShellIcons}

  Return

abort:
  Abort
SectionEnd


Section -un.Program
  ; Shutdown running client
  DetailPrint "Shutting down any local clients"

  ; Terminate
  Call un.CloseApps

  ; Menu
  RMDir /r "${MENU_PATH}"

  ; Autostart
  Delete "$SMSTARTUP\Folding@home.lnk"

  ; Desktop
  Delete "$DESKTOP\Folding @Home.lnk"

  ; Remove from PATH
  ${un.EnvVarUpdate} $0 "PATH" "R" "HKCU" $INSTDIR

  ; Registry
  DeleteRegKey HKLM "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"

  ; Refresh desktop to cleanup any deleted desktop icons
  ${un.RefreshShellIcons}

  ; Program directory
  remove_dir:
  ClearErrors
  RMDir /r "$INSTDIR"
  IfErrors 0 +3
    IfSilent +2
    MessageBox MB_RETRYCANCEL "Failed to remove $INSTDIR.  Please stop all \
      running Folding@home software." IDRETRY remove_dir
SectionEnd


Section /o un.Data
  RMDir /r $DataDir
SectionEnd


; Functions
Function .onInit
  ${IfNot} ${AtLeastWin7}
    MessageBox MB_OK "Windows 7 or newer required"
    Quit
  ${EndIf}

  ; 32/64 bit registry
  ;SetRegView %(PACKAGE_ARCH)s

  SetShellVarContext all

  ; Language selection page
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd


!macro EndProcess un
Function ${un}EndProcess
  Exch $R1
  Push $R0
  Push $R2

  Retry:
    nsProcess::_FindProcess /NOUNLOAD "$R1"
    Pop $R0
    IntCmp $R0 0 0 0 End

    nsProcess::_KillProcess /NOUNLOAD "$R1"
    Pop $R0

    StrCpy $R2 0
    CheckAgain:
      Sleep 250 ; 1/4s
      nsProcess::_FindProcess /NOUNLOAD "$R1"
      Pop $R0
      IntCmp $R0 0 0 0 End
      IntOp $R2 $R2 + 1
      IntCmp $R2 120 0 CheckAgain ; Max 30s wait

    MessageBox MB_RETRYCANCEL "Please close $R1, and press 'Retry'. \
        $\r$\n$\r$\nNote: Folding@home maybe running in the system tray \
        in the lower righthand corner of your screen." \
        /SD IDCANCEL IDCANCEL End IDRETRY Retry

  End:
  Pop $R2
  Pop $R0
  Pop $R1
  nsProcess::_Unload
FunctionEnd
!macroend

!insertmacro EndProcess ""
!insertmacro EndProcess "un."


Function CloseApps
  Push "${CLIENT_EXE}"
  Call EndProcess

  Push "FAHControl.exe"
  Call EndProcess
FunctionEnd


Function EmptyDir
  Pop $0

  FindFirst $1 $2 $0\*.*
  empty_dir_loop:
    StrCmp $2 "" empty_dir_done

    ; Skip . and ..
    StrCmp $2 "." empty_dir_next
    StrCmp $2 ".." empty_dir_next

    ; Remove subdirectories
    IfFileExists $0\$2\*.* 0 +3
    RmDir /r $0\$2
    Goto empty_dir_next

    ; Remove file
    Delete $INSTDIR\$2

    ; Next
    empty_dir_next:
    FindNext $1 $2
    Goto empty_dir_loop

  ; Done
  empty_dir_done:
  FindClose $1
FunctionEnd


Function ValidPath
  Pop $0

  ; Get Length
  StrLen $1 $0

loop:
  ; Check length
  StrCmp $1 0 pass

  ; Get next char
  StrCpy $2 $0 1
  StrCpy $0 $0 "" 1

  ; Check for invalid characters
  StrCmp $2 "@" fail
  StrCmp $2 "?" fail
  StrCmp $2 "*" fail
  StrCmp $2 "|" fail
  StrCmp $2 "<" fail
  StrCmp $2 ">" fail
  StrCmp $2 "'" fail
  StrCmp $2 '"' fail

  ; Decrement length
  IntOp $1 $1 - 1
  Goto loop

pass:
  Return

fail:
  MessageBox MB_OK `The following characters are not allowed: @?*|<>'"`
  Abort
FunctionEnd


Function OnInstallPageEnter
  ; Init
  ${If} $DataDir == ""
    ReadRegStr $DataDir HKLM "${PRODUCT_UNINST_KEY}" "DataDirectory"
    StrCpy $DataDir "$APPDATA\${PRODUCT_NAME}"
    StrCpy $AutoStart ${BST_CHECKED}
  ${EndIf}

  !insertmacro MUI_HEADER_TEXT "Installation Options" ""

  nsDialogs::Create 1018
  Pop $0
  ${If} $0 == error
    Abort
  ${EndIf}

  ; Client Startup
  ${NSD_CreateCheckbox} 5%% 8u 90%% 12u \
    "Automatically start at login time. (Recommended)"
  Pop $0
  ${NSD_SetState} $0 $AutoStart
  ${NSD_OnClick} $0 OnAutoStartChange

  ; Install Path
  ${NSD_CreateGroupBox} 5%% 35u 90%% 34u "Install Path"
  Pop $0

    ${NSD_CreateDirRequest} 10%% 49u 59%% 12u "$INSTDIR"
    Pop $InstallDirText

    ${NSD_CreateBrowseButton} 70%% 49u 20%% 12u "Browse..."
    Pop $0
    ${NSD_OnClick} $0 OnInstallDirBrowse

  ; Data Path
  ${NSD_CreateGroupBox} 5%% 79u 90%% 34u "Data Path"
  Pop $0

    ${NSD_CreateDirRequest} 10%% 93u 59%% 12u "$DataDir"
    Pop $DataDirText

    ${NSD_CreateBrowseButton} 70%% 93u 20%% 12u "Browse..."
    Pop $0
    ${NSD_OnClick} $0 OnDataDirBrowse

  nsDialogs::Show
FunctionEnd


Function OnInstallDirBrowse
    ${NSD_GetText} $InstallDirText $0
    nsDialogs::SelectFolderDialog "Select Install Directory" "$0"
    Pop $0
    ${If} $0 != error
        ${NSD_SetText} $InstallDirText "$0"
    ${EndIf}
FunctionEnd


Function OnDataDirBrowse
    ${NSD_GetText} $DataDirText $0
    nsDialogs::SelectFolderDialog "Select Data Directory" "$0"
    Pop $0
    ${If} $0 != error
        ${NSD_SetText} $DataDirText "$0"
    ${EndIf}
FunctionEnd


Function OnInstallPageLeave
  ; Validate install dir
  Push $INSTDIR
  Call ValidPath

  ; Validate data dir
  Push $DataDir
  Call ValidPath

  StrLen $0 $INSTDIR
  StrCpy $1 $DataDir $0
  StrCmp $INSTDIR $1 0 exit

  MessageBox MB_OKCANCEL \
    "WARNING: If the data directory is a sub-directory of the install \
     directory it will always be removed at uninstall time." IDOK exit
  Abort

exit:
FunctionEnd


Function OnAutoStartChange
  Pop $0
  ${NSD_GetState} $0 $AutoStart
FunctionEnd


Function OnRunFAH
  ; Also opens Web Control
  ExecShell "open" "${MENU_PATH}\Folding@home.lnk"
FunctionEnd


Function un.onInit
  ; 32/64 bit registry
  ;SetRegView %(PACKAGE_ARCH)s

  SetShellVarContext all

  ; Get Data Directory
  ReadRegStr $DataDir HKLM "${PRODUCT_UNINST_KEY}" "DataDirectory"

  ; Use same language as installer
  !insertmacro MUI_UNGETLANGUAGE
FunctionEnd


Function un.CloseApps
  Push "${CLIENT_EXE}"
  Call un.EndProcess
FunctionEnd
