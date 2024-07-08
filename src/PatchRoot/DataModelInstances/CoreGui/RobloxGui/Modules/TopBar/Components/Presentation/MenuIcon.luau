local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_withTooltip_0 = v8.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v8.App.Dialog.Enum.TooltipOrientation;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local v15 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v16 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local _ = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v18 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v19 = require(script.Parent.BadgeOver12);
local v20 = require(l_RobloxGui_0.Modules.VR.VRHub);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v23 = require(script.Parent.Parent.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local v24 = require(script.Parent.Parent.Parent.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v25 = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagAddOver12TopBarBadge);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Parent.Actions;
local v28 = require(l_Parent_0.Parent.Constants);
local v29 = require(l_Actions_0.SetGamepadMenuOpen);
local v30 = require(l_Actions_0.SetKeepOutArea);
local v31 = nil;
if v15() then
    v31 = require(l_RobloxGui_0.Modules.InGameMenuInit);
end;
local v32 = require(l_RobloxGui_0.Modules.isNewTiltIconEnabled);
local v33 = require(script.Parent.IconButton);
local v34 = v5.PureComponent:extend("MenuIcon");
local v35 = not v32() and 32 or v28.TopBarHeight - 4;
if v23() then
    v35 = v28.TopBarButtonHeight;
end;
local v36 = v13();
local v37 = not v36 and 0.4 or 0.65;
local v38 = {
    Enum.KeyCode.Escape
};
local v39 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceRecordingIndicatorsEnabled);
v34.validateProps = v7.strictInterface({
    layoutOrder = v7.integer, 
    setGamepadMenuOpen = v7.callback, 
    iconScale = v7.optional(v7.number), 
    onAreaChanged = v7.optional(v7.callback), 
    showBadgeOver12 = v7.optional(v7.boolean)
});
v34.init = function(v40)
    v40:setState({
        vrShowMenuIcon = false, 
        showTooltip = false, 
        isHovering = false, 
        clickLatched = if not v36 then nil else false, 
        enableFlashingDot = false
    });
    if not (not v39() or v13()) then
        task.spawn(function()
            v40:setState({
                enableFlashingDot = true
            });
        end);
    end;
    v40.menuIconActivated = function()
        v40:setState({
            showTooltip = false, 
            isHovering = not not v36 and nil, 
            clickLatched = not not v36 or nil
        });
        if not l_VRService_0.VREnabled or not v20.ShowTopBar and not l_GamepadService_0.GamepadCursorEnabled then
            if not v15() then
                require(l_RobloxGui_0.Modules.Settings.SettingsHub):ToggleVisibility(v16.AnalyticsMenuOpenTypes.TopbarButton);
                return ;
            else
                v31.openInGameMenu(v16.MainPagePageKey);
                return ;
            end;
        else
            v31.openInGameMenu(v16.MainPagePageKey);
            return ;
        end;
    end;
    v40.menuIconOnHover = function()
        if v36 then
            v40:setState({
                isHovering = true
            });
            delay(v37, function()
                if not (not v40.state.isHovering or v40.state.clickLatched) then
                    v40:setState({
                        showTooltip = true
                    });
                end;
            end);
        end;
        if v15() then
            if l_isSubjectToDesktopPolicies_0() then
                v31.openInGameMenu(v16.InitalPageKey);
                v31.setMenuIconTooltipOpen(false);
            else
                return ;
            end;
        end;
    end;
    v40.menuIconOnHoverEnd = function()
        v40:setState({
            showTooltip = false, 
            isHovering = false, 
            clickLatched = if not v36 then nil else false
        });
    end;
    v40.showTopBarCallback = function()
        if v40.state.vrShowMenuIcon ~= false then
            v40:setState({
                vrShowMenuIcon = false
            });
        end;
    end;
end;
v34.render = function(v41)
    local v42 = not l_VRService_0.VREnabled or v41.state.vrShowMenuIcon;
    local function v44(v43)
        if v43 then
            v41.props.onAreaChanged(v28.MenuIconKeepOutAreaId, v43.AbsolutePosition, v43.AbsoluteSize);
        end;
    end;
    local v45 = v5.createElement(v33, {
        icon = not v32() and "rbxasset://textures/ui/TopBar/coloredlogo.png" or l_Images_0["icons/logo/block"], 
        iconSize = 24 * (v41.props.iconScale or 1), 
        useIconScaleAnimation = v32(), 
        onActivated = v41.menuIconActivated, 
        onHover = v41.menuIconOnHover, 
        onHoverEnd = if not v36 then nil else v41.menuIconOnHoverEnd, 
        enableFlashingDot = v41.state.enableFlashingDot
    });
    local v46 = l_GamepadService_0 and v5.createElement(l_ExternalEventConnection_0, {
        event = v20.ShowTopBarChanged.Event or l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
        callback = v41.showTopBarCallback
    });
    local v47 = if not not v25() and v41.props.showBadgeOver12 then v5.createElement(v19, {
        position = if not v13() then UDim2.new(0, -4, 1, 4) else UDim2.new(0, 1, 1, -(v28.TopBarButtonPadding + 1))
    }) else nil;
    if not v36 then
        return v5.createElement("Frame", {
            Visible = v42, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v35, 1, 0), 
            LayoutOrder = v41.props.layoutOrder, 
            [v5.Change.AbsoluteSize] = if v24 or v13() then v44 else nil, 
            [v5.Change.AbsolutePosition] = if v24 or v13() then v44 else nil
        }, {
            BadgeOver12 = v47, 
            Background = v45, 
            ShowTopBarListener = v46
        });
    else
        local v48 = "Roblox Menu";
        pcall(function()
            v48 = v18:FormatByKey("CoreScripts.TopBar.RobloxMenu");
        end);
        return l_withTooltip_0({
            textAlignment = Enum.TextXAlignment.Center, 
            headerText = v48, 
            hotkeyCodes = v38
        }, {
            active = v41.state.showTooltip, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            DisplayOrder = 10
        }, function(v49)
            local function v51(v50)
                if v50 then
                    v41.props.onAreaChanged(v28.MenuIconKeepOutAreaId, v50.AbsolutePosition, v50.AbsoluteSize);
                end;
                v49(v50);
            end;
            return v5.createElement("Frame", {
                Visible = v42, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v35, 1, 0), 
                LayoutOrder = v41.props.layoutOrder, 
                [v5.Change.AbsoluteSize] = v51, 
                [v5.Change.AbsolutePosition] = v51
            }, {
                BadgeOver12 = v47, 
                Background = v45, 
                ShowTopBarListener = v46
            });
        end);
    end;
end;
return v6.UNSTABLE_connect2(nil, function(v52)
    return {
        setGamepadMenuOpen = function(v53)
            return v52(v29(v53));
        end, 
        onAreaChanged = function(v54, v55, v56)
            return v52(v30(v54, v55, v56));
        end
    };
end)(v34);
