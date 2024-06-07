#Requires AutoHotkey v2.0

#Include ../Lib/SaveDataEntry.ahk

global GameSaveData

setupDynamicForm(gui, data, basePath) {
    i := 1
    treeview := gui.Add("TreeView", "r50 w500 section")
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
    textdisplay := gui.Add("Text", "cWhite w400 ys section", "Nothing selected")
    EditBox := gui.Add("Edit", "w400", "Nothing selected")
    EditBox.OnEvent("Change", DelaySave)

    SaveState := gui.Add("Text", "cff88000 +Hidden", "Changes Saved.")

    ItemSelected(GuiCtrlObj, Item) {
        textdisplay.Text := IdMap[Item]
        temp := SaveDataEntry()
        temp.Location := IdMap[Item]
        temp.DataType := "string"
        content := temp.Get()
        if (Type(content) != "Map" && Type(content) != "Array") {
            EditBox.Value := content
        }
    }

    DelaySave(GuiCtrlObj, Info) {
        SetTimer(SaveChangedItem, -1000)
    }

    SaveChangedItem() {
        SaveState.Visible := true
        SetTimer(ResetSaveState, -500)
        temp := SaveDataEntry()
        temp.Location := textdisplay.Text
        temp.Set(EditBox.Value)
        WriteEditedSave()
    }

    ResetSaveState() {
        if (SaveState) {
            SaveState.Visible := false
        }
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
