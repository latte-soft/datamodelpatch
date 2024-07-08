local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v10.Core.Style.withStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v14 = require(script.MenuHeader);
local v15 = require(script.ChatIcon);
local v16 = require(script.MenuCell);
local _ = require(script.BottomBar);
local v18 = require(script.QuickMenuControllerBar);
local v19 = require(script.MenuNavigationToggleDialog);
local v20 = require(script.MenuNavigationDismissablePrompt);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v22 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v23 = require(l_RobloxGui_0.Modules.BackpackScript);
local v24 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v25 = require(l_RobloxGui_0.Modules.ChatSelector);
local v26 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v27 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v28 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local v29 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v30 = require(script.Parent.Parent.Parent.Actions.SetGamepadMenuOpen);
local v31 = require(script.MenuNavigationPromptLocalStorage);
local v32 = l_Images_0["icons/logo/block"];
local v33 = l_Images_0["icons/menu/AR"];
local v34 = l_Images_0["icons/actions/respawn"];
local v35 = l_Images_0["icons/navigation/close"];
local v36 = l_Images_0["component_assets/circle_17"];
local v37 = Rect.new(8, 8, 9, 9);
local _ = l_Players_0.LocalPlayer;
local v39 = v6.PureComponent:extend("GamepadMenu");
local v40 = require(script.Parent.Parent.Parent.Flags.FFlagAddMenuNavigationToggleDialog);
local v41 = require(script.Parent.Parent.Parent.Flags.FFlagEnableGamepadMenuSelector);
local v42 = require(l_RobloxGui_0.Modules.Chrome.Flags.GetFFlagEnableUnibarSneakPeak);
local v43 = require(script.Parent.Parent.Parent.Flags.GetFFlagOpenPlayersPageFromGamepad);
local l_GetFFlagSupportCompactUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSupportCompactUtility;
v39.validateProps = v9.strictInterface({
    screenSize = v9.Vector2, 
    chatEnabled = v9.boolean, 
    leaderboardEnabled = v9.boolean, 
    emotesEnabled = v9.boolean, 
    backpackEnabled = v9.boolean, 
    respawnEnabled = v9.boolean, 
    leaderboardOpen = v9.boolean, 
    backpackOpen = v9.boolean, 
    emotesOpen = v9.boolean, 
    menuOpen = v9.boolean, 
    setGamepadMenuOpen = v9.callback, 
    isGamepadMenuOpen = v9.boolean
});
v39.init = function(v45)
    v45:setState({
        selectedIndex = 1, 
        menuActions = {}, 
        shouldShowMenuNavigationPrompt = if not v41 then nil else v31.getShouldShowMenuNavigationPrompt()
    });
    v45.boundMenuOpenActions = false;
    v45.toggleMenuVisibleAction = function(_, v47, _)
        if v47 == Enum.UserInputState.Begin and not v45.props.menuOpen then
            v45.props.setGamepadMenuOpen(not v45.props.isGamepadMenuOpen);
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end;
    v45.closeMenuAction = function(_, v50, _)
        if v50 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v45.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v45.leaveGameMenuAction = function(_, v53, _)
        if v53 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v39.leaveGame();
            v45.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v45.respawnMenuAction = function(_, v56, _)
        if v56 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v39.respawnCharacter();
            v45.props.setGamepadMenuOpen(false);
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v45.lastThumbStickMove = 0;
    v45.moveSelectionAction = function(_, v59, v60)
        if v59 == Enum.UserInputState.Begin then
            if v60.KeyCode == Enum.KeyCode.DPadUp then
                if v45.state.selectedIndex > 1 then
                    v45:setState({
                        selectedIndex = v45.state.selectedIndex - 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            elseif v60.KeyCode == Enum.KeyCode.DPadDown then
                if v45.state.selectedIndex < #v45.state.menuActions then
                    v45:setState({
                        selectedIndex = v45.state.selectedIndex + 1
                    });
                end;
                return Enum.ContextActionResult.Sink;
            end;
        elseif v60.KeyCode == Enum.KeyCode.Thumbstick1 then
            if tick() - v45.lastThumbStickMove < 0.15 then
                return Enum.ContextActionResult.Pass;
            elseif v60.Position.Y > 0.8 then
                if v45.state.selectedIndex > 1 then
                    v45:setState({
                        selectedIndex = v45.state.selectedIndex - 1
                    });
                    v45.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Pass;
            elseif v60.Position.Y < -0.8 then
                if v45.state.selectedIndex < #v45.state.menuActions then
                    v45:setState({
                        selectedIndex = v45.state.selectedIndex + 1
                    });
                    v45.lastThumbStickMove = tick();
                end;
                return Enum.ContextActionResult.Sink;
            end;
        end;
        return Enum.ContextActionResult.Pass;
    end;
    v45.goToTopAction = function(_, v62, _)
        if v62 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v45:setState({
                selectedIndex = 1
            });
            return ;
        end;
    end;
    v45.goToBottomAction = function(_, v65, _)
        if v65 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        else
            v45:setState({
                selectedIndex = #v45.state.menuActions
            });
            return ;
        end;
    end;
    v45.activateSelectionAction = function(_, v68, _)
        if v68 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Pass;
        elseif not v41 or not v45.state.shouldShowMenuNavigationPrompt then
            local v70 = v45.state.menuActions[v45.state.selectedIndex];
            v45.props.setGamepadMenuOpen(false);
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
            v70.onActivated();
            return Enum.ContextActionResult.Sink;
        else
            v45:setState({
                shouldShowMenuNavigationPrompt = false
            });
            v31.setMenuNavigationPromptShown();
            return Enum.ContextActionResult.Sink;
        end;
    end;
    v45.overlayDismiss = function()
        v45.props.setGamepadMenuOpen(false);
    end;
end;
v39.openRootMenu = function()
    if not v27() then
        local v71 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if not v43() then
            v71:SetVisibility(true, nil, v71.Instance.GameSettingsPage, true, v28.AnalyticsMenuOpenTypes.SettingsTriggered);
            return ;
        else
            v71:SetVisibility(true, nil, nil, true, v28.AnalyticsMenuOpenTypes.PlayersTriggered);
            return ;
        end;
    else
        require(l_RobloxGui_0.Modules.InGameMenuInit).openInGameMenu(v28.MainPagePageKey);
        return ;
    end;
end;
v39.openUnibarMenu = function()
    local v72 = require(l_RobloxGui_0.Modules.Chrome.Service);
    if not v42() then
        v72:toggleOpen();
        return ;
    else
        v72:open();
        return ;
    end;
end;
v39.closeUnibarMenu = function()
    local v73 = require(l_RobloxGui_0.Modules.Chrome.Service);
    if not l_GetFFlagSupportCompactUtility_0() then
        v73:close();
        return ;
    else
        v73:close(true);
        return ;
    end;
end;
v39.toggleChatVisible = function()
    v25:ToggleVisibility();
end;
v39.toggleLeaderboard = function()
    if not v27() then
        v26:SetVisibility(not v26:GetSetVisible());
        return ;
    else
        require(l_RobloxGui_0.Modules.InGameMenuInit).openPlayersPage();
        return ;
    end;
end;
v39.toggleEmotesMenu = function()
    if not v24:isOpen() then
        v24:open();
        return ;
    else
        v24:close();
        return ;
    end;
end;
v39.toggleBackpack = function()
    v23:OpenClose();
end;
v39.leaveGame = function()
    if not v27() then
        local v74 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v74:SetVisibility(true, false, v74.Instance.LeaveGamePage, true, v28.AnalyticsMenuOpenTypes.GamepadLeaveGame);
        return ;
    else
        require(l_RobloxGui_0.Modules.InGameMenuInit).openGameLeavePage();
        return ;
    end;
end;
v39.respawnCharacter = function()
    if not v27() then
        local v75 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v75:SetVisibility(true, false, v75.Instance.ResetCharacterPage, true, v28.AnalyticsMenuOpenTypes.GamepadResetCharacter);
        return ;
    else
        require(l_RobloxGui_0.Modules.InGameMenuInit).openCharacterResetPage();
        return ;
    end;
end;
v39.getMenuActionsFromProps = function(v76)
    local v77 = {};
    table.insert(v77, {
        name = "Menu", 
        icon = v32, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Menu", 
        onActivated = v39.openRootMenu
    });
    if v29() then
        table.insert(v77, {
            name = "Unibar", 
            icon = v33, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Title.ExperienceControls", 
            onActivated = v39.openUnibarMenu
        });
    end;
    if not (not v76.chatEnabled or v22:IsEnabled()) then
        table.insert(v77, {
            name = "Chat", 
            icon = nil, 
            iconComponent = v15, 
            localizationKey = "CoreScripts.TopBar.Chat", 
            onActivated = v39.toggleChatVisible
        });
    end;
    if not (not v76.leaderboardEnabled and not v22:IsEnabled()) then
        local _ = nil;
        table.insert(v77, {
            name = "Leaderboard", 
            icon = not v76.leaderboardOpen and "rbxasset://textures/ui/TopBar/leaderboardOff.png" or "rbxasset://textures/ui/TopBar/leaderboardOn.png", 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Leaderboard", 
            onActivated = v39.toggleLeaderboard
        });
    end;
    if v76.emotesEnabled then
        local _ = nil;
        table.insert(v77, {
            name = "Emotes", 
            icon = not v76.emotesOpen and "rbxasset://textures/ui/TopBar/emotesOff.png" or "rbxasset://textures/ui/TopBar/emotesOn.png", 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Emotes", 
            onActivated = v39.toggleEmotesMenu
        });
    end;
    if v76.backpackEnabled then
        local _ = nil;
        table.insert(v77, {
            name = "Inventory", 
            icon = not v76.backpackOpen and "rbxasset://textures/ui/TopBar/inventoryOff.png" or "rbxasset://textures/ui/TopBar/inventoryOn.png", 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Inventory", 
            onActivated = v39.toggleBackpack
        });
    end;
    if v76.respawnEnabled then
        table.insert(v77, {
            name = "Respawn", 
            icon = v34, 
            iconComponent = nil, 
            localizationKey = "CoreScripts.TopBar.Respawn", 
            onActivated = v39.respawnCharacter
        });
    end;
    table.insert(v77, {
        name = "Leave", 
        icon = v35, 
        iconComponent = nil, 
        localizationKey = "CoreScripts.TopBar.Leave", 
        onActivated = v39.leaveGame
    });
    return v77;
end;
v39.getDerivedStateFromProps = function(v81, v82)
    local v83 = v39.getMenuActionsFromProps(v81);
    local v84 = v82.selectedIndex or 1;
    if #v83 < v84 then
        v84 = #v83;
    end;
    return v8.Dictionary.join(v82, {
        selectedIndex = v84, 
        menuActions = v83
    });
end;
v39.render = function(v85)
    return l_withStyle_0(function(v86)
        local l_Theme_0 = v86.Theme;
        local v88 = {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MenuHeader = v6.createElement(v14, {
                layoutOrder = 1, 
                height = 120
            })
        };
        for v89, v90 in ipairs(v85.state.menuActions) do
            v88[v90.name] = v6.createElement(v16, {
                layoutOrder = v89 + 1, 
                icon = v90.icon, 
                iconComponent = v90.iconComponent, 
                localizationKey = v90.localizationKey, 
                height = 56, 
                hasDivider = v89 ~= #v85.state.menuActions, 
                isSelected = v89 == v85.state.selectedIndex
            });
        end;
        local v91 = 120 + #v85.state.menuActions * 56;
        local v92 = 1;
        if v85.props.screenSize.Y * 0.75 < v91 then
            v92 = (v85.props.screenSize.Y * 0.75) / v91;
        end;
        if v85.props.screenSize.X * 0.75 < 336 then
            local v93 = (v85.props.screenSize.X * 0.75) / 336;
            if v93 < v92 then
                v92 = v93;
            end;
        end;
        if v92 < 1 then
            v88.UIScale = v6.createElement("UIScale", {
                Scale = v92
            });
        end;
        local l_isGamepadMenuOpen_0 = v85.props.isGamepadMenuOpen;
        return v6.createElement("TextButton", {
            Visible = l_isGamepadMenuOpen_0, 
            Text = "", 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            ZIndex = 10, 
            [v6.Event.Activated] = v85.overlayDismiss
        }, if not not v41 and v85.state.shouldShowMenuNavigationPrompt then {
            MenuNavigationDismissablePrompt = v6.createElement(v20, {
                Position = UDim2.fromScale(0.5, 0.5), 
                Visible = v85.props.isGamepadMenuOpen
            })
        } else {
            Menu = v6.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v36, 
                SliceCenter = v37, 
                ScaleType = Enum.ScaleType.Slice, 
                ImageTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                ImageColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                Size = UDim2.fromOffset(336, v91), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, v88), 
            ControllerBar = not not l_isGamepadMenuOpen_0 and v6.createElement(v18) or nil, 
            MenuNavigationToggleDialog = if not v40 then nil else v6.createElement(v19, {
                Position = UDim2.fromScale(0.5, 0.1)
            })
        });
    end);
end;
v39.didMount = function(v95)
    if not l_VRService_0.VREnabled then
        l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v95.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
    end;
end;
v39.bindMenuOpenActions = function(v96)
    v96.boundMenuOpenActions = true;
    l_ContextActionService_0:BindCoreAction("TopBarGamepadFreezeController", function()
    end, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadCloseMenu", v96.closeMenuAction, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadLeaveGame", v96.leaveGameMenuAction, false, Enum.KeyCode.ButtonX);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadRespawnAction", v96.respawnMenuAction, false, Enum.KeyCode.ButtonY);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadActivateSelection", v96.activateSelectionAction, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelection", v96.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionTop", v96.goToTopAction, false, Enum.KeyCode.ButtonL2);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadMoveSelectionBottom", v96.goToBottomAction, false, Enum.KeyCode.ButtonR2);
    l_ContextActionService_0:BindCoreAction("TopBarGamepadToggleGamepadMenu", v96.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart);
