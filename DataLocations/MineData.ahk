#Requires AutoHotkey v2.0

#Include ../Lib/SaveDataEntry.ahk

global MineData := setupMineDataEntries()

setupMineDataEntries() {

    Entries := []

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_enhance.count"
    temp.Name := "mines.mines_enhance.count"
    temp.UIName := "Mine Enhance"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_veins.count"
    temp.Name := "mines.mines_max_veins.count"
    temp.UIName := "Max Veins Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 4
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_veins_search_reduction_multiplier.count"
    temp.Name := "mines.mines_veins_search_reduction_multiplier.count"
    temp.UIName := "Veins Search Time Reduction"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_veins_mine_count.count"
    temp.Name := "mines.mines_max_veins_mine_count.count"
    temp.UIName := "Max Veins Tick Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_veins_rarity_multiplier.count"
    temp.Name := "mines.mines_veins_rarity_multiplier.count"
    temp.UIName := "Vein Rarity Multiplier"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_mines.count"
    temp.Name := "mines.mines_drill_mines.count"
    temp.UIName := "Drill for Mines"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_cd.count"
    temp.Name := "mines.mines_drill_cd.count"
    temp.UIName := "CDia Drill for Mines"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_sd.count"
    temp.Name := "mines.mines_drill_sd.count"
    temp.UIName := "SDia Drill for Mines"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_mines.count"
    temp.Name := "mines.mines_max_mines.count"
    temp.UIName := "Max Mines"
    temp.DataType := "int"
    temp.Position := 1
    temp.Min := 0
    temp.Max := 3
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_caves.count"
    temp.Name := "mines.mines_max_caves.count"
    temp.UIName := "Max Mine Caves"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_mine_power_multiplier.count"
    temp.Name := "mines.mines_mine_power_multiplier.count"
    temp.UIName := "Mine Power Multiplier"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 50
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_search_duration_reduction_multiplier.count"
    temp.Name := "mines.mines_search_duration_reduction_multiplier.count"
    temp.UIName := "Mine Search Time"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_reward_multiplier.count"
    temp.Name := "mines.mines_reward_multiplier.count"
    temp.UIName := "Mine Cave Reward Multi"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 20
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_min_level.count"
    temp.Name := "mines.mines_min_level.count"
    temp.UIName := "Mine Min Level"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 9
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_level.count"
    temp.Name := "mines.mines_max_level.count"
    temp.UIName := "Mine Max Level"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 17
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_max_active_caves.count"
    temp.Name := "mines.mines_max_active_caves.count"
    temp.UIName := "Max Active Cave Mining"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_coal_time_sphere_efficiency.count"
    temp.Name := "mines.mines_coal_time_sphere_efficiency.count"
    temp.UIName := "Coal Sphere Multiplier"
    temp.DataType := "int"
    temp.Position := 1
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_inventory_size.count"
    temp.Name := "mines.mines_inventory_size.count"
    temp.UIName := "Mine Inventory Size"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_items_max_count.count"
    temp.Name := "mines.mines_items_max_count.count"
    temp.UIName := "Mine Max Item Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 20
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_craft_from_codex.count"
    temp.Name := "mines.mines_craft_from_codex.count"
    temp.UIName := "Mine Codex"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_rarity_multiplier.count"
    temp.Name := "mines.mines_rarity_multiplier.count"
    temp.UIName := "Mine Cave Rarity Multi"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.unlock_depth_drill.count"
    temp.Name := "mines.unlock_depth_drill.count"
    temp.UIName := "Depth Drill Unlock"
    temp.DataType := "bool"
    temp.Position := 1
    temp.Min := 0
    temp.Max := 1
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_depth_progress.count"
    temp.Name := "mines.mines_drill_depth_progress.count"
    temp.UIName := "Depth Drill Power Amount"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_depth_progress_multiplier.count"
    temp.Name := "mines_drill_depth_progress_multiplier.count"
    temp.UIName := "Depth Drill Power Multi"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.fuel_efficiency.count"
    temp.Name := "mines.fuel_efficiency.count"
    temp.UIName := "Depth Drill Fuel Reduction"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.mines.mines_drill_free_refuel_multiplier.count"
    temp.Name := "mines.mines_drill_free_refuel_multiplier.count"
    temp.UIName := "Depth Drill Refuel Multi"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.objects.o_game.data.mines.drill_depth"
    temp.Name := "objects.o_game.data.mines.drill_depth"
    temp.UIName := "Depth Drill Current Depth"
    temp.DataType := "float"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0.0
    Entries.Push(temp)

    return Entries
}