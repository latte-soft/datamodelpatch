local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_VRService_0 = game:GetService("VRService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v11 = require(l_Modules_0.LuaApp.Constants);
local l_MainScreenResolution_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants.MainScreenResolution;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v14 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v15 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v16 = require(l_Modules_0.LuaApp.Actions.SetScreenSize);
local v17 = require(l_Modules_0.LuaApp.Actions.SetDeviceOrientation);
local l_SetFormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Actions.SetFormFactor;
local v19 = require(l_Modules_0.LuaApp.Actions.SetStatusBarHeight);
local v20 = require(l_Modules_0.LuaApp.Actions.SetGlobalGuiInset);
local v21 = require(l_Modules_0.LuaApp.getVRFloorOffset);
local v22 = require(l_Modules_0.LuaApp.Actions.SetGlobalContextMenuInset);
local l_Placements_0 = require(l_CorePackages_0.Workspace.Packages.AppSystemBar).Enum.Placements;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagSetOrientationWhenRequested);
local l_GetFFlagAdjustVRFloor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAdjustVRFloor;
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagViewportManagerFixStatusBarHeightRace);
local v30 = v6.Component:extend("ViewportManager");
v30.init = function(v31)
    v31.updateDeviceOrientation = function(v32)
        local v33 = v32.y < v32.x and l_DeviceOrientationMode_0.Landscape or l_DeviceOrientationMode_0.Portrait;
        if v27() or v31.props.deviceOrientation ~= v33 then
            v31.props.setDeviceOrientation(v33);
        end;
    end;
    v31.updateDeviceFormFactor = function(v34)
        local l_useWidthBasedRule_0 = v31.props.useWidthBasedRule;
        local l_WIDE_0 = l_FormFactor_0.WIDE;
        if not l_useWidthBasedRule_0 then
            if v34.X < v34.Y then
                l_WIDE_0 = l_FormFactor_0.COMPACT;
            end;
        elseif v34.X < 600 then
            l_WIDE_0 = l_FormFactor_0.COMPACT;
        end;
        v31.props.setFormFactor(l_WIDE_0);
    end;
    v31.updateViewport = function()
        local l_ViewportSize_0 = l_Workspace_0.CurrentCamera.ViewportSize;
        if v31.props.use3DPanels then
            l_ViewportSize_0 = l_MainScreenResolution_0;
        end;
        if l_ViewportSize_0.X > 1 and l_ViewportSize_0.Y > 1 then
            v31.props.setScreenSize(l_ViewportSize_0);
            v31.updateDeviceOrientation(l_ViewportSize_0);
            v31.updateDeviceFormFactor(l_ViewportSize_0);
        end;
    end;
    v31.pointCameraTo3DPanels = function()
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            if not l_GetFFlagAdjustVRFloor_0() then
                l_CurrentCamera_0.CFrame = CFrame.new(0, 5, 0);
            else
                l_CurrentCamera_0.CFrame = CFrame.new(0, -v21().Y, 0);
                return ;
            end;
        end;
    end;
    v31.updateStatusBarHeight = function()
        local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
        if not (v31.props.statusBarHeight == l_Y_0 and not v29()) then
            v31.props.setStatusBarHeight(l_Y_0);
        end;
    end;
    v31.updateGlobalGuiInset = function()
        local l_bottomBarVisible_0 = v31.props.bottomBarVisible;
        local _ = v31.props.systemBarPlacement;
        local v42 = v14();
        local v43 = 0;
        local l_X_0 = l_UserInputService_0.RightBarSize.X;
        local l_v42_0 = v42;
        local l_BOTTOM_BAR_SIZE_0 = v11.BOTTOM_BAR_SIZE;
        if l_bottomBarVisible_0 then
            if v31.props.systemBarPlacement == l_Placements_0.Left then
                v43 = v43 + v11.LEFT_BAR_SIZE;
            elseif v31.props.systemBarPlacement == l_Placements_0.Bottom then
                l_v42_0 = l_v42_0 + l_BOTTOM_BAR_SIZE_0;
            end;
        end;
        v31.props.setGlobalContextMenuInset(0, 0, l_X_0, v42);
        v31.props.setGlobalGuiInset(v43, 0, l_X_0, l_v42_0);
    end;
