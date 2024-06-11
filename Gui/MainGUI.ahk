#Requires AutoHotkey v2.0

#Include ConvertFileGUI.ahk
#Include MainEditGUI.ahk
global MyGui := false

RunGui() {
    global MyGui
    MyGui := Gui(, "LBR SaveManager NobodyScript")
    ;MyGui.Opt("-SysMenu")
    MyGui.BackColor := "0c0018"

    MyBtn := MyGui.Add("Button", "Default w80", "Exit")
    MyBtn.OnEvent("Click", cExit)

    MyBtn := MyGui.Add("Button", "Default w80", "Reload/End")
    MyBtn.OnEvent("Click", cReload)

    MyBtn := MyGui.Add("Button", "Default w120", "Backup Save`n(Close Game First)")
    MyBtn.OnEvent("Click", cBackupSave)

    MyBtn := MyGui.Add("Button", "Default w120", "Open Save Dir")
    MyBtn.OnEvent("Click", cOpenSaveDir)

    MyBtn := MyGui.Add("Button", "Default w120", "Open Backup Dir")
    MyBtn.OnEvent("Click", cOpenBackupDir)

    MyGui.Add("Text", "ccfcfcf", "`nWARNING")
    MyBtn := MyGui.Add("Button", "Default w120", "Rename *.dat`nin Backup Dir")
    MyBtn.OnEvent("Click", cRenameSaves)

    MyGui.Add("Text", "ccfcfcf", "`nWARNING")
    MyBtn := MyGui.Add("Button", "Default w120", "Rename *.txt`nin Backup Dir")
    MyBtn.OnEvent("Click", cRenameSavesTxt)

    MyGui.Add("Text", "cff0000 ys", "WARNING DANGEROUS")
    MyBtn := MyGui.Add("Button", "Default w120", "Restore`nNewest Backup")
    MyBtn.OnEvent("Click", cRestoreNewestBackup)

    MyGui.Add("Text", "ccfcfcf", "`nWARNING")
    MyBtn := MyGui.Add("Button", "Default w120", "Convert Save to Json")
    MyBtn.OnEvent("Click", cConvertSaveToJson)

    MyGui.Add("Text", "ccfcfcf", "`nWARNING")
    MyBtn := MyGui.Add("Button", "Default w120", "Convert Json To Save")
    MyBtn.OnEvent("Click", cConvertJsonToSave)

    MyGui.Add("Text", "cff0000", "`nWARNING DANGEROUS")
    MyBtn := MyGui.Add("Button", "Default w120", "Force load`nmain save.dat")
    MyBtn.OnEvent("Click", cForceLoadSave)

    MyGui.Add("Text", "", "")
    MyBtn := MyGui.Add("Button", "Default w120", "Edit Save")
    MyBtn.OnEvent("Click", cEditMain)

    MyBtn := MyGui.Add("Button", "Default w120", "Settings")
    MyBtn.OnEvent("Click", cOpenSettings)

    MyGui.Show("w400")

    ;MyGui.OnEvent("Close", Button_Click_Exit)
}

cOpenSettings(*) {
    global UserBackupSaveDir

    settingsGUI := GUI(, "General Settings")
    settingsGUI.Opt("+Owner +MinSize +MinSize500x")
    settingsGUI.BackColor := "0c0018"

    settingsGUI.Add("Text", "ccfcfcf", "Backup Folder:")
    If (UserBackupSaveDir) {
        settingsGUI.AddEdit("vSaveDir", RemoveLongPath(UserBackupSaveDir))
    } else {
        settingsGUI.AddEdit("vSaveDir", RemoveLongPath(BackupSaveDir))
    }

    settingsGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserSettings)
    settingsGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralSettings)

    settingsGUI.Show("w300")

    SaveUserSettings(*) {
        global UserBackupSaveDir, settings
        values := settingsGUI.Submit()
        UserBackupSaveDir := values.SaveDir
        if (DirExist(UserBackupSaveDir) ) {
            settings.SaveCurrentSettings()
        } else {
            DirCreate(UserBackupSaveDir)
            MsgBox("Directory created as not found.", , "0x100 0x30")
            return
        }
        settingsGUI.Hide()
    }

    CloseUserGeneralSettings(*) {
        settingsGUI.Hide()
    }
}

OpenSaveDir() {
    Run("Explorer.exe " GameSaveDir)
}

OpenBackupDir() {
    if (UserBackupSaveDir) {
        BackupDir := UserBackupSaveDir
    } else {
        BackupDir := BackupSaveDir
    }
    Run("Explorer.exe " BackupDir)
}

cExit(*) {
    ExitApp()
}

cReload(*) {
    Reload()
}

cOpenSaveDir(*) {
    OpenSaveDir()
}


cOpenBackupDir(*) {
    OpenBackupDir()
}
