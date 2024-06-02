#Requires AutoHotkey v2.0

generateEditForm(guiObj, dataObj, isGeneralList := false) {
    FirstControl := true
    num := 1
    if (!dataObj) {
        return
    }
    for EntryKey, Entry in dataObj {
        NewCol := ""
        if(num = 1 && isGeneralList) {
            NewCol := " section"
            num := 1
        }
        if (Entry.Position = 1) {
            NewCol := " ys"
        }
/*         if (Entry.Position = 2) {
            NewCol := " xs section"
        }
        if (Entry.Position = 3) {
            NewCol := " ys"
        } */
        if(num >= 12 && isGeneralList) {
            NewCol := " ys section"
            num := 1
        }
        num++
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
                guiObj.AddEdit("v" Entry.Name " w180", Entry.Get())
            case "float":
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit("v" Entry.Name " w180", Entry.Get())
            default:
                guiObj.Add("Text", "ccfcfcf" NewCol, Entry.UIName ":")
                guiObj.AddEdit("v" Entry.Name " w180", Entry.Get())
        }
    }

    return guiObj
}

saveEditForm(dataObj, GuiObj) {
    global LoadedSaveFileName, GameSaveData
    values := GuiObj.Submit()

    WaitGUI := GUI(, "Waiting for save")
    WaitGUI.Opt("+Owner +MinSize +MinSize500x")
    WaitGUI.BackColor := "0c0018"
    WaitGUI.AddText("cWhite", "Waiting for file to save to: " LoadedSaveFileName)
    WaitGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)

    for EntryKey, Entry in dataObj {
        Entry.Set(values.%Entry.Name%)
        WaitGUI["MyProgress"].value += 1
    }
    SetTimer(incWaitProgress.Bind(WaitGUI), 50)
    WaitGUI.Show()

    SaveVarToJsonFile(LoadedSaveFileName, GameSaveData)
    
    WaitGUI.Hide()
    MsgBox("Edited file saved to: " LoadedSaveFileName)
    SetTimer(incWaitProgress.Bind(WaitGUI), 0)
}

incWaitProgress(WaitGUI) {
    WaitGUI["MyProgress"].value += 1
}