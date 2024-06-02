#Requires AutoHotkey v2.0

#Include ../Lib/SaveDataEntry.ahk
#Include ..\Lib\Functions.ahk

global GeneralData := setupGeneralDataEntries()

setupGeneralDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "gems")
    AddResourceUiGroup(Entries, "coins")
    AddResourceUiGroup(Entries, "blc")
    AddResourceUiGroup(Entries, "mlc")
    AddResourceUiGroup(Entries, "beer")
    AddResourceUiGroup(Entries, "cheese")
    AddResourceUiGroup(Entries, "fruits")
    AddResourceUiGroup(Entries, "mulch")
    AddResourceUiGroup(Entries, "shards")
    AddResourceUiGroup(Entries, "ascension_shards")
    AddResourceUiGroup(Entries, "fusion_shards")
    AddResourceUiGroup(Entries, "transformation_shards")
    AddResourceUiGroup(Entries, "cp")
    AddResourceUiGroup(Entries, "card_parts")
    AddResourceUiGroup(Entries, "transcension_card_parts")
    AddResourceUiGroup(Entries, "season_gems")
    ;AddResourceUiGroup(Entries, "usd")
    AddResourceUiGroup(Entries, "energy_electrical")
    AddResourceUiGroup(Entries, "seeds")
    AddResourceUiGroup(Entries, "honor")
    AddResourceUiGroup(Entries, "soul_stones")
    AddResourceUiGroup(Entries, "silver_token")
    AddResourceUiGroup(Entries, "gold_token")
    AddResourceUiGroup(Entries, "borb_o_lantern")
    return Entries
}

global GeneralResourceMineData := setupGeneralMineDataEntries()

setupGeneralMineDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "coal_time_sphere")
    AddResourceUiGroup(Entries, "diamond_coal")
    AddResourceUiGroup(Entries, "fuel")
    AddResourceUiGroup(Entries, "diamond_shiny")
    return Entries
}

global GeneralDiceData := setupGeneralDiceDataEntries()

setupGeneralDiceDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "power_dice")
    AddResourceUiGroup(Entries, "dice")
    return Entries
}

global GeneralSoulData := setupGeneralSoulDataEntries()

setupGeneralSoulDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "soul_particles")
    AddResourceUiGroup(Entries, "soul_entities")
    AddResourceUiGroup(Entries, "soul_flask")
    AddResourceUiGroup(Entries, "soul_keys")
    return Entries
}

global GeneralNatureData := setupGeneralNatureDataEntries()

setupGeneralNatureDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "nature_gems")
    AddResourceUiGroup(Entries, "clover_basic3")
    AddResourceUiGroup(Entries, "clover_basic4")
    AddResourceUiGroup(Entries, "magic_mulch")
    AddResourceUiGroup(Entries, "nature_time_sphere")
    return Entries
}

global GeneralBorbvData := setupGeneralBorbvDataEntries()

setupGeneralBorbvDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "borbs")
    AddResourceUiGroup(Entries, "borb_token")
    AddResourceUiGroup(Entries, "borb_juice")
    AddResourceUiGroup(Entries, "borb_ascension_juice")
    AddResourceUiGroup(Entries, "borb_rune")
    AddResourceUiGroup(Entries, "borb_ascension_rune")
    return Entries
}

global GeneralQuarkData := setupGeneralQuarkDataEntries()

setupGeneralQuarkDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "leafton")
    AddResourceUiGroup(Entries, "quark_blob")
    AddResourceUiGroup(Entries, "quantum_blob")
    AddResourceUiGroup(Entries, "quark_structure")
    AddResourceUiGroup(Entries, "energy_quark")
    return Entries
}


global GeneralFlasksData := setupGeneralFlasksDataEntries()

setupGeneralFlasksDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "flask_orange")
    AddResourceUiGroup(Entries, "flask_red")
    AddResourceUiGroup(Entries, "flask_blue")
    AddResourceUiGroup(Entries, "flask_black")
    AddResourceUiGroup(Entries, "flask_green")
    AddResourceUiGroup(Entries, "flask_strange")
    AddResourceUiGroup(Entries, "flask_magenta")
    return Entries
}

global GeneralLeavesData := setupGeneralLeavesDataEntries()

