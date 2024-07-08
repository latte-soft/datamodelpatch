local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.TenFootUiCommon);
local l_createNavigator_0 = v1.createNavigator;
local l_SwitchRouter_0 = v1.SwitchRouter;
local v5 = require(script.Parent.Views.TenFootUiSwitchView);
return function(v6, v7)
    return l_createNavigator_0(v5, l_SwitchRouter_0(v6, v7), v7);
end;
