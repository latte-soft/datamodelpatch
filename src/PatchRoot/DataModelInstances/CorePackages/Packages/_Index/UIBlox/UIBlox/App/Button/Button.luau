local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v5 = require(l_Parent_3.React);
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.RoactGamepad);
local v8 = require(l_Parent_3.t);
local v9 = require(l_Core_0.ImageSet.Validator.validateImage);
local v10 = require(l_Core_0.Style.Validator.validateFontInfo);
local v11 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v12 = require(l_Parent_0.Enum.ButtonType);
local v13 = require(l_Core_0.Button.Enum.StandardButtonSize);
local v14 = require(l_Core_0.Button.GenericButton);
local v15 = require(l_Core_0.Control.Enum.ControlState);
local v16 = require(l_Parent_2.Utility.isReactTagProp);
local v17 = require(l_Parent_1.ImageSet.Images);
local v18 = require(l_Parent_1.SelectionImage.CursorKind);
local v19 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v20 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v21 = require(l_Parent_2.UIBloxConfig);
local v22 = v5.PureComponent:extend("Button");
local v23 = {
    [v12.Alert] = {
        [v15.Default] = "Alert"
    }, 
    [v12.PrimaryContextual] = {
        [v15.Default] = "ContextualPrimaryDefault", 
        [v15.Hover] = "ContextualPrimaryOnHover"
    }, 
    [v12.PrimarySystem] = {
        [v15.Default] = "SystemPrimaryDefault", 
        [v15.Hover] = "SystemPrimaryOnHover"
    }, 
    [v12.Secondary] = {
        [v15.Default] = "SecondaryDefault", 
        [v15.Hover] = "SecondaryOnHover"
    }
};
local v24 = {
    [v12.Alert] = {
        [v15.Default] = "Alert"
    }, 
    [v12.PrimaryContextual] = {
        [v15.Default] = "ContextualPrimaryContent"
    }, 
    [v12.PrimarySystem] = {
        [v15.Default] = "SystemPrimaryContent"
    }, 
    [v12.Secondary] = {
        [v15.Default] = "SecondaryContent", 
        [v15.Hover] = "SecondaryOnHover"
    }
};
local v25 = {
    [v12.Alert] = v17["component_assets/circle_17_stroke_1"], 
    [v12.PrimaryContextual] = v17["component_assets/circle_17"], 
    [v12.PrimarySystem] = v17["component_assets/circle_17"], 
    [v12.Secondary] = v17["component_assets/circle_17_stroke_1"]
};
local v26 = {
    [v12.PrimaryContextual] = v17["component_assets/bulletRight_17"], 
    [v12.PrimarySystem] = v17["component_assets/bulletRight_17"]
};
local v27 = {
    [v12.Alert] = false, 
    [v12.PrimaryContextual] = true, 
    [v12.PrimarySystem] = false, 
    [v12.Secondary] = false
};
local v28 = UDim.new(0, 8);
v22.validateProps = v8.strictInterface({
    [v5.Tag] = v16, 
    buttonType = v8.optional(v12.isEnumValue), 
    automaticSize = v8.optional(v8.EnumItem), 
    size = v8.optional(v8.UDim2), 
    standardSize = v8.optional(v13.isEnumValue), 
    maxWidth = v8.optional(v8.numberPositive), 
    fitContent = v8.optional(v8.boolean), 
    anchorPoint = v8.optional(v8.Vector2), 
    position = v8.optional(v8.UDim2), 
    layoutOrder = v8.optional(v8.number), 
    icon = v8.optional(v9), 
    text = v8.optional(v8.string), 
    inputIcon = v8.optional(v9), 
    fontStyle = v8.optional(v8.union(v8.string, v10, v11)), 
    buttonTextOverride = v8.optional(v8.table), 
    isDisabled = v8.optional(v8.boolean), 
    isLoading = v8.optional(v8.boolean), 
    isHoverBackgroundEnabled = v8.optional(v8.boolean), 
    isDelayedInput = v8.optional(v8.boolean), 
    enableInputDelayed = v8.optional(v8.boolean), 
    delayInputSeconds = v8.optional(v8.numberPositive), 
    onActivated = v8.callback, 
    onStateChanged = v8.optional(v8.callback), 
    userInteractionEnabled = v8.optional(v8.boolean), 
    feedbackType = v8.optional(v8.string), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    buttonRef = v8.optional(v8.union(v8.table, v8.callback)), 
    cursor = v8.optional(v8.any), 
    [v5.Change.AbsoluteSize] = v8.optional(v8.callback), 
    [v5.Change.AbsolutePosition] = v8.optional(v8.callback)
});
v22.defaultProps = {
    buttonType = v12.PrimarySystem, 
    isDisabled = false, 
    isLoading = false
};
v22.render = function(v29)
    return v19(function(v30)
        return v5.createElement(v7.Focusable[v14], {
            [v5.Tag] = v29.props[v5.Tag], 
            Size = v29.props.size, 
            standardSize = v29.props.standardSize, 
            maxWidth = v29.props.maxWidth, 
            fitContent = v29.props.fitContent, 
            AnchorPoint = v29.props.anchorPoint, 
            Position = v29.props.position, 
            LayoutOrder = v29.props.layoutOrder, 
            SelectionImageObject = if not v29.props.cursor then v30(v18.RoundedRectNoInset) else v29.props.cursor, 
            icon = v29.props.icon, 
            text = v29.props.text, 
            inputIcon = v29.props.inputIcon, 
            fontStyle = v29.props.fontStyle, 
            isDisabled = v29.props.isDisabled, 
            isLoading = v29.props.isLoading, 
            isHoverBackgroundEnabled = v27[v29.props.buttonType], 
            isDelayedInput = v29.props.isDelayedInput, 
            enableInputDelayed = v29.props.enableInputDelayed, 
            delayInputSeconds = v29.props.delayInputSeconds, 
            onActivated = v29.props.onActivated, 
            onStateChanged = v29.props.onStateChanged, 
            userInteractionEnabled = v29.props.userInteractionEnabled, 
            buttonImage = v25[v29.props.buttonType], 
            delayedInputImage = v26[v29.props.buttonType], 
            buttonStateColorMap = v23[v29.props.buttonType], 
            contentStateColorMap = v24[v29.props.buttonType], 
            buttonTextOverride = v29.props.buttonTextOverride, 
            NextSelectionUp = v29.props.NextSelectionUp, 
            NextSelectionDown = v29.props.NextSelectionDown, 
            NextSelectionLeft = v29.props.NextSelectionLeft, 
            NextSelectionRight = v29.props.NextSelectionRight, 
            ref = v29.props.buttonRef, 
            feedbackType = v29.props.feedbackType, 
            [v5.Change.AbsoluteSize] = v29.props[v5.Change.AbsoluteSize], 
            [v5.Change.AbsolutePosition] = v29.props[v5.Change.AbsolutePosition]
        });
    end);
end;
local function v32(v31)
    return v5.createElement(v22, (v6.Dictionary.join({
        cursor = v20(v28)
    }, v31)));
end;
local v35 = v5.forwardRef(function(v33, v34)
    return v5.createElement(if not v21.useNewSelectionCursor then v22 else v32, v6.Dictionary.join(v33, {
        buttonRef = v34
    }));
end);
v35.validateProps = v22.validateProps;
return v35;
