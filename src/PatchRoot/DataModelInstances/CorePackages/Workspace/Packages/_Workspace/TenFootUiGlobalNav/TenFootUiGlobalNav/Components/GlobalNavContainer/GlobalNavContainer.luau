local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v4 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavProps);
local v5 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavDisplayOptions);
local l_getActiveChildNavigationOptionsRecursively_0 = require(l_Parent_0.Navigation).getActiveChildNavigationOptionsRecursively;
local v7 = require(l_script_FirstAncestor_0.Components.GlobalNav);
return function()
    local v8 = l_useNavigation_0();
    return v2.createElement(v7, (v4(v8, (v5(v8, l_getActiveChildNavigationOptionsRecursively_0)))));
end;
