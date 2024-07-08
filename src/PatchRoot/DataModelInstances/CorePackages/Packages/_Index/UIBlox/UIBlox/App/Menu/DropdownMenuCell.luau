local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Parent_1.Core.Style.useStyle);
local v11 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Core_0.ImageSet.ImageSetComponent);
local v14 = require(l_Parent_0.Loading.ShimmerPanel);
local v15 = require(l_Parent_0.Constant.IconSize);
local v16 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v17 = require(l_Core_0.ImageSet.Validator.validateImage);
local v18 = require(l_Core_0.Button.getContentStyle);
local v19 = require(l_Core_0.Style.Validator.validateTypographyInfo);
local v20 = require(l_Core_0.Style.Validator.validateColorInfo);
local v21 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v22 = require(l_Parent_0.SelectionCursor.CursorType);
local v23 = require(l_Parent_1.UIBloxConfig);
local v24 = require(script.Parent.StyleDefaults);
local v25 = v4.PureComponent:extend("DropdownMenuCell");
local function v29(v26, v27)
    local v28 = v26[v27] or v26[v8.Default];
    return {
        Color = v28.Color, 
        Transparency = v28.Transparency
    };
end;
local function _(v30, v31, v32, v33, v34)
    local v35 = v30(v31, v32, v33);
    if not (not (v32 ~= v8.Disabled and v32 ~= v8.Pressed) or not v34) then
        v35.Transparency = 0.5 * v35.Transparency + 0.5;
    end;
    return v35;
end;
local function _(v37, v38, v39, v40, v41, v42)
    local v43 = v37(v38, v39, v40);
    if not (not (v39 ~= v8.Disabled and v39 ~= v8.Pressed) or not v41 and v42) then
        v43.Transparency = 0.5 * v43.Transparency + 0.5;
    end;
    return v43;
end;
v25.init = function(v45)
    v45:setState({
        controlState = v8.Initialize
    });
    v45.onStateChanged = function(v46, v47)
        v45:setState({
            controlState = v47
        });
        if v45.props.onStateChanged then
            v45.props.onStateChanged(v46, v47);
        end;
    end;
