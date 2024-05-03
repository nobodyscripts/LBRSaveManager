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
    temp.Max := 2147483647
    Entries.Push(temp)

    return Entries
}
