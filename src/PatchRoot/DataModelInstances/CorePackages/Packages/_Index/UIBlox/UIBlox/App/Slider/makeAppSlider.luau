local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_0.Style.Colors);
local v6 = require(l_Parent_1.Core.Slider.GenericSlider);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = {
    frequency = 5
};
local v9 = require(l_Parent_1.Utility.divideTransparency);
local v10 = require(l_Parent_1.Utility.lerp);
return function(v11, v12)
    local v13 = v3.PureComponent:extend("AppSliderFor" .. v11);
    v13.defaultProps = {
        textInputEnabled = false, 
        stepInterval = 1, 
        width = UDim.new(1, 0), 
        customPressedKnobShadowTransparencyLower = 1
    };
    v13.init = function(v14)
        local v15 = nil;
        local v16 = nil;
        local v17, v18 = v3.createBinding(0);
        v14.pressedProgressLower = v17;
        v15 = v18;
        v17, v18 = v3.createBinding(0);
        v14.pressedProgressUpper = v17;
        v16 = v18;
        v17, v18 = v3.createBinding(v14.props.isDisabled);
        v14.disabled = v17;
        v14.setDisabled = v18;
        v17, v18 = v3.createBinding(v14.props.style);
        v14.style = v17;
        v14.setStyle = v18;
        v14.wasUnmounted = false;
        v17 = v3.joinBindings({
            disabled = v14.disabled, 
            pressedProgressLower = v14.pressedProgressLower, 
            pressedProgressUpper = v14.pressedProgressUpper, 
            style = v14.style
        });
        v14.trackColor = v17:map(function(v19)
            return v19.style.Theme.UIMuted.Color;
        end);
        v14.trackTransparency = v17:map(function(v20)
            return v9(v20.style.Theme.UIMuted.Transparency, not v20.disabled and 1 or 2);
        end);
        v14.trackFillColor = v17:map(function(v21)
            return v21.style.Theme[v11].Color;
        end);
        v14.trackFillTransparency = v17:map(function(v22)
            return v9(v22.style.Theme[v11].Transparency, not v22.disabled and 1 or 2);
        end);
        v14.knobColorLower = v17:map(function(v23)
            if not v23.disabled then
                local v24 = Color3.new(1, 1, 1);
                local l_Pumice_0 = v5.Pumice;
                if v11 ~= "SystemPrimaryDefault" then
                    l_Pumice_0 = v23.style.Theme[v11].Color;
                end;
                return v24:lerp(l_Pumice_0, v23.pressedProgressLower);
            else
                return v5.Pumice;
            end;
        end);
        v14.knobColorUpper = v17:map(function(v26)
            if not v26.disabled then
                local v27 = Color3.new(1, 1, 1);
                local l_Pumice_1 = v5.Pumice;
                if v11 ~= "SystemPrimaryDefault" then
                    l_Pumice_1 = v26.style.Theme[v11].Color;
                end;
                return v27:lerp(l_Pumice_1, v26.pressedProgressUpper);
            else
                return v5.Pumice;
            end;
        end);
        v14.knobTransparency = v17:map(function(v29)
            return v9(v29.style.Theme[v11].Transparency, not v29.disabled and 1 or 2);
        end);
        v14.knobShadowTransparencyLower = v17:map(function(v30)
            if not v30.disabled then
                return v10(v30.style.Theme.DropShadow.Transparency, v14.props.customPressedKnobShadowTransparencyLower, v30.pressedProgressLower);
            else
                return 1;
            end;
        end);
        v14.knobShadowTransparencyUpper = v17:map(function(v31)
            if not v31.disabled then
                return v10(v31.style.Theme.DropShadow.Transparency, 1, v31.pressedProgressUpper);
            else
                return 1;
            end;
        end);
        v14.pressedMotorLower = v4.createSingleMotor(0);
        v14.pressedMotorLower:onStep(v15);
        v14.pressedMotorUpper = v4.createSingleMotor(0);
        v14.pressedMotorUpper:onStep(v16);
        v14.onDragStartLower = function()
            if v14.props.onDragStartLower then
                v14.props.onDragStartLower();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorLower:setGoal(v4.spring(1, v8));
            end;
        end;
        v14.onDragStartUpper = function()
            if v14.props.onDragStartUpper then
                v14.props.onDragStartUpper();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorUpper:setGoal(v4.spring(1, v8));
            end;
        end;
        v14.onDragEnd = function()
            if v14.props.onDragEnd then
                v14.props.onDragEnd();
            end;
            if not v14.wasUnmounted then
                v14.pressedMotorLower:setGoal(v4.spring(0, v8));
                v14.pressedMotorUpper:setGoal(v4.spring(0, v8));
            end;
        end;
    end;
    v13.render = function(v32)
        local l_props_0 = v32.props;
        local v34 = {
            min = l_props_0.min, 
            max = l_props_0.max, 
            stepInterval = l_props_0.stepInterval, 
            isDisabled = l_props_0.isDisabled, 
            width = l_props_0.width, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            layoutOrder = l_props_0.layoutOrder, 
            onValueChanged = l_props_0.onValueChanged, 
            onDragStartLower = v32.onDragStartLower, 
            onDragStartUpper = v32.onDragStartUpper, 
            onDragEnd = v32.onDragEnd, 
            trackImage = v7["component_assets/circle_16"], 
            trackColor = v32.trackColor, 
            trackTransparency = v32.trackTransparency, 
            trackSliceCenter = Rect.new(8, 8, 8, 8), 
            trackFillImage = v7["component_assets/circle_16"], 
            trackFillColor = v32.trackFillColor, 
            trackFillTransparency = v32.trackFillTransparency, 
            trackFillSliceCenter = Rect.new(8, 8, 8, 8), 
            knobImage = v7["component_assets/circle_28_padding_10"], 
            knobColorLower = l_props_0.customKnobColorLower or v32.knobColorLower, 
            knobColorUpper = v32.knobColorUpper, 
            knobTransparency = v32.knobTransparency, 
            knobImagePadding = 10, 
            knobShadowImage = v7["component_assets/dropshadow_28"], 
            knobShadowTransparencyLower = v32.knobShadowTransparencyLower, 
            knobShadowTransparencyUpper = v32.knobShadowTransparencyUpper, 
            [v3.Ref] = l_props_0.forwardedRef, 
            NextSelectionUp = l_props_0.NextSelectionUp, 
            NextSelectionDown = l_props_0.NextSelectionDown, 
            focusController = l_props_0.focusController, 
            customTrack = l_props_0.customTrack, 
            customKnobHeight = l_props_0.customKnobHeight, 
            customKnobBorderSize = l_props_0.customKnobBorderSize, 
            customKnobBorderColor = l_props_0.customKnobBorderColor
        };
        if not v12 then
            v34.lowerValue = l_props_0.value;
        else
            v34.upperValue = l_props_0.upperValue;
            v34.lowerValue = l_props_0.lowerValue;
        end;
        return v3.createElement(v6, v34);
    end;
    v13.didMount = function(v35)
        v35.pressedMotorLower:start();
        v35.pressedMotorUpper:start();
    end;
    v13.didUpdate = function(v36, v37)
        if v37.style ~= v36.props.style then
            v36.setStyle(v36.props.style);
        end;
        if v37.isDisabled ~= v36.props.isDisabled then
            v36.setDisabled(v36.props.isDisabled);
            if v36.props.isDisabled then
                v36.pressedMotorLower:setGoal(v4.spring(0, v8));
                v36.pressedMotorUpper:setGoal(v4.spring(0, v8));
            end;
        end;
    end;
    v13.willUnmount = function(v38)
        v38.wasUnmounted = true;
        v38.pressedMotorLower:destroy();
        v38.pressedMotorUpper:destroy();
    end;
    return v13;
end;
