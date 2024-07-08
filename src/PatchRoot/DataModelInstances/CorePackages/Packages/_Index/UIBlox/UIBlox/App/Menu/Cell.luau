local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v6 = require(l_Parent_0.App.SelectionImage.withSelectionCursorProvider);
local v7 = require(l_Parent_0.App.SelectionImage.CursorKind);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v10 = require(l_Parent_1.UIBlox.Core.ImageSet.ImageSetComponent);
local v11 = require(l_Parent_1.UIBlox.App.ImageSet.Images);
local v12 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Parent_0.Utility.divideTransparency);
local v14 = require(l_Parent_1.UIBlox.Core.Style.Validator.validateFontInfo);
local v15 = require(l_Parent_1.UIBlox.Core.Control.Controllable);
local v16 = require(l_Parent_1.UIBlox.Core.Control.Enum.ControlState);
local v17 = require(script.Parent.KeyLabel.KeyLabel);
local v18 = require(script.Parent.RoundedFrame);
local v19 = require(l_Parent_0.UIBloxConfig);
local v20 = v11["component_assets/circle_17"];
local v21 = v2.PureComponent:extend("Cell");
v21.validateProps = v3.strictInterface({
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    text = v3.string, 
    onActivated = v3.callback, 
    keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
        key = v3.enum(Enum.KeyCode), 
        axis = v3.optional(v3.string)
    }))), 
    selected = v3.optional(v3.boolean), 
    iconColorOverride = v3.optional(v3.Color3), 
    textColorOverride = v3.optional(v3.Color3), 
    elementHeight = v3.integer, 
    hasRoundTop = v3.boolean, 
    hasRoundBottom = v3.boolean, 
    hasDivider = v3.boolean, 
    disabled = v3.optional(v3.boolean), 
    stayOnActivated = v3.optional(v3.boolean), 
    renderRightSideGadget = v3.optional(v3.callback), 
    rightSideGadgetSize = v3.optional(v3.Vector2), 
    leftPaddingOffset = v3.optional(v3.number), 
    layoutOrder = v3.integer, 
    setButtonRef = v3.optional(v3.union(v3.callback, v3.table)), 
    cursorKind = if not v19.migrateToNewSelectionCursor then v3.optional(v7.isEnumValue) else nil, 
    isElementBackgroundVisible = v3.optional(v3.boolean), 
    dividerOffset = v3.optional(v3.number), 
    dividerSize = v3.optional(v3.number), 
    fontStyle = v3.optional(v3.union(v3.string, v14)), 
    iconSize = v3.optional(v3.integer), 
    selectedIconSize = v3.optional(v3.integer), 
    iconPaddingLeft = v3.optional(v3.integer), 
    textPadding = v3.optional(v3.strictInterface({
        left = v3.integer, 
        right = v3.integer
    })), 
    selectedIconPaddingRight = v3.optional(v3.integer), 
    keyLabelPaddingRight = v3.optional(v3.integer), 
    textOnlyPadding = v3.optional(v3.integer), 
    borderCornerRadius = v3.optional(v3.integer), 
    background = v3.optional(v5), 
    selectionOrder = v3.optional(v3.number), 
    selectionCursor = if not v19.migrateToNewSelectionCursor then nil else v3.optional(v3.any)
});
v21.defaultProps = {
    selected = false, 
    disabled = false, 
    rightSideGadgetSize = nil, 
    leftPaddingOffset = 0, 
    isElementBackgroundVisible = true, 
    dividerOffset = 0, 
    dividerSize = 1, 
    iconSize = 36, 
    selectedIconSize = 16, 
    iconPaddingLeft = 12, 
    textPadding = {
        left = 12, 
        right = 12
    }, 
    selectedIconPaddingRight = 24, 
    textOnlyPadding = 24, 
    keyLabelPaddingRight = 16, 
    borderCornerRadius = 4
};
v21.init = function(v22)
    v22.state = {
        controlState = v16.Default, 
        keyLabelWidth = 0
    };
    v22.keyLabelSizeChanged = function(v23)
        v22:setState({
            keyLabelWidth = v23.AbsoluteSize.X
        });
    end;
    v22.setControlState = function(v24)
        v22:setState({
            controlState = v24
        });
    end;
