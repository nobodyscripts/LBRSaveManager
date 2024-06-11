#Requires AutoHotkey v2.0

#Include ../DataLocations/Header.ahk
#Include DynamicForms.ahk
#Include FormLib.ahk

global LoadedSaveFileName := ""
global GameSaveData := false

cEditMain(*) {
    global GameSaveData

    MainGUI := GUI(, "Edit Save")
    MainGUI.Opt("+MinSize +MinSize500x")
    MainGUI.BackColor := "0c0018"
    MainGUI.Add("Progress", "w270 h20 cBlue vMyProgress smooth", 5)
    MainGUI["MyProgress"].Visible := false
    MainGUI.Add("Text", , "")
    MainGUI.Add("Button", "default", "Open File").OnEvent("Click", OpenSaveToEdit)
    MainGUI.OnEvent("Close", RestoreBaseGUI)

    if (!GameSaveData) {
        MainGUI.Show("w300")
    } else {
        cOpenEditableSave()
    }

    OpenSaveToEdit(*) {
        global GameSaveData, LoadedSaveFileName, MyGui
        LoadedSaveFileName := FileSelect("3", UserBackupSaveDir,
            "Select a json file to edit.", "LBR Saves (*.dat; *.json)")
        if (LoadedSaveFileName = ActiveSavePath && IsWindowActive()) {
            MsgBox("Error: Close game if attempting to edit save.dat directly.")
            MainGUI.Hide()
            MyGui.Show()
            return false
        }
        if (!LoadedSaveFileName || !FileExist(LoadedSaveFileName)) {
            MsgBox("Error: No file exists at: " LoadedSaveFileName)
            MainGUI.Hide()
            MyGui.Show()
            return false
        }
        MainGUI["MyProgress"].Visible := true
        SetTimer(IncLoadingProgress, 150, 1)
        switch gFile.IsDatOrJson(LoadedSaveFileName) {
            case 2:
                gfile.LoadDatToObj(LoadedSaveFileName)
            case 1:
                gfile.LoadJsonToObj(LoadedSaveFileName)
            default:
                Log("Loaded file was not dat or json.")
                return false
        }
        if (!gFile.fileDataObj) {
            MsgBox("Error: No game save data loaded.")
            MainGUI.Hide()
            return false
        }
        GameSaveData := gFile.fileDataObj
        SetTimer(IncLoadingProgress, 0)
        cOpenEditableSave()
        MyGui.Hide()
        MainGUI.Hide()
    }

    IncLoadingProgress() {
        MainGUI["MyProgress"].value += 1
    }

    RestoreBaseGUI(*) {
        global MyGui
        MyGui.Show()
    }
}

cOpenEditableSave() {
    MainOpenedGUI := GUI(, "Edit Save")
    MainOpenedGUI.Opt("+MinSize300y +MinSize300x +Resize")
    MainOpenedGUI.BackColor := "0c0018"
    tabs := []

    MainOpenedGUI.OnEvent("Close", RestoreBaseGUI)

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

    tabcontrol := MainOpenedGUI.Add("Tab3", "ccfcfcf vTabControl", tabs)
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

    RestoreBaseGUI(*) {
        global MyGui
        MyGui.Show()
    }
}