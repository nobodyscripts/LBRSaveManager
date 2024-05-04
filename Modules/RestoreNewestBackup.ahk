#Requires AutoHotkey v2.0

cRestoreNewestBackup(*) {
    if (WinExist(LBRWindowTitle)) {
        MsgBox("CLOSE GAME BEFORE RUNNING RESTORE SCRIPT")
        cReload()
        return
    }
    if (UserBackupSaveDir) {
        BackupDir := UserBackupSaveDir
    } else {
        BackupDir := BackupSaveDir
    }
    newestFile := ""
    newestFileTime := 0
    timeDiff := 0
    currentTime := A_now
    savesPath := RemoveLongPath(BackupDir) "\*.dat"
    loop files savesPath, "F" {
        log(A_LoopFileName)
        if (newestFileTime = 0) {
            newestFileTime := A_LoopFileTimeModified
            newestFile := A_LoopFileName
            timeDiff := DateDiff(currentTime, A_LoopFileTimeModified, "Seconds")
        } else {
            if (DateDiff(currentTime, A_LoopFileTimeModified, "Seconds") < timeDiff) {
                newestFileTime := A_LoopFileTimeModified
                newestFile := A_LoopFileName
                timeDiff := DateDiff(currentTime, A_LoopFileTimeModified, "Seconds")
            }
        }
    }
    if (newestFile = "") {
        MsgBox("Aborted, no backups found.", , "0x100 0x30")
        return
    }
    HasPressed := MsgBox("Newest file: " newestFile
        "`nMinutes old: " Format("{1:.2f}", timeDiff / 60)
        "`n Do you wish to restore?",
        "Restore backup file?", "0x1 0x100 0x10")
    if (HasPressed = "OK") {
        HasPressed2 := MsgBox("Are you certain, current save will be lost?",
            "Restore backup file?", "0x1 0x100 0x30")
    } else {
        MsgBox("Aborted save restore.", , "0x100 0x30")
        return
    }

    if (HasPressed2 = "OK") {
        FileCopy(BackupDir "\" newestFile, ActiveSavePath, true)
    } else {
        MsgBox("Aborted save restore.", , "0x100 0x30")
        return
    }
}
