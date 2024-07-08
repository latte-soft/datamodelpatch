local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Otter);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = require(l_Parent_0.UIBlox.Core.Control.Controllable);
local v7 = require(l_Parent_0.UIBlox.Core.Control.Enum.ControlState);
local v8 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.UIBlox.Utility.divideTransparency);
local v10 = require(l_Parent_0.UIBlox.Utility.lerp);
local v11 = {
    frequency = 4
};
local v12 = UDim2.new(0, -4, 0.5, 0);
local v13 = UDim2.new(0, 20, 0.5, 0);
local v14 = Rect.new(18, 18, 18, 18);
local v15 = Rect.new(18, 18, 18, 18);
local v16 = v2.PureComponent:extend("Toggle");
v16.validateProps = v3.strictInterface({
    isSelected = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onActivated = v3.callback, 
    layoutOrder = v3.optional(v3.integer), 
    anchorPoint = v3.optional(v3.Vector2), 
    position = v3.optional(v3.UDim2)
});
v16.init = function(v17)
    local v18 = not v17.props.isSelected and 0 or 1;
    v17.state = {
        progress = v18
    };
    v17.progressMotor = v1.createSingleMotor(v18);
    v17.progressMotor:onStep(function(v19)
        v17:setState({
            progress = v19
        });
    end);
    v17.setControlState = function(_, v21)
        v17:setState({
            controlState = v21
        });
    end;
end;
v16.render = function(v22)
    return v4(function(v23)
        local l_Theme_0 = v23.Theme;
        local l_controlState_0 = v22.state.controlState;
        local l_progress_0 = v22.state.progress;
        local v27 = l_controlState_0 == v7.Disabled and 2 or 1;
        local v28 = if l_controlState_0 == v7.Hover then l_Theme_0.SecondaryOnHover else l_Theme_0.SecondaryDefault;
        local l_Color_0 = v28.Color;
        local v30 = v9(v28.Transparency, v27);
        local v31 = v9(l_Theme_0.ContextualPrimaryDefault.Transparency, v27);
        local v32 = v10(v30, 1, l_progress_0);
        local v33 = v10(1, v31, l_progress_0);
        local v34 = v12:lerp(v13, l_progress_0);
        return v2.createElement(v6, {
            controlComponent = {
                component = "ImageButton", 
                props = {
                    BackgroundTransparency = 1, 
                    Image = "", 
                    Size = UDim2.fromOffset(60, 44), 
                    Position = v22.props.position, 
                    LayoutOrder = v22.props.layoutOrder, 
                    AnchorPoint = v22.props.anchorPoint, 
                    [v2.Event.Activated] = not v22.props.isDisabled and v22.props.onActivated
                }, 
                children = {
                    Track = v2.createElement(v8.Label, {
                        Size = UDim2.fromOffset(60, 36), 
                        BackgroundTransparency = 1, 
                        Image = v5["component_assets/circle_36_stroke_1"], 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v14, 
                        ImageTransparency = v32, 
                        ImageColor3 = l_Color_0, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }), 
                    Fill = v2.createElement(v8.Label, {
                        Size = UDim2.fromOffset(60, 36), 
                        BackgroundTransparency = 1, 
                        Image = v5["component_assets/circle_36"], 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = v15, 
                        ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
                        ImageTransparency = v33, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        ZIndex = 2
                    }), 
                    Knob = v2.createElement(v8.Label, {
                        Size = UDim2.fromOffset(44, 44), 
                        BackgroundTransparency = 1, 
                        Image = v5["component_assets/circle_28_padding_10"], 
                        ImageTransparency = v31, 
                        Position = v34, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ZIndex = 4
                    }), 
                    KnobShadow = v2.createElement(v8.Label, {
                        Size = UDim2.fromOffset(44, 44), 
                        BackgroundTransparency = 1, 
                        Image = v5["component_assets/dropshadow_28"], 
                        ImageTransparency = v31, 
                        Position = v34, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ZIndex = 3
                    })
                }
            }, 
            isDisabled = v22.props.isDisabled, 
            onStateChanged = v22.setControlState
        });
    end);
end;
v16.didMount = function(v35)
    v35.progressMotor:start();
end;
v16.didUpdate = function(v36, v37, _)
    if v37.isSelected ~= v36.props.isSelected then
        v36.progressMotor:setGoal(v1.spring(not v36.props.isSelected and 0 or 1, v11));
    end;
end;
v16.willUnmount = function(v39)
    v39.progressMotor:destroy();
end;
return v16;
