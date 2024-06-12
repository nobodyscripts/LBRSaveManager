# LBRSaveManager

Leaf Blower Revolution save file management script

Features save editing of LBR saves, backups, file organisation, file conversion.

## Warnings

### Forced load

Looks for a non empty token.dat file and renames it to log you
out of humble online. This can be renamed back afterwards.

To inject over the steam cloud the script looks for the first save.dat file in:  
"C:\Program Files (x86)\Steam\userdata\<numbers>\1468260\remote\save.dat"  
Where <numbers> is your steam user id, however if multiple users play on the
same pc this could overwrite the wrong users save.dat file.

Also removes the backup save.dat-1 file to avoid this being loaded.

This feature also makes a backup of the save.dat in your cloud folder if a copy with the same date doesn't already exist.

### Restore newest backup

Looks for the newest backup in the backup folder to replace in the save dir,
this can be an unintended file if a backup has been made automatically by other
functions so be careful or manually replace the save file if not correct.

### Convert save > json, json > save

The conversion of these files does not overwrite the target filename for safety.
So if converting save.dat > save.json > save.dat, rename the original save.dat
after the first conversion.

### Rename .dat .txt in backup dir

This is a cleanup script to rename files into a uniform format for easier
archiving. However if you have custom notes on the filenames, these will be
wiped in favour of the new names. Ignores options*.dat files.

## Changes

Dynamic tree views of save editing, auto saving after 1 second after changes.  
Allows editing of entire file and new additions without changes.  
Added locking when editing a value before save occurs to prevent changing focus.
Fixed numeric values being edited to strings.  
Moved the edit save messages to the text display under the edit box.  
Locked editbox if selecting values which have sub values.  
Store editbox value and location as soon as change detected.  
Edit save can load dat directly and save to same file.  
Added force load feature that destructively makes game load AppData\Local\
blow_the_leaves_away\save.dat  

## TODO

Add custom forms for specific views in the editor.  
Check for active steam userid to avoid multi user conflicts in force load.  
Reset the 1 second save timer more cleanly when constantly typing in edit.  
Shortcut creation on run?  
Optional overwriting and backups via dialogs.
