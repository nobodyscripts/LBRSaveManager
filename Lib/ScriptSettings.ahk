#Requires AutoHotkey v2.0

; ------------------- Settings -------------------
; Loads UserSettings.ini values for the rest of the script to use

global EnableLogging := Debug := false

class singleSetting {
    Name := ""
    DefaultValue := 0
    NobodyDefaultValue := 0
    DataType := "bool"
    Category := "Default"
    globalvar := 0

    Create(iName, iDefaultValue := 0, iNobodyDefaultValue := 0,
        iDataType := "bool", iCategory := "Default") {
            this.Name := iName
            this.DefaultValue := iDefaultValue
            this.NobodyDefaultValue := iNobodyDefaultValue
            this.DataType := iDataType
            this.Category := iCategory
            return this
    }

    ValueToString(value := %this.Name%) {
        switch (StrLower(this.DataType)) {
            case "bool":
                return BinaryToStr(value)
            case "arrborbv":
                return ArrToCommaDelimStr(value)
            case "longpath":
                return "\\?\" RemoveLongPath(value)
            default:
                return value
        }
    }

    SetCommaDelimStrToArr(var) {
        %this.Name% := StrSplit(var, " ", ",.")
    }
}

class cSettings {

    sFilename := A_ScriptDir "\SaveManagerSettings.ini"
    sFileSection := "Default"
    sUseNobody := false

    initSettings(secondary := false) {
        global Debug
        this.Map := Map()

        this.Map["EnableLogging"] := singleSetting().Create("EnableLogging", false, true, "bool", "Default")
        this.Map["Debug"] := singleSetting().Create("Debug", false, true, "bool", "Debug")
        this.Map["UserBackupSaveDir"] := singleSetting().Create("UserBackupSaveDir", BackupSaveDir, BackupSaveDir, "longpath", "Default")
        

        if (!secondary) {
            if (FileExist(A_ScriptDir "\IsNobody")) {
                this.sUseNobody := true
                Debug := true
                OutputDebug("Settings: Using Nobody Defaults.`r`n")
                Log("Settings: Using Nobody Defaults")
            }
            if (!FileExist(this.sFilename)) {
                OutputDebug("No SaveManagerSettings.ini found, writing default file.`r`n")
                Log("No SaveManagerSettings.ini found, writing default file.")
                this.WriteDefaults(this.sUseNobody)
            }
            if (this.loadSettings()) {
                Log("Loaded settings.")
            } else {
                return false
            }
            return true
        } else {
            this.sFilename := A_ScriptDir "\..\SaveManagerSettings.ini"
            if (this.loadSettings()) {
                Log("Loaded settings.")
            } else {
                return false
            }
            return true
        }
    }

    loadSettings() {
        global EnableLogging := false
        global Debug := false
        global UserBackupSaveDir

        for (setting in this.Map) {
            try {
                if (this.Map[setting].Name != "BVItemsArr") {
                    %this.Map[setting].Name% :=
                        IniToVar(this.sFilename, this.Map[setting].Category,
                            this.Map[setting].Name)
                } else {
                    ; special handling for the bv array
                    %this.Map[setting].Name% :=
                        CommaDelimStrToArr(
                            IniToVar(this.sFilename, this.Map[setting].Category,
                                this.Map[setting].Name)
                        )
                }
            } catch as exc {
                if (exc.Extra) {
                    Log("Error 35: LoadSettings failed - " exc.Message "`n" exc.Extra)
                } else {
                    Log("Error 35: LoadSettings failed - " exc.Message)
                }
                MsgBox("Could not load all settings, making new default SaveManagerSettings.ini")
                Log("Attempting to write a new default SaveManagerSettings.ini.")
                this.WriteDefaults(this.sUseNobody)
                return false
            }
        }
        return true
    }

    /* saveSettings() {
        IniWrite("this is a new value", this.sFilename, this.sFileSection, "key")
    
    } */

    WriteToIni(key, value, section := this.sFileSection) {
        IniWrite(value, this.sFilename, section, key)
    }

    WriteDefaults(isnobody) {
        if (isnobody) {
            for (setting in this.Map) {
                this.WriteToIni(this.Map[setting].Name,
                    this.Map[setting].ValueToString(this.Map[setting].NobodyDefaultValue),
                    this.Map[setting].Category)
            }
        } else {
            for (setting in this.Map) {
                this.WriteToIni(this.Map[setting].Name,
                    this.Map[setting].ValueToString(this.Map[setting].DefaultValue),
                    this.Map[setting].Category)
            }
        }
    }

    SaveCurrentSettings() {
        for (setting in this.Map) {
            this.WriteToIni(this.Map[setting].Name,
                this.Map[setting].ValueToString(),
                this.Map[setting].Category)
        }
    }
}

IniToVar(file, section, name) {
    var := IniRead(file, section, name)
    switch var {
        case "true":
            return true
        case "false":
            return false
        default:
            return var
    }
}

BinaryToStr(var) {
    if (var) {
        return "true"
    }
    return "false"
}

ArrToCommaDelimStr(var) {
    output := ""
    if (var.Length > 1) {
        for text in var {
            if (output != "") {
                output := output ", " text
            } else {
                output := text
            }
        }
        return output
    } else {
        return false
    }
}

CommaDelimStrToArr(var) {
    return StrSplit(var, " ", ",.")
}