local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local l_useGlobalNavDisplayOptions_0 = require(l_Parent_0.TenFootUiGlobalNav).useGlobalNavDisplayOptions;
local l_getActiveChildNavigationOptionsRecursively_0 = require(l_Parent_0.Navigation).getActiveChildNavigationOptionsRecursively;
local l_GlobalNavDisplayOption_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiRNTypes.GlobalNavDisplayOption;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_useFocusRegistryEntry_0 = v4.FocusNavigableSurfaceRegistry.useFocusRegistryEntry;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
return function(v7)
    local v8 = l_useGlobalNavDisplayOptions_0(v7, l_getActiveChildNavigationOptionsRecursively_0) ~= l_GlobalNavDisplayOption_0.HideAll;
    local v9 = l_useFocusRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    if not v8 then
        return nil;
    else
        return v9;
    end;
end;
