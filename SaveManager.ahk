#Requires AutoHotkey v2.0
#SingleInstance Force

global LBRWindowTitle := "Leaf Blower Revolution ahk_class YYGameMakerYY ahk_exe game.exe"
global ScriptsLogFile := A_ScriptDir "\SaveManager.log"

global GameSaveDir := A_AppData "\..\Local\blow_the_leaves_away\"
global ActiveSavePath := GameSaveDir "save.dat"
global BackupSaveDir := "\\?\" A_ScriptDir "\Backups\"
global UserBackupSaveDir := 0
global EnableLogging := false

#Include Lib\Functions.ahk
#Include Lib\ScriptSettings.ahk
#Include Lib\EditableSave.ahk
#Include Gui\MainGUI.ahk

#Include Modules\BackupSave.ahk
#Include Modules\ConvertSaveToJson.ahk
#Include Modules\ConvertJsonToSave.ahk
#Include Modules\RestoreNewestBackup.ahk


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

*F1:: {
    cExit()
}

cExit(*) {
    ExitApp()
}

*F2:: {
    cReload()
}

cReload(*) {
    Reload()
}

*F3:: {
    cBackupSave()
}

*F4:: {
    cOpenSaveDir()
}

cOpenSaveDir(*) {
    OpenSaveDir()
}

*F5:: {
    cOpenBackupDir()
}

cOpenBackupDir(*) {
    OpenBackupDir()
}

*F6:: {
    cRestoreNewestBackup()
}
