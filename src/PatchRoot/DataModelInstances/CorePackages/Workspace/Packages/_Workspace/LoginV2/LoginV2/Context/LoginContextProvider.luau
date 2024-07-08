local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v3 = require(l_script_FirstAncestor_0.Reducers.LoginStateReducer);
local v4 = require(l_script_FirstAncestor_0.Enums);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_Parent_0.React);
local v7 = {
    userIdentifier = "", 
    userIdentifierType = v4.UserIdentifierType.Unknown, 
    numLoginAttempts = 0, 
    availableLoginMethods = {}
};
return function(v8)
    local v9, v10 = v6.useReducer(v3, v7);
    return v6.createElement(v2.Provider, {
        value = {
            state = v9, 
            dispatch = v10, 
            parentNavigation = v8.parentNavigation
        }
    }, v8.children);
end;