setupGeneralLeavesDataEntries() {
    Entries := []

    AddResourceUiGroup(Entries, "coal")
    AddResourceUiGroup(Entries, "kyanite")
    AddResourceUiGroup(Entries, "biotite")
    AddResourceUiGroup(Entries, "benitoite")
    AddResourceUiGroup(Entries, "quark")
    AddResourceUiGroup(Entries, "amber")
    AddResourceUiGroup(Entries, "ancient")
    AddResourceUiGroup(Entries, "lava")
    AddResourceUiGroup(Entries, "hematite")
    AddResourceUiGroup(Entries, "ruby")
    AddResourceUiGroup(Entries, "sacred")
    AddResourceUiGroup(Entries, "bismuth")
    AddResourceUiGroup(Entries, "platinum")
    AddResourceUiGroup(Entries, "mythical")
    AddResourceUiGroup(Entries, "malachite")
    AddResourceUiGroup(Entries, "leaves")
    AddResourceUiGroup(Entries, "moonstone")
    AddResourceUiGroup(Entries, "emerald")
    AddResourceUiGroup(Entries, "soul")
    AddResourceUiGroup(Entries, "celestial")
    AddResourceUiGroup(Entries, "void")
    AddResourceUiGroup(Entries, "amethyst")
    AddResourceUiGroup(Entries, "exotic")
    AddResourceUiGroup(Entries, "cosmic")
    AddResourceUiGroup(Entries, "rhodonite")
    AddResourceUiGroup(Entries, "silicon")
    AddResourceUiGroup(Entries, "azurite")
    AddResourceUiGroup(Entries, "obsidian")
    AddResourceUiGroup(Entries, "sand")
    AddResourceUiGroup(Entries, "plasma")
    AddResourceUiGroup(Entries, "gold")
    AddResourceUiGroup(Entries, "ice")
    AddResourceUiGroup(Entries, "soul_empty")
    AddResourceUiGroup(Entries, "niobium")
    AddResourceUiGroup(Entries, "tektite")
    return Entries
}

global GeneralPlantData := setupGeneralPlantDataEntries()

setupGeneralPlantDataEntries() {
    Entries := []
    AddResourceUiGroup(Entries, "plant_hyacinth")
    AddResourceUiGroup(Entries, "plant_dandelion")
    AddResourceUiGroup(Entries, "plant_hibiscus")
    AddResourceUiGroup(Entries, "plant_forgetmenot")
    AddResourceUiGroup(Entries, "plant_poppy")
    AddResourceUiGroup(Entries, "plant_cornflower")
    AddResourceUiGroup(Entries, "plant_daffodil")
    AddResourceUiGroup(Entries, "plant_dame")
    AddResourceUiGroup(Entries, "plant_marigold")
    AddResourceUiGroup(Entries, "plant_tulip")
    AddResourceUiGroup(Entries, "plant_aster")
    AddResourceUiGroup(Entries, "plant_rose")
    AddResourceUiGroup(Entries, "plant_primula")
    AddResourceUiGroup(Entries, "plant_camomile")
    AddResourceUiGroup(Entries, "plant_lily")
    AddResourceUiGroup(Entries, "plant_pansy")

    return Entries
}

global GeneralButterflyData := setupGeneralButterflyDataEntries()

setupGeneralButterflyDataEntries() {
    Entries := []
    AddResourceUiGroup(Entries, "butterfly_prismwing")
    AddResourceUiGroup(Entries, "butterfly_duskmoth")
    AddResourceUiGroup(Entries, "butterfly_auroraflit")
    AddResourceUiGroup(Entries, "butterfly_meadowdance")
    AddResourceUiGroup(Entries, "butterfly_sunspark")
    AddResourceUiGroup(Entries, "butterfly_soulwing")
    AddResourceUiGroup(Entries, "butterfly_serenewisp")
    AddResourceUiGroup(Entries, "butterfly_oceaniclash")
    AddResourceUiGroup(Entries, "butterfly_citrineshine")
    AddResourceUiGroup(Entries, "butterfly_moonbloom")
    AddResourceUiGroup(Entries, "butterfly_crystalvale")
    AddResourceUiGroup(Entries, "butterfly_radiantwing")
    AddResourceUiGroup(Entries, "butterfly_emberglide")
    AddResourceUiGroup(Entries, "butterfly_twilightglow")
    AddResourceUiGroup(Entries, "butterfly_blossomhaze")
    AddResourceUiGroup(Entries, "butterfly_starlance")

    return Entries
}

AddResourceUiGroup(Entries, Resource) {
    if (Resource != "cp") {
        displayResource := CapitaliseFirstChar(Resource)
        displayResource := StrReplace(displayResource, "_", A_Space)
    } else {
        displayResource := "Challenge Points"
    }

    temp := SaveDataEntry()
    temp.Location := "profiles.def.resources." Resource ".collected_total"
    temp.Name := "resources." Resource ".collected_total"
    temp.UIName := displayResource " Collected Total"
    temp.DataType := "string"
    temp.Position := 2
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.resources." Resource ".collected"
    temp.Name := "resources." Resource ".collected"
    temp.UIName := displayResource " Collected"
    temp.DataType := "string"
    temp.Position := 3
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.resources." Resource ".count"
    temp.Name := "resources." Resource ".count"
    temp.UIName := displayResource " Count"
    temp.DataType := "string"
    temp.Position := 3
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

}