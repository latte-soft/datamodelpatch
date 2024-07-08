local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_0.Indicator.Badge);
local v8 = require(l_Parent_0.Indicator.Enum.BadgeStates);
local v9 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v10 = require(l_Parent_0.ImageSet.getIconSize);
local v11 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Core_0.Control.Enum.ControlState);
local v14 = require(l_Core_0.Control.Interactable);
local v15 = require(l_Core_0.ImageSet.ImageSetComponent);
local v16 = require(l_Core_0.ImageSet.Validator.validateImage);
local v17 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v18 = require(l_Parent_1.Core.Style.Validator.validateFontInfo);
local v19 = require(l_Parent_1.Core.Style.Validator.validateTypographyInfo);
local v20 = require(l_Parent_1.Core.Style.withStyle);
local v21 = require(l_Parent_1.Utility.divideTransparency);
local v22 = require(l_Parent_0.SelectionCursor.withCursor);
local v23 = require(l_Parent_0.SelectionCursor.CursorType);
local v24 = require(l_Parent_1.UIBloxConfig);
local v25 = require(l_Parent_1.Core.Text.GetTextSize);
local v26 = UDim.new(0, 12);
local v27 = UDim.new(0, 8);
local v28 = {
    frequency = 6, 
    dampingRatio = 1
};
local v29 = {
    BACKGROUND = 1, 
    HOVER_MASK = 2, 
    ICON_AND_TITLE_CONTAINER = 3, 
    BADGE_CONTAINER = 4, 
    ROUNDED_CORNERS_MASK = 5
};
local v30 = {
    ICON = 1, 
    TITLE = 2
};
local v31 = v5.Component:extend("MenuTile");
v31.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    styleProps = {}
};
v31.validateProps = v6.strictInterface({
    size = v6.optional(v6.UDim2), 
    position = v6.optional(v6.UDim2), 
    layoutOrder = v6.optional(v6.number), 
    badgeValue = v6.optional(v6.union(v6.string, v6.number, v8.isEnumValue)), 
    icon = v6.optional(v16), 
    title = v6.string, 
    onActivated = v6.callback, 
    styleProps = v6.optional(v6.strictInterface({
        iconStyle = v6.optional(v17), 
        iconSize = v6.optional(v9.isEnumValue), 
        titleStyle = v6.optional(v17), 
        titleFont = v6.optional(v6.union(v18, v19))
    }))
});
local function v36(v32)
    return v20(function(v33)
        return v11(function(v34)
            if not v24.migrateToNewSelectionCursor then
                return v32(v33, v34);
            else
                return v22(function(v35)
                    return v32(v33, v34, (v35.getCursorByType(v23.RoundedRect)));
                end);
            end;
        end);
    end);
end;
local function v40(v37, v38)
    local l_Theme_0 = v38.Theme;
    return {
        iconStyle = v37.iconStyle or l_Theme_0.IconDefault, 
        iconSize = if not v37.iconSize then v10(v9.Large) else v10(v37.iconSize, v38), 
        titleStyle = v37.titleStyle or l_Theme_0.TextDefault, 
        titleFont = v37.titleFont or v38.Font.SubHeader1
    };
end;
v31.init = function(v41)
    local v42, v43 = v5.createBinding(1);
    v41.hoverTransparency = v42;
    v41.updateHoverTransparency = v43;
    v41.hoverTransparencyMotor = v4.createSingleMotor(1);
    v41.hoverTransparencyMotor:onStep(v41.updateHoverTransparency);
    v41.hoverTransparencyMotor:onComplete(function(v44)
        if v44 == 1 then
            v41:setState({
                showHoverMask = false
            });
        end;
    end);
    v41:setState({
        backgroundTransparency = 0, 
        iconTransparency = 0, 
        titleTransparency = 0, 
        showHoverMask = false
    });
