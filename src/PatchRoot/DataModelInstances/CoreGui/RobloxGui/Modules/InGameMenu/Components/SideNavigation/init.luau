local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Components.Connection.FocusHandler);
local v12 = require(l_Parent_0.Components.ZonePortal);
local v13 = require(l_Parent_0.Thunks.CloseMenu);
local v14 = require(l_Parent_0.Actions.SetCurrentPage);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Enums.Direction);
local v17 = require(script.CloseMenuButton);
local v18 = require(script.HomeButton);
local v19 = require(script.SystemMenuButton);
local v20 = require(l_Parent_0.InGameMenuPolicy);
local v21 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v22 = l_Roact_0.PureComponent:extend("SideNavigation");
v22.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    closeMenu = l_t_0.callback, 
    goToHomePage = l_t_0.callback, 
    goToSystemMenu = l_t_0.callback, 
    currentPage = l_t_0.string, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    currentZone = not not v21() and l_t_0.optional(l_t_0.number) or nil, 
    enableInGameHomeIcon = l_t_0.optional(l_t_0.boolean)
});
v22.init = function(v23)
    v23.controlStateUpdated = function(v24, v25)
        if (v24 == l_ControlState_0.Hover and v25 ~= l_ControlState_0.Hover) and v23.props.currentPage == v15.InitalPageKey then
            v23.props.closeMenu();
        end;
    end;
    v23.firstItemRef = l_Roact_0.createRef();
    v23.onContainerRendered = function(v26)
        if v26 then
            l_GuiService_0:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup");
            l_GuiService_0:AddSelectionParent("SideNavigation_IGMSelectionGroup", v26);
        end;
    end;
end;
v22.oldRender = function(v27)
    local v28 = nil;
    if v21() then
        local v29 = true;
        if v27.props.currentZone == 0 then
            v29 = not v27.props.open;
        end;
        v28 = v29;
    end;
    return l_withStyle_0(function(v30)
        return l_Roact_0.createElement("TextButton", {
            AutoButtonColor = false, 
            Text = "", 
            BackgroundColor3 = v30.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v30.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 64, 1, 0), 
            Visible = v27.props.open, 
            Selectable = false, 
            [l_Roact_0.Ref] = v27.onContainerRendered
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 1)
            }), 
            CloseMenuButton = l_Roact_0.createElement(v17, {
                onActivated = v27.props.closeMenu, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 4), 
                [l_Roact_0.Ref] = v27.firstItemRef
            }), 
            FocusHandler = l_Roact_0.createElement(v11, {
                isFocused = v27.props.canCaptureFocus, 
                shouldForgetPreviousSelection = v28, 
                didFocus = not not v21() and function(v31)
                    l_GuiService_0.SelectedCoreObject = v31 or v27.firstItemRef:getValue();
                end or function()
                    l_GuiService_0.SelectedCoreObject = v27.firstItemRef:getValue();
                end
            }), 
            ZonePortal = v27.props.currentPage ~= v15.InitalPageKey and l_Roact_0.createElement(v12, {
                targetZone = 1, 
                direction = v16.Right
            }) or nil
        });
    end);
end;
v22.newRender = function(v32)
    local l_currentPage_0 = v32.props.currentPage;
    local v34 = {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 1)
        }), 
        Content = l_Roact_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Selectable = false
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), 
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4)
            }), 
            SystemMenuButton = l_Roact_0.createElement(v19, {
                on = l_currentPage_0 == v15.MainPagePageKey, 
                onClose = v32.props.closeMenu, 
                onActivated = v32.props.goToSystemMenu, 
                layoutOrder = 1, 
                anchorPoint = Vector2.new(0.5, 0), 
                position = UDim2.new(0.5, 0, 0, 4), 
                canCaptureFocus = v32.props.canCaptureFocus
            }), 
            HomeButton = l_Roact_0.createElement(v18, {
                on = l_currentPage_0 == v15.LeaveToAppPromptPageKey, 
                onActivated = v32.props.goToHomePage, 
                layoutOrder = 2, 
                anchorPoint = Vector2.new(0.5, 0), 
                position = UDim2.new(0.5, 0, 0, 8)
            })
        }), 
        ZonePortal = v32.props.currentPage ~= v15.InitalPageKey and l_Roact_0.createElement(v12, {
            targetZone = 1, 
            direction = v16.Right
        }) or nil
    };
    return l_withStyle_0(function(v35)
        return l_Roact_0.createElement(l_Interactable_0, {
            onStateChanged = v32.controlStateUpdated, 
            AutoButtonColor = false, 
            BackgroundColor3 = v35.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v35.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 64, 1, 0), 
            Visible = v32.props.open, 
            Selectable = false, 
            [l_Roact_0.Ref] = v32.onContainerRendered
        }, v34);
    end);
end;
v22.render = function(v36)
    if not v36.props.enableInGameHomeIcon then
        return v36:oldRender();
    else
        return v36:newRender();
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v37, _)
    local l_isMenuOpen_0 = v37.isMenuOpen;
    if l_isMenuOpen_0 then
        l_isMenuOpen_0 = not v37.respawn.dialogOpen;
        if l_isMenuOpen_0 then
            l_isMenuOpen_0 = false;
            if v37.displayOptions.inputType == v15.InputType.Gamepad then
                l_isMenuOpen_0 = v37.currentZone == 0;
            end;
        end;
    end;
    local v40 = nil;
    if v21() then
        v40 = v37.currentZone;
    end;
    return {
        canCaptureFocus = l_isMenuOpen_0, 
        currentPage = v37.menuPage, 
        open = v37.isMenuOpen, 
        currentZone = v40
    };
end, function(v41)
    return {
        closeMenu = function()
            v41(v13);
        end, 
        goToSystemMenu = function()
            v41(v14(v15.MainPagePageKey));
        end, 
        goToHomePage = function()
            v41(v14(v15.LeaveToAppPromptPageKey));
        end
    };
end)((v20.connect(function(v42, _)
    return {
        enableInGameHomeIcon = v42.enableInGameHomeIcon()
    };
end)(v22)));
