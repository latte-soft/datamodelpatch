local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return v1.createContext({
    state = nil, 
    dispatch = nil, 
    parentNavigation = nil
});
