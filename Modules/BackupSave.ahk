#Requires AutoHotkey v2.0

cBackupSave(*) {
    if (WinExist(LBRWindowTitle)) {
        MsgBox("CLOSE GAME BEFORE RUNNING BACKUP SCRIPT")
        cReload()
        return
    }

    if (UserBackupSaveDir) {
        BackupDir := UserBackupSaveDir
    } else {
        BackupDir := BackupSaveDir
    }
    NewBackupSavePath := BackupDir "LBR Save " FormatTime(A_Now, "yyyy MM dd '-' HH'-'mm'-'ss") ".dat"
    if (!DirExist(BackupDir)) {
        DirCreate(BackupDir)
    }
    if (!FileExist(NewBackupSavePath)) {

        FileCopy(ActiveSavePath, NewBackupSavePath)
    }
    MsgBox("Have backed up save to:`n" RemoveLongPath(NewBackupSavePath), "Backup Successful")
    OpenBackupDir()

}