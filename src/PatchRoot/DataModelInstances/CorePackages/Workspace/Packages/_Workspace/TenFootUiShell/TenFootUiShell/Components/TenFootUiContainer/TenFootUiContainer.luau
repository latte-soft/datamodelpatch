local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_Parent_0.RoactNavigation);
local _ = require(l_Parent_0.AppCommonLib);
local v7 = require(l_script_FirstAncestor_0.Hooks.TenFootUiScene);
local v8 = require(l_script_FirstAncestor_0.ReactNavigationExtend.createTenFootUiNavigator);
local l_GlobalNavContainer_0 = require(l_Parent_0.TenFootUiGlobalNav).GlobalNavContainer;
local l_TenFootUiContext_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiContext;
local l_useGlobalFocusHandler_0 = require(l_Parent_0.FocusNavigationUtils).useGlobalFocusHandler;
local v12 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Hooks.useProcessNavigationStateChange);
local v13 = require(l_script_FirstAncestor_0.Hooks.CrossPlay.useInitializeCrossPlaySettings);
local v14 = require(l_script_FirstAncestor_0.Hooks.useRegisterPlatformFriendListRefresh);
local v15 = require(l_script_FirstAncestor_0.ReactNavigationExtend.RnBypassAdapter);
local v16 = require(l_Parent_0.TenFootUiControllerBar);
local l_ControllerBarContainer_0 = v16.ControllerBarContainer;
local l_ControllerBarContext_0 = v16.ControllerBarContext;
local v19 = require(script.Parent.TenFootUiLayout);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v21 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v21.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v21.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = v21.Hooks.useNavigation;
local l_usePrevious_0 = v21.Hooks.usePrevious;
local l_ProviderContainer_0 = v21.Components.ProviderContainer;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v29 = require(l_script_FirstAncestor_0.Hooks.useHideMouseCursorEffect);
local v30 = require(l_script_FirstAncestor_0.Hooks.useForceNotificationServiceThemeEffect);
local v31 = require(script.Parent.utils.avatarInteractions);
local l_getStackRootIsAvatar_0 = v31.getStackRootIsAvatar;
local l_getAutoFocusDisabledForAvatar_0 = v31.getAutoFocusDisabledForAvatar;
local l_useGamepadDisconnectOverlayEffect_0 = require(l_Parent_0.InputUi).Gamepad.useGamepadDisconnectOverlayEffect;
local l_getRouteIsActive_0 = require(l_Parent_0.Navigation).getRouteIsActive;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v38 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableUniversalFocusNavigation_0 = v38.FFlagEnableUniversalFocusNavigation;
local l_FFlagUnifyNavigationGraph_0 = v38.FFlagUnifyNavigationGraph;
local l_GetFFlagGamepadAnalytics_0 = v38.GetFFlagGamepadAnalytics;
local function _(v42)
    return l_getRouteIsActive_0(v42, l_AppPage_0.AvatarExperienceRoot);
end;
local function v48(v44, v45)
    local v46 = if not l_FFlagUnifyNavigationGraph_0 then l_getStackRootIsAvatar_0(v44) else l_getRouteIsActive_0(v44, l_AppPage_0.AvatarExperienceRoot);
    local v47 = if not l_FFlagUnifyNavigationGraph_0 then l_getStackRootIsAvatar_0(v45) else l_getRouteIsActive_0(v45, l_AppPage_0.AvatarExperienceRoot);
    if not ((not v46 or v47) or not workspace.CurrentCamera) then
        workspace.CurrentCamera.CFrame = CFrame.new(v4.CAMERA_POSITION);
    end;
end;
local function v53(v49, v50)
    if v49 then
        for _, v52 in ipairs(v49:GetChildren()) do
            if v52:IsA("BasePart") then
                v52.Transparency = v50;
            end;
        end;
    end;
end;
local function v58(v54)
    local v55 = v7.getBackgroundInstance();
    if v55 then
        local v56 = if not l_FFlagUnifyNavigationGraph_0 then l_getStackRootIsAvatar_0(v54) else l_getRouteIsActive_0(v54, l_AppPage_0.AvatarExperienceRoot);
        local v57 = not v56 and 0 or 1;
        if not v56 then
            v53(v55, v57);
        else
            task.spawn(function()
                if workspace:WaitForChild("AvatarSceneNew") then
                    v53(v55, v57);
                end;
            end);
            return ;
        end;
    end;
end;
local function _()
    local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_0.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_0 = l_Folder_0;
    end;
    return l_l_CoreGui_0_FirstChild_0;
