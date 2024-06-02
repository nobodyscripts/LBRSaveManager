#Requires AutoHotkey v2.0
#Include FormLib.ahk

AddEditGuiMines(mineGUI) {
    global MineData

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