end;
v30.render = function(v47)
    return v6.createElement("Folder", {}, {
        viewportSizeListener = v6.createElement(v15, {
            event = l_Workspace_0.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = v47.updateViewport
        }), 
        statusBarSizeListener = v6.createElement(v15, {
            event = l_UserInputService_0:GetPropertyChangedSignal("StatusBarSize"), 
            callback = v47.updateStatusBarHeight
        }), 
        bottomBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and v6.createElement(v15, {
            event = l_UserInputService_0:GetPropertyChangedSignal("BottomBarSize"), 
            callback = v47.updateGlobalGuiInset
        }), 
        rightBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and v6.createElement(v15, {
            event = l_UserInputService_0:GetPropertyChangedSignal("RightBarSize"), 
            callback = v47.updateGlobalGuiInset
        }), 
        safeZoneOffsetsListener = not _G.__TESTEZ_RUNNING_TEST__ and v6.createElement(v15, {
            event = v47.props.guiService.SafeZoneOffsetsChanged, 
            callback = v47.updateGlobalGuiInset
        }), 
        VRUserCFrameListener = if not l_GetFFlagAdjustVRFloor_0() then nil else v6.createElement(v15, {
            event = l_VRService_0.UserCFrameChanged, 
            callback = function(v48)
                if v48 == Enum.UserCFrame.Floor then
                    v47.pointCameraTo3DPanels();
                end;
            end
        })
    });
end;
v30.didMount = function(v49)
    if not v49.props.useBottomBar then
        v49.props.guiService:BroadcastNotification("", v10.HIDE_TAB_BAR);
    end;
    l_UserInputService_0.LegacyInputEventsEnabled = false;
    v49.updateViewport();
    v49.updateStatusBarHeight();
    v49.updateGlobalGuiInset();
    if v49.props.use3DPanels then
        v49.pointCameraTo3DPanels();
    end;
end;
v30.didUpdate = function(v50, v51)
    if v50.props.bottomBarVisible ~= v51.bottomBarVisible then
        v50.updateGlobalGuiInset();
    end;
    local l_globalGuiInset_0 = v50.props.globalGuiInset;
    if l_globalGuiInset_0 ~= v51.globalGuiInset then
        v50.props.guiService:SetGlobalGuiInset(l_globalGuiInset_0.left, l_globalGuiInset_0.top, l_globalGuiInset_0.right, l_globalGuiInset_0.bottom);
    end;
    local l_hasScreenGuiBlur_0 = v50.props.hasScreenGuiBlur;
    if l_hasScreenGuiBlur_0 ~= v51.hasScreenGuiBlur then
        v50.props.runService:SetRobloxGuiFocused(l_hasScreenGuiBlur_0);
    end;
    if not (not v50.props.use3DPanels or v51.use3DPanels) then
        v50.pointCameraTo3DPanels();
    end;
end;
return (l_RoactAppPolicy_0.connect(function(v54, _)
    return {
        useWidthBasedRule = v54.getUseWidthBasedFormFactorRule(), 
        useBottomBar = v54.getUseBottomBar(), 
        systemBarPlacement = v54.getSystemBarPlacement(), 
        use3DPanels = v54.getUse3DPanels()
    };
end)((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    runService = l_AppRunService_0
})((v7.connect(function(v56)
    return {
        statusBarHeight = v56.TopBar.statusBarHeight, 
        deviceOrientation = v56.DeviceOrientation, 
        globalGuiInset = v56.GlobalGuiInset, 
        globalContextMenuInset = v56.GlobalContextMenuInset, 
        bottomBarVisible = v56.TabBarVisible, 
        hasScreenGuiBlur = v56.ScreenGuiBlur.hasBlur
    };
end, function(v57)
    return {
        setScreenSize = function(v58)
            v57(v16(v58));
        end, 
        setDeviceOrientation = function(v59)
            v57(v17(v59));
        end, 
        setFormFactor = function(v60)
            v57(l_SetFormFactor_0(v60));
        end, 
        setStatusBarHeight = function(v61)
            v57(v19(v61));
        end, 
        setGlobalGuiInset = function(v62, v63, v64, v65)
            return v57(v20(v62, v63, v64, v65));
        end, 
        setGlobalContextMenuInset = function(v66, v67, v68, v69)
            return v57(v22(v66, v67, v68, v69));
        end
    };
end)(v30))))));
