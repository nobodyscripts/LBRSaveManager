#Requires AutoHotkey v2.0

/* 
"profiles.def.shops.mines.mines_veins_search_reduction_multiplier.count"
"profiles.def.shops.mines.mines_max_veins_mine_count.count"
"profiles.def.shops.mines.mines_veins_rarity_multiplier.count"
"profiles.def.shops.mines.mines_drill_mines.count"
"profiles.def.shops.mines.mines_drill_cd.count"
"profiles.def.shops.mines.mines_drill_sd.count"
"profiles.def.shops.mines.mines_max_mines.count"
"profiles.def.shops.mines.mines_max_caves.count"
"profiles.def.shops.mines.mines_mine_power_multiplier.count"
"profiles.def.shops.mines.mines_search_duration_reduction_multiplier.count"
"profiles.def.shops.mines.mines_reward_multiplier.count"
"profiles.def.shops.mines.mines_min_level.count"
"profiles.def.shops.mines.mines_max_level.count"
"profiles.def.shops.mines.mines_max_active_caves.count"
"profiles.def.shops.mines.mines_coal_time_sphere_efficiency.count"
"profiles.def.shops.mines.mines_inventory_size.count"
"profiles.def.shops.mines.mines_items_max_count.count"
"profiles.def.shops.mines.mines_craft_from_codex.count"
"profiles.def.shops.mines.mines_rarity_multiplier.count"
"profiles.def.shops.mines.unlock_depth_drill.count"
"profiles.def.shops.mines.mines_drill_depth_progress.count"
"profiles.def.shops.mines.mines_drill_depth_progress_multiplier.count"
"profiles.def.shops.mines.fuel_efficiency.count"
"profiles.def.shops.mines.mines_drill_free_refuel_multiplier.count" */

global MineData := setupMineDataEntries()

setupMineDataEntries() {
    Entries := []

    MinesEnchanceCount := SaveDataEntry()
    MinesEnchanceCount.Location := "profiles.def.shops.mines.mines_enhance.count"
    MinesEnchanceCount.Name := "mines.mines_enhance.count"
    MinesEnchanceCount.UIName := "Mine Enhance"
    MinesEnchanceCount.DataType := "bool"
    MinesEnchanceCount.Position := 0
    MinesEnchanceCount.Min := 0
    MinesEnchanceCount.Max := 1
    Entries.Push(MinesEnchanceCount)

    MaxVeinsCount := SaveDataEntry()
    MaxVeinsCount.Location := "profiles.def.shops.mines.mines_max_veins.count"
    MaxVeinsCount.Name := "mines.mines_max_veins.count"
    MaxVeinsCount.UIName := "Max Veins Count"
    MaxVeinsCount.DataType := "int"
    MaxVeinsCount.Position := 0
    MaxVeinsCount.Min := 0
    MaxVeinsCount.Max := 4
    Entries.Push(MaxVeinsCount)

    MaxVeinsCount := SaveDataEntry()
    MaxVeinsCount.Location := "profiles.def.shops.mines.mines_veins_search_reduction_multiplier.count"
    MaxVeinsCount.Name := "mines.mines_veins_search_reduction_multiplier.count"
    MaxVeinsCount.UIName := "Veins Search Time Reduction"
    MaxVeinsCount.DataType := "int"
    MaxVeinsCount.Position := 0
    MaxVeinsCount.Min := 0
    MaxVeinsCount.Max := 10
    Entries.Push(MaxVeinsCount)

    return Entries
}