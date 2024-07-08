local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.enumerate);
local v7 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Control.Enum.ControlState);
local v10 = require(l_Core_0.Button.getContentStyle);
local v11 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v12 = require(l_Core_0.Utility.bindingValidator);
local v13 = require(l_Core_0.ImageSet.Validator.validateImage);
local v14 = require(l_Core_0.Style.Validator.validateColorInfo);
local v15 = require(l_Core_0.Style.withStyle);
local v16 = require(l_Core_0.Button.HoverButtonBackground);
local v17 = require(l_Core_0.ImageSet.ImageSetComponent);
local v18 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v19 = require(l_script_FirstAncestor_0.SelectionImage.withSelectionCursorProvider);
local v20 = require(l_script_FirstAncestor_0.SelectionImage.CursorKind);
local l_Focusable_0 = require(l_Parent_1.RoactGamepad).Focusable;
local v22 = require(l_Parent_0.Utility.isCallable);
local v23 = require(l_Parent_0.App.SelectionCursor.withCursor);
local v24 = UDim.new(0, 8);
local v25 = v5.PureComponent:extend("IconButton");
v25.debugProps = v6("debugProps", {
    "controlState"
});
v25.validateProps = v4.strictInterface({
    onStateChanged = v4.optional(v22), 
    isDisabled = v4.optional(v4.boolean), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    colorDefault = v4.optional(v14), 
    colorHover = v4.optional(v14), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v22), 
    onAbsolutePositionChanged = v4.optional(v22), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.union(v4.UDim2, v4.table)), 
    size = v4.optional(v4.union(v4.UDim2, v4.table)), 
    icon = v4.optional(v13), 
    iconSize = v4.optional(v18.isEnumValue), 
    iconColor3 = v4.optional(v4.Color3), 
    iconTransparency = v4.optional(v4.union(v4.number, v12(v4.number))), 
    showBackground = v4.optional(v4.boolean), 
    backgroundColor = v4.optional(v14), 
    backgroundTransparency = v4.optional(v4.union(v4.number, v12(v4.number))), 
    [v5.Children] = v4.optional(v4.table), 
    [v25.debugProps.controlState] = v4.optional(v9.isEnumValue), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    inputBindings = v4.optional(v4.table), 
    buttonRef = v4.optional(v4.union(v4.callback, v4.table)), 
    [v5.Change.AbsoluteSize] = v4.optional(v4.callback)
});
v25.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = nil, 
    icon = "", 
    iconSize = v18.Medium, 
    colorStyleDefault = "SystemPrimaryDefault", 
    colorStyleHover = "SystemPrimaryDefault", 
    iconColor3 = nil, 
    iconTransparency = nil, 
    showBackground = false, 
    backgroundColor = nil, 
    backgroundTransparency = nil, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    [v25.debugProps.controlState] = nil
};
v25.init = function(v26)
    v26:setState({
        controlState = v9.Initialize
    });
    v26.onStateChanged = function(v27, v28)
        v26:setState({
            controlState = v28
        });
        if v26.props.onStateChanged then
            v26.props.onStateChanged(v27, v28);
        end;
    end;
    local v29 = {
        [v18.Small] = 1, 
        [v18.Medium] = 2, 
        [v18.Large] = 3, 
        [v18.XLarge] = 4, 
        [v18.XXLarge] = 5
    };
    v26.getSize = function(v30)
        if not v26.props.size then
            local v31 = v30 + 4 * v29[v26.props.iconSize];
            return UDim2.fromOffset(v31, v31);
        else
            return v26.props.size;
        end;
    end;
end;
v25.render = function(v32)
    return v15(function(v33)
        return v19(function(v34)
            if not v7.useNewSelectionCursor then
                return v32:renderWithProviders(v33, v34);
            else
                return v23(function(v35)
                    return v32:renderWithProviders(v33, v34, v35.getCursor);
                end);
            end;
        end);
    end);
end;
v25.renderWithProviders = function(v36, v37, v38, v39)
    local v40 = v11(v36.props.iconSize, v37);
    local v41 = v36.getSize(v40);
    local l_showBackground_0 = v36.props.showBackground;
    local v43 = v36.props[v25.debugProps.controlState] or v36.state.controlState;
    local v44 = v10({
        [v9.Default] = v36.props.colorStyleDefault, 
        [v9.Hover] = v36.props.colorStyleHover
    }, v43, v37);
    local v45 = nil;
    v45 = if v36.props.backgroundColor == nil then v37.Theme.UIMuted else v36.props.backgroundColor;
    return v5.createElement(l_Focusable_0[v8], {
        AnchorPoint = v36.props.anchorPoint, 
        LayoutOrder = v36.props.layoutOrder, 
        Position = v36.props.position, 
        Size = v41, 
        isDisabled = v36.props.isDisabled, 
        onStateChanged = v36.onStateChanged, 
        userInteractionEnabled = v36.props.userInteractionEnabled, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v5.Change.AbsoluteSize] = v36.props[v5.Change.AbsoluteSize], 
        [v5.Change.AbsolutePosition] = v36.props.onAbsolutePositionChanged, 
        [v5.Event.Activated] = v36.props.onActivated, 
        [v5.Ref] = v36.props.buttonRef, 
        NextSelectionLeft = v36.props.NextSelectionLeft, 
        NextSelectionRight = v36.props.NextSelectionRight, 
        NextSelectionUp = v36.props.NextSelectionUp, 
        NextSelectionDown = v36.props.NextSelectionDown, 
        inputBindings = v36.props.inputBindings, 
        SelectionImageObject = if not v7.useNewSelectionCursor then v38(v20.RoundedRectNoInset) else v39(v24)
    }, {
        sizeConstraint = v5.createElement("UISizeConstraint", {
            MinSize = Vector2.new(v40, v40)
        }), 
        imageLabel = v5.createElement(v17.Label, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(v40, v40), 
            BackgroundTransparency = 1, 
            Image = v36.props.icon, 
            ImageColor3 = v36.props.iconColor3 or v44.Color, 
            ImageTransparency = v36.props.iconTransparency or v44.Transparency
        }, v36.props[v5.Children]), 
        hoverBackground = v43 == v9.Hover and v5.createElement(v16) or nil, 
        background = not not l_showBackground_0 and v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v45.Color, 
            BackgroundTransparency = v36.props.backgroundTransparency or v45.Transparency, 
            ZIndex = not v7.useNewThemeColorPalettes and 0 or -10
        }, {
            corner = v5.createElement("UICorner", {
                CornerRadius = v24
            })
        }) or nil
    });
end;
return v25;
