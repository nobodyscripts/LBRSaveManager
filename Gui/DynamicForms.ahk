#Requires AutoHotkey v2.0

#Include ../Lib/SaveDataEntry.ahk

global GameSaveData

setupDynamicForm(editGui, data, basePath) {
    i := 1
    treeview := editGui.Add("TreeView", "r50 w500 section")
    treeview.OnEvent("ItemSelect", ItemSelected)
    static IdMap := Map()
    if (Type(data) = "Map") {
        for (Key, Value in data) {
            SubTv := treeview.Add(StrReplace(CapitaliseFirstChar(Key), "_", A_Space))
            IdMap[SubTv] := basePath . Key
            IdMap := MapToTreeView(treeview, Value, SubTv, basePath . Key, IdMap)
        }
    } else if (Type(data) = "Array") {
        j := 1
        for (Value in data) {
            SubTv := treeview.Add(j)
            IdMap[SubTv] := basePath . j
            IdMap := MapToTreeView(treeview, Value, SubTv, basePath . j, IdMap)
            j++
        }
    }
    textdisplay := editGui.Add("Text", "cWhite w400 ys section", "Nothing selected")
    EditBox := editGui.Add("Edit", "w400", "Nothing selected")
    EditBox.OnEvent("Change", DelaySave)

    SaveState := editGui.Add("Text", "cff8800 +Hidden w400 r3", "")

    ItemSelected(GuiCtrlObj, Item) {
        textdisplay.Text := IdMap[Item]
        SaveState.Visible := false
        if (GuiCtrlObj.GetChild(Item) != 0) {
            EditBox.Value := ""
            EditBox.Enabled := false
            SaveState.Visible := true
            SaveState.Value := "Cannot edit categories."
            return
        }
        EditBox.Enabled := true
        temp := SaveDataEntry()
        temp.Location := IdMap[Item]
        temp.DataType := "string"
        content := temp.Get()
        if (Type(content) != "Map" && Type(content) != "Array") {
            EditBox.Value := content
        }
    }

    DelaySave(GuiCtrlObj, Info) {
        SetTimer(SaveChangedItem.Bind(IdMap[treeview.GetSelection()], EditBox.Value), -1000)
    }

    SaveChangedItem(location, data) {
        SaveState.Value := "Saving..."
        SaveState.Visible := true
        SetTimer(ResetSaveState, -750)
        temp := SaveDataEntry()
        temp.Location := location
        Log("Setting " location " to " data)
        temp.Set(data)
        WriteEditedSave()
    }

    ResetSaveState() {
        if (SaveState) {
            SaveState.Visible := false
        }
    }

    WriteEditedSave() {
        global GameSaveData, LoadedSaveFileName

        WaitGUI := GUI(, "Waiting for save")
        WaitGUI.Opt("+Owner +MinSize +MinSize500x")
        WaitGUI.BackColor := "0c0018"
        WaitGUI.AddText("cWhite", "Waiting for file to save: " LoadedSaveFileName)
        WaitGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)
        editGui["TabControl"].Enabled := false
        treeview.Enabled := false
        SetTimer(incWaitProgress.Bind(WaitGUI), 10)
        WaitGUI.Show()

        gFile.fileDataObj := GameSaveData
        failedToSave := false
        switch gFile.IsDatOrJson(LoadedSaveFileName) {
            case 2:
                if (!gfile.SaveObjToDat(LoadedSaveFileName, true)) {
                    failedToSave := true
                }
            case 1:
                if (!gfile.SaveObjToJson(LoadedSaveFileName, true)) {
                    failedToSave := true
                }
            default:
                Log("Loaded file was not dat or json.")
                return false
        }

        WaitGUI.Hide()
        SetTimer(incWaitProgress.Bind(WaitGUI), 0)
        if (failedToSave) {
            SaveState.Value := "Edited file saved to: " LoadedSaveFileName
            SetTimer(ResetSaveState, -3000)
        } else {
            SaveState.Value := "Failed to save: " LoadedSaveFileName
            SetTimer(ResetSaveState, -5000)
        }
        SaveState.Visible := true
        treeview.Enabled := true
        editGui["TabControl"].Enabled := true
    }

    incWaitProgress(WaitGUI) {
        WaitGUI["MyProgress"].value += 1
    }
}

; indent amount, if indentamount changed apply to next element

MapToTreeView(tv, data, lastNode, path, IdMap) {
    if (Type(data) = "Map") {
        for (Key, Value in data) {
            SubTv := tv.Add(StrReplace(CapitaliseFirstChar(Key), "_", A_Space), lastNode)
            IdMap[SubTv] := path "." Key
            IdMap := MapToTreeView(tv, Value, SubTv, path "." Key, IdMap)
        }
    } else if (Type(data) = "Array") {
        j := 1
        for (Value in data) {
            SubTv := tv.Add(j, lastNode)
            IdMap[SubTv] := path "." j
            IdMap := MapToTreeView(tv, Value, SubTv, path "." j, IdMap)
            j++
        }
    }
    return IdMap
    /* else {
       SubTv := tv.Add(data, lastNode)
       IdMap[path "." data] := SubTv
    } */
}

/*
MapToForm(var, gui, path, indentCount) {
    static lastIndent := 0
    nextIndent := indentCount + 1
    first := true
    if(indentCount = lastIndent) {
        first := false
    }
    i := 1
    if (Type(var) = "Map") {
        for (Key, Value in var) {
            if (i > 1) {
                break
            }
            i++
            if (first) {
                Log("1a")
                gui.Add("Text", "cWhite", Key)
                first := false
            } else {
                Log("1")
                gui.Add("Text", "cWhite", Key)
            }
            if (Type(Value) = "Map") {
                MapToForm(Value, gui, path "." Key, nextIndent)
            } else {
                ;gui.AddEdit("v" path "." Key " w180", Value)
            }

        }
    } else {
        key := StrSplit(path, ".")
        key := key[key.Length]
        if (first) {
            Log("2a" )
            gui.Add("Text", "cWhite", key)
            first := false
        } else {
            Log("2")
            gui.Add("Text", "cWhite", Key)
        }
       ; gui.AddEdit("v" path " w180", var)
    }
    lastIndent := indentCount
} */
