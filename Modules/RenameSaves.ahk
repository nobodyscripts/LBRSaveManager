#Requires AutoHotkey v2.0


cRenameSaves(*) {
    if (UserBackupSaveDir) {
        BackupDir := UserBackupSaveDir
    } else {
        BackupDir := BackupSaveDir
    }
    loop files BackupDir "\*.dat", "F" {
        log(A_LoopFileName)
        desiredName := "LBR Save " FormatTime(A_LoopFileTimeModified, "yyyy MM dd '-' HH'-'mm'-'ss") ".dat"
        firstword := StrSplit(A_LoopFileName, A_Space) 
        if (A_LoopFileName != desiredName && StrLower(firstword[1]) != "options") {
            i := 0
            loop {
                if (i > 0) {
                    desiredName := "LBR Save " FormatTime(A_LoopFileTimeModified,
                        "yyyy MM dd '-' HH'-'mm'-'ss") " (" i ").dat"
                }
                if (!FileExist(BackupDir "\" desiredName)) {
                    log(BackupDir "\" A_LoopFileName " " BackupDir "\" desiredName)
                    FileMove(BackupDir "\" A_LoopFileName, BackupDir "\" desiredName)
                    break
                }
                i++
            }
        }
    }
}

cRenameSavesTxt(*) {
    if (UserBackupSaveDir) {
        BackupDir := UserBackupSaveDir
    } else {
        BackupDir := BackupSaveDir
    }
    loop files BackupDir "\*.txt", "F" {
        log(A_LoopFileName)
        desiredName := "LBR Save " FormatTime(A_LoopFileTimeModified, "yyyy MM dd '-' HH'-'mm'-'ss") ".dat"
        if (A_LoopFileName != desiredName) {
            i := 0
            loop {
                if (i > 0) {
                    desiredName := "LBR Save " FormatTime(A_LoopFileTimeModified,
                        "yyyy MM dd '-' HH'-'mm'-'ss") " (" i ").dat"
                }
                if (!FileExist(BackupDir "\" desiredName)) {
                    log(BackupDir "\" A_LoopFileName " " BackupDir "\" desiredName)
                    FileMove(BackupDir "\" A_LoopFileName, BackupDir "\" desiredName)
                    break
                }
                i++
            }
        }
    }
}