end;
v39.unbindMenuOpenActions = function(v97)
    v97.boundMenuOpenActions = false;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadFreezeController");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadCloseMenu");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadActivateSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadLeaveGame");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadRespawnAction");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelection");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionTop");
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadMoveSelectionBottom");
end;
v39.unbindAllActions = function(v98)
    if v98.boundMenuOpenActions then
        v98:unbindMenuOpenActions();
    end;
    l_ContextActionService_0:UnbindCoreAction("TopBarGamepadToggleGamepadMenu");
end;
v39.didUpdate = function(v99, v100, _)
    local v102 = nil;
    local v103 = nil;
    v102 = v100.isGamepadMenuOpen ~= v99.props.isGamepadMenuOpen;
    v103 = v99.props.isGamepadMenuOpen;
    if v102 then
        if not v103 then
            v99:unbindMenuOpenActions();
            l_GuiService_0:SetMenuIsOpen(false, "GamepadMenu");
        else
            v99:bindMenuOpenActions();
            if v99.state.selectedIndex ~= 1 then
                v99:setState({
                    selectedIndex = 1
                });
            end;
            v99.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
            l_GuiService_0.SelectedCoreObject = nil;
            v99.savedSelectedObject = l_GuiService_0.SelectedObject;
            l_GuiService_0.SelectedObject = nil;
            l_GuiService_0:SetMenuIsOpen(true, "GamepadMenu");
            if not (not v42() or not v29()) then
                v39.closeUnibarMenu();
                return ;
            end;
        end;
    end;
