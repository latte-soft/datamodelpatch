local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return (require(l_Parent_0.Rodux).combineReducers({
    ChatAppReducer = require(script.Parent.Parent.installReducer)(), 
    Users = require(l_Parent_0.UserLib).Reducers.UserReducer
}));
