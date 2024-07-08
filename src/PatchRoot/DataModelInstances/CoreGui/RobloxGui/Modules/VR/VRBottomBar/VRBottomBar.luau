local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_CorePackages_0.Otter);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Roact);
local v12 = require(l_CorePackages_0.RoactRodux);
local v13 = require(l_CorePackages_0.UIBlox);
local l_BaseMenu_0 = v13.App.Menu.BaseMenu;
local l_SystemBar_0 = v13.App.Navigation.SystemBar;
local l_Placement_0 = v13.App.Navigation.Enum.Placement;
local l_Panel3D_0 = v13.Core.VR.Panel3D;
local l_Constants_0 = v13.Core.VR.Constants;
local l_ImageSetLabel_0 = v13.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v13.Core.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v22 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v23 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v24 = require(l_RobloxGui_0.Modules.VR.VRUtil);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v26 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_GameSettings_0 = UserSettings().GameSettings;
local v28 = require(l_RobloxGui_0.Modules.InGameMenuInit);
local v29 = require(l_RobloxGui_0.Modules.ChatSelector);
local v30 = v11.PureComponent:extend("TopBarApp");
local v31 = require(script.Parent.VRBarSeparator);
local v32 = require(script.Parent.VRBarVoiceIcon);
local v33 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v34 = require(l_RobloxGui_0.Modules.BackpackScript);
local v35 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects");
local v38 = require(l_RobloxGui_0.Modules.Flags.FFlagVRMoveVoiceIndicatorToBottomBar);
local v39 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarDebugPositionConfig);
local v40 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber);
local v41 = require(l_RobloxGui_0.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber);
local v42 = require(l_RobloxGui_0.Modules.Flags.FFlagVRBottomBarHighlightedLeaveGameIcon);
local v43 = game:DefineFastFlag("VRBottomBarNoCurvature", false);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v45 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
local function _(v46)
    local l_status_0, l_result_0 = pcall(require, v46);
    if not l_status_0 then
        warn("Failure to Start CoreScript module " .. v46.Name .. ".\n" .. l_result_0);
        return ;
    else
        return l_result_0;
    end;
end;
local v50 = {
    Y = v40 / 100, 
    Z = v41 / 100
};
local _ = 0.2 + v50.Z / 10;
local v52 = {
    Default = {
        dampingRatio = 1, 
        frequency = 4.5
    }, 
    Slower = {
        dampingRatio = 1, 
        frequency = 0.66
    }
};
local v53 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_menu.png", 
    onActivated = function()
        v23:SetShowTopBar(true);
        if v28.getOpen() then
            v28.closeInGameMenu();
        else
            v28.openInGameMenu(v26.MainPagePageKey);
            v23:SetShowMoreMenu(false);
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MainMenu");
    end
};
local v54 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_maximize.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_minimize.png", 
    onActivated = function()
        if v23.ShowTopBar then
            v23:SetShowTopBar(false);
            v28.closeInGameMenu();
        else
            v23:SetShowTopBar(false);
            v23:SetShowTopBar(true);
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-ToggleGui");
    end
};
local v55 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    onActivated = function()
        if v23.ShowTopBar then
            v34.OpenClose();
        else
            v23:SetShowTopBar(true);
            if not v34.IsOpen then
                v34.OpenClose();
            end;
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Backpack");
    end
};
local v56 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    onActivated = function()
        if v23.ShowTopBar then
            v35:SetVisibility(not v35:GetSetVisible());
        else
            v23:SetShowTopBar(true);
            if not v35:GetSetVisible() then
                v35:SetVisibility(true);
            end;
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-PlayerList");
    end
};
local v57 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    onActivated = function()
        if v23.ShowTopBar then
            if not v33:isOpen() then
                v33:open();
            else
                v33:close();
            end;
        else
            v23:SetShowTopBar(true);
            if not v33:isOpen() then
                v33:open();
            end;
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Emotes");
    end
};
local v58 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_chat.png", 
    onActivated = function()
        if v23.ShowTopBar then
            v29:ToggleVisibility();
            l_GameSettings_0.ChatVisible = v29:GetVisibility();
        else
            v23:SetShowTopBar(true);
            if not v29:GetVisibility() then
                v29:ToggleVisibility();
                l_GameSettings_0.ChatVisible = v29:GetVisibility();
            end;
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Chat");
    end
};
local v59 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_on.png", 
    onActivated = function()
        v23:ToggleSafetyBubble();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v60 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_safety_off.png", 
    onActivated = function()
        v23:ToggleSafetyBubble();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Safety");
    end
};
local v61 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave.png", 
    onActivated = function()
        v23:SetShowTopBar(true);
        v23:SetShowMoreMenu(false);
        if v28 then
            if not v28.getOpen() then
                v28.openInGameMenu(v26.MainPagePageKey);
            end;
            v28.openGameLeavePage();
        end;
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-LeaveGame");
    end
};
local v62 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png", 
    onActivated = v61.onActivated
};
local v63 = {
    iconOn = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    iconOff = "rbxasset://textures/ui/MenuBar/icon_more.png", 
    onActivated = function()
        v23:SetShowTopBar(true);
        v23:SetShowMoreMenu(not v23.ShowMoreMenu);
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-More");
    end
};
local v64 = {
    iconComponent = v31, 
    itemSize = UDim2.new(0, 28, 0, 44)
};
local v65 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_emote.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Emotes"), 
    onActivated = function()
        v57.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Emotes");
    end
};
local v66 = {
    icon = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
    onActivated = function()
        v56.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-PlayerList");
    end
};
local v67 = {
    icon = "rbxasset://textures/ui/MenuBar/icon__backpack.png", 
    text = v22:FormatByKey("CoreScripts.TopBar.Inventory"), 
    onActivated = function()
        v55.onActivated();
        l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-MoreMenu-Backpack");
    end
};
local function _(v68)
    return v68 >= 0 and math.floor(v68 * 10 + 0.5) / 10 or math.ceil(v68 * 10 - 0.5) / 10;
