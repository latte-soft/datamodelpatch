local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return v0.combineReducers({
    LastSavedSort = require(l_Parent_0.LastSavedSort), 
    CurrentSort = require(l_Parent_0.CurrentSort), 
    EntryPage = require(l_Parent_0.EntryPage), 
    CharacterUpdatesLocked = require(l_Parent_0.CharacterUpdatesLocked)
});
