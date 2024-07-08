local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Otter_0 = v0.Otter;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v8 = require(script.Parent.Parent.Utility.divideTransparency);
local v9 = require(script.Parent.AssetImage);
local v10 = UDim2.new(0, -3, 0.5, 0);
local v11 = UDim2.new(1, -39, 0.5, 0);
local v12 = {
    frequency = 4
};
local v13 = l_Roact_0.PureComponent:extend("ToggleSwitch");
v13.validateProps = l_t_0.strictInterface({
    checked = l_t_0.boolean, 
    onToggled = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    buttonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table)), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    NextSelectionUp = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table)), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    onSelectionGained = l_t_0.optional(l_t_0.callback)
});
v13.init = function(v14)
    local v15 = not v14.props.checked and 0 or 1;
    local v16, v17 = l_Roact_0.createBinding(v15);
    v14.progress = v16;
    v14.setProgress = v17;
    v14.fillTransparency = v14.progress:map(function(v18)
        return v8(1 - v18, not v14.props.disabled and 1 or 4);
    end);
    v14.knobPosition = v14.progress:map(function(v19)
        return v10:lerp(v11, v19);
    end);
    v14.motor = l_Otter_0.createSingleMotor(v15);
    v14.motor:onStep(v14.setProgress);
end;
v13.renderWithSelectionCursor = function(v20, v21)
    return l_withStyle_0(function(v22)
        return l_Roact_0.createElement(v9.Button, {
            Size = UDim2.new(0, 60, 0, 36), 
            BackgroundTransparency = 1, 
            Position = v20.props.Position, 
            LayoutOrder = v20.props.LayoutOrder, 
            imageKey = "ToggleOutline", 
            AnchorPoint = v20.props.AnchorPoint, 
            ImageColor3 = v22.Theme.SecondaryDefault.Color, 
            ImageTransparency = v8(v22.Theme.SecondaryDefault.Transparency, not v20.props.disabled and 1 or 4), 
            NextSelectionUp = v20.props.NextSelectionUp, 
            [l_Roact_0.Event.Activated] = v20.props.onToggled, 
            [l_Roact_0.Ref] = v20.props.buttonRef, 
            [l_Roact_0.Event.SelectionLost] = v20.props.onSelectionLost, 
            [l_Roact_0.Event.SelectionGained] = v20.props.onSelectionGained, 
            SelectionImageObject = v21(l_CursorKind_0.Toggle)
        }, {
            Fill = l_Roact_0.createElement(v9.Label, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                imageKey = "ToggleFill", 
                ImageColor3 = v22.Theme.Success.Color, 
                ImageTransparency = v20.fillTransparency
            }), 
            Knob = l_Roact_0.createElement(v9.Label, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 42, 0, 42), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = v20.knobPosition, 
                imageKey = "ToggleKnob", 
                ImageTransparency = v8(0, not v20.props.disabled and 1 or 4), 
                ZIndex = 2
            })
        });
    end);
end;
v13.render = function(v23)
    return l_withSelectionCursorProvider_0(function(v24)
        return v23:renderWithSelectionCursor(v24);
    end);
end;
v13.didUpdate = function(v25)
    v25.motor:setGoal(l_Otter_0.spring(not v25.props.checked and 0 or 1, v12));
end;
v13.willUnmount = function(v26)
    v26.motor:destroy();
end;
return v13;