end;
v30.init = function(v70)
    local v71 = {
        yOffset = v50.Y * v45, 
        zOffset = v50.Z * v45, 
        moreMenuOpen = false, 
        vrMenuOpen = true, 
        lookAway = false
    };
    local v72;
    if l_VRService_0.VREnabled then
        local l_UserGui_0 = l_RobloxGui_0.Modules.VR.UserGui;
        local l_status_1, l_result_1 = pcall(require, l_UserGui_0);
        if not l_status_1 then
            warn("Failure to Start CoreScript module " .. l_UserGui_0.Name .. ".\n" .. l_result_1);
            v72 = nil;
        else
            v72 = l_result_1;
        end;
        if v72 then
            goto label0;
        end;
    end;
    v72 = v11.None;
    ::label0::;
    v71.userGui = v72;
    v71.hidden = not l_SplashScreenManager_0.isFPSAtTarget();
    v70:setState(v71);
    v70.backpackHasItems = false;
    v70.emotesLoaded = false;
    v70.onTargetFPSSTateChange = function(v76)
        v70:setState({
            hidden = not v76
        });
    end;
    l_SplashScreenManager_0.addStatusChangeListener(v70.onTargetFPSSTateChange);
    v70.getVoiceIcon = function()
        return {
            iconImageComponent = function(v77)
                return v10.createElement(v32, v8.Dictionary.join(v77, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    iconStyle = "MicLight"
                }));
            end, 
            onActivated = function()
                if v70.props.voiceState == Enum.VoiceChatState.Failed then
                    v70.props.voiceChatServiceManager:RejoinPreviousChannel();
                else
                    v70.props.voiceChatServiceManager:ToggleMic("VRBottomBar");
                end;
                l_RbxAnalyticsService_0:ReportCounter("VR-BottomBar-Voice");
            end
        };
    end;
    v70.getDebugYOffsetUp = function()
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_up.png", 
            onActivated = function()
                v70:setState({
                    yOffset = v70.state.yOffset + 0.1
                });
            end
        };
    end;
    v70.getDebugYOffsetDown = function()
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_down.png", 
            onActivated = function()
                v70:setState({
                    yOffset = v70.state.yOffset - 0.1
                });
            end
        };
    end;
    v70.getDebugZOffsetUp = function()
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_left.png", 
            onActivated = function()
                v70:setState({
                    zOffset = v70.state.zOffset + 0.1
                });
            end
        };
    end;
    v70.getDebugZOffsetDown = function()
        return {
            iconOn = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            iconOff = "rbxasset://textures/ui/MenuBar/arrow_right.png", 
            onActivated = function()
                v70:setState({
                    zOffset = v70.state.zOffset - 0.1
                });
            end
        };
    end;
    v70.getDebugTextLabel = function()
        return {
            iconComponent = function(v78)
                local l_yOffset_0 = v70.state.yOffset;
                local v80 = l_yOffset_0 >= 0 and math.floor(l_yOffset_0 * 10 + 0.5) / 10 or math.ceil(l_yOffset_0 * 10 - 0.5) / 10;
                local l_zOffset_0 = v70.state.zOffset;
                return v11.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = "Y " .. v80 .. ", Z " .. (l_zOffset_0 >= 0 and math.floor(l_zOffset_0 * 10 + 0.5) / 10 or math.ceil(l_zOffset_0 * 10 - 0.5) / 10), 
                    TextColor3 = Color3.new(1, 1, 1), 
                    TextWrapped = true, 
                    TextScaled = true, 
                    Size = UDim2.fromScale(1, 1), 
                    [v11.Children] = v78[v11.Children]
                });
            end, 
            itemSize = UDim2.new(0, 44, 0, 44)
        };
    end;
    v70:setState({
        itemList = {
            v53, 
            v64, 
            v54, 
            v64, 
            v61
        }, 
        moreItemList = {}
    });
    v70.onShowTopBarChanged = function()
        if not v23.ShowTopBar then
            v23:SetShowMoreMenu(false);
        end;
        v70:setState({
            vrMenuOpen = v23.ShowTopBar
        });
    end;
    v70.onShowMoreMenuChanged = function()
        v70:setState({
            moreMenuOpen = v23.ShowMoreMenu
        });
    end;
    v70.updateItemListState = function()
        local v82, v83 = v70:updateItems();
        v70:setState({
            itemList = v82, 
            moreItemList = v83
        });
    end;
    v70.onBackpackItemAdded = function()
        if not v70.backpackHasItems then
            v70.backpackHasItems = true;
            v70.updateItemListState();
        end;
    end;
    v70.onBackpackEmpty = function()
        if v70.backpackHasItems then
            v70.backpackHasItems = false;
            v70.updateItemListState();
        end;
    end;
    v70.onEmotesLoaded = function(v84)
        if v84 ~= v70.emotesLoaded then
            v70.emotesLoaded = v84;
            v70.updateItemListState();
        end;
    end;
    v70.onVREnabledChanged = function()
        local l_v70_0 = v70;
        local v86 = {};
        local v87;
        if l_VRService_0.VREnabled then
            local l_UserGui_1 = l_RobloxGui_0.Modules.VR.UserGui;
            local l_status_2, l_result_2 = pcall(require, l_UserGui_1);
            if not l_status_2 then
                warn("Failure to Start CoreScript module " .. l_UserGui_1.Name .. ".\n" .. l_result_2);
                v87 = nil;
            else
                v87 = l_result_2;
            end;
            if v87 then
                goto label1;
            end;
        end;
        v87 = v11.None;
        ::label1::;
        v86.userGui = v87;
        l_v70_0:setState(v86);
    end;
    v70.onRenderStepped = function()
        local v91 = v24.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2;
        if v70.state.lookAway ~= v91 then
            v70:setState({
                lookAway = v91
            });
        end;
    end;
    local v92, v93 = v11.createBinding(0);
    v70.fadeTransparency = v92;
    v70.setFadeTransparency = v93;
    v70.fadeTransparencyMotor = v9.createSingleMotor(v70.fadeTransparency:getValue());
    v70.fadeTransparencyMotor:onStep(v70.setFadeTransparency);
    v70.fadeTransparencyMotor:setGoal(v9.spring(0, v52.Default));
    v70.getAlignedPanelPart = function()
        local v94 = if not v70.state.userGui then nil else v70.state.userGui:getPanel();
        local v95 = v94 and v94:GetPart();
        if not ((v95 and v94:IsPositionLockedType()) and (v94:IsVisible() or v94.alwaysUpdatePosition)) then
            return ;
        else
            return v95;
        end;
    end;
    v70.bottomBarPanelOffsetCallback = function(v96)
        local l_finalPosition_0 = v96.finalPosition;
        local l_cameraHeadScale_0 = v96.cameraHeadScale;
        local v99 = v70.getAlignedPanelPart();
        if v99 then
            local l_yOffset_1 = v70.state.yOffset;
            local l_zOffset_1 = v70.state.zOffset;
            local v102 = v24.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v103 = v99.CFrame:ToWorldSpace((CFrame.new(0, 0, l_zOffset_1 * l_cameraHeadScale_0 - v99.Size.Z * 0.5)));
            l_finalPosition_0 = Vector3.new(v103.Position.X, v102.Position.Y + l_yOffset_1 * l_cameraHeadScale_0, v103.Position.Z);
        end;
        return l_finalPosition_0;
    end;
    v70.moreMenuPanelOffsetCallback = function(v104)
        local l_finalPosition_1 = v104.finalPosition;
        local l_cameraHeadScale_1 = v104.cameraHeadScale;
        local v107 = v70.getAlignedPanelPart();
        if v107 then
            local v108 = CFrame.new(v70.bottomBarPanelOffsetCallback(v104), v24.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position);
            local v109 = (0.2 + v70.state.zOffset / 10) * v45;
            l_finalPosition_1 = (CFrame.new(v108:ToWorldSpace((CFrame.new(-(not not v39 and ((#v70.state.itemList - 3) / 2) * v109 or ((#v70.state.itemList - 2.5) / 2) * v109) * l_cameraHeadScale_1, (v109 / 2) * l_cameraHeadScale_1, -0.025))).Position) * v107.CFrame.Rotation):ToWorldSpace((CFrame.new(0, ((#v70.state.moreItemList * v109) / 2) * l_cameraHeadScale_1, 0.025))).Position;
        end;
        return l_finalPosition_1;
    end;
    v70.moreMenuPanelTiltCallback = function(v110)
        local l_panelCFrame_0 = v110.panelCFrame;
        local v112 = v70.getAlignedPanelPart();
        if v112 then
            l_panelCFrame_0 = CFrame.new(l_panelCFrame_0.Position) * v112.CFrame.Rotation;
        end;
        return l_panelCFrame_0;
    end;
end;
v30.didMount = function(v113)
    v113.emotesLoaded = v33:isEmotesLoaded();
    v113.backpackHasItems = v34.IsInventoryEmpty();
    v113.updateItemListState();
end;
v30.updateItems = function(v114)
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    local l_l_StarterGui_0_CoreGuiEnabled_2 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Chat);
    local l_l_StarterGui_0_CoreGuiEnabled_3 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    local v119 = {
        v53, 
        v64, 
        v54
    };
    if v39 then
        v119 = {
            v114.getDebugYOffsetUp(), 
            v114.getDebugYOffsetDown(), 
            v114.getDebugZOffsetUp(), 
            v114.getDebugZOffsetDown(), 
            v114.getDebugTextLabel(), 
            v64, 
            v53, 
            v64, 
            v54
        };
    end;
    local v120 = l_l_StarterGui_0_CoreGuiEnabled_1 and not (l_StarterPlayer_0.UserEmotesEnabled and v114.emotesLoaded == false);
    local v121 = l_l_StarterGui_0_CoreGuiEnabled_0 and v114.backpackHasItems;
    if l_l_StarterGui_0_CoreGuiEnabled_2 then
        table.insert(v119, v58);
    end;
    if not (not v38 or not v114.props.voiceEnabled) then
        table.insert(v119, v114.getVoiceIcon());
    end;
    table.insert(v119, v64);
    if not v23.SafetyBubble or not v23.SafetyBubble.enabled then
        table.insert(v119, v60);
    else
        table.insert(v119, v59);
    end;
    if not v42 then
        table.insert(v119, v61);
    elseif not v23.ShowHighlightedLeaveGameIcon then
        table.insert(v119, v61);
    else
        table.insert(v119, v62);
    end;
    local v122 = {};
    if v120 then
        table.insert(v122, v65);
    end;
    if l_l_StarterGui_0_CoreGuiEnabled_3 then
        table.insert(v122, v66);
    end;
    if v121 then
        table.insert(v122, v67);
    end;
    if #v122 > 0 then
        table.insert(v119, v63);
    end;
    return v119, v122;
end;
v30.renderWithStyle = function(v123, v124)
    local v125 = (0.2 + v123.state.zOffset / 10) * v45;
    local l_itemList_0 = v123.state.itemList;
    local l_moreItemList_0 = v123.state.moreItemList;
    local v128 = not v39 and 1 or 7;
    if v123.state.vrMenuOpen then
        if v123.state.moreMenuOpen and #l_moreItemList_0 > 0 then
            v128 = #l_itemList_0;
        end;
    else
        v128 = not v39 and 3 or 9;
    end;
    return v11.createFragment({
        BottomBarPanel3D = v11.createElement(l_Panel3D_0, {
            panelName = "BottomBar", 
            partSize = Vector2.new((#l_itemList_0 - 1) * v125, v125), 
            virtualScreenSize = Vector2.new((#l_itemList_0 - 1) * 50, 50), 
            offset = not not v123.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v123.bottomBarPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            curvature = (v43 or game:GetEngineFeature("EnableMaquettesSupport")) and 0 or nil, 
            alwaysOnTop = not not l_game_EngineFeature_0 or nil, 
            parent = not not l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            zOffset = 1
        }, {
            CanvasGroup = v11.createElement("CanvasGroup", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                GroupTransparency = v123.fadeTransparency, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                SystemBar = v11.createElement(l_SystemBar_0, {
                    itemList = l_itemList_0, 
                    selection = v128, 
                    placement = l_Placement_0.Bottom, 
                    hidden = v123.state.hidden, 
                    onSafeAreaChanged = function()
                    end, 
                    size = UDim2.new(1, 0, 1, 0), 
                    position = UDim2.new(), 
                    layoutOrder = 1, 
                    roundCorners = true, 
                    buttonStroke = true, 
                    bgTransparency = 0, 
                    sortOrder = Enum.SortOrder.LayoutOrder
                })
            })
        }), 
        MoreMenuPanel3D = v123.state.moreMenuOpen and v11.createElement(l_Panel3D_0, {
            panelName = "MoreMenu", 
            partSize = Vector2.new(5 * v125, #l_moreItemList_0 * v125), 
            virtualScreenSize = Vector2.new(250, #l_moreItemList_0 * 56 + 8), 
            offset = not not v123.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0), 
            offsetCallback = v123.moreMenuPanelOffsetCallback, 
            lerp = true, 
            tilt = 0, 
            tiltCallback = v123.moreMenuPanelTiltCallback, 
            anchoring = l_Constants_0.AnchoringTypes.Head, 
            faceCamera = true, 
            alwaysOnTop = not not l_game_EngineFeature_0 or nil, 
            parent = not not l_game_EngineFeature_0 and l_GuiService_0.CoreGuiFolder or nil, 
            zOffset = 2
        }, {
            Content = v11.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                MoreMenu = v11.createElement(l_BaseMenu_0, {
                    anchorPoint = Vector2.new(0.5, 1), 
                    buttonProps = l_moreItemList_0, 
                    position = UDim2.new(0.5, 0, 1, -8), 
                    background = v124.Theme.BackgroundContrast
                }), 
                Caret = v11.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png", 
                    ImageColor3 = Color3.fromRGB(25, 27, 29), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    Size = UDim2.new(0, 24, 0, 10)
                })
            })
        }), 
        ShowHighlightedLeaveGameIconToggled = v42 and v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowHighlightedLeaveGameIconToggled.Event, 
            callback = v123.updateItemListState
        }), 
        ShowTopBarChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowTopBarChanged.Event, 
            callback = v123.onShowTopBarChanged
        }), 
        ShowMoreMenuChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = v23.ShowMoreMenuChanged.Event, 
            callback = v123.onShowMoreMenuChanged
        }), 
        CoreGuiChanged = v11.createElement(l_ExternalEventConnection_0, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = v123.updateItemListState
        }), 
        SafetyBubbleToggled = v23.SafetyBubble and v11.createElement(l_ExternalEventConnection_0, {
            event = v23.SafetyBubble.Toggled.Event, 
            callback = v123.updateItemListState
        }), 
        BackpackItemAdded = v11.createElement(l_ExternalEventConnection_0, {
            event = v34.BackpackItemAdded.Event, 
            callback = v123.onBackpackItemAdded
        }), 
        BackpackEmpty = v11.createElement(l_ExternalEventConnection_0, {
            event = v34.BackpackEmpty.Event, 
            callback = v123.onBackpackEmpty
        }), 
        EmotesLoaded = v11.createElement(l_ExternalEventConnection_0, {
            event = v33.EmotesLoaded.Event, 
            callback = v123.onEmotesLoaded
        }), 
        RenderStepped = v11.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = v123.onRenderStepped
        }), 
        VREnabled = v11.createElement(l_ExternalEventConnection_0, {
            event = l_VRService_0:GetPropertyChangedSignal("VREnabled"), 
            callback = v123.onVREnabledChanged
        })
    });
end;
v30.render = function(v129)
    return l_withStyle_0(function(v130)
        return v129:renderWithStyle(v130);
    end);
end;
v30.didUpdate = function(v131, v132, v133)
    if not (v133.lookAway == v131.state.lookAway) or v133.vrMenuOpen ~= v131.state.vrMenuOpen then
        if not (not v131.state.vrMenuOpen and v131.state.lookAway) then
            v131.fadeTransparencyMotor:setGoal(v9.spring(0, v52.Default));
        else
            v131.fadeTransparencyMotor:setGoal(v9.spring(1, v52.Slower));
        end;
    end;
    if v131.state.moreMenuOpen and #v131.state.moreItemList == 0 then
        v23:SetShowMoreMenu(false);
    end;
    if v38 and v132.voiceEnabled ~= v131.props.voiceEnabled then
        v131.updateItemListState();
        return ;
    else
        if not (v133.yOffset == v131.state.yOffset) or v133.zOffset ~= v131.state.zOffset then
            v131.updateItemListState();
        end;
        return ;
    end;
end;
v30.willUnmount = function(v134)
    v134.fadeTransparencyMotor:stop();
end;
return v12.UNSTABLE_connect2(nil, nil)(v30);
