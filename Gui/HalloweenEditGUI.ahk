#Requires AutoHotkey v2.0

AddEditGuiHalloween(GUIObj) {
    global GameSaveData, HalloweenData

    HalloweenGUI := generateEditForm(GUIObj, HalloweenData)

    GUIObj.Add("Button", "default", "Save").OnEvent("Click", SaveUserHalloween)
    GUIObj.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralHalloween)

    SaveUserHalloween(*) {
        saveEditForm(HalloweenData, GUIObj)
        GUIObj.Hide()
    }

    CloseUserGeneralHalloween(*) {
        GUIObj.Hide()
    }
}
