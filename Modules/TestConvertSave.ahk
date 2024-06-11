#Requires AutoHotkey v2.0
global ActiveSavePath

RunTest() {
    
    testFile := cFile()
    if (!FileExist(ActiveSavePath)) {
        return
    }
    FileCopy(ActiveSavePath, A_ScriptDir . "\save.dat", true)

    testFile.ConvertDatFileToJsonFile(A_ScriptDir . "\save.dat")

    FileMove(A_ScriptDir . "\save.dat", A_ScriptDir . "\saveGood.dat")

    testFile.ConvertJsonFileToDatFile(A_ScriptDir . "\save.json")

    testFile.GetFileBase64(A_ScriptDir . "\save.dat")
    newsave := testFile.FileBase64
    testFile.GetFileBase64(A_ScriptDir . "\saveGood.dat")
    oldsave := testFile.FileBase64
    if (newsave != oldsave) {
        Log("Files DO NOT MATCH, test failed.")
    } else {
        Log("Files match, test success.")
    }
    TestJsonStringSave(A_ScriptDir . "\saveGood.dat")

    if (FileExist(A_ScriptDir . "\saveGood.dat")) {
        FileDelete(A_ScriptDir . "\saveGood.dat")
    }
    if (FileExist(A_ScriptDir . "\save.dat")) {
        FileDelete(A_ScriptDir . "\save.dat")
    }
    if (FileExist(A_ScriptDir . "\save.json")) {
        FileDelete(A_ScriptDir . "\save.json")
    }
}

TestJsonStringSave(filename) {
    testFile := cFile()
    testFile.GetFileBase64(A_ScriptDir . "\saveGood.dat")
    olddat := testFile.FileBase64
    if (!olddat) {
        return false
    }
    save := Base64ToString(olddat)
    saveLen := StrLen(save)
    oldhash := SubStr(save, saveLen - 40, -1)
    newdata := SubStr(save, 1, saveLen - 42)

    newHash := Hash.HMAC("SHA-1", newdata, "ke03m!5ng93nan7p24lyg343nml2o591")
    newsave := newdata . "#" . newHash . "#"
    newdat := StringToBase64(newsave)

    Log("Old hash " oldhash "`r`n New hash " newHash)
    if (save != newsave) {
        Log("Saves do not match")
    } else {
        Log("Saves match")
    }
    if (olddat != newdat) {
        Log("Dats do not match")
    } else {
        Log("Dats match")
    }

    return newdata
}