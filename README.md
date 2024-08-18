# LBRSaveManager v0.0.1 build 27

Leaf Blower Revolution save file management script
Features save editing of LBR saves, backups, file organisation, file conversion.

Autohotkey V2 script, see Setup Guide below for installation help.
Support and news: <https://discord.gg/xu8fXw4CQ8>

## Features

### Backup save

Copies your %localappdata%/blow_the_leaves_away/save.dat to the selected backup
directory set in settings, renames to allow archiving by date.

### Open X Dir

Opens the folder in Explorer so that files can be managed directly.

### Rename `*.dat/*.txt` in backup dir

Renames all of the selected file type to archive date filenames.
This is only useful if you have a lot of old saves you want to rename at once,
as it will remove any custom naming from existing files. Ignores options*.dat
files.

### Restore newest backup

Looks for the newest backup in the backup folder to replace in the save dir.

- Warnings
  - Can be an unintended file if a backup has been made automatically by other
  functions so be check or manually replace the save file if not correct.

### Convert save > json, json > save

Convert save file to a text editable format, (use vscode or other editor) and
allow conversion back to .dat format.

- Warnings
  - The conversion of these files does not overwrite the target filename for safety.
  So if converting save.dat > save.json > save.dat, rename the original save.dat
  after the first conversion.

### Forced load

Allows you to force the game to load a save.dat file when the game ignores a
newer file due to unchanged dates. User must place the save.dat they wish to
load at `C:\Users\<username>\AppData\Local\blow_the_leaves_away\save.dat`

- Function
  - Changes filename of token.dat
  - Replaces steam cloud active save file
  - Removes games own local backup save file

- Warnings
  - To inject over the steam cloud the script looks for the first save.dat file in:  
  `C:\Program Files (x86)\Steam\userdata\<numbers>\1468260\remote\save.dat`  
  Where <numbers> is your steam user id, however if multiple users play on the
  same pc this could overwrite the wrong users save.dat file.
  - Looks for a non empty token.dat file and renames it to log you out of humble
   online. This can be renamed back afterwards to
   `C:\Users\<username>\AppData\Local\blow_the_leaves_away\token.dat`.
  - Also removes the backup file to avoid this being loaded
  `C:\Users\<username>\AppData\Local\blow_the_leaves_away\save.dat-1`.
  - This feature also makes a backup of the save.dat in your cloud folder if a
  copy with the same date doesn't already exist.

### Edit Save

Open target save file to edit, can be .json or .dat, after loading the gui allows
for customisation of any data entry in the save file.
Auto saves a moment after changing the values to allow for rapid editing.
Data is typically in one of these formats (in the brackets):

- False (0) / True (1)
- Number (999) / Float (999.0) / Scientific (1.0e+308)
- String (text content)

- Warning
  - Ensure you have a backup at all times.
  - Really! Have a backup, you can corrupt your save.

  1. Game loads but no edit; Game has loaded backup save, use force load.
  2. Game doesn't load with forced load; Save is corrupt, restore backup.

  - The game is unlikely to load a save after minor editing without a different
  date set. To get the game to load the edited save use "force load" with the
  save in the correct location. The game defaults to using the cloud save and
  overwrites changes unless it notices different dates.
  - If the game fails to load or loads a backup, it is likely the save caused an
  error and is corrupt, restore with a copy of your backup before continuing.
  - Some things are easier to edit with a text editor, use convert for that.
  - Save data is kept loaded in the script if you close the editor, "reload" to
  clear the data and load another file.

## Setup Guide

### 1. Extract Files

Install Autohotkey V2 latest version (must be V2). <https://www.autohotkey.com/>

Download the version of the script you need, either latest build:
<https://github.com/nobodyscripts/LBRSaveManager/archive/refs/heads/main.zip>
Or from releases page:
<https://github.com/nobodyscripts/LBRSaveManager/releases>

Extract the zip where you want to keep the files, something like:
Documents/LBRSaveManager/{files}

### 2. Setup

Select a backup dir in the scripts settings when run.

Suggested: Search in Windows Start Menu for "File explorer options", "View tab",
untick "Hide extentions for known file types" to allow easier editing of file
names.

## Changes

- Dynamic tree views of save editing, auto saving after 1 second after changes.  
- Allows editing of entire file and new additions without changes.  
- Added locking when editing a value before save occurs to prevent changing focus.
- Fixed numeric values being edited to strings.  
- Moved the edit save messages to the text display under the edit box.  
- Locked editbox if selecting values which have sub values.  
- Store editbox value and location as soon as change detected.  
- Edit save can load dat directly and save to same file.  
- Added force load feature that destructively makes game load AppData\Local\
blow_the_leaves_away\save.dat  

## TODO

- Add custom forms for specific views in the editor.  
- Check for active steam userid to avoid multi user conflicts in force load.  
- Reset the 1 second save timer more cleanly when constantly typing in edit.  
- Shortcut creation on run?  
- Optional overwriting and backups via dialogs.

## Known issues
