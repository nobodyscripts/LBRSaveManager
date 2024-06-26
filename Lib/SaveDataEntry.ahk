#Requires AutoHotkey v2.0

#Include ../ExtLIbs/PeepAHK-main/script/Peep.v2.ahk

Class SaveDataEntry {
    Name := ""
    UIName := ""
    DataType := ""
    Position := 0
    Location := ""
    Max := 0
    Min := 0

    Get() {
        global GameSaveData
        if (!GameSaveData) {
            GameSaveData := false
            Log("No game save data loaded.")
            return false
        }
        arr := StrSplit(this.Location, ".")
        switch arr.Length {
            case 1:
                return GameSaveData[arr[1]]
            case 2:
                return GameSaveData[arr[1]][arr[2]]
            case 3:
                return GameSaveData[arr[1]][arr[2]][arr[3]]
            case 4:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]]
            case 5:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]]
            case 6:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]]
            case 7:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]]
            case 8:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]][arr[8]]
            case 9:
                return GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]][arr[8]][arr[9]]
            default:
                Log("Tried to use SaveDataEntry.Get with " arr.Length)
                return false
        }
    }

    Set(val) {
        if (this.DataType = "int" || this.DataType = "bool" || this.DataType = "float" || IsFloat(val) || IsNumber(val)) {
            val += 0.0
        }
        global GameSaveData
        arr := StrSplit(this.Location, ".")
        i := arr.Length
        newArr := []
        switch arr.Length {
            case 1:
                GameSaveData[arr[1]] := val
            case 2:
                GameSaveData[arr[1]][arr[2]] := val
            case 3:
                GameSaveData[arr[1]][arr[2]][arr[3]] := val
            case 4:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]] := val
            case 5:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]] := val
            case 6:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]] := val
            case 7:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]] := val
            case 8:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]][arr[8]] := val
            case 9:
                GameSaveData[arr[1]][arr[2]][arr[3]][arr[4]][arr[5]][arr[6]][arr[7]][arr[8]][arr[9]] := val
            default:
                Log("Tried to use SaveDataEntry.Set with " arr.Length)
        }
    }
}