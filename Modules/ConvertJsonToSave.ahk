#Requires AutoHotkey v2.0

#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\Base64ToString.ahk
#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\StringToBase64.ahk
#Include ..\ExtLIbs\HashCalc-master\src\HashCalc.ahk

ConvertJsonToSaveFile(filename) {
    datpath := ExtentionToDat(filename)
    savefile := GetBase64StringSave(filename)
    if (!savefile) {
        return false
    }
    if (!FileExist(datpath)) {
        FileAppend(savefile, datpath)
    } else {
        MsgBox("File already exists, aborting.")
        return false
    }
    return true
}

GetBase64StringSave(filename) {
    save := GetSaveData(filename)
    if (!save) {
        return false
    }

    newHash := Hash.HMAC("SHA-1", save, "ke03m!5ng93nan7p24lyg343nml2o591")
    save := save "#" newHash "#"
    Log("Newhash " newHash)
    return StringToBase64(save)
}

ExtentionToDat(path) {
    return StrReplace(path, ".json", ".dat", 0)
}