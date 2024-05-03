#Requires AutoHotkey v2.0

generateEditForm(guiObj, dataObj) {
    FirstControl := true
    for EntryKey, Entry in dataObj {
        NewCol := ""
        if (Entry.Position = 1) {
            NewCol := " ys"
            ;guiObj.Add("Text", "ccfcfcf ys", "")
        }
        if (FirstControl) {
            NewCol := " Section"
            FirstControl := false
        }
        switch Entry.DataType {
            case "int":
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit()
                guiObj.AddUpDown("v" Entry.Name " Range" Entry.Min "-" Entry.Max, Entry.Get())
            case "bool":
                if (Entry.Get() = true) {
                    guiObj.Add("CheckBox", "v" Entry.Name " ccfcfcf checked" NewCol, Entry.UIName)
                } else {
                    guiObj.Add("CheckBox", "v" Entry.Name " ccfcfcf" NewCol, Entry.UIName)
                }
            case "string":
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit("v" Entry.Name " w120", Entry.Get())
            case "float":
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit("v" Entry.Name " w120", Entry.Get())
            default:
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit("v" Entry.Name " w120", Entry.Get())
        }
    }

    return guiObj
}

saveEditForm(dataObj, GuiObj) {
    global LoadedSaveFileName, GameSaveData
    values := GuiObj.Submit()

    for EntryKey, Entry in dataObj {
        Entry.Set(values.%Entry.Name%)
    }
    
    SaveVarToJsonFile(LoadedSaveFileName, GameSaveData)
}
