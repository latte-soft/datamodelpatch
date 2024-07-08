local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent;
return (v0.combineReducers({
    displayOptions = require(l_Parent_0.DisplayOptions), 
    emotesPage = require(l_Parent_0.EmotesPage), 
    emotesWheel = require(l_Parent_0.EmotesWheel), 
    layout = require(l_Parent_0.Layout), 
    locale = require(l_Parent_0.Locale)
}));