end;
local v48 = v5.union(v5.interface({
    [v8.Default] = v5.string
}), v5.interface({
    [v8.Default] = v20
}));
v25.validateProps = v5.interface({
    icon = v5.optional(v17), 
    text = v5.optional(v5.string), 
    textFont = v5.optional(v19), 
    buttonImage = v17, 
    buttonStateColorMap = v48, 
    contentStateColorMap = v48, 
    textStateColorMap = v5.optional(v48), 
    iconStateColorMap = v5.optional(v48), 
    isDisabled = v5.optional(v5.boolean), 
    isActivated = v5.optional(v5.boolean), 
    hasContent = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean), 
    onActivated = v5.callback, 
    onStateChanged = v5.optional(v5.callback), 
    userInteractionEnabled = v5.optional(v5.boolean), 
    iconSize = v5.optional(v5.number), 
    containerPadding = v5.optional(v5.strictInterface({
        left = v5.number, 
        right = v5.number
    })), 
    iconTextSpacing = v5.optional(v5.number), 
    border = v5.optional(v5.strictInterface({
        cornerRadius = v5.number, 
        size = v5.number
    })), 
    enableTokenOverride = v5.optional(v5.boolean), 
    selectionOrder = v5.optional(v5.number), 
    selectionCursor = v5.optional(v5.any)
});
v25.defaultProps = {
    isDisabled = false, 
    isLoading = false, 
    SliceCenter = Rect.new(8, 8, 9, 9), 
    iconSize = v15.Regular, 
    containerPadding = {
        left = 12, 
        right = 20
    }, 
    iconTextSpacing = 5, 
    border = {
        cornerRadius = 8, 
        size = 1
    }, 
    enableTokenOverride = false
};
v25.render = function(v49)
    return v9(function(v50)
        return v11(function(v51)
            assert(v5.table(v50), "Style provider is missing.");
            local l_controlState_0 = v49.state.controlState;
            local l_text_0 = v49.props.text;
            local l_icon_0 = v49.props.icon;
            local l_iconSize_0 = v49.props.iconSize;
            local l_containerPadding_0 = v49.props.containerPadding;
            local l_iconTextSpacing_0 = v49.props.iconTextSpacing;
            local l_isLoading_0 = v49.props.isLoading;
            local l_isDisabled_0 = v49.props.isDisabled;
            local l_buttonStateColorMap_0 = v49.props.buttonStateColorMap;
            local l_contentStateColorMap_0 = v49.props.contentStateColorMap;
            local v62 = v49.props.textStateColorMap or l_contentStateColorMap_0;
            local v63 = v49.props.iconStateColorMap or l_contentStateColorMap_0;
            if l_isLoading_0 then
                l_isDisabled_0 = true;
            end;
            local v64 = v49.props.selectionCursor or v51 and v51(v12.RoundedRectNoInset);
            local v65 = nil;
            v65 = if not not v23.enableNewMenuLayout and v49.props.enableTokenOverride then v29 else v18;
            local l_v65_0 = v65;
            local l_v50_0 = v50;
            local l_isActivated_0 = v49.props.isActivated;
            local v69 = l_v65_0(l_buttonStateColorMap_0, l_controlState_0, l_v50_0);
            if not (not (l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed) or not l_isActivated_0) then
                v69.Transparency = 0.5 * v69.Transparency + 0.5;
            end;
            local l_v69_0 = v69;
            l_v65_0 = l_text_0;
            if l_v65_0 then
                l_v50_0 = v65;
                l_isActivated_0 = v50;
                v69 = v49.props.isActivated;
                local l_hasContent_0 = v49.props.hasContent;
                local v72 = l_v50_0(v62, l_controlState_0, l_isActivated_0);
                if not (not (l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed) or not v69 and l_hasContent_0) then
                    v72.Transparency = 0.5 * v72.Transparency + 0.5;
                end;
                l_v65_0 = v72;
            end;
            l_v50_0 = l_icon_0;
            if l_v50_0 then
                l_isActivated_0 = v65;
                v69 = v50;
                local l_isActivated_1 = v49.props.isActivated;
                local v74 = l_isActivated_0(v63, l_controlState_0, v69);
                if (l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed) and l_isActivated_1 then
                    v74.Transparency = 0.5 * v74.Transparency + 0.5;
                end;
                l_v50_0 = v74;
            end;
            l_isActivated_0 = v49.props.buttonImage;
            v69 = nil;
            v69 = if not not v23.enableNewMenuLayout and v49.props.enableTokenOverride then v49.props.textFont else v50.Font.Header2;
            local v75 = nil;
            v75 = if l_icon_0 ~= nil then (l_iconSize_0 + l_iconTextSpacing_0) + l_containerPadding_0.right else l_containerPadding_0.right;
            local v76 = nil;
            v76 = if not l_isLoading_0 then v49.props[v4.Children] or {
                TextContainer = v4.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_containerPadding_0.left)
                    }), 
                    Text = if not l_text_0 then nil else v4.createElement(v16, {
                        BackgroundTransparency = 1, 
                        Text = l_text_0, 
                        fontStyle = v69, 
                        colorStyle = l_v65_0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -v75, 1, 0), 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = false
                    })
                }), 
                IconContainer = v4.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, l_containerPadding_0.right)
                    }), 
                    Icon = not not l_icon_0 and v4.createElement(v13.Label, {
                        Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = l_v50_0.Color, 
                        ImageTransparency = l_v50_0.Transparency, 
                        LayoutOrder = 2
                    }) or nil
                })
            } else {
                isLoadingShimmer = v4.createElement(v14, {
                    Size = UDim2.fromScale(1, 1)
                })
            };
            local v77 = {
                isActivated = v6.None, 
                hasContent = v6.None, 
                icon = v6.None, 
                text = v6.None, 
                textFont = v6.None, 
                buttonImage = v6.None, 
                buttonStateColorMap = v6.None, 
                contentStateColorMap = v6.None, 
                textStateColorMap = v6.None, 
                iconStateColorMap = v6.None, 
                iconSize = v6.None, 
                containerPadding = v6.None, 
                iconTextSpacing = v6.None, 
                border = v6.None, 
                enableTokenOverride = v6.None, 
                onActivated = v6.None, 
                isLoading = v6.None, 
                [v4.Children] = v6.None, 
                isDisabled = l_isDisabled_0, 
                onStateChanged = v49.onStateChanged, 
                userInteractionEnabled = v49.props.userInteractionEnabled, 
                ScaleType = Enum.ScaleType.Slice, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                selectionCursor = v6.None, 
                SelectionImageObject = v64, 
                SelectionOrder = v49.props.selectionOrder, 
                [v4.Event.Activated] = v49.props.onActivated
            };
            local v78 = nil;
            local v79 = nil;
            local v80 = nil;
            if not v23.enableNewMenuLayout or not v49.props.enableTokenOverride then
                v80 = UDim2.new(1, 0, 1, 0);
                v79 = {};
                v78 = v6.Dictionary.join(v49.props, {
                    Image = l_isActivated_0, 
                    ImageColor3 = l_v69_0.Color, 
                    ImageTransparency = l_v69_0.Transparency
                }, v77);
            else
                local l_size_0 = v49.props.border.size;
                v80 = UDim2.new(1, -2 * l_size_0, 1, -2 * l_size_0);
                v79 = {
                    UIStroke = v4.createElement("UIStroke", {
                        Color = l_v69_0.Color, 
                        Transparency = l_v69_0.Transparency, 
                        Thickness = l_size_0
                    }), 
                    UICorner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v49.props.border.cornerRadius)
                    })
                };
                v78 = v6.Dictionary.join(v49.props, v77);
            end;
            return v4.createElement(v7, v78, {
                ButtonContent = v4.createElement("Frame", {
                    Size = v80, 
                    BackgroundTransparency = 1
                }, v6.Dictionary.join(v79, v76))
            });
        end);
    end);
end;
return function(v82)
    local l_v82_0 = v82;
    if not (not v23.enableNewMenuLayout or not v82.enableTokenOverride) then
        l_v82_0 = v6.Dictionary.join(v24.getDropdownMenuCellDefaultTokens((v10())), v82);
    end;
    local v84 = v21(v22.RoundedRectNoInset);
    if v23.migrateToNewSelectionCursor then
        l_v82_0 = v6.Dictionary.join({
            selectionCursor = v84
        }, l_v82_0);
    end;
    return v4.createElement(v25, l_v82_0);
end;
