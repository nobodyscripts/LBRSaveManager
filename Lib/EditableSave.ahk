#Requires AutoHotkey v2.0

#Include ../ExtLIbs/jsongo_AHKv2-main/src/jsongo.v2.ahk
#Include SaveDataEntry.ahk

LoadSaveToJson(filename) {
    savefile := GetSaveData(filename)
    if (!savefile) {
        Log("No data loaded when opening: " filename)
        return false
    }
    jsonobj := jsongo
    jsonobj.silent_error := false
    ;jsonobj.extract_all := true
    ;jsonobj.extract_objects := true
    try {
        fetchedJson := jsonobj.Parse(savefile)
        if (jsonobj.error_log) {
            Log(jsonobj.error_log)
        }
    } catch as Exception {
        Log(Exception.Message)
    }
    return fetchedJson
}

SaveVarToJsonFile(filename, var) {
    jsonobj := jsongo
    ;jsonobj.escape_backslash
    ;jsonobj.escape_slash
    ;jsonobj.inline_arrays
    jsonobj.silent_error := false
    ;jsonobj.extract_all := true
    ;jsonobj.extract_objects := true
    savefile := jsonobj.Stringify(var)
    if (jsonobj.error_log) {
        Log(jsonobj.error_log)
    }

    if (FileExist(filename)) {
        Log("File exists, removing " filename)
        FileDelete(filename)
    }
    Log("File written to " filename)
    FileAppend(savefile, filename)
}

SaveVarToDatFile(filename, var) {
    jsonobj := jsongo
    jsonobj.silent_error := false
    ;jsonobj.extract_all := true
    ;jsonobj.extract_objects := true
    fetchedJsonStr := jsonobj.Stringify(var)
    if (jsonobj.error_log) {
        Log(jsonobj.error_log)
    }

    savefile := JsonStringToDatFormat(fetchedJsonStr)
    if (FileExist(filename)) {
        Log("File already exists " filename)
        FileDelete(filename)
    }
    FileAppend(savefile, filename)
}

JsonStringToDatFormat(var) {
    if (!var) {
        return false
    }
    newHash := Hash.HMAC("SHA-1", var, "ke03m!5ng93nan7p24lyg343nml2o591")
    newvar := var "#" newHash "#"
    Log("Newhash " newHash)
    return StringToBase64(newvar)
}