end;
local function _()
    local l_workspace_FirstChild_0 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_0 then
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_1.Parent = workspace;
        l_workspace_FirstChild_0 = l_Folder_1;
    end;
    return l_workspace_FirstChild_0;
end;
local function v77(v65, v66, v67, v68)
    local l_l_CoreGui_0_FirstChild_1 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_1 then
        local l_Folder_2 = Instance.new("Folder");
        l_Folder_2.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_2.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_1 = l_Folder_2;
    end;
    local l_l_l_CoreGui_0_FirstChild_1_0 = l_l_CoreGui_0_FirstChild_1;
    local l_workspace_FirstChild_1 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_1 then
        local l_Folder_3 = Instance.new("Folder");
        l_Folder_3.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_3.Parent = workspace;
        l_workspace_FirstChild_1 = l_Folder_3;
    end;
    l_l_CoreGui_0_FirstChild_1 = l_workspace_FirstChild_1;
    local v74 = v8(v65, {
        initialRouteName = l_AppPage_0.Landing, 
        surfaceGuiContainer = l_l_l_CoreGui_0_FirstChild_1_0, 
        worldContainer = l_l_CoreGui_0_FirstChild_1, 
        resetOnBlur = false
    });
    local v75 = v3.Component:extend("TenFootUiRootNavigator");
    v75.router = v74.router;
    v75.render = function(v76)
        return v3.createElement(v3.Fragment, nil, {
            Toast = v68, 
            CentralOverlay = v67, 
            RnBypassAdapter = v3.createElement(v15, {
                rnBypassActionSignal = v66
            }), 
            TenFootUiLayout = v3.createElement(v19, {
                adorneeParent = l_l_CoreGui_0_FirstChild_1, 
                surfaceGuiParent = l_l_l_CoreGui_0_FirstChild_1_0, 
                rootViewSlot = v3.createElement(v74, {
                    navigation = v76.props.navigation, 
                    screenProps = {
                        surfaceGuiContainer = l_l_l_CoreGui_0_FirstChild_1_0, 
                        worldContainer = l_l_CoreGui_0_FirstChild_1
                    }
                }), 
                globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
                controllerBarSlot = v3.createElement(l_ControllerBarContainer_0)
            })
        });
    end;
    return v5.createAppContainer(v75);
end;
local function v83()
    local v78 = l_useDispatch_0();
    local v80 = l_useSelector_0(function(v79)
        return v79.CentralOverlay.OverlayType == l_CentralOverlayType_0.GamepadDisconnected;
    end);
    local v81 = v3.useCallback(function()
        if v80 then
            v78(l_SetCentralOverlay_0());
        end;
    end, {
        v78, 
        v80
    });
    local v82 = v3.useCallback(function()
        v78(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamepadDisconnected));
    end, {
        v78
    });
    if not l_GetFFlagGamepadAnalytics_0() then
        l_useGamepadDisconnectOverlayEffect_0(v82, v81);
        return ;
    else
        l_useGamepadDisconnectOverlayEffect_0(v82, v81, l_useRoactService_0(l_AppEventIngestService_0), "InApp");
        return ;
    end;
end;
local function _()
    return l_getRouteIsActive_0(l_useNavigation_0().state, l_AppPage_0.AvatarExperienceRoot) and not l_useSelector_0(function(v84)
        return v84.CentralOverlay.OverlayType ~= nil;
    end);
end;
local function v88()
    local l_state_0 = l_useNavigation_0().state;
    local v87 = l_usePrevious_0(l_state_0) or l_state_0;
    v3.useEffect(function()
        v48(v87, l_state_0);
        v58(l_state_0);
    end, {
        l_state_0
    });
end;
local function v92(v89)
    local l_disableAutoFocus_0 = v89.disableAutoFocus;
    if l_FFlagUnifyNavigationGraph_0 then
        l_disableAutoFocus_0 = l_getRouteIsActive_0(l_useNavigation_0().state, l_AppPage_0.AvatarExperienceRoot) and not l_useSelector_0(function(v91)
            return v91.CentralOverlay.OverlayType ~= nil;
        end);
        v88();
    end;
    v30();
    v29();
    if not l_FFlagEnableUniversalFocusNavigation_0 then
        l_useGlobalFocusHandler_0(l_disableAutoFocus_0);
    end;
    v13();
    v83();
    v14();
    if l_FFlagUnifyNavigationGraph_0 then
        v3.useLayoutEffect(function()
            v7.initialize();
            return function()
                v7.deinitialize();
            end;
        end, {});
    end;
    return v3.createElement(v3.Fragment, nil, v89.children);
