return (require(game:GetService("CorePackages").Rodux).combineReducers({
    displayOptions = require(script.DisplayOptions), 
    coreGuiEnabled = require(script.CoreGuiEnabled), 
    health = require(script.Health), 
    moreMenu = require(script.MoreMenu), 
    chat = require(script.Chat), 
    respawn = require(script.Respawn), 
    gameInfo = require(script.GameInfo)
}));
