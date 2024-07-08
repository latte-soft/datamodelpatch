return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).combineReducers({
    byUserId = require(script.Parent.byUserId), 
    byDisplayName = require(script.Parent.byDisplayName), 
    byUsername = require(script.Parent.byUsername), 
    charactersByUserId = require(script.Parent.charactersByUserId)
});
