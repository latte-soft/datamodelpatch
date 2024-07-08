local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Badge_0 = v4.App.Indicator.Badge;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_withTooltip_0 = v4.App.Dialog.TooltipV2.withTooltip;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v13 = require(l_Parent_0.Unibar.Constants);
local v14 = require(l_Parent_0.Service);
local v15 = require(l_Parent_0.Analytics.ChromeAnalytics);
local _ = require(l_Parent_0.Service.Types);
local v17 = require(l_Parent_0.Flags.GetFFlagEnableChromeAnalytics)();
local v18 = require(l_Parent_0.Flags.GetFFlagEnableUnibarSneakPeak);
local v19 = require(l_Parent_0.Hooks.useObservableValue);
local v20 = require(l_Parent_0.Hooks.useNotificationCount);
local v21 = require(l_Parent_0.Hooks.useMappedObservableValue);
local v22 = require(l_Parent_0.Hooks.useMappedObservableValueBinding);
local v23 = require(l_Parent_0.Hooks.useTimeHysteresis);
local v24 = require(l_Parent_0.Utility.shouldRejectMultiTouch);
local v25 = {};
areTooltipsDisplaying = function()
    local v26 = tick();
    for _, v28 in v25, nil, nil do
        if v28.displaying or v26 - v28.time < 0.15 then
            return true;
        end;
    end;
    return false;
end;
logTooltipState = function(v29, v30)
    if not v25[v29] or v25[v29].displaying ~= v30 then
        v25[v29] = {
            displaying = v30, 
            time = tick()
        };
    end;
end;
NotificationBadge = function(v31)
    if v31.integration then
        local v32 = v20(v31.integration.integration);
        if v21(v14:currentSubMenu(), function(v33)
            return v33 == v31.integration.id;
        end) then
            v32 = 0;
        end;
        local v34 = false;
        if not (not v31.integration or not v31.integration.integration) then
            v34 = v31.integration.integration.hideNotificationCountWhileOpen or false;
        end;
        local l_createElement_0 = v3.createElement;
        local v36 = "Frame";
        local v38 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = (not not not v31.toggleTransition or v31.toggleTransition:map(function(v37)
                if not v34 then
                    return true;
                else
                    return v37 < 0.5;
                end;
            end)) or true, 
            ZIndex = 2
        };
        local v39 = {};
        local v40 = false;
        if v32 > 0 then
            v40 = v3.createElement(l_Badge_0, {
                position = UDim2.fromOffset(20, 0), 
                anchorPoint = Vector2.new(0, 0), 
                hasShadow = false, 
                value = v32
            });
        end;
        v39.Badge = v40;
        return l_createElement_0(v36, v38, v39);
    else
        return nil;
    end;
end;
NotificationIndicator = function(v41)
    local v42 = v19(v14:notificationIndicator());
    v41.setIconVisible(not v42 and true or false);
    return (v3.createElement("Frame", {
        Name = "NotificationIndicatorFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        IntegrationIcon = not not v42 and v42.component(v41) or nil, 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        })
    }));
