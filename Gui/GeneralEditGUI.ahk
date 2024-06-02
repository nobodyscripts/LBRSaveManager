#Requires AutoHotkey v2.0
#Include FormLib.ahk

AddEditGuiResourcesGeneral(GeneralGUI) {
    global GeneralData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneral)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneral)

    SaveUserGeneral(*) {
        saveEditForm(GeneralData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneral(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralLeaves(GeneralGUI) {
    global GeneralData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralLeavesData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralLeaves)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralLeaves)

    SaveUserGeneralLeaves(*) {
        saveEditForm(GeneralLeavesData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralLeaves(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralMine(GeneralGUI) {
    global GeneralResourceMineData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralResourceMineData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralMine)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralMine)

    SaveUserGeneralMine(*) {
        saveEditForm(GeneralResourceMineData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralMine(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralDice(GeneralGUI) {
    global GeneralDiceData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralDiceData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralDice)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralDice)

    SaveUserGeneralDice(*) {
        saveEditForm(GeneralDiceData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralDice(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralSoul(GeneralGUI) {
    global GeneralSoulData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralSoulData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralSoul)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralSoul)

    SaveUserGeneralSoul(*) {
        saveEditForm(GeneralSoulData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralSoul(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralNature(GeneralGUI) {
    global GeneralNatureData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralNatureData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralNature)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralNature)

    SaveUserGeneralNature(*) {
        saveEditForm(GeneralNatureData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralNature(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralBorbv(GeneralGUI) {
    global GeneralBorbvData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralBorbvData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralBorbv)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralBorbv)

    SaveUserGeneralBorbv(*) {
        saveEditForm(GeneralBorbvData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralBorbv(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralQuark(GeneralGUI) {
    global GeneralQuarkData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralQuarkData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralQuark)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralQuark)

    SaveUserGeneralQuark(*) {
        saveEditForm(GeneralQuarkData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralQuark(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralFlasks(GeneralGUI) {
    global GeneralFlasksData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralFlasksData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralFlasks)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralFlasks)

    SaveUserGeneralFlasks(*) {
        saveEditForm(GeneralFlasksData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralFlasks(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralPlant(GeneralGUI) {
    global GeneralPlantData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralPlantData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralPlant)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralPlant)

    SaveUserGeneralPlant(*) {
        saveEditForm(GeneralPlantData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralPlant(*) {
        GeneralGUI.Hide()
    }
}

AddEditGuiResourcesGeneralButterfly(GeneralGUI) {
    global GeneralButterflyData

    GeneralGUI := generateEditForm(GeneralGUI, GeneralButterflyData, true)

    GeneralGUI.Add("Button", "default", "Save").OnEvent("Click", SaveUserGeneralButterfly)
    GeneralGUI.Add("Button", "default yp", "Cancel").OnEvent("Click", CloseUserGeneralGeneralButterfly)

    SaveUserGeneralButterfly(*) {
        saveEditForm(GeneralButterflyData, GeneralGUI)
        GeneralGUI.Hide()
    }

    CloseUserGeneralGeneralButterfly(*) {
        GeneralGUI.Hide()
    }
}
