#Requires AutoHotkey v2.0

AddEditGuiMines(mineGUI) {
    global GameSaveData, MineData

    mineGUI := generateEditForm(mineGUI, MineData)

    mineGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserMine)
    mineGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralMine)

    SaveUsermine(*) {
        saveEditForm(MineData, mineGUI)
        mineGUI.Hide()
    }

    CloseUserGeneralmine(*) {
        mineGUI.Hide()
    }
}
/*
Button_Click_Mine(thisGui, info) {
    global Settings, MinerEnableVeins

    optionsGUI := Gui(, "Mine Maintainer Settings")
    optionsGUI.Opt("+Owner +MinSize +MinSize500x")
    optionsGUI.BackColor := "0c0018"

    if (MinerEnableSpammer = true) {
        optionsGUI.Add("CheckBox", "vMinerEnableSpammer ccfcfcf checked", "Enable Boss Spammer")
    } else {
        optionsGUI.Add("CheckBox", "vMinerEnableSpammer ccfcfcf", "Enable Boss Spammer")
    }

    optionsGUI.Add("Text", "ccfcfcf", "Auto Bars Transmute Timer (s):")
    optionsGUI.AddEdit()
    If (IsInteger(MinerTransmuteTimer) && MinerTransmuteTimer > 0) {
        optionsGUI.Add("UpDown", "vMinerTransmuteTimer Range1-9999",
            MinerTransmuteTimer)
    } else {
        if (settings.sUseNobody) {
            optionsGUI.Add("UpDown", "vMinerTransmuteTimer Range1-9999",
                settings.defaultNobodySettings.MinerTransmuteTimer)
        } else {
            optionsGUI.Add("UpDown", "vMinerTransmuteTimer Range1-9999",
                settings.defaultSettings.MinerTransmuteTimer)
        }
    }

    optionsGUI.Add("Button", "default", "Run").OnEvent("Click", RunMine)
    optionsGUI.Add("Button", "default yp", "Save and Run").OnEvent("Click", RunSaveMine)
    optionsGUI.Add("Button", "default yp", "Save").OnEvent("Click", ProcessMineSettings)
    optionsGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseMineSettings)

    optionsGUI.Show("w300")

    ProcessMineSettings(*) {
        MineSave()
    }

    RunMine(*) {
        optionsGUI.Hide()
        WinActivate(LBRWindowTitle)
        fMineStart()
    }

    RunSaveMine(*) {
        MineSave()
        optionsGUI.Hide()
        WinActivate(LBRWindowTitle)
        fMineStart()
    }

    CloseMineSettings(*) {
        optionsGUI.Hide()
    }

    MineSave() {
        values := optionsGUI.Submit()
        MinerEnableVeins := values.MinerEnableVeins
        settings.SaveCurrentSettings()
    }
} */
