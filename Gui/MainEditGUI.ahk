#Requires AutoHotkey v2.0

#Include ../DataLocations/Header.ahk
#Include GeneralEditGUI.ahk
#Include DiceEditGUI.ahk
#Include HalloweenEditGUI.ahk
#Include MineEditGUI.ahk

global LoadedSaveFileName := ""
global GameSaveData := false

cEditMain(*) {
    global GameSaveData

    MainGUI := GUI(, "Edit Save")
    MainGUI.Opt("+Owner +MinSize +MinSize500x")
    MainGUI.BackColor := "0c0018"
    MainGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)
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
            MsgBox("Error: No file exists at: " LoadedSaveFileName)
            MainGUI.Hide()
            return false
        }
        MainGUI["MyProgress"].Visible := true
        SetTimer(IncLoadingProgress, 150, 1)
        GameSaveData := LoadSaveToJson(LoadedSaveFileName)
        if (!GameSaveData) {
            MsgBox("Error: No game save data loaded.")
            MainGUI.Hide()
            return false
        }
        SetTimer(IncLoadingProgress, 0)
        MainGUI.Hide()
        cOpenEditableSave()
    }
    
    IncLoadingProgress() {
        MainGUI["MyProgress"].value += 1
    }
}

cOpenEditableSave() {
    MainOpenedGUI := GUI(, "Edit Save")
    MainOpenedGUI.Opt("+Owner +MinSize +MinSize500x +Resize")
    MainOpenedGUI.BackColor := "0c0018"

    tabcontrol := MainOpenedGUI.Add("Tab3", "ccfcfcf", ["General", "Leaves", "Flasks", "Borbv", "Nature", "Plant", "Butterfly", "Soul", "Quark", "Dice", "Dice2", "Mines", "Mines2", "Halloween"])
    tabcontrol.UseTab(1)
    AddEditGuiResourcesGeneral(MainOpenedGUI)
    tabcontrol.UseTab(2)
    AddEditGuiResourcesGeneralLeaves(MainOpenedGUI)
    tabcontrol.UseTab(3)
    AddEditGuiResourcesGeneralFlasks(MainOpenedGUI)
    tabcontrol.UseTab(4)
    AddEditGuiResourcesGeneralBorbv(MainOpenedGUI)
    tabcontrol.UseTab(5)
    AddEditGuiResourcesGeneralNature(MainOpenedGUI)
    tabcontrol.UseTab(6)
    AddEditGuiResourcesGeneralPlant(MainOpenedGUI)
    tabcontrol.UseTab(7)
    AddEditGuiResourcesGeneralButterfly(MainOpenedGUI)
    tabcontrol.UseTab(8)
    AddEditGuiResourcesGeneralSoul(MainOpenedGUI)
    tabcontrol.UseTab(9)
    AddEditGuiResourcesGeneralQuark(MainOpenedGUI)
    tabcontrol.UseTab(10)
    AddEditGuiResourcesGeneralDice(MainOpenedGUI)
    tabcontrol.UseTab(11)
    AddEditGuiDice(MainOpenedGUI)
    tabcontrol.UseTab(12)
    AddEditGuiResourcesGeneralMine(MainOpenedGUI)
    tabcontrol.UseTab(13)
    AddEditGuiMines(MainOpenedGUI)
    tabcontrol.UseTab(14)
    AddEditGuiHalloween(MainOpenedGUI)

    MainOpenedGUI.Show()
}
