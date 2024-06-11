#Requires AutoHotkey v2.0

cConvertSaveToJson(*) {
    filename := FileSelect("3", UserBackupSaveDir,
        "Select a save file to convert.", "*.dat")
    if (FileExist(filename)) {
        if (!gFile.ConvertDatFileToJsonFile(filename)) {
            if (!FileExist(gFile.ExtentionToJson(filename))) {
                MsgBox("Failed to convert " filename)
            } 
        } else {
            MsgBox("Created json file " gFile.ExtentionToJson(filename))
        }
    }
}

cConvertJsonToSave(*) {
    filename := FileSelect("3", UserBackupSaveDir,
        "Select a json file to convert.", "*.json")
    if (FileExist(filename)) {
        if (!gFile.ConvertJsonFileToDatFile(filename)) {
            if (!FileExist(gFile.ExtentionToDat(filename))) {
                MsgBox("Failed to convert " filename)
            } 
        } else {
            MsgBox("Created save file " gFile.ExtentionToDat(filename))
        }
    }
}