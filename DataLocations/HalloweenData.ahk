#Requires AutoHotkey v2.0

global HalloweenData := setupHalloweenDataEntries()

setupHalloweenDataEntries() {
    Entries := []

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.borb_o_lantern_drop_count.count"
    temp.Name := "event.borb_o_lantern_drop_count.count"
    temp.UIName := "Borb O Count"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 20
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.borb_o_lantern_drop_chance.count"
    temp.Name := "event.borb_o_lantern_drop_chance.count"
    temp.UIName := "Borb O Chance"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 20
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.borb_o_digs.count"
    temp.Name := "event.borb_o_digs.count"
    temp.UIName := "Borb O Digs"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 5
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.increase_cursed_cheese_damage.count"
    temp.Name := "event.increase_cursed_cheese_damage.count"
    temp.UIName := "Cursed Weakness"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := ConstMaxInt
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.cursed_cheese_curses_multiplier.count"
    temp.Name := "event.cursed_cheese_curses_multiplier.count"
    temp.UIName := "Cursed Cheese Curses"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 20
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.cursed_cheese_leafscended_leaves_drop_chance.count"
    temp.Name := "event.cursed_cheese_leafscended_leaves_drop_chance.count"
    temp.UIName := "Cursed Leafscension Luck"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 10
    Entries.Push(temp)

    temp := SaveDataEntry()
    temp.Location := "profiles.def.shops.event.cursed_cheese_leafscended_leaves_max_level.count"
    temp.Name := "event.cursed_cheese_leafscended_leaves_max_level.count"
    temp.UIName := "Cursed Leafscension Level"
    temp.DataType := "int"
    temp.Position := 0
    temp.Min := 0.0
    temp.Max := 2
    Entries.Push(temp)

    return Entries
}
