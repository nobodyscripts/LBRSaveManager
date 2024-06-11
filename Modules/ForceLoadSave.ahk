#Requires AutoHotkey v2.0

cForceLoadSave(*) {
        if (IsWindowActive()) {
        MsgBox("Close the game & Steam before using this feature.`nAborted.", , "0x100 0x30")
        return
    }
    if (ProcessExist("steam.exe")) {
        MsgBox("Close Steam before using this feature.`nAborted.", , "0x100 0x30")
        return
    }
    HasPressed := MsgBox("Function will overwrite cloud save, delete save.dat-1, force load of save.dat and log out of humble online?",
        "Force load save.dat?", "0x1 0x100 0x10")
    if (HasPressed = "OK") {
        HasPressed2 := MsgBox("Are you certain, without backups data will be lost?",
            "Force load save.dat confirm?", "0x1 0x100 0x30")
    } else {
        MsgBox("Aborted force load.", , "0x100 0x30")
        return
    }
    if (!HasPressed2 = "OK") {
        MsgBox("Aborted force load.", , "0x100 0x30")
        return
    }

    loop files SteamUserFolder "*", "D" {
        loop files A_LoopFilePath SteamUserSubpath, "F" {
            log(A_LoopFileFullPath)
            desiredName := "LBR Save " FormatTime(A_LoopFileTimeModified, "yyyy MM dd '-' HH'-'mm'-'ss") ".dat"
            backup := 0
            if (DirExist(BackupSaveDir)) {
                backup := BackupSaveDir
            }
            if (DirExist(UserBackupSaveDir)) {
                backup := UserBackupSaveDir
            }
            if (!DirExist(backup)) {
                MsgBox("Error: Backup directory not set correctly.")
                return
            }
            if (!FileExist(backup . desiredName)) {
                Log("Backed up steam cloud save file. Copying normal save.dat to cloud.")
                Log(A_LoopFileFullPath " copying to " backup desiredName)
                FileCopy(A_LoopFileFullPath, backup . desiredName)
                MsgBox("Backed up steam cloud save file. Injecting save.dat.")
                Log(ActiveSavePath " copying to " A_LoopFileFullPath)
                FileCopy(ActiveSavePath, A_LoopFileFullPath, true)
            } else {
                Log("Already had steam cloud save file backed up, overwriting cloud file.")
                MsgBox("Cloud save file already backed up. Injecting save.dat.")
                FileCopy(ActiveSavePath, A_LoopFileFullPath, true)
            }
        }
    }
    if (FileExist(ActiveSavePath "-1")) {
        Log("Deleting userprofile local backup save file.")
        FileDelete(ActiveSavePath "-1")
    }
    if (FileExist(GameSaveDir "token.dat")) {
        if (FileGetSize(GameSaveDir "token.dat", "B") != 0) {
            ; Rename token if it contains data, assuming this is humble login
            ; if empty we don't care, if has token backup (overwrite)
            FileMove(GameSaveDir "token.dat", GameSaveDir "token.dat-1", true)
            MsgBox("File <save dir>/token.dat renamed to token.dat-1, this can be`n reverted after successful load.")
        }
    }
    MsgBox("Running game now should load " ActiveSavePath)
}