#Requires AutoHotkey v2.0
#Include FormLib.ahk

AddEditGuiHalloween(GUIObj) {
    global HalloweenData

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