end;
HighlightCircle = function(v43)
    return v3.createElement("Frame", {
        Name = v43.name or "Highlighter", 
        Size = UDim2.new(0, 36, 0, 36), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = v43.color.Color, 
        BackgroundTransparency = v43.color.Transparency, 
        BorderSizePixel = 0, 
        Visible = v43.visible
    }, {
        corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
TooltipButton = function(v44)
    local v45 = v3.useRef(nil);
    local l_secondaryAction_0 = v44.integration.integration.secondaryAction;
    local v47 = v44.integration.integration.draggable or false;
    local v48 = v3.useRef(nil);
    v3.useEffect(function()
        return function()
            if v48.current then
                v48.current:Disconnect();
                v48.current = nil;
            end;
        end;
    end, {});
    local v49 = nil;
    local v50 = nil;
    if not l_secondaryAction_0 then
        local v51, v52 = v23(0.6, 0.65, 0.7);
        v49 = v51;
        v50 = v52;
    else
        local v53, v54 = v23(0.05, 0.15, 0.35);
        v49 = v53;
        v50 = v54;
    end;
    local v55, v56 = v23(0, 0, 0.65);
    local v57, v58 = v3.useState(false);
    local v59, v60 = v23(0, 1);
    local v65 = v3.useCallback(function(v61, v62)
        if v62 == l_ControlState_0.Selected and v61 == l_ControlState_0.Default then
            v14:setSelected(v44.integration.id);
        end;
        local v63 = v62 ~= l_ControlState_0.Default;
        v44.setHovered(v63);
        local v64 = v62 == l_ControlState_0.Hover;
        v50(v64, not not v64 and v55 or areTooltipsDisplaying());
        if not v63 then
            v60(false);
        end;
    end, {
        v44.setHovered, 
        v50, 
        v60, 
        v55
    });
    local v71 = v3.useCallback(function(_, v67)
        if v47 then
            if not (v67.UserInputType ~= Enum.UserInputType.MouseButton1) or v67.UserInputType == Enum.UserInputType.Touch then
                local l_Position_0 = v67.Position;
                v60(true, true);
                if v17 then
                    v15.default:onIconTouchBegan(v44.integration.id);
                end;
                if not v48.current then
                    v48.current = l_UserInputService_0.InputChanged:Connect(function(v69, _)
                        if not v24(v67, v69) then
                            if v13.DRAG_MAGNITUDE_THRESHOLD < math.abs((l_Position_0 - v69.Position).Magnitude) then
                                if v17 then
                                    v15.default:onIconDrag(v44.integration.id);
                                end;
                                if v18() then
                                    v14:storeChromeInteracted();
                                end;
                                v14:toggleWindow(v44.integration.id);
                                v14:gesture(v44.integration.id, v48, v67);
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end, {
        v47
    });
    local v74 = v3.useCallback(function(_, v73)
        if v47 then
            if not (v73.UserInputType ~= Enum.UserInputType.MouseButton1) or v73.UserInputType == Enum.UserInputType.Touch then
                v60(false);
                if v48.current then
                    v48.current:Disconnect();
                    v48.current = nil;
                    v14:gesture(v44.integration.id, nil);
                end;
            end;
            return ;
        else
            return ;
        end;
    end, {
        v47
    });
    local v75 = ((v49 or v55) or v57) and not v59;
    logTooltipState(v44.integration.id, v75);
    local v79 = v3.useCallback(function(v76)
        return v3.createElement(l_Interactable_0, {
            Name = "IconHitArea_" .. v44.integration.id, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            onStateChanged = v65, 
            ref = v45, 
            SelectionOrder = 100 - v44.integration.order, 
            Position = v44.isCurrentlyOpenSubMenu:map(function(v77)
                return UDim2.new(0, 0, 0, not v77 and 0 or 1);
            end), 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.SelectedKnob), 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = v44.isCurrentlyOpenSubMenu:map(function(v78)
                if not (v75 and l_secondaryAction_0) and not v78 then
                    return Enum.SelectionBehavior.Stop;
                else
                    return Enum.SelectionBehavior.Escape;
                end;
            end), 
            [v3.Change.AbsolutePosition] = v76, 
            [v3.Change.AbsoluteSize] = v76, 
            [v3.Event.InputBegan] = v71, 
            [v3.Event.InputEnded] = v74, 
            [v3.Event.Activated] = function()
                v60(true, true);
                v44.integration.activated();
                if v48.current then
                    v48.current:Disconnect();
                    v48.current = nil;
                    v14:gesture(v44.integration.id, nil);
                end;
            end
        });
    end, {
        v65, 
        v50, 
        v60, 
        v71, 
        v74, 
        v44.isCurrentlyOpenSubMenu, 
        v75, 
        l_secondaryAction_0
    });
    local v80 = v3.useRef(nil);
    return l_withTooltip_0({
        headerText = v44.integration.integration.label, 
        hotkeyCodes = v44.integration.integration.hotkeyCodes, 
        textAlignment = Enum.TextXAlignment.Left, 
        buttonProps = if not l_secondaryAction_0 then nil else {
            text = l_secondaryAction_0.label, 
            onStateChanged = function(_, v82)
                if v82 == l_ControlState_0.Selected then
                    v58(true);
                    return ;
                else
                    v58(false);
                    return ;
                end;
            end, 
            onActivated = function()
                l_secondaryAction_0.activated(v44.integration);
            end, 
            NextSelectionUp = v45, 
            NextSelectionLeft = v45, 
            NextSelectionRight = v45, 
            NextSelectionDown = v45
        }, 
        ref = if not l_secondaryAction_0 then nil else v3.useCallback(function(v83)
            local v84 = nil;
            local v85 = nil;
            local v86 = nil;
            local function v87()
                if v84 then
                    v84:disconnect();
                    v84 = nil;
                end;
                if v85 then
                    v85:disconnect();
                    v85 = nil;
                end;
                if v86 then
                    v86:disconnect();
                    v86 = nil;
                end;
            end;
            if v83 ~= v80.current then
                pcall(v87);
                if v83 then
                    v84 = v83.MouseEnter:Connect(function()
                        v56(true, true);
                    end);
                    v85 = v83.MouseLeave:Connect(function()
                        v56(false);
                    end);
                    v86 = v83.Destroying:Connect(function()
                        v56(false);
                    end);
                end;
                v80.current = v83;
            end;
        end, {
            v56
        })
    }, {
        active = v75, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 10
    }, v79);
end;
IconHost = function(v88)
    if not (v88.integration and v88.integration.component) then
        warn("IconHost has no component to render");
    end;
    local v89, v90 = v3.useBinding(false);
    local v91, v92 = v3.useBinding(true);
    local l_BackgroundOnHover_0 = l_useStyle_0().Theme.BackgroundOnHover;
    local v95 = v22(v14:currentSubMenu(), function(v94)
        return v94 == v88.integration.id;
    end);
    return v3.createElement("Frame", {
        Size = UDim2.new(0, v13.ICON_CELL_WIDTH, 0, v13.ICON_CELL_WIDTH), 
        LayoutOrder = v88.integration.order, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Position = v88.position, 
        Visible = v88.visible, 
        ZIndex = v88.integration.order
    }, {
        v3.createElement("Frame", {
            Name = "IntegrationIconFrame", 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Visible = v91
        }, {
            IntegrationIcon = (not not v88.integration and v88.integration.component) and v88.integration.component(v88) or nil, 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        }), 
        if not v88.integration.integration.flashNotificationSource then nil else v3.createElement(NotificationIndicator, {
            integration = v88.integration, 
            setIconVisible = v92
        }), 
        v3.createElement(HighlightCircle, {
            name = "SelectedHighlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v95
        }), 
        v3.createElement(HighlightCircle, {
            name = "Highlighter", 
            color = l_BackgroundOnHover_0, 
            visible = v89
        }), 
        v3.createElement(NotificationBadge, v88), 
        if not v88.disableButtonBehaviors then v3.createElement(TooltipButton, {
            integration = v88.integration, 
            setHovered = v90, 
            isCurrentlyOpenSubMenu = v95
        }) else nil
    });
end;
return IconHost;
