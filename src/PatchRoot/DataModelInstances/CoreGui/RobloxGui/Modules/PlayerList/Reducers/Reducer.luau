local v0 = require(game:GetService("CorePackages").Rodux);
local v1 = require(script.Parent.DisplayOptions);
local v2 = require(script.Parent.ScreenSize);
local v3 = require(script.Parent.Settings);
local v4 = require(script.Parent.GameStats);
local v5 = require(script.Parent.Teams);
local v6 = require(script.Parent.TeamNames);
local v7 = require(script.Parent.TeamColors);
local v8 = require(script.Parent.Players);
local v9 = require(script.Parent.PlayerStats);
local v10 = require(script.Parent.PlayerTeam);
local v11 = require(script.Parent.PlayerIconInfo);
local v12 = require(script.Parent.PlayerRelationship);
local v13 = require(script.Parent.PlayerDropDown);
local v14 = require(script.Parent.PlayerKeys);
local v15 = v0.combineReducers({
    displayOptions = v1, 
    screenSize = v2, 
    settings = v3, 
    gameStats = v4, 
    teams = v5, 
    teamNames = v6, 
    teamColors = v7, 
    players = v8, 
    playerStats = v9, 
    playerTeam = v10, 
    playerIconInfo = v11, 
    playerRelationship = v12, 
    playerDropDown = v13
});
return function(v16, v17)
    local v18 = v15(v16, v17);
    v18.playerKeys = v14(not not v16 and v16.playerKeys or nil, v17, v18);
    return v18;
end;