end;
v31.render = function(v45)
    local l_backgroundTransparency_0 = v45.state.backgroundTransparency;
    local l_iconTransparency_0 = v45.state.iconTransparency;
    local l_titleTransparency_0 = v45.state.titleTransparency;
    local l_badgeValue_0 = v45.props.badgeValue;
    local l_icon_0 = v45.props.icon;
    local l_layoutOrder_0 = v45.props.layoutOrder;
    local l_onActivated_0 = v45.props.onActivated;
    local l_position_0 = v45.props.position;
    local l_size_0 = v45.props.size;
    local l_title_0 = v45.props.title;
    return v36(function(v56, v57, v58)
        local l_Theme_1 = v56.Theme;
        local v60 = v40(v45.props.styleProps, v56);
        local l_BackgroundUIDefault_0 = l_Theme_1.BackgroundUIDefault;
        local l_BackgroundOnHover_0 = l_Theme_1.BackgroundOnHover;
        local l_iconStyle_0 = v60.iconStyle;
        local l_iconSize_0 = v60.iconSize;
        local l_titleStyle_0 = v60.titleStyle;
        local l_titleFont_0 = v60.titleFont;
        local v67 = if not l_titleFont_0.RelativeSize then l_titleFont_0.FontSize else l_titleFont_0.RelativeSize * v56.Font.BaseSize;
        local l_Y_0 = v25(l_title_0, v67, l_titleFont_0.Font, Vector2.new(100, v67)).Y;
        return v5.createElement(v14, {
            Size = l_size_0, 
            Position = l_position_0, 
            BackgroundTransparency = 1, 
            SelectionImageObject = if not v24.migrateToNewSelectionCursor then v57(v12.RoundedRect) else v58, 
            LayoutOrder = l_layoutOrder_0, 
            onStateChanged = function(_, v70)
                if v70 == v13.Hover then
                    v45:setState({
                        backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                        iconTransparency = l_iconStyle_0.Transparency, 
                        titleTransparency = l_titleStyle_0.Transparency, 
                        showHoverMask = true
                    });
                    v45.hoverTransparencyMotor:setGoal(v4.spring(l_BackgroundOnHover_0.Transparency, v28));
                    return ;
                elseif v70 == v13.Default then
                    v45:setState({
                        backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                        iconTransparency = l_iconStyle_0.Transparency, 
                        titleTransparency = l_titleStyle_0.Transparency
                    });
                    v45.hoverTransparencyMotor:setGoal(v4.spring(1, v28));
                    return ;
                else
                    if v70 == v13.Pressed then
                        v45:setState({
                            backgroundTransparency = v21(l_BackgroundUIDefault_0.Transparency, 2), 
                            iconTransparency = v21(l_iconStyle_0.Transparency, 2), 
                            titleTransparency = v21(l_titleStyle_0.Transparency, 2), 
                            showHoverMask = false
                        });
                        v45.hoverTransparencyMotor:setGoal(v4.instant(1));
                    end;
                    return ;
                end;
            end, 
            [v5.Event.Activated] = l_onActivated_0
        }, {
            MenuTileFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = l_size_0
            }, {
                Background = v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
                    BackgroundTransparency = l_backgroundTransparency_0, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v29.BACKGROUND
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                HoverMask = v45.state.showHoverMask and v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundOnHover_0.Color, 
                    BackgroundTransparency = v45.hoverTransparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v29.HOVER_MASK
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                IconAndTitleContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v29.ICON_AND_TITLE_CONTAINER
                }, {
                    IconAndTitleUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = v26, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    IconAndTitleUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v27, 
                        PaddingLeft = v27, 
                        PaddingRight = v27, 
                        PaddingTop = v27 + UDim.new(0, l_Y_0)
                    }), 
                    Icon = l_icon_0 and v5.createElement(v15.Label, {
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = l_iconStyle_0.Color, 
                        ImageTransparency = l_iconTransparency_0, 
                        LayoutOrder = v30.ICON, 
                        Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0)
                    }), 
                    Title = l_title_0 and v5.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Font = l_titleFont_0.Font, 
                        LayoutOrder = v30.TITLE, 
                        Size = UDim2.new(1, 0, 0, l_Y_0 * 2), 
                        Text = l_title_0, 
                        TextColor3 = l_titleStyle_0.Color, 
                        TextSize = v67, 
                        TextTransparency = l_titleTransparency_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                }), 
                BadgeContainer = l_badgeValue_0 and v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v29.BADGE_CONTAINER
                }, {
                    BadgeUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = v26, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    BadgeUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v27, 
                        PaddingLeft = v27, 
                        PaddingRight = v27, 
                        PaddingTop = v27
                    }), 
                    Badge = v5.createElement(v7, {
                        value = l_badgeValue_0
                    })
                })
            })
        });
    end);
end;
v31.willUnmount = function(v71)
    if v71.hoverTransparencyMotor then
        v71.hoverTransparencyMotor:destroy();
    end;
end;
return v31;
