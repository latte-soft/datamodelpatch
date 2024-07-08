local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.InputHandlers);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v5 = require(l_Parent_0.TenFootUiCommon);
local v6 = require(l_Parent_0.TenFootUiGlobalNav);
local v7 = require(l_Parent_0.FocusNavigationUtils);
local v8 = require(l_Parent_0.Navigation);
local v9 = require(l_Parent_0.Dash);
local l_useGlobalNavDisplayOptions_0 = v6.useGlobalNavDisplayOptions;
local l_getActiveChildNavigationOptionsRecursively_0 = v8.getActiveChildNavigationOptionsRecursively;
local l_FocusNavigationEventNameEnum_0 = v7.FocusNavigationEventNameEnum;
local l_TenFootUiContext_0 = v5.TenFootUiContext;
local l_GlobalNavDisplayOption_0 = v5.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_useFocusRegistryEntry_0 = v7.FocusNavigableSurfaceRegistry.useFocusRegistryEntry;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_useDescendantHasFocus_0 = v7.useDescendantHasFocus;
local l_useRegistryEntry_0 = v7.FocusNavigableSurfaceRegistry.useRegistryEntry;
local l_getCurrentTabName_0 = require(l_Parent_0.NavigationRodux).Utils.getCurrentTabName;
local l_FFlagUnifyNavigationGraph_0 = require(l_Parent_0.SharedFlags).FFlagUnifyNavigationGraph;
local function _(v21, v22)
    if type(v21) == "function" then
        v21(v22);
        return ;
    else
        if type(v21) == "table" then
            v21.current = v22;
        end;
        return ;
    end;
end;
local function _(v24, v25)
    for v26, v27 in v25, nil, nil do
        if v27.page == v24 then
            local v28 = v25[v26 + 1];
            if v28 ~= nil then
                return v28.page;
            end;
        end;
    end;
    return nil;
end;
local function _(v30, v31)
    for v32, v33 in v31, nil, nil do
        if v33.page == v30 then
            local v34 = v31[v32 - 1];
            if v34 ~= nil then
                return v34.page;
            end;
        end;
    end;
    return nil;
end;
local function _(v36)
    return (("TenFootUiNavBinding%*"):format(v36));
end;
local v38 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.Search);
local v39 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabForward);
local v40 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabBackward);
local v41 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.NavigateBack);
useRootFocusNavigationBindings = function(v42)
    local v45 = v1.useCallback(function(v43)
        if v42 then
            local l_v42_0 = v42;
            if type(l_v42_0) == "function" then
                l_v42_0(v43);
                return ;
            elseif type(l_v42_0) == "table" then
                l_v42_0.current = v43;
            end;
        end;
    end, {
        v42
    });
    local v46 = v1.useContext(l_TenFootUiContext_0);
    local v47 = l_useNavigation_0();
    local v48 = l_useFocusRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v49 = l_useDescendantHasFocus_0((l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar)));
    local v50 = l_useGlobalNavDisplayOptions_0(v47, l_getActiveChildNavigationOptionsRecursively_0);
    local v51 = true;
    if v50 ~= l_GlobalNavDisplayOption_0.TabGroupOnly then
        v51 = v50 == l_GlobalNavDisplayOption_0.ShowAll;
    end;
    local v52 = v47.state.key or v47.state.routes[v47.state.index].key;
    local v53 = if not v46 then {} else v46.globalNavConfig.tabs;
    local v54 = if not v46 then nil else v46.useRoactService(v46.RoactAnalytics).EventStream;
    local v55 = if not v46 then v9.noop else v46.buttonClick;
    local v56 = if not l_FFlagUnifyNavigationGraph_0 then v52 else l_getCurrentTabName_0(v47.state);
    local v57;
    for v58, v59 in v53, nil, nil do
        if v59.page == v56 then
            local v60 = v53[v58 - 1];
            if v60 ~= nil then
                v57 = v60.page;
                goto label0 --[[  true, false  ]];
            end;
        end;
    end;
    v57 = nil;
    ::label0::;
    local v61;
    for v62, v63 in v53, nil, nil do
        if v63.page == v56 then
            local v64 = v53[v62 + 1];
            if v64 ~= nil then
                v61 = v64.page;
                goto label1 --[[  true, false  ]];
            end;
        end;
    end;
    v61 = nil;
    ::label1::;
    return (v2.useEventHandlerMap(v1.useMemo(function()
        local v65 = {};
        if not v51 then
            v65[l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v3.onRelease(function()
                    if v47.pop ~= nil then
                        v47.pop();
                    else
                        v47.goBack();
                    end;
                    v55(v54, v41, "unknown", v52);
                end)
            };
            return v65;
        else
            v65[l_FocusNavigationEventNameEnum_0.Search] = {
                handler = v3.onRelease(function(_)
                    v47.navigate("SearchPage");
                    v55(v54, v38, "SearchPage", v52);
                end)
            };
            v65[l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v3.onRelease(function(_)
                    if v61 then
                        v47.navigate(v61);
                        v55(v54, v39, v61, v52);
                    end;
                end)
            };
            v65[l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v3.onRelease(function(_)
                    if v57 then
                        v47.navigate(v57);
                        v55(v54, v40, v57, v52);
                    end;
                end)
            };
            v65[l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v3.onRelease(function(_)
                    if not v49 then
                        v48();
                    end;
                end)
            };
            return v65;
        end;
    end, {
        v47, 
        v54, 
        v55, 
        v61, 
        v57, 
        v52, 
        v48, 
        v49, 
        v51
    }), (v2.useEventMap(v1.useMemo(function()
        return {
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward, 
            [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.Search
        };
    end, {}), v45))));
end;
return useRootFocusNavigationBindings;
