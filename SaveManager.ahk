#Requires AutoHotkey v2.0
#SingleInstance Force

global LBRWindowTitle := "Leaf Blower Revolution ahk_class YYGameMakerYY ahk_exe game.exe"
global ScriptsLogFile := A_ScriptDir "\SaveManager.log"

global GameSaveDir := A_AppData "\..\Local\blow_the_leaves_away\"
global ActiveSavePath := GameSaveDir "save.dat"
global BackupSaveDir := A_ScriptDir "\Backups\"

; "C:\Program Files (x86)\Steam\userdata\<numbers>\1468260\remote\save.dat"
global SteamUserFolder := "C:\Program Files (x86)\Steam\userdata\"
global SteamUserSubpath := "\1468260\remote\save.dat"

global UserBackupSaveDir := 0
global EnableLogging := false

#Include Lib\Functions.ahk
#Include Lib\ScriptSettings.ahk
#Include Lib\FileClass.ahk
#Include Gui\MainGUI.ahk

#Include Modules\BackupSave.ahk
#Include Modules\RestoreNewestBackup.ahk
#Include Modules\RenameSaves.ahk
#Include Modules\TestConvertSave.ahk
#Include Modules\ForceLoadSave.ahk

global settings := cSettings()

if (!settings.initSettings()) {
    ; If the first load fails, it attempts to write a new config, this retrys
    ; loading after that first failure
    ; Hardcoding 2 attempts because a loop could continuously error
    Sleep(50)
    if (!settings.initSettings()) {
        MsgBox("Script failed to load settings, script closing, try restarting.")
        ExitApp()
    }
}

RunGui()

RunTest()