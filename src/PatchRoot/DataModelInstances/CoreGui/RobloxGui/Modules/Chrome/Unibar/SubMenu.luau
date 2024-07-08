local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(script.Parent.Parent.Service.LocalStore);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_Badge_0 = v3.App.Indicator.Badge;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_ScrollBarType_0 = v3.App.Container.Enum.ScrollBarType;
local l_Parent_0 = script.Parent.Parent;
local v17 = require(l_Parent_0.Service);
local _ = require(l_Parent_0.Service.Types);
local v19 = require(l_Parent_0.Analytics.ChromeAnalytics);
local v20 = require(l_Parent_0.Service.ViewportUtil);
local v21 = require(l_Parent_0.Unibar.Constants);
local v22 = require(l_Parent_0.Parent.TopBar.Constants);
local l_UserInputService_0 = game:GetService("UserInputService");
local v24 = require(l_Parent_0.Hooks.useChromeMenuItems);
local v25 = require(l_Parent_0.Hooks.useObservableValue);
local v26 = require(l_Parent_0.Flags.GetFFlagUnibarRespawn);
local v27 = require(l_Parent_0.Flags.GetFFlagEnableChromePinIntegrations);
local v28 = require(l_Parent_0.Flags.GetFFlagUseNewPinIcon);
local v29 = require(l_Parent_0.Flags.GetFFlagEnableSubmenuTruncationFix);
local v30 = require(l_Parent_0.Flags.GetFFlagKeepSubmenuOpenOnPin);
local v31 = require(l_Parent_0.Flags.GetFFlagFixSubmenuCloseIOS);
local v32 = require(l_Parent_0.Flags.GetFFlagEnableCaptureBadge);
local v33 = require(l_Parent_0.Flags.GetFIntNumTimesNewBadgeIsDisplayed);
local v34 = require(l_Parent_0.Flags.GetFStringNewFeatureList);
local v35 = require(l_Parent_0.Flags.GetFFlagEnableChromePinAnalytics);
local v36 = require(l_Parent_0.Hooks.useMappedObservableValue);
local v37 = require(script.Parent.ComponentHosts.IconHost);
local l_SUB_MENU_ROW_HEIGHT_0 = v21.SUB_MENU_ROW_HEIGHT;
local v39 = l_SUB_MENU_ROW_HEIGHT_0 * 0.5;
local v40 = nil;
local v41 = nil;
if not v28() then
    v40 = l_Images_0["icons/actions/edit/remove"];
    v41 = l_Images_0["icons/actions/edit/add"];
else
    v40 = l_Images_0["icons/controls/pinned_small"];
    v41 = l_Images_0["icons/controls/unpinned_small"];
end;
local v42 = false;
local v43 = {};
local v44 = false;
local v45 = Vector2.new(0, 0);
for v46 in string.gmatch(v34(), "([^, ]+)") do
    v43[v46] = true;
end;
ClearBadge = function(v47)
    if v43[v47] then
        v43[v47] = false;
        if v4.isEnabled() then
            local v48 = v4.loadForLocalPlayer("TimesSeenNewFeatures") or {};
            v48[v47] = v33();
            v4.storeForLocalPlayer("TimesSeenNewFeatures", v48);
        end;
    end;
