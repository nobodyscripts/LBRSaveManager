#Requires AutoHotkey v2.0
global ScriptsLogFile
global ConstMaxInt := 2147483647
; ------------------- Functions -------------------

/**
 * Logger, user disable possible, debugout regardless of setting to vscode.
 * Far more usable than outputting to tooltips or debugging using normal means
 * due to focus changing and hotkeys overwriting
 * @param logmessage 
 * @param {string} logfile Defaults to A_ScriptDir "\LeafBlowerV3.log" but is 
 * overwritable
 */
Log(logmessage, logfile := ScriptsLogFile) {
    static isWritingToLog := false
    message := FormatTime(, 'MM/dd/yyyy hh:mm:ss:' A_MSec) ' - ' logmessage '`r`n'
    OutputDebug(message)
    if (!EnableLogging) {
        return
    }
    k := 0
    try {
        if (!isWritingToLog) {
            isWritingToLog := true
            Sleep(1)
            FileAppend(message, logfile)
            isWritingToLog := false

        }
    } catch as exc {
        OutputDebug("LogError: Error writing to log - " exc.Message "`r`n")
        ; MsgBox("Error writing to log:`n" exc.Message)
        Sleep(1)
        FileAppend(message, logfile)
        Sleep(1)
        FileAppend(FormatTime(, 'MM/dd/yyyy hh:mm:ss:' A_MSec) ' - '
            "LogError: Error writing to log - " exc.Message '`r`n', logfile)
    }
}

MakeWindowActive() {
    if (!WinExist(LBRWindowTitle)) {
        Log("Error 14: Window doesn't exist.")
        return false ; Don't check further
    }
    if (!WinActive(LBRWindowTitle)) {
        WinActivate(LBRWindowTitle)
    }
    return true
}

global LastWindowNotActiveTimer := A_Now

IsWindowActive() {
    global LastWindowNotActiveTimer
    if (!WinExist(LBRWindowTitle) ||
        !WinActive(LBRWindowTitle)) {
        ; Because this can be spammed lets limit rate the error log
        if (DateDiff(A_Now, LastWindowNotActiveTimer, "Seconds") >= 10) {
            Log("Error 1: Window not active or doesn't exist.")
            LastWindowNotActiveTimer := A_Now
        }
        return false
    }
    return true
}

InitGameWindow() {
    global X, Y, W, H
    if (WinExist(LBRWindowTitle)) {
        WinGetClientPos(&X, &Y, &W, &H, LBRWindowTitle)
        return true
    }
    return false
}

RemoveLongPath(var) {
    return StrReplace(var, "\\?\")
}

CapitaliseFirstChar(string) {
    if (!string) {
        return false
    }
    arr := StrSplit(string, , , 2)
    if (arr.Length = 2) {
        arr[1] := StrUpper(arr[1])
        return arr[1] arr[2]
    }
    return StrUpper(arr[1])
}