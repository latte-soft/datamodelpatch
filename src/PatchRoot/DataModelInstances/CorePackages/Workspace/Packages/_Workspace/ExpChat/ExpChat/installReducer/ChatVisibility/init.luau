return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).combineReducers({
    isChatInputBarEnabled = require(script.isChatInputBarEnabled), 
    isChatWindowEnabled = require(script.isChatWindowEnabled), 
    isChatHotkeyEnabled = require(script.isChatHotkeyEnabled), 
    transparency = require(script.transparency)
});