end;
v21.getImageProperties = function(v25)
    local l_ImageRectSize_0 = v20.ImageRectSize;
    local l_ImageRectOffset_0 = v20.ImageRectOffset;
    local v28 = 8 * v11.ImagesResolutionScale;
    local v29 = 8 * v11.ImagesResolutionScale;
    local v30 = Rect.new(v28, v29, l_ImageRectSize_0.x - v28, l_ImageRectSize_0.y - v29);
    local l_X_0 = l_ImageRectSize_0.X;
    local v32 = math.floor(l_X_0 / 2);
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if not v25.props.hasRoundTop or not v25.props.hasRoundBottom then
        if not v25.props.hasRoundTop then
            if not v25.props.hasRoundBottom then
                return Vector2.new(1, 1), l_ImageRectOffset_0 + Vector2.new(v32, v32), (Rect.new(0, 0, 0, 0));
            else
                return Vector2.new(l_X_0, v32), l_ImageRectOffset_0 + Vector2.new(0, v32), (Rect.new(v32 - 1, 0, v32 + 1, 1));
            end;
        else
            return Vector2.new(l_X_0, v32), l_ImageRectOffset_0, (Rect.new(v32 - 1, v32 - 1, v32 + 1, v32));
        end;
    else
        return l_ImageRectSize_0, l_ImageRectOffset_0, v30;
    end;
end;
v21.renderRoundedBackground = function(v36, v37, v38)
    assert(v19.enableNewMenuLayout, "enableNewMenuLayout must be enabled to call renderRoundedBackground");
    local v39 = UDim.new(0, v36.props.borderCornerRadius);
    return v2.createElement(v18, {
        zIndex = v37, 
        background = v38, 
        topCornerRadius = if not v36.props.hasRoundTop then nil else v39, 
        bottomCornerRadius = if not v36.props.hasRoundBottom then nil else v39
    });
