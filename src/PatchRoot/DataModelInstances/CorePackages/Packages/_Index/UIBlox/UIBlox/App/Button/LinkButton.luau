local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.enumerate);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Button.getContentStyle);
local v10 = require(l_Core_0.Text.GetTextSize);
local v11 = require(l_Core_0.Text.CleanRichTextTags);
local v12 = require(l_Core_0.Style.withStyle);
local v13 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v14 = require(l_Core_0.Button.HoverButtonBackground);
local v15 = require(l_script_FirstAncestor_0.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_script_FirstAncestor_0.SelectionCursor.withCursor);
local v17 = require(l_script_FirstAncestor_0.SelectionCursor.CursorType);
local l_Focusable_0 = require(l_Parent_1.RoactGamepad).Focusable;
local v19 = require(l_Parent_0.UIBloxConfig);
local v20 = v5.PureComponent:extend("LinkButton");
v20.debugProps = v6("debugProps", {
    "getTextSize", 
    "controlState"
});
v20.validateProps = v4.strictInterface({
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    fontStyle = v4.optional(v4.string), 
    colorStyleDefault = v4.optional(v4.string), 
    colorStyleHover = v4.optional(v4.string), 
    hoverBackgroundEnabled = v4.optional(v4.boolean), 
    underlineAlwaysEnabled = v4.optional(v4.boolean), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    size = v4.optional(v4.UDim2), 
    text = v4.optional(v4.string), 
    minPaddingX = v4.optional(v4.number), 
    minPaddingY = v4.optional(v4.number), 
    selectionCursorKind = v4.optional(v4.userdata), 
    [v20.debugProps.getTextSize] = v4.optional(v4.callback), 
    [v20.debugProps.controlState] = v4.optional(v8.isEnumValue), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    buttonRef = v4.optional(v4.union(v4.callback, v4.table))
});
v20.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    layoutOrder = 0, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.fromScale(0, 0), 
    text = "", 
    fontStyle = "Header2", 
    colorStyleDefault = "TextLink", 
    colorStyleHover = "TextLink", 
    hoverBackgroundEnabled = false, 
    underlineAlwaysEnabled = false, 
    isDisabled = false, 
    userInteractionEnabled = true, 
    minPaddingX = 8, 
    minPaddingY = 11, 
    [v20.debugProps.getTextSize] = v10, 
    [v20.debugProps.controlState] = nil
};
v20.init = function(v21)
    v21:setState({
        controlState = v8.Initialize
    });
    v21.applyRichTextUnderline = function(v22)
        return "<u>" .. v22 .. "</u>";
    end;
    v21.onStateChanged = function(v23, v24)
        v21:setState({
            controlState = v24
        });
        if v21.props.onStateChanged then
            v21.props.onStateChanged(v23, v24);
        end;
    end;
end;
v20.render = function(v25)
    if not v19.migrateToNewSelectionCursor then
        return v15(function(v26)
            return v25:renderWithSelectionCursorProvider(v26);
        end);
    else
        return v16(function(v27)
            return v25:renderWithSelectionCursorProvider(nil, (v27.getCursorByType(v17.RoundedRectNoInset)));
        end);
    end;
end;
v20.renderWithSelectionCursorProvider = function(v28, v29, v30)
    return v12(function(v31)
        local v32 = v28.props[v20.debugProps.controlState] or v28.state.controlState;
        local v33 = v9({
            [v8.Default] = v28.props.colorStyleDefault, 
            [v8.Hover] = v28.props.colorStyleHover
        }, v32, v31);
        local v34 = v31.Font[v28.props.fontStyle];
        if v28.props.underlineAlwaysEnabled == true and v32 == v8.Hover then
            v33.Transparency = 0.3;
        end;
        local v35 = v34.RelativeSize * v31.Font.BaseSize;
        local l_X_0 = v28.props[v20.debugProps.getTextSize](v11(v28.props.text), v35, v34.Font, Vector2.new(10000, 0)).X;
        local l_text_0 = v28.props.text;
        if not (not v28.props.underlineAlwaysEnabled and v32 ~= v8.Hover) or v32 == v8.Pressed then
            l_text_0 = v28.applyRichTextUnderline(v28.props.text);
        end;
        local v38 = Vector2.new(l_X_0 + v28.props.minPaddingX * 2, v35 + v28.props.minPaddingY * 2);
        local v39 = nil;
        if not v19.migrateToNewSelectionCursor then
            if v28.props.selectionCursorKind ~= nil then
                v39 = v29(v28.props.selectionCursorKind);
            end;
        else
            v39 = v30;
        end;
        local l_createElement_0 = v5.createElement;
        local v41 = if not v19.enableLinkButtonGamepadSupport then v7 else l_Focusable_0[v7];
        local v42 = {
            AnchorPoint = v28.props.anchorPoint, 
            LayoutOrder = v28.props.layoutOrder, 
            Position = v28.props.position, 
            Size = v28.props.size, 
            isDisabled = v28.props.isDisabled, 
            onStateChanged = v28.onStateChanged, 
            userInteractionEnabled = v28.props.userInteractionEnabled, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            SelectionImageObject = v39, 
            [v5.Event.Activated] = v28.props.onActivated, 
            [v5.Ref] = if not v19.enableLinkButtonGamepadSupport then nil else v28.props.buttonRef, 
            NextSelectionLeft = if not v19.enableLinkButtonGamepadSupport then nil else v28.props.NextSelectionLeft, 
            NextSelectionRight = if not v19.enableLinkButtonGamepadSupport then nil else v28.props.NextSelectionRight, 
            NextSelectionUp = if not v19.enableLinkButtonGamepadSupport then nil else v28.props.NextSelectionUp, 
            NextSelectionDown = if not v19.enableLinkButtonGamepadSupport then nil else v28.props.NextSelectionDown
        };
        local v43 = {
            sizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = v38
            }), 
            textLabel = v5.createElement(v13, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                fontStyle = v34, 
                colorStyle = v33, 
                RichText = true
            })
        };
        local l_hoverBackgroundEnabled_0 = v28.props.hoverBackgroundEnabled;
        if l_hoverBackgroundEnabled_0 then
            l_hoverBackgroundEnabled_0 = false;
            if v32 == v8.Hover then
                l_hoverBackgroundEnabled_0 = v5.createElement(v14);
            end;
        end;
        v43.background = l_hoverBackgroundEnabled_0;
        return l_createElement_0(v41, v42, v43);
    end);
end;
return v20;