end;
local function v99(v93)
    local l_l_CoreGui_0_FirstChild_2 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
    if not l_l_CoreGui_0_FirstChild_2 then
        local l_Folder_4 = Instance.new("Folder");
        l_Folder_4.Name = v4.SURFACE_GUI_FOLDER_NAME;
        l_Folder_4.Parent = l_CoreGui_0;
        l_l_CoreGui_0_FirstChild_2 = l_Folder_4;
    end;
    local l_l_l_CoreGui_0_FirstChild_2_0 = l_l_CoreGui_0_FirstChild_2;
    local l_workspace_FirstChild_2 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
    if not l_workspace_FirstChild_2 then
        local l_Folder_5 = Instance.new("Folder");
        l_Folder_5.Name = v4.WORKSPACE_FOLDER_NAME;
        l_Folder_5.Parent = workspace;
        l_workspace_FirstChild_2 = l_Folder_5;
    end;
    return v3.createElement(v93.dependencies.RootNavigator, {
        navigation = l_useNavigation_0(), 
        screenProps = {
            surfaceGuiContainer = l_l_l_CoreGui_0_FirstChild_2_0, 
            worldContainer = l_workspace_FirstChild_2
        }
    });
end;
return function(v100)
    local v101 = nil;
    if not l_FFlagUnifyNavigationGraph_0 then
        local v102, v103 = v3.useState(false);
        local v105 = l_useSelector_0(function(v104)
            return v104.CentralOverlay.OverlayType ~= nil;
        end);
        v3.useLayoutEffect(function()
            v7.initialize();
            return function()
                v7.deinitialize();
            end;
        end, {});
        local v106 = v12(v100.dependencies.ApplyRoactNavigationHistory, v100.updateRoute);
        local v111 = v3.useMemo(function()
            local v107 = {};
            for _, v109 in v100.dependencies.routerConfig.commonStackRoutes, nil, nil do
                for v110 in v109, nil, nil do
                    v107[v110] = true;
                end;
            end;
            return v107;
        end, {
            v100.dependencies.routerConfig
        });
        v101 = v3.createElement(v92, {
            disableAutoFocus = v102 and not v105
        }, v3.createElement(v3.useMemo(function()
            return v77(v100.dependencies.routerConfig, v100.rnBypassActionSignal, v100.centralOverlay, v100.toast);
        end, {
            v100.dependencies.routerConfig, 
            v100.rnBypassActionSignal, 
            v100.centralOverlay, 
            v100.toast
        }), {
            detached = true, 
            onNavigationStateChange = function(v112, v113, v114)
                v103((l_getAutoFocusDisabledForAvatar_0(v113, v111)));
                v48(v112, v113);
                v58(v113);
                v106(v112, v113, v114);
            end
        }));
    else
        local l_l_CoreGui_0_FirstChild_3 = l_CoreGui_0:FindFirstChild(v4.SURFACE_GUI_FOLDER_NAME);
        if not l_l_CoreGui_0_FirstChild_3 then
            local l_Folder_6 = Instance.new("Folder");
            l_Folder_6.Name = v4.SURFACE_GUI_FOLDER_NAME;
            l_Folder_6.Parent = l_CoreGui_0;
            l_l_CoreGui_0_FirstChild_3 = l_Folder_6;
        end;
        local l_l_l_CoreGui_0_FirstChild_3_0 = l_l_CoreGui_0_FirstChild_3;
        local l_workspace_FirstChild_3 = workspace:FindFirstChild(v4.WORKSPACE_FOLDER_NAME);
        if not l_workspace_FirstChild_3 then
            local l_Folder_7 = Instance.new("Folder");
            l_Folder_7.Name = v4.WORKSPACE_FOLDER_NAME;
            l_Folder_7.Parent = workspace;
            l_workspace_FirstChild_3 = l_Folder_7;
        end;
        v101 = v3.createElement(v3.Fragment, nil, {
            Toast = v100.toast, 
            CentralOverlay = v100.centralOverlay, 
            TenFootUiLayout = v3.createElement(v19, {
                adorneeParent = l_workspace_FirstChild_3, 
                surfaceGuiParent = l_l_l_CoreGui_0_FirstChild_3_0, 
                rootViewSlot = v3.createElement(v99, v100), 
                globalNavSlot = v3.createElement(l_GlobalNavContainer_0), 
                controllerBarSlot = v3.createElement(l_ControllerBarContainer_0)
            }), 
            GlobalEffects = v3.createElement(v92)
        });
    end;
    local v120 = {};
    table.insert(v120, {
        class = l_TenFootUiContext_0.Provider, 
        props = {
            value = v100.dependencies
        }
    });
    table.insert(v120, {
        class = l_ControllerBarContext_0.Provider
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v120
    }, v101);
end;
