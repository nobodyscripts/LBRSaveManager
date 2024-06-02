#Requires AutoHotkey v2.0

#Include ../Lib/SaveDataEntry.ahk

global DeathBookData := setupDeathBookDataEntries()

setupDeathBookDataEntries() {
    Entries := []

    temp := SaveDataEntry()
    temp.Location := ""
    temp.Name := ""
    temp.UIName := ""
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0.0
    Entries.Push(temp)

    return Entries
}
