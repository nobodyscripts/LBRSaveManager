#Requires AutoHotkey v2.0

#Include ../ExtLIbs/jsongo_AHKv2-main/src/jsongo.v2.ahk
#Include SaveDataEntry.ahk

Global GameSaveData := ""

LoadSaveToJson(filename) {
    savefile := GetSaveData(filename)
    if (!savefile) {
        Log(savefile)
        return false
    }
    return jsongo.Parse(savefile)
}

SaveVarToJsonFile(filename, var) {
    global GameSaveData
    savefile := jsongo.Stringify(var)
     if (FileExist(filename)) {
        Log("File already exists " filename)
        FileDelete(filename)
    }
    FileAppend(savefile, filename)
}

SaveVarToDatFile(filename, var) {
    global GameSaveData
    savefile := JsonStringToBase64(jsongo.Stringify(var))
     if (FileExist(filename)) {
        Log("File already exists " filename)
        FileDelete(filename)
    }
    FileAppend(savefile, filename)
}

JsonStringToBase64(var) {
    if (!var) {
        return false
    }
    newHash := Hash.HMAC("SHA-1", var, "ke03m!5ng93nan7p24lyg343nml2o591")
    var := var "#" newHash "#"
    Log("Newhash " newHash)
    return StringToBase64(var)
}
