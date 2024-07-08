local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.enumerate);
local v8 = require(l_Core_0.Control.Interactable);
local v9 = require(l_Core_0.Control.Enum.ControlState);
local v10 = require(l_Core_0.Button.getContentStyle);
local v11 = require(l_Core_0.Text.GetTextSize);
local v12 = require(l_Core_0.Text.CleanRichTextTags);
local v13 = require(l_Parent_0.Utility.isReactTagProp);
local v14 = require(l_script_FirstAncestor_0.SelectionImage.withSelectionCursorProvider);
local v15 = require(l_script_FirstAncestor_0.SelectionImage.CursorKind);
local v16 = require(l_Core_0.Style.Validator.validateColorInfo);
local v17 = require(l_Core_0.Style.withStyle);
local v18 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v19 = require(l_Core_0.Button.HoverButtonBackground);
local v20 = require(l_Parent_1.UIBlox.UIBloxConfig);
local v21 = require(l_Parent_0.App.SelectionCursor.withCursor);
local v22 = UDim.new(0, 8);
local v23 = v5.PureComponent:extend("TextButton");
v23.debugProps = v7("debugProps", {
    "getTextSize", 
    "controlState"
});
v23.validateProps = v4.strictInterface({
    [v6.Tag] = v13, 
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    richText = v4.optional(v4.boolean), 
    showBackground = v4.optional(v4.boolean), 
    backgroundColor = v4.optional(v16), 
    horizontalPadding = v4.optional(v4.number), 
    verticalPadding = v4.optional(v4.number), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    [v23.debugProps.getTextSize] = v4.optional(v4.callback), 
    [v23.debugProps.controlState] = v4.optional(v9.isEnumValue)
});
v23.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    verticalPadding = 11, 
    horizontalPadding = 8, 
    showBackground = false, 
    fontStyle = "Header2", 
    colorStyleDefault = "SystemPrimaryDefault", 
    colorStyleHover = "SystemPrimaryDefault", 
    hoverBackgroundEnabled = true, 
    richText = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    [v23.debugProps.getTextSize] = v11, 
    [v23.debugProps.controlState] = nil
};
v23.init = function(v24)
    v24:setState({
        controlState = v9.Initialize
    });
    v24.onStateChanged = function(v25, v26)
        v24:setState({
            controlState = v26
        });
        if v24.props.onStateChanged then
            v24.props.onStateChanged(v25, v26);
        end;
    end;
end;
v23.render = function(v27)
    return v17(function(v28)
        return v14(function(v29)
            if not v20.useNewSelectionCursor then
                return v27:renderWithProviders(v28, v29);
            else
                return v21(function(v30)
                    return v27:renderWithProviders(v28, v29, v30.getCursor);
                end);
            end;
        end);
    end);
end;
v23.renderWithProviders = function(v31, v32, v33, v34)
    local v35 = v31.props[v23.debugProps.controlState] or v31.state.controlState;
    local v36 = v10({
        [v9.Default] = v31.props.colorStyleDefault, 
        [v9.Hover] = v31.props.colorStyleHover
    }, v35, v32);
    local v37 = v32.Font[v31.props.fontStyle];
    local v38 = v37.RelativeSize * v32.Font.BaseSize;
    local l_X_0 = v31.props[v23.debugProps.getTextSize](not not v31.props.richText and v12(v31.props.text) or v31.props.text, v38, v37.Font, Vector2.new(10000, 0)).X;
    local l_showBackground_0 = v31.props.showBackground;
    local v41 = v31.props.backgroundColor or v32.Theme.UIMuted;
    local l_verticalPadding_0 = v31.props.verticalPadding;
    local l_horizontalPadding_0 = v31.props.horizontalPadding;
    local l_createElement_0 = v5.createElement;
    local l_v8_0 = v8;
    local v46 = {
        [v6.Tag] = v31.props[v6.Tag], 
        AnchorPoint = v31.props.anchorPoint, 
        LayoutOrder = v31.props.layoutOrder, 
        Position = v31.props.position, 
        Size = v31.props.size, 
        isDisabled = v31.props.isDisabled, 
        onStateChanged = v31.onStateChanged, 
        userInteractionEnabled = v31.props.userInteractionEnabled, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        SelectionImageObject = if not v34 then v33 and v33(v15.RoundedRectNoInset) else v34(v22), 
        [v5.Event.Activated] = v31.props.onActivated
    };
    local v47 = {
        sizeConstraint = v5.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_X_0 + l_horizontalPadding_0 * 2, v38 + l_verticalPadding_0 * 2)
        }), 
        textLabel = v5.createElement(v18, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Text = v31.props.text, 
            fontStyle = v37, 
            colorStyle = v36, 
            RichText = v31.props.richText
        })
    };
    local l_hoverBackgroundEnabled_0 = v31.props.hoverBackgroundEnabled;
    if l_hoverBackgroundEnabled_0 then
        l_hoverBackgroundEnabled_0 = false;
        if v35 == v9.Hover then
            l_hoverBackgroundEnabled_0 = v5.createElement(v19);
        end;
    end;
    v47.hoverBackground = l_hoverBackgroundEnabled_0;
    v47.background = not not l_showBackground_0 and v5.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v41.Color, 
        BackgroundTransparency = v31.props.backgroundTransparency or v41.Transparency, 
        ZIndex = not v20.useNewThemeColorPalettes and 0 or -10
    }, {
        corner = v5.createElement("UICorner", {
            CornerRadius = v22
        })
    }) or nil;
    return l_createElement_0(l_v8_0, v46, v47);
end;
return v23;
