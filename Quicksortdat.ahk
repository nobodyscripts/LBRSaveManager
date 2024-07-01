#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 8
#SingleInstance Force

global ScriptsLogFile := A_ScriptDir "\LeafBlowerV3.Log"
global EnableLogging := true
global IsSecondary := false
/*
#Include Gui\MainGUI.ahk


#Include Lib\ScriptSettings.ahk
#Include Lib\Functions.ahk
#Include Lib\Navigate.ahk
#Include Lib\SettingsCheck.ahk
#Include Lib\Spammers.ahk */
#Include ../LBRSaveManager/Lib/FileClass.ahk
/*
#Include Lib\GameHotkeys.ahk
#Include Lib\ScriptHotkeys.ahk
#Include Lib\GameSettings.ahk

#Include Modules\BankDeposit.ahk
#Include Modules\Borbventure.ahk
#Include Modules\Cards.ahk
#Include Modules\CardsBuy.ahk
#Include Modules\Claw.ahk
#Include Modules\CursedCheese.ahk
#Include Modules\FarmGFSS.ahk
#Include Modules\FarmNatureBoss.ahk
#Include Modules\FarmNormalBoss.ahk
#Include Modules\GemFarm.ahk
#Include Modules\NatureHyacinth.ahk
#Include Modules\TowerTimeWarp.ahk
#Include Modules\TowerFarmPassive.ahk
#Include Modules\LeaftonTaxi.ahk
#Include Modules\MineMaintainer.ahk
#Include Modules\SuitcaseSpam.ahk
#Include Modules\QuickPrestige.ahk */
/*
SendMode("Input") ; Support for vm
; Can be Input, Event, Play, InputThenPlay if Input doesn't work for you

DetectHiddenWindows(true)
Persistent()  ; Prevent the script from exiting automatically.

global GameSaveDir := A_AppData "\..\Local\blow_the_leaves_away\"
global ActiveSavePath := GameSaveDir "save.dat"
global ActiveGameSettingsPath := GameSaveDir "options.dat"
global on9 := 0
global HadToHideNotifsF9 := false
global CardsBossFarmEnabled := false*/
global LBRWindowTitle := "Leaf Blower Revolution ahk_class YYGameMakerYY ahk_exe game.exe"
/* global X, Y, W, H
global settings := cSettings()

if (!settings.initSettings()) {
    ; If the first load fails, it attempts to write a new config, this retrys
    ; loading after that first failure
    ; Hardcoding 2 attempts because a loop could continuously error
    Sleep(50)
    if (!settings.initSettings()) {
        MsgBox("Script failed to load settings, script closing, try restarting.")
        ExitApp()
    }
}
X := Y := W := H := 0
if (WinExist(LBRWindowTitle)) {
    WinGetClientPos(&X, &Y, &W, &H, LBRWindowTitle)
} */

gFile := cFile()

gFile.GetFileJson(A_ScriptDir "\options.dat", true)
gFile.ConvertJsonStringToObj()
gFile.ConvertObjToJsonString()
if(gFile.WriteFileJson(true)) {
    Log("Done")
}


fFile := cFile()

fFile.GetFileJson(A_ScriptDir "\options-challenge.dat", true)
fFile.ConvertJsonStringToObj()
fFile.ConvertObjToJsonString()
if (fFile.WriteFileJson(true)) {
    Log("Done 2")
}