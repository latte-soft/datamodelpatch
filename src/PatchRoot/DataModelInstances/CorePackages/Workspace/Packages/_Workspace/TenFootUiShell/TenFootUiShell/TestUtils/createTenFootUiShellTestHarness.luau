local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_FocusNavigationService_0 = v2.FocusNavigationService;
local l_TestHelpers_0 = require(l_Parent_0.Dev.TenFootUiTesting).TestHelpers;
local l_mapProviderListToSpecs_0 = l_TestHelpers_0.mapProviderListToSpecs;
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_mocks_0 = l_TestHelpers_0.mocks;
local l_CoreGui_0 = v2.EngineInterface.CoreGui;
local function _()
    local v10 = table.clone(l_CoreGui_0);
    v10.setSelection = function()
    end;
    return l_FocusNavigationService_0.new(v10);
end;
return function(v12, v13)
    local v14, v15 = l_mocks_0.makeMockProviders(v13);
    local v16 = l_mapProviderListToSpecs_0(v14);
    return v1.forwardRef(function(v17, _)
        local l_createElement_0 = v1.createElement;
        local l_Provider_1 = v2.FocusNavigationContext.Provider;
        local v21 = {};
        local l_v12_0 = v12;
        if not l_v12_0 then
            local v23 = table.clone(l_CoreGui_0);
            v23.setSelection = function()
            end;
            l_v12_0 = l_FocusNavigationService_0.new(v23);
        end;
        v21.value = l_v12_0;
        return l_createElement_0(l_Provider_1, v21, v1.createElement(l_ProviderContainer_0, {
            providers = v16
        }, v1.createElement(l_Provider_0, nil, v17.children)));
    end), v15;
end;
