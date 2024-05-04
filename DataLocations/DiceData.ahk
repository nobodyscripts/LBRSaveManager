#Requires AutoHotkey v2.0

global DiceData := setupDiceDataEntries()

setupDiceDataEntries() {
    Entries := []

    temp := SaveDataEntry()
    temp.Location := "profiles.def.objects.o_game.data.dice.cursed_count_max_saved"
    temp.Name := "objects.o_game.data.dice.cursed_count_max_saved"
    temp.UIName := "Cursed Dice Max Saved"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := ConstMaxInt
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_azurite_leaves.count"
    temp.Name := "dice.unlock_azurite_leaves.count"
    temp.UIName := "Unlock Azurite Leaves"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_niobium_leaves.count"
    temp.Name := "dice.unlock_niobium_leaves.count"
    temp.UIName := "Unlock Niobium Leaves"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_count.count"
    temp.Name := "dice.dice_count.count"
    temp.UIName := "Dice Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_sides.count"
    temp.Name := "dice.dice_sides.count"
    temp.UIName := "Dice Sides Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_inventory_size.count"
    temp.Name := "dice.dice_inventory_size.count"
    temp.UIName := "Bigger Dice Bag"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_backpack_size.count"
    temp.Name := "dice.dice_backpack_size.count"
    temp.UIName := "Bigger Dice Backpack"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_timeout_reduction.count"
    temp.Name := "dice.dice_timeout_reduction.count"
    temp.UIName := "Faster Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_battlefield_roll_timeout_reduction.count"
    temp.Name := "dice.dice_battlefield_roll_timeout_reduction.count"
    temp.UIName := "Faster Battle Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_converter_azurite_dice.count"
    temp.Name := "dice.unlock_converter_azurite_dice.count"
    temp.UIName := "Unlock Dice Points Converter (Azurite)"
    temp.DataType := "bool"
    temp.Position := 1
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_converter_azurite_power_dice.count"
    temp.Name := "dice.unlock_converter_azurite_power_dice.count"
    temp.UIName := "Unlock Power Dice Converter (Azurite)"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_count_azurite.count"
    temp.Name := "dice.dice_count_azurite.count"
    temp.UIName := "Dice Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_sides_azurite.count"
    temp.Name := "dice.dice_sides_azurite.count"
    temp.UIName := "Sides Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_inventory_size_azurite.count"
    temp.Name := "dice.dice_inventory_size_azurite.count"
    temp.UIName := "Bigger Dice Bag"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_timeout_reduction_azurite.count"
    temp.Name := "dice.dice_timeout_reduction_azurite.count"
    temp.UIName := "Faster Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_battlefield_roll_timeout_reduction_azurite.count"
    temp.Name := "dice.dice_battlefield_roll_timeout_reduction_azurite.count"
    temp.UIName := "Faster Battle Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_converter_niobium_dice.count"
    temp.Name := "dice.unlock_converter_niobium_dice.count"
    temp.UIName := "Unlock Dice Points Converter (Niobium)"
    temp.DataType := "bool"
    temp.Position := 1
    temp.Min := 0.0
    temp.Max := 0
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.unlock_converter_niobium_power_dice.count"
    temp.Name := "dice.unlock_converter_niobium_power_dice.count"
    temp.UIName := "Unlock Power Dice Converter (Niobium)"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_count_niobium.count"
    temp.Name := "dice.dice_count_niobium.count"
    temp.UIName := "Dice Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_sides_niobium.count"
    temp.Name := "dice.dice_sides_niobium.count"
    temp.UIName := "Sides Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_inventory_size_niobium.count"
    temp.Name := "dice.dice_inventory_size_niobium.count"
    temp.UIName := "Bigger Dice Bag"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_timeout_reduction_niobium.count"
    temp.Name := "dice.dice_timeout_reduction_niobium.count"
    temp.UIName := "Faster Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.dice_battlefield_roll_timeout_reduction_niobium.count"
    temp.Name := "dice.dice_battlefield_roll_timeout_reduction_niobium.count"
    temp.UIName := "Faster Battle Dice"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.dice.trade_gems_max_value.count"
    temp.Name := "dice.trade_gems_max_value.count"
    temp.UIName := "Gems Business"
    temp.DataType := "bool"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 0
    Entries.Push(temp)

    return Entries
}
