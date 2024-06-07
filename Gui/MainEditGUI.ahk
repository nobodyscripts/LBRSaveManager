#Requires AutoHotkey v2.0

#Include ../DataLocations/Header.ahk
#Include DynamicForms.ahk
#Include FormLib.ahk
#Include ../Lib/EditableSave.ahk

global LoadedSaveFileName := ""
global GameSaveData := false

cEditMain(*) {
    global GameSaveData

    MainGUI := GUI(, "Edit Save")
    MainGUI.Opt("+Owner +MinSize +MinSize500x")
    MainGUI.BackColor := "0c0018"
    MainGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)
    MainGUI["MyProgress"].Visible := false
    MainGUI.Add("Text", , "")
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

WriteEditedSave() {
    global GameSaveData, LoadedSaveFileName

    WaitGUI := GUI(, "Waiting for save")
    WaitGUI.Opt("+Owner +MinSize +MinSize500x")
    WaitGUI.BackColor := "0c0018"
    WaitGUI.AddText("cWhite", "Waiting for file to save to: " LoadedSaveFileName)
    WaitGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)

    SetTimer(incWaitProgress.Bind(WaitGUI), 50)
    WaitGUI.Show()

    SaveVarToJsonFile(LoadedSaveFileName, GameSaveData)
    
    WaitGUI.Hide()
    MsgBox("Edited file saved to: " LoadedSaveFileName)
    SetTimer(incWaitProgress.Bind(WaitGUI), 0)
}

cOpenEditableSave() {
    MainOpenedGUI := GUI(, "Edit Save")
    MainOpenedGUI.Opt("+Owner +MinSize300y +MinSize300x +Resize")
    MainOpenedGUI.BackColor := "0c0018"
    tabs := []


    for (k, v in GameSaveData) {
        if (k != "profiles" && k != "version" && k != "version_int" &&
            k != "current_profile") {
            tabs.Push(StrReplace(CapitaliseFirstChar(k), "_", A_Space))
        }
    }

    for (k, v in GameSaveData["profiles"]["def"]) {
        if (k != "player" && k != "key") {
            tabs.Push(StrReplace(CapitaliseFirstChar(k), "_", A_Space))
        }
    }
    tabs.Push("Challenge Profile")

    tabcontrol := MainOpenedGUI.Add("Tab3", "ccfcfcf", tabs)
    i := 1
    for (k, v in GameSaveData) {
        if (k != "profiles" && k != "version" && k != "version_int" &&
            k != "current_profile") {
            tabcontrol.UseTab(i)
            setupDynamicForm(MainOpenedGUI, v, k ".")
            i++
        }
    }
    for (k, v in GameSaveData["profiles"]["def"]) {
        if (k != "player" && k != "key") {
            tabcontrol.UseTab(i)
            setupDynamicForm(MainOpenedGUI, v, "profiles.def." k ".")
            i++
        }
    }
    tabcontrol.UseTab(i)
    setupDynamicForm(MainOpenedGUI,
        GameSaveData["profiles"]["challenge"], "profiles.challenge.")
    MainOpenedGUI.Show()
}