end;
v39.willUnmount = function(v104)
    v104:unbindAllActions();
end;
return v7.UNSTABLE_connect2(function(v105)
    local l_topbarEnabled_0 = v105.displayOptions.topbarEnabled;
    return {
        screenSize = v105.displayOptions.screenSize, 
        chatEnabled = (v105.coreGuiEnabled[Enum.CoreGuiType.Chat] and l_topbarEnabled_0) and not l_VRService_0.VREnabled, 
        leaderboardEnabled = v105.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and l_topbarEnabled_0, 
        emotesEnabled = (v105.moreMenu.emotesEnabled and v105.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu]) and l_topbarEnabled_0, 
        backpackEnabled = v105.coreGuiEnabled[Enum.CoreGuiType.Backpack] and l_topbarEnabled_0, 
        respawnEnabled = v105.respawn.enabled, 
        leaderboardOpen = v105.moreMenu.leaderboardOpen, 
        backpackOpen = v105.moreMenu.backpackOpen, 
        emotesOpen = v105.moreMenu.emotesOpen, 
        menuOpen = v105.displayOptions.menuOpen, 
        isGamepadMenuOpen = v105.displayOptions.isGamepadMenuOpen
    };
end, function(v107)
    return {
        setGamepadMenuOpen = function(v108)
            return v107(v30(v108));
        end
    };
end)(v39);
