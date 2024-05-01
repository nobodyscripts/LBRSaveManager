#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Lib\Functions.ahk
#Include Lib\ScriptSettings.ahk
#Include Gui\MainGUI.ahk

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
    loop files BackupDir "*.dat", "F" {
        if (newestFileTime = 0) {
            newestFileTime := A_LoopFileTimeCreated
            newestFile := A_LoopFileName
            timeDiff := DateDiff(currentTime, A_LoopFileTimeCreated, "Seconds")
        } else {
            if (DateDiff(currentTime, A_LoopFileTimeCreated, "Seconds") < timeDiff) {
                newestFileTime := A_LoopFileTimeCreated
                newestFile := A_LoopFileName
                timeDiff := DateDiff(currentTime, A_LoopFileTimeCreated, "Seconds")
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
        DirCopy(BackupDir newestFile, ActiveSavePath, true)
    } else {
        MsgBox("Aborted save restore.", , "0x100 0x30")
        return
    }
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