end;
MenuRow = function(v49)
    local v50 = l_useStyle_0();
    local l_Theme_0 = v50.Theme;
    local l_Font_0 = v50.Font;
    local v53 = {
        Color = Color3.new(0, 0, 0), 
        Transparency = 1
    };
    local v54 = if not v27() then nil else v17:isUserPinned(v49.id);
    local v55 = if not v27() then nil else v17:areUserPinsFull() and not v54;
    local v56, v57 = v2.useBinding(v53);
    local v58, v59 = v2.useBinding(v53);
    local v62 = v2.useCallback(function(_, v61)
        if v61 == l_ControlState_0.Pressed then
            v57(l_Theme_0.BackgroundOnPress);
            return ;
        elseif v61 == l_ControlState_0.Hover then
            v57(l_Theme_0.BackgroundOnHover);
            return ;
        else
            v57(v53);
            return ;
        end;
    end);
    local v65 = v2.useCallback(function(_, v64)
        if v64 == l_ControlState_0.Pressed then
            v59(l_Theme_0.BackgroundOnPress);
            return ;
        elseif v64 == l_ControlState_0.Hover then
            v59(l_Theme_0.BackgroundOnHover);
            return ;
        else
            v59(v53);
            return ;
        end;
    end);
    local v66 = v2.createElement(v2.Fragment, nil, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = if not v27() then UDim.new(0, 24) else UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 8)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 8)
        }), 
        IconHost = v2.createElement(v37, {
            integration = v49, 
            disableButtonBehaviors = true
        }), 
        StyledTextLabel = v2.createElement(l_StyledTextLabel_0, {
            fontStyle = l_Font_0.Header2, 
            colorStyle = l_Theme_0.TextEmphasis, 
            text = v49.integration.label, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            fluidSizing = not v27() and true or false, 
            richText = not v27() and true or false
        })
    });
    return v2.createElement(l_Interactable_0, {
        Size = UDim2.new(1, 0, 0, l_SUB_MENU_ROW_HEIGHT_0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = v56:map(function(v67)
            return v67.Transparency;
        end), 
        BackgroundColor3 = v56:map(function(v68)
            return v68.Color;
        end), 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
        AutoButtonColor = if not v30() then nil else false, 
        [v2.Event.Activated] = if not v32() then v49.activated else function()
            ClearBadge(v49.id);
            v49.activated();
        end, 
        LayoutOrder = v49.order, 
        onStateChanged = v62
    }, {
        RowLabel = if not v27() then v66 else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v49.order
        }, {
            v66
        }), 
        UserPin = if not v27() then nil else v2.createElement(l_Interactable_0, {
            Size = if not not v32() and v43[v49.id] then UDim2.new(0, v21.NEW_BADGE_SIZE, 0, v21.PIN_BUTTON_SIZE) else UDim2.new(0, v21.PIN_BUTTON_SIZE, 0, v21.PIN_BUTTON_SIZE), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = if not not v32() and v43[v49.id] then UDim2.new(1, -v21.NEW_BADGE_SIZE - v21.PIN_RIGHT_PADDING, 0.5, 0) else UDim2.new(1, -v21.PIN_BUTTON_SIZE - v21.PIN_RIGHT_PADDING, 0.5, 0), 
            BorderSizePixel = 0, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.RoundedRectNoInset), 
            isDisabled = if not v30() then v55 else nil, 
            Selectable = if not v30() then nil else not v55, 
            [v2.Event.Activated] = function()
                if not v30() then
                    ClearBadge(v49.id);
                    pinActivated(v49.id);
                else
                    v44 = true;
                    if not v55 then
                        ClearBadge(v49.id);
                        pinActivated(v49.id);
                        return ;
                    end;
                end;
            end, 
            BackgroundTransparency = v58:map(function(v69)
                if not v30() or not v55 then
                    return v69.Transparency;
                else
                    return 1;
                end;
            end), 
            BackgroundColor3 = v58:map(function(v70)
                return v70.Color;
            end), 
            LayoutOrder = 2, 
            onStateChanged = v65
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UserPinIcon = if not not v32() and v43[v49.id] then nil else v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundTransparency = 1, 
                Image = if not v54 then v41 else v40, 
                Size = v21.PIN_ICON_SIZE, 
                ImageColor3 = v50.Theme.IconEmphasis.Color, 
                ImageTransparency = if not v55 then v50.Theme.IconEmphasis.Transparency else v50.Theme.UIEmphasis.Transparency
            }), 
            NewBadge = if not not v32() and v43[v49.id] then v2.createElement(l_Badge_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                value = "NEW"
            }) else nil
        })
    });
end;
isLeft = function(v71)
    return v71 == Enum.HorizontalAlignment.Left;
