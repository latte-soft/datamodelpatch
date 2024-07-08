local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
return require(l_script_FirstAncestor_0.Parent.Rodux).combineReducers({
    Players = require(l_script_FirstAncestor_0.installReducer.Players)
});
