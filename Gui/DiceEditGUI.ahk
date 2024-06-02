#Requires AutoHotkey v2.0
#Include FormLib.ahk

AddEditGuiDice(DiceGUI) {
    global DiceData

    DiceGUI := generateEditForm(DiceGUI, DiceData)

    DiceGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserMine)
    DiceGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralMine)

    SaveUsermine(*) {
        saveEditForm(DiceData, DiceGUI)
        DiceGUI.Hide()
    }

    CloseUserGeneralmine(*) {
        DiceGUI.Hide()
    }
}
