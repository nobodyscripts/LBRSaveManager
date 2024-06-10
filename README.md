# LBRSaveManager

Leaf Blower Revolution save file management script

## Changes

Dynamic tree views of save editing, auto saving after 1 second after changes.  
Allows editing of entire file and new additions without changes.  
Added locking when editing a value before save occurs to prevent changing focus.
Fixed numeric values being edited to strings.  
Moved the edit save messages to the text display under the edit box.  
Locked editbox if selecting values which have sub values.  
Store editbox value and location as soon as change detected.  

## TODO

Block tabs while saving
Overwrite confirm on json to dat and dat to json
Overwrite confirm on edit save
Edit save dat directly