end;
v21.renderWithSelectionCursor = function(v40, v41)
    return v4(function(v42)
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        local l_Settings_0 = v42.Settings;
        local l_textOnlyPadding_0 = v40.props.textOnlyPadding;
        if v40.props.icon then
            l_textOnlyPadding_0 = v40.props.iconPaddingLeft;
        end;
        l_textOnlyPadding_0 = l_textOnlyPadding_0 + v40.props.leftPaddingOffset;
        local v47 = 0;
        if not v40.props.keyCodeLabel then
            if v40.props.selected then
                v47 = v40.props.selectedIconPaddingRight;
            end;
        else
            v47 = v40.props.keyLabelPaddingRight;
        end;
        local v48 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v40.state.controlState == v16.Pressed then
            v48 = l_Theme_0.BackgroundOnPress;
        elseif v40.state.controlState == v16.Hover then
            v48 = l_Theme_0.BackgroundOnHover;
        end;
        local v49, v50, v51 = v40:getImageProperties();
        local v52 = 0;
        local v53 = true;
        if v40.props.rightSideGadgetSize ~= nil then
            v52 = ((v40.props.rightSideGadgetSize.X + v40.props.iconPaddingLeft) + v40.props.iconSize) + v40.props.textPadding.left;
        else
            if v40.props.icon then
                v53 = false;
                l_textOnlyPadding_0 = v40.props.iconPaddingLeft;
                v52 = v40.props.iconPaddingLeft + v40.props.iconSize;
            end;
            if v40.props.selected then
                v53 = false;
                v52 = (v52 + v40.props.selectedIconSize) + v40.props.selectedIconPaddingRight;
            end;
            if v40.props.keyCodeLabel then
                v53 = false;
                v52 = (v52 + v40.props.keyLabelPaddingRight) + v40.state.keyLabelWidth;
            end;
            v52 = if not v53 then (v52 + v40.props.textPadding.left) + v40.props.textPadding.right else v52 + v40.props.textOnlyPadding * 2;
        end;
        local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
        if v40.props.textColorOverride then
            l_TextEmphasis_0 = {
                Color = v40.props.textColorOverride, 
                Transparency = l_Theme_0.TextEmphasis.Transparency
            };
        end;
        if not (v40.state.controlState ~= v16.Pressed and not v40.props.disabled) then
            l_TextEmphasis_0 = {
                Color = l_TextEmphasis_0.Color, 
                Transparency = v13(l_Theme_0.TextEmphasis.Transparency, 2)
            };
        end;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        local v56 = l_Object_0.assign({}, {
            Color = l_BackgroundUIDefault_0.Color, 
            Transparency = l_BackgroundUIDefault_0.Transparency
        }, v40.props.background);
        v56.Transparency = v56.Transparency * l_Settings_0.PreferredTransparency;
        local l_isElementBackgroundVisible_0 = v40.props.isElementBackgroundVisible;
        return v2.createElement(v15, {
            controlComponent = {
                component = "ImageButton", 
                props = {
                    Size = UDim2.new(1, 0, 0, v40.props.elementHeight), 
                    BackgroundTransparency = 1, 
                    Image = if not v19.enableNewMenuLayout then v20.Image else nil, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v51, 
                    ImageRectSize = v49, 
                    ImageRectOffset = v50, 
                    SliceScale = 1 / v11.ImagesResolutionScale, 
                    ImageTransparency = not (l_isElementBackgroundVisible_0 and not v19.enableNewMenuLayout) and 1 or v56.Transparency, 
                    ImageColor3 = v56.Color, 
                    AutoButtonColor = false, 
                    LayoutOrder = v40.props.layoutOrder, 
                    BorderSizePixel = 0, 
                    [v2.Ref] = v40.props.setButtonRef, 
                    [v2.Event.Activated] = v40.props.onActivated, 
                    SelectionImageObject = if not v19.migrateToNewSelectionCursor then v41(v40.props.cursorKind) else v40.props.selectionCursor, 
                    SelectionOrder = v40.props.selectionOrder
                }, 
                children = {
                    Background = if not not v19.enableNewMenuLayout and l_isElementBackgroundVisible_0 then v40:renderRoundedBackground(-1, v56) else nil, 
                    Divider = v2.createElement("Frame", {
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -v40.props.dividerOffset, 0, v40.props.dividerSize), 
                        Position = UDim2.new(0, v40.props.dividerOffset, 1, 0), 
                        AnchorPoint = Vector2.new(0, 1), 
                        Visible = v40.props.hasDivider
                    }), 
                    StateOverlay = if not v19.enableNewMenuLayout then v2.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Image = v20.Image, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v51, 
                        ImageRectSize = v49, 
                        ImageRectOffset = v50, 
                        SliceScale = 1 / v11.ImagesResolutionScale, 
                        ImageColor3 = v48.Color, 
                        ImageTransparency = v48.Transparency, 
                        BorderSizePixel = 0, 
                        Size = UDim2.fromScale(1, 1), 
                        ZIndex = 2
                    }) else v40:renderRoundedBackground(2, v48), 
                    LeftAlignedContent = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v40.props.textPadding.left)
                        }), 
                        LeftPadding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_textOnlyPadding_0)
                        }), 
                        Icon = v40.props.icon and v2.createElement(v10.Label, {
                            Image = v40.props.icon, 
                            Size = UDim2.fromOffset(v40.props.iconSize, v40.props.iconSize), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = v40.props.iconColorOverride or l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = v13(l_Theme_0.IconEmphasis.Transparency, not v40.props.disabled and 1 or 2), 
                            LayoutOrder = 1
                        }), 
                        Text = v2.createElement(v12, {
                            fontStyle = v40.props.fontStyle or l_Font_0.Header2, 
                            colorStyle = l_TextEmphasis_0, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -v52, 1, 0), 
                            Text = v40.props.text, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = false, 
                            LayoutOrder = 2
                        })
                    }), 
                    RightAlignedContent = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v40.props.textPadding.right)
                        }), 
                        RightPadding = v2.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, v47)
                        }), 
                        RightSideContent = (not not v40.props.renderRightSideGadget and v40.props.rightSideGadgetSize) and v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 3, 
                            Size = UDim2.fromOffset(v40.props.rightSideGadgetSize.X, v40.props.rightSideGadgetSize.Y)
                        }, v40.props.renderRightSideGadget()) or v2.createFragment({
                            KeyLabel = v40.props.keyCodeLabel and v2.createElement(v17, {
                                keyCode = v40.props.keyCodeLabel, 
                                LayoutOrder = 2, 
                                [v2.Change.AbsoluteSize] = v40.keyLabelSizeChanged
                            }), 
                            SelectedIcon = v2.createElement(v10.Label, {
                                Image = v11["icons/status/success_small"], 
                                Size = UDim2.fromOffset(v40.props.selectedIconSize, v40.props.selectedIconSize), 
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                                Visible = v40.props.selected
                            })
                        })
                    })
                }
            }, 
            onStateChanged = function(_, v59)
                v40.setControlState(v59);
            end, 
            isDisabled = v40.props.disabled
        });
    end);
end;
v21.render = function(v60)
    return v6(function(v61)
        return v60:renderWithSelectionCursor(v61);
    end);
end;
return v21;
