#Requires AutoHotkey v2.0


#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\Base64ToString.ahk
#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\StringToBase64.ahk
#Include ..\ExtLIbs\HashCalc-master\src\HashCalc.ahk
#Include ..\ExtLIbs\ahk-scripts-v2-main\src\Strings\Base64ToString.ahk
#Include ..\ExtLIbs\jsongo_AHKv2-main\src\jsongo.v2.ahk
#Include ..\Lib\Functions.ahk

global gFile := cFile()

class cFile {
    FileBase64 := ""
    fileJsonString := ""
    fileDataObj := ""

    fileName := ""
    fileExtention := ""

    ExtentionToJson(filename) {
        filenameLen := StrLen(filename)
        if (this.IsDat(filename)) {
            ;Log("ExtentionToJson " SubStr(filename, 1, filenameLen - 3) "json")
            return SubStr(filename, 1, filenameLen - 3) "json"
        }
        return false
    }

    ExtentionToDat(filename) {
        filenameLen := StrLen(filename)
        if (this.IsJson(filename)) {
            ;Log("ExtentionToDat " SubStr(filename, 1, filenameLen - 4) "dat")
            return SubStr(filename, 1, filenameLen - 4) "dat"
        }
        return false
    }

    IsDatOrJson(filename) {
        filenameLen := StrLen(filename)
        if (this.IsJson(filename)) {
            return 1
        } else if (this.IsDat(filename)) {
            return 2
        }
        return false
    }

    IsDat(filename) {
        filenameLen := StrLen(filename)
        ;Log("IsDat " SubStr(filename, filenameLen - 3, filenameLen))
        if (SubStr(filename, filenameLen - 3, filenameLen) = ".dat") {
            return true
        }
        return false
    }

    IsJson(filename) {
        filenameLen := StrLen(filename)
        ;Log("IsJson " SubStr(filename, filenameLen - 4, filenameLen))
        if (SubStr(filename, filenameLen - 4, filenameLen) = ".json") {
            return true
        }
        return false
    }

    GetFileBase64(filename, forceLoad := false) {
        this.fileName := filename
        try {
            if (!forceLoad) {
                if (this.IsDat(filename)) {
                    this.fileExtention := ".dat"
                } else {
                    Log("File " filename " is not a dat file. Canceled load.")
                    return false
                }
            }
            this.FileBase64 := FileRead(filename)

            return true
        } catch as exc {
            Log("Error: Error opening file " filename " - " exc.Message "`r`n")
            MsgBox("Error: Error opening file " filename " - " exc.Message)
        }
        return false
    }

    GetFileJson(filename, forceLoad := false) {
        this.fileName := filename
        if (!forceLoad) {
            if (this.IsJson(filename)) {
                this.fileExtention := ".json"
            } else {
                Log("File " filename " is not a json file. Canceled load.")
                return false
            }
        }
        try {
            this.fileJsonString := FileRead(filename)
            return true
        } catch as exc {
            Log("Error: Error opening file " filename " - " exc.Message "`r`n")
            MsgBox("Error: Error opening file " filename " - " exc.Message)
        }
        return false
    }

    WriteFileDat(overwrite := false) {
        if (!this.FileBase64) {
            Log("WriteFileData Failed on: " this.fileName)
            return false
        }
        if (!overwrite) {
            if (!FileExist(this.fileName)) {
                FileAppend(this.FileBase64, this.fileName)
                return true
            } else {
                MsgBox("File already exists, aborting.")
                return false
            }
        } else {
            if (!FileExist(this.fileName)) {
                FileAppend(this.FileBase64, this.fileName)
            } else {
                FileDelete(this.fileName)
                FileAppend(this.FileBase64, this.fileName)
            }
        }
        return true
    }

    WriteFileJson(overwrite := false) {
        if (!this.fileJsonString) {
            Log("WriteFileJson Failed on: " this.fileName)
            return false
        }
        if (!overwrite) {
            if (!FileExist(this.fileName)) {
                FileAppend(this.fileJsonString, this.fileName)
                return true
            } else {
                MsgBox("File already exists, aborting.")
                return false
            }
        } else {
            if (!FileExist(this.fileName)) {
                FileAppend(this.fileJsonString, this.fileName)
            } else {
                FileDelete(this.fileName)
                FileAppend(this.fileJsonString, this.fileName)
            }
        }
        return true
    }

    ConvertBase64ToJsonString() {
        if (!this.FileBase64) {
            return false
        }
        fullJsonString := Base64ToString(this.FileBase64)
        saveLen := StrLen(fullJsonString)
        Log("OldHash " SubStr(fullJsonString, saveLen - 40, -1))
        ; Get from first char to end minus the hash
        this.fileJsonString := SubStr(fullJsonString, 1, saveLen - 42)
        return true
    }

