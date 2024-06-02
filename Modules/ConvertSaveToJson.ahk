#Requires AutoHotkey v2.0

#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\Base64ToString.ahk

ConvertSaveToJsonFile(filename) {
    jsonpath := ExtentionToJson(filename)
    savefile := GetJsonStringSave(filename)
    if (!savefile) {
        Log(savefile)
        return false
    }
    if (!FileExist(jsonpath)) {
        FileAppend(savefile, jsonpath)
    } else {
        MsgBox("File already exists, aborting.")
        return false
    }
    return true
}

GetJsonStringSave(filename) {
    save := GetSaveData(filename)
    if (!save) {
        return false
    }
    save := Base64ToString(save)
    saveLen := StrLen(save)
    Log("OldHash " SubStr(save, saveLen - 40, -1))
    newdata := SubStr(save, 1, saveLen - 42)
    return newdata
}

GetSaveData(filename) {
    try {
        var := FileRead(filename)
        return var
    } catch as exc {
        Log("Error: Error opening file " filename " - " exc.Message "`r`n")
        MsgBox("Error: Error opening file " filename " - " exc.Message)
    }
    return false
}

ExtentionToJson(path) {
    return StrReplace(path, ".dat", ".json", 0)
}