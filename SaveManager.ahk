#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Lib\Functions.ahk
#Include Lib\ScriptSettings.ahk
#Include Gui\MainGUI.ahk

#Include Modules\BackupSave.ahk
#Include Modules\RestoreNewestBackup.ahk

global LBRWindowTitle := "Leaf Blower Revolution ahk_class YYGameMakerYY ahk_exe game.exe"
global ScriptsLogFile := A_ScriptDir "\SaveManager.log"

global GameSaveDir := A_AppData "\..\Local\blow_the_leaves_away\"
global ActiveSavePath := GameSaveDir "save.dat"
global BackupSaveDir := "\\?\" A_ScriptDir "\Backups\"
global UserBackupSaveDir := 0

LoadSettings()
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

SaveSettings() {
    IniWrite(UserBackupSaveDir, "SaveManagerSettings.ini", "Default", "UserBackupSaveDir")
}

LoadSettings() {
    global UserBackupSaveDir := "\\?\" IniRead("SaveManagerSettings.ini", "Default", "UserBackupSaveDir", BackupSaveDir)
}

RemoveLongPath(var) {
    return StrReplace(var, "\\?\")
}