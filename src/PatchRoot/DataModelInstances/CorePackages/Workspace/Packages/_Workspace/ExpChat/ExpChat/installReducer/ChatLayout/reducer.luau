return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).combineReducers({
    Alignment = require(script.Parent.alignment), 
    ChatWindowSettings = require(script.Parent.windowSettings), 
    ChatInputBarSettings = require(script.Parent.inputBarSettings)
});
