#Requires AutoHotkey v2.0

global LoadedSaveFileName := ""

cEditMain(*) {
    global GameSaveData

    MainGUI := GUI(, "Edit Save")
    MainGUI.Opt("+Owner +MinSize +MinSize500x")
    MainGUI.BackColor := "0c0018"
    MainGUI.Add("Progress", "w300 h40 cBlue vMyProgress smooth", 5)
    MainGUI["MyProgress"].Visible := false
    MainGUI.Add("Text",,"")
    MainGUI.Add("Button", "default", "Open File").OnEvent("Click", OpenSaveToEdit)
    if (!GameSaveData) {
        MainGUI.Show("w300")
    } else {
        cOpenEditableSave()
    }

    OpenSaveToEdit(*) {
        global GameSaveData, LoadedSaveFileName
        LoadedSaveFileName := FileSelect("3", UserBackupSaveDir,
            "Select a json file to edit.", "*.json")
        if (!LoadedSaveFileName || !FileExist(LoadedSaveFileName)) {
            return false
        }
        MainGUI["MyProgress"].Visible := true
        SetTimer(IncLoadingProgress, 100, 1)
        GameSaveData := LoadSaveToJson(LoadedSaveFileName)
        SetTimer(IncLoadingProgress, 0)
        MainGUI.Hide()
        cOpenEditableSave()
    }
    
    IncLoadingProgress() {
        MainGUI["MyProgress"].value += 4
    }
}

cOpenEditableSave() {
    MainOpenedGUI := GUI(, "Edit Save")
    MainOpenedGUI.Opt("+Owner +MinSize +MinSize500x")
    MainOpenedGUI.BackColor := "0c0018"

    tabcontrol := MainOpenedGUI.Add("Tab3", "ccfcfcf", ["General", "Mines", "Dice"])
    tabcontrol.UseTab(2)
    AddEditGuiMines(MainOpenedGUI)

    MainOpenedGUI.Show("w300")
}
/*
GameSaveData := LoadSaveToJson("F:\Documents\LBR Backups\LBR Save 2024 04 16 - 12-05-28.json")
MineData.MinesEnchanceCount.Set(2)
Peep(MineData.MinesEnchanceCount.Get())
Peep(GameSaveData)
SaveVarToJsonFile("F:\Documents\LBR Backups\LBR Save 2024 04 16 - 12-05-28.json", GameSaveData)
*/
