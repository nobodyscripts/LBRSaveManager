#Requires AutoHotkey v2.0

RunGui() {
    MyGui := Gui(, "LBR SaveManager NobodyScript")
    ;MyGui.Opt("-SysMenu")
    MyGui.BackColor := "0c0018"

    MyGui.Add("Text", "ccfcfcf", "F1")
    MyBtn := MyGui.Add("Button", "Default w80", "Exit")
    MyBtn.OnEvent("Click", cExit)

    MyGui.Add("Text", "ccfcfcf", "F2")
    MyBtn := MyGui.Add("Button", "Default w80", "Reload/End")
    MyBtn.OnEvent("Click", cReload)

    MyGui.Add("Text", "ccfcfcf", "F3")
    MyBtn := MyGui.Add("Button", "Default w120", "Backup Save`n(Close Game First)")
    MyBtn.OnEvent("Click", cBackupSave)

    MyGui.Add("Text", "ccfcfcf", "F4")
    MyBtn := MyGui.Add("Button", "Default w120", "Open Save Dir")
    MyBtn.OnEvent("Click", cOpenSaveDir)

    MyGui.Add("Text", "ccfcfcf", "F5")
    MyBtn := MyGui.Add("Button", "Default w120", "Open Backup Dir")
    MyBtn.OnEvent("Click", cOpenBackupDir)

    MyGui.Add("Text", "cff0000", "F6 (WARNING DANGEROUS)")
    MyBtn := MyGui.Add("Button", "Default w120", "Restore`nNewest Backup")
    MyBtn.OnEvent("Click", cRestoreNewestBackup)

    MyGui.Add("Text", "ccfcfcf wp", "Settings")
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
        global UserBackupSaveDir
        values := settingsGUI.Submit()
        UserBackupSaveDir := values.SaveDir
        if (DirExist(UserBackupSaveDir) ) {
            SaveSettings()
        } else {
            MsgBox("Could not save new backup folder, no dir found.", , "0x10")
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
