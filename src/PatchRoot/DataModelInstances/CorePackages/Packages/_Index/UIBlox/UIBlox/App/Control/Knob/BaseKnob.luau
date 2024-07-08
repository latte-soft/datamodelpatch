local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_0.ImageSet.Images);
local v7 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_1.Core.Control.Interactable);
local v9 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v10 = require(l_Parent_1.Core.Style.withStyle);
local v11 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v12 = v3.Component:extend("BaseKnob");
local v13 = {
    [v9.Default] = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 0.7
    }, 
    [v9.Hover] = {
        Color = Color3.fromRGB(0, 0, 0), 
        Transparency = 0.5
    }
};
local v14 = {
    [v9.Default] = UDim2.fromOffset(48, 48), 
    [v9.Hover] = UDim2.fromOffset(48, 48), 
    [v9.Pressed] = UDim2.fromOffset(0, 0), 
    [v9.Disabled] = UDim2.fromOffset(0, 0), 
    [v9.Selected] = UDim2.fromOffset(52, 52), 
    [v9.SelectedPressed] = UDim2.fromOffset(42, 42)
};
local v15 = {
    [v9.Default] = "component_assets/dropshadow_28", 
    [v9.Hover] = "component_assets/dropshadow_28", 
    [v9.Selected] = "component_assets/circle_52_stroke_3", 
    [v9.SelectedPressed] = "component_assets/circle_42_stroke_3"
};
v12.validateProps = v4.interface({
    onStateChanged = v4.optional(v4.callback), 
    isDisabled = v4.optional(v4.boolean), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    onActivated = v4.optional(v4.callback), 
    anchorPoint = v4.optional(v4.Vector2), 
    layoutOrder = v4.optional(v4.number), 
    position = v4.optional(v4.UDim2), 
    colorMap = v4.strictInterface({
        [v9.Default] = v11, 
        [v9.Hover] = v11, 
        [v9.Pressed] = v11, 
        [v9.Disabled] = v11, 
        [v9.Selected] = v11, 
        [v9.SelectedPressed] = v11
    }), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    controlRef = v4.optional(v4.table)
});
v12.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    userInteractionEnabled = true, 
    isDisabled = false
};
v12.init = function(v16)
    v16:setState({
        controlState = v9.Initialize
    });
    v16.onStateChanged = function(v17, v18)
        v16:setState({
            controlState = v18
        });
        if v16.props.onStateChanged then
            v16.props.onStateChanged(v17, v18);
        end;
    end;
end;
v12.render = function(v19)
    return v10(function(v20)
        local v21 = v19.props.colorMap[v19.state.controlState] or v19.props.colorMap[v9.Default];
        local v22 = v14[v19.state.controlState] or v14[v9.Default];
        local v23 = v15[v19.state.controlState] or v15[v9.Default];
        local v24 = true;
        if v19.state.controlState ~= v9.Selected then
            v24 = v19.state.controlState == v9.SelectedPressed;
        end;
        local v25 = v13[v19.state.controlState] or v13[v9.Default];
        if v24 then
            v25 = v20.Theme.SelectionCursor;
        end;
        return v3.createElement("Frame", {
            AnchorPoint = v19.props.anchorPoint, 
            LayoutOrder = v19.props.layoutOrder, 
            Position = v19.props.position, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(28, 28)
        }, {
            KnobShadow = v3.createElement(v7.Label, {
                Size = v22, 
                Position = UDim2.new(0.5, 0, 0.5, v24 and 0 or 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v6[v23], 
                ImageColor3 = v25.Color, 
                ImageTransparency = v25.Transparency, 
                Active = true, 
                BackgroundTransparency = 1
            }), 
            KnobButton = v3.createElement(v5.Focusable[v8], {
                Size = UDim2.fromScale(1, 1), 
                isDisabled = v19.props.isDisabled, 
                onStateChanged = v19.onStateChanged, 
                userInteractionEnabled = v19.props.userInteractionEnabled, 
                BackgroundTransparency = 1, 
                Image = v6["component_assets/circle_29"], 
                ImageColor3 = v21.Color, 
                ImageTransparency = v21.Transparency, 
                [v3.Ref] = v19.props.forwardedRef, 
                [v3.Event.Activated] = v19.props.onActivated, 
                NextSelectionLeft = v19.props.NextSelectionLeft, 
                NextSelectionRight = v19.props.NextSelectionRight, 
                NextSelectionUp = v19.props.NextSelectionUp, 
                NextSelectionDown = v19.props.NextSelectionDown
            })
        });
    end);
end;
return v12;