end;
pinActivated = function(v72)
    if v27() then
        if not v17:isUserPinned(v72) then
            v17:setUserPin(v72);
            if v35() then
                v19.default:setPin(v72, true, v17:userPins());
            end;
        else
            v17:removeUserPin(v72);
            if v35() then
                v19.default:setPin(v72, false, v17:userPins());
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
SubMenu = function(v73)
    if not (not v32() or v42) then
        v42 = true;
        if v4.isEnabled() then
            local v74 = v4.loadForLocalPlayer("TimesSeenNewFeatures") or {};
            for v75, v76 in pairs(v43) do
                if v76 then
                    v74[v75] = (v74[v75] or 0) + 1;
                    if v33() < v74[v75] then
                        v43[v75] = false;
                    end;
                end;
            end;
            v4.storeForLocalPlayer("TimesSeenNewFeatures", v74);
        end;
    end;
    local l_Theme_1 = l_useStyle_0().Theme;
    local v78 = v2.useRef(nil);
    local v79 = v25(v20.screenSize);
    v2.useEffect(function()
        local v82 = l_UserInputService_0.InputBegan:Connect(function(v80)
            local l_KeyCode_0 = v80.KeyCode;
            if not (l_KeyCode_0 ~= Enum.KeyCode.Left) or l_KeyCode_0 == Enum.KeyCode.DPadLeft then
                if v78.current and v78.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                    v17:setSelectedByOffset(-1);
                    return ;
                end;
            elseif not (not (not (l_KeyCode_0 ~= Enum.KeyCode.Right) or l_KeyCode_0 == Enum.KeyCode.DPadRight) or not (v78.current and v78.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject))) then
                v17:setSelectedByOffset(1);
            end;
        end);
        return function()
            v82:Disconnect();
        end;
    end, {});
    local v83 = v26() or v29();
    local v84 = v22.TopBarHeight + v21.ICON_CELL_WIDTH;
    local v85 = if not not v73 and v73.items then l_SUB_MENU_ROW_HEIGHT_0 * #v73.items else 0;
    local v86 = math.min(v79.Y - v84, v85);
    if v29() and v79.Y - v84 < v85 then
        local v87 = math.floor((v79.Y - v84) / l_SUB_MENU_ROW_HEIGHT_0);
        v86 = if l_SUB_MENU_ROW_HEIGHT_0 * v87 + v39 <= v79.Y - v84 then l_SUB_MENU_ROW_HEIGHT_0 * v87 + v39 else l_SUB_MENU_ROW_HEIGHT_0 * v87 - v39;
    end;
    local v88 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = if not v83 then Vector2.new(math.huge, 232) else nil, 
            MinSize = if not v83 then nil else Vector2.new(0, v86)
        }), 
        BottomPadding = v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10000
        })
    };
    for _, v90 in v73.items, nil, nil do
        v88[v90.id] = v2.createElement(MenuRow, v90);
    end;
    local v91 = v36(v17:orderAlignment(), isLeft);
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 240, 0, 0), 
        AnchorPoint = if not v91 then Vector2.new(1, 0) else Vector2.zero, 
        Position = if not v91 then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = l_Theme_1.BackgroundUIContrast.Color, 
        BackgroundTransparency = l_Theme_1.BackgroundUIContrast.Transparency, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v78
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        ScrollingFrame = if not v29() then v2.createElement("ScrollingFrame", {
            ScrollBarThickness = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            CanvasSize = if not v83 then nil else UDim2.new(0, 0, 0, v85), 
            AutomaticSize = if not v83 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            AutomaticCanvasSize = if not v83 then Enum.AutomaticSize.XY else nil, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectionGroup = true, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            Selectable = false
        }, v88) else v2.createElement(l_VerticalScrollView_0, {
            size = UDim2.new(1, 0, 1, 0), 
            useAutomaticCanvasSize = if not v83 then Enum.AutomaticSize.XY else nil, 
            canvasSizeY = if not v83 then nil else UDim.new(0, v85), 
            selectable = false, 
            scrollBarType = l_ScrollBarType_0.Compact
        }, v88)
    });
end;
return function(_)
    local v93 = {};
    local v94 = v2.useRef(nil);
    local v95 = v2.useRef(nil);
    local v96 = v2.useRef(nil);
    local v97 = v25(v17:currentSubMenu());
    v2.useEffect(function()
        if v97 then
            if v31() then
                v96.current = l_UserInputService_0.TouchStarted:Connect(function(v98)
                    v45 = Vector2.new(v98.Position.X, v98.Position.Y);
                end);
            end;
            if v26() then
                v95.current = l_UserInputService_0.TouchTap:Connect(function(v99)
                    if v31() and v99[1] - v45 ~= Vector2.zero then
                        return ;
                    else
                        local v100 = v17:currentSubMenu():get();
                        if v100 then
                            if not v30() or not v44 then
                                v17:toggleSubMenu(v100);
                            else
                                v44 = false;
                                return ;
                            end;
                        end;
                        return ;
                    end;
                end);
            end;
            v94.current = l_UserInputService_0.InputEnded:Connect(function(v101, _)
                local v103 = false;
                if not v26() then
                    local v104 = true;
                    if v101.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        v104 = v101.UserInputType == Enum.UserInputType.Touch;
                    end;
                    v103 = v104;
                else
                    v103 = v101.UserInputType == Enum.UserInputType.MouseButton1;
                end;
                local v105 = v17:currentSubMenu():get();
                if not (not v105 or not v103) then
                    if not v30() or not v44 then
                        v17:toggleSubMenu(v105);
                    else
                        v44 = false;
                        return ;
                    end;
                end;
            end);
        end;
        return function()
            if v94.current then
                v94.current:Disconnect();
                v94.current = nil;
            end;
            if v95.current then
                v95.current:Disconnect();
                v95.current = nil;
            end;
            if v96.current then
                v96.current:Disconnect();
                v96.current = nil;
            end;
        end;
    end, {
        v97
    });
    local v106 = v24();
    local v107 = {};
    if not (not v97 or not v106) then
        for _, v109 in v106, nil, nil do
            if v97 == v109.id then
                v107 = v109.children;
                break;
            end;
        end;
    end;
    if #v107 > 0 then
        v93[v97] = v2.createElement(SubMenu, {
            items = v107
        });
    end;
    return v2.createElement("Frame", {
        Name = "SubMenuHost", 
        Size = UDim2.new(0, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, v93);
end;
