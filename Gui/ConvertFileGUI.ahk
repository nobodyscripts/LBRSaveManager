#Requires AutoHotkey v2.0

cConvertSaveToJson(*) {
    filename := FileSelect("3", UserBackupSaveDir,
        "Select a save file to convert.", "*.dat")
    if (FileExist(filename)) {
        if (!ConvertSaveToJsonFile(filename)) {
            if (!FileExist(ExtentionToJson(filename))) {
                MsgBox("Failed to convert " filename)
            } 
        } else {
            MsgBox("Created json file " ExtentionToJson(filename))
        }
    }
}

cConvertJsonToSave(*) {
    filename := FileSelect("3", UserBackupSaveDir,
        "Select a json file to convert.", "*.json")
    if (FileExist(filename)) {
        if (!ConvertJsonToSaveFile(filename)) {
            if (!FileExist(ExtentionToDat(filename))) {
                MsgBox("Failed to convert " filename)
            } 
        } else {
            MsgBox("Created save file " ExtentionToDat(filename))
        }
    }
}