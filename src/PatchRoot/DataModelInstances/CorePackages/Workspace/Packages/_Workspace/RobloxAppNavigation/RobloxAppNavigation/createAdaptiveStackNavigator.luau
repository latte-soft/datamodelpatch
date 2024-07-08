local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_createNavigator_0 = require(l_Parent_0.RoactNavigation).createNavigator;
local _ = require(l_Parent_0.Navigation);
local v4 = require(l_script_FirstAncestor_0.LuaAppStackRouter);
local v5 = require(l_script_FirstAncestor_0.Views.AdaptiveStackView);
return function(v6, v7)
    return l_createNavigator_0(v5, v4(v6, v7), v7);
end;