    ConvertJsonStringToBase64() {
        if (!this.fileJsonString) {
            return false
        }
        save := this.fileJsonString
        ; Going to strip out the indenting and newlines incase people format
        while (save != StrReplace(save, "  ")) {
            save := StrReplace(save, "  ")
        }
        while (save != StrReplace(save, A_Tab)) {
            save := StrReplace(save, A_Tab)
        }
        save := StrReplace(save, "`r")
        save := StrReplace(save, "`n")

        newHash := Hash.HMAC("SHA-1", save, "ke03m!5ng93nan7p24lyg343nml2o591")
        newsave := save . "#" . newHash . "#"
        Log("Newhash " newHash)
        this.FileBase64 := StringToBase64(newsave)
        return true
    }

    ConvertJsonStringToObj() {
        jsonobj := jsongo
        ;jsonobj.escape_backslash := true
        ;jsonobj.escape_slash := true
        ;jsonobj.inline_arrays := true
        jsonobj.silent_error := false
        ;jsonobj.extract_all := true
        ;jsonobj.extract_objects := true
        try {
            this.fileDataObj := jsonobj.Parse(this.fileJsonString)
            if (jsonobj.error_log) {
                Log(jsonobj.error_log)
            }
        } catch as Exception {
            Log(Exception.Message)
            return false
        }
        return true
    }

    ConvertObjToJsonString() {
        jsonobj := jsongo
        ;jsonobj.escape_backslash := true
        ;jsonobj.escape_slash := true
        ;jsonobj.inline_arrays := true
        jsonobj.silent_error := false
        ;jsonobj.extract_all := true
        ;jsonobj.extract_objects := true
        try {
            this.fileJsonString := jsonobj.Stringify(this.fileDataObj)
            if (jsonobj.error_log) {
                Log(jsonobj.error_log)
            }
        } catch as Exception {
            Log(Exception.Message)
            return false
        }
        return true
    }

    WriteJsonToDatFile(filename, overwrite := false) {
        if (!this.fileJsonString) {
            Log("ConvertJsonToDatFile: No json data to write to " filename)
            return false
        }
        if (!this.ConvertJsonStringToBase64()) {
            Log("ConvertJsonToDatFile: Json failed to convert to base64 " filename)
            return false
        }
        this.fileName := filename
        if (!this.WriteFileDat(overwrite)) {
            Log("ConvertJsonToDatFile: Failed to write file " filename)
            return false
        }
        return true
    }

    WriteDatToJsonFile(filename, overwrite := false) {
        if (!this.FileBase64) {
            Log("ConvertDatToJsonFile: No Base64 data to write to " filename)
            return false
        }
        if (!this.ConvertBase64ToJsonString()) {
            Log("ConvertDatToJsonFile: Base64 failed to convert to json " filename)
            return false
        }
        this.fileName := filename
        if (!this.WriteFileJson(overwrite)) {
            Log("ConvertDatToJsonFile: Failed to write file " filename)
            return false
        }
        return true
    }

    ConvertDatFileToJsonFile(filename) {
        global gFile
        gFile.GetFileBase64(filename)
        filename := gFile.ExtentionToJson(filename)
        if (!gFile.WriteDatToJsonFile(filename, false)) {
            MsgBox("File already exists, aborting.")
            return false
        }
    }

    ConvertJsonFileToDatFile(filename) {
        global gFile
        gFile.GetFileJson(filename)
        filename := gFile.ExtentionToDat(filename)
        if (!gFile.WriteJsonToDatFile(filename, false)) {
            MsgBox("File already exists, aborting.")
            return false
        }
    }

    LoadDatToObj(filename) {
        this.fileName := filename
        if (!this.GetFileBase64(filename)) {
            Log("LoadDatToObj: Failed to load dat file " filename)
            return false
        }
        if (!this.ConvertBase64ToJsonString()) {
            Log("LoadDatToObj: Failed to convert to json string " filename)
            return false
        }
        if (!this.ConvertJsonStringToObj()) {
            Log("LoadDatToObj: Failed to convert to json obj " filename)
            return false
        }
        return true
    }

    LoadJsonToObj(filename) {
        this.fileName := filename
        if (!this.GetFileJson(filename)) {
            Log("LoadJsonToObj: Failed to load json file " filename)
            return false
        }
        if (!this.ConvertJsonStringToObj()) {
            Log("LoadJsonToObj: Failed to convert to json obj " filename)
            return false
        }
    }

    SaveObjToJson(filename, overwrite := false) {
        this.fileName := filename
        if (!this.ConvertObjToJsonString()) {
            Log("SaveObjToJson: Failed to convert to json string " filename)
            return false
        }
        if (!this.WriteFileJson(overwrite)) {
            Log("SaveObjToJson: Failed to write json file " filename)
            return false
        }
    }

    SaveObjToDat(filename, overwrite := false) {
        this.fileName := filename
        if (!this.ConvertObjToJsonString()) {
            Log("SaveObjToDat: Failed to convert to json string " filename)
            return false
        }
        if (!this.ConvertJsonStringToBase64()) {
            Log("SaveObjToDat: Failed to convert to base64 " filename)
            return false
        }
        if (!this.WriteFileDat(overwrite)) {
            Log("SaveObjToDat: Failed to write dat file " filename)
            return false
        }
    }
}