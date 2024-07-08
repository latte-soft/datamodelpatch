local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Otter);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local l_Focusable_0 = v6.Focusable;
local v9 = require(l_CorePackages_0.UIBlox);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local l_Colors_0 = v9.App.Style.Colors;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local v17 = l_Images_0["component_assets/dropshadow_28"];
local v18 = l_Images_0["component_assets/circle_29"];
local l_White_0 = l_Colors_0.White;
local l_Pumice_0 = l_Colors_0.Pumice;
local l_Pumice_1 = l_Colors_0.Pumice;
local v22 = {
    frequency = 5
};
local v23 = v5.PureComponent:extend("TwoAxisSlider");
v23.validateProps = v10.strictInterface({
    mapPositionToScales = v10.callback, 
    mapScalesToPosition = v10.callback, 
    setScales = v10.callback, 
    xScaleRules = v10.table, 
    yScaleRules = v10.table, 
    xScale = v10.number, 
    yScale = v10.number, 
    getBackgroundAbsolutePosition = v10.callback, 
    getBackgroundAbsoluteSize = v10.callback, 
    invertDPadX = v10.optional(v10.boolean), 
    invertDPadY = v10.optional(v10.boolean), 
    isDisabled = v10.optional(v10.boolean), 
    onDragStart = v10.optional(v10.callback), 
    onDragEnd = v10.optional(v10.callback)
});
v23.disconnectDragConnections = function(v24)
    if v24.dragChangeListen then
        v24.dragChangeListen:Disconnect();
        v24.dragChangeListen = nil;
    end;
    if v24.dragEndListen then
        v24.dragEndListen:Disconnect();
        v24.dragEndListen = nil;
    end;
end;
v23.init = function(v25)
    v25.dragChangeListen = nil;
    v25.dragEndListen = nil;
    v25.knobRef = v5.createRef();
    v25.selectionObjectRef = v5.createRef();
    v25.totalMoveTime = 0;
    v25.unhandledTime = 0;
    v25.firstMove = true;
    v25.state = {
        gamepadActive = false
    };
    local v26, v27 = v5.createBinding(0);
    local v28, v29 = v5.createBinding(0);
    local v30 = v5.joinBindings({
        pressed = v26, 
        hovered = v28
    });
    v25.knobColorMapping = v26:map(function(v31)
        return l_White_0:lerp(l_Pumice_0, v31);
    end);
    v25.knobShadowTransparencyMapping = v30:map(function(v32)
        return v11.lerp(v11.lerp(0.7, 0.5, v32.hovered), 1, v32.pressed);
    end);
    v25.pressedMotor = v4.createSingleMotor(0);
    v25.pressedMotor:onStep(v27);
    v25.hoveredMotor = v4.createSingleMotor(0);
    v25.hoveredMotor:onStep(v29);
    v25.mouseEnter = function()
        v25.hoveredMotor:setGoal(v4.spring(1, v22));
    end;
    v25.mouseLeave = function()
        v25.hoveredMotor:setGoal(v4.spring(0, v22));
    end;
    v25.nonGamepadInputChanged = function(v33)
        if v33.UserInputType ~= Enum.UserInputType.MouseMovement and v33.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        else
            local v34 = v25.props.getBackgroundAbsolutePosition();
            local v35 = v25.props.getBackgroundAbsoluteSize();
            if not (not v34 or not v35) then
                local l_Position_0 = v33.Position;
                v25.props.setScales(v25.props.mapPositionToScales((Vector2.new((l_Position_0.X - v34.X) / v35.X, (l_Position_0.Y - v34.Y) / v35.Y))));
            end;
            return ;
        end;
    end;
    v25.nonGamepadInputEnded = function(v37)
        if v37.UserInputType ~= Enum.UserInputType.MouseButton1 and v37.UserInputType ~= Enum.UserInputType.Touch then
            return ;
        else
            if v25.props.onDragEnd then
                v25.props.onDragEnd();
            end;
            v25:disconnectDragConnections();
            v25.pressedMotor:setGoal(v4.spring(0, v22));
            return ;
        end;
    end;
    v25.nonGamepadInputBegan = function(_, v39)
        local v40 = false;
        if v39.UserInputState == Enum.UserInputState.Begin then
            v40 = true;
            if v39.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v40 = v39.UserInputType == Enum.UserInputType.Touch;
            end;
        end;
        if not (v25.props.isDisabled or v25.dragChangeListen) and v40 then
            if v25.props.onDragStart then
                v25.props.onDragStart();
            end;
            v25.dragChangeListen = l_UserInputService_0.InputChanged:connect(v25.nonGamepadInputChanged);
            v25.dragEndListen = l_UserInputService_0.InputEnded:connect(v25.nonGamepadInputEnded);
            v25.pressedMotor:setGoal(v4.spring(1, v22));
            return ;
        else
            return ;
        end;
    end;
    v25.disableGamepadInput = function()
        v25:setState({
            gamepadActive = false
        });
    end;
    v25.onAPressed = function(_)
        if not v25.state.gamepadActive then
            if not v25.props.isDisabled then
                v25:setState({
                    gamepadActive = true
                });
            end;
            return ;
        else
            v25:setState({
                gamepadActive = false
            });
            return ;
        end;
    end;
    v25.moveSlider = function(v42, v43)
        local v44 = l_GamepadUtils_0.normalizeStickByDeadzone(v42[Enum.KeyCode.Thumbstick1].Position);
        local v45 = v44 ~= Vector2.new(0, 0);
        local v46 = Vector2.new((v42[Enum.KeyCode.DPadLeft].Position.z == 1 and -1 or 0) + (v42[Enum.KeyCode.DPadRight].Position.z == 1 and 1 or 0), (v42[Enum.KeyCode.DPadUp].Position.z == 1 and 1 or 0) + (v42[Enum.KeyCode.DPadDown].Position.z == 1 and -1 or 0));
        local l_xScale_0 = v25.props.xScale;
        local l_yScale_0 = v25.props.yScale;
        local l_l_xScale_0_0 = l_xScale_0;
        local l_l_yScale_0_0 = l_yScale_0;
        if not v45 then
            if v46 ~= Vector2.new(0, 0) then
                v25.totalMoveTime = v25.totalMoveTime + v43;
                local v51 = nil;
                if not v25.firstMove then
                    if v25.totalMoveTime > 0.2 then
                        local v52 = (v43 - math.max(0.2 - (v25.totalMoveTime - v43), 0)) + v25.unhandledTime;
                        v51 = math.floor(8 * v52);
                        v25.unhandledTime = v52 - v51 / 8;
                    else
                        v51 = 0;
                        v25.unhandledTime = 0;
                    end;
                else
                    v51 = 1;
                    v25.unhandledTime = 0;
                    v25.firstMove = false;
                end;
                local v53 = Vector2.new(not v25.props.invertDPadX and 1 or -1, not v25.props.invertDPadY and 1 or -1);
                local v54 = (v51 - 1) + 0.51;
                if v46.x == 0 then
                    l_l_xScale_0_0 = l_xScale_0;
                else
                    local l_xScaleRules_0 = v25.props.xScaleRules;
                    l_l_xScale_0_0 = math.clamp(l_xScaleRules_0.min + v11.Round((l_xScale_0 + ((v46.x * v53.x) * l_xScaleRules_0.increment) * v54) - l_xScaleRules_0.min, l_xScaleRules_0.increment), l_xScaleRules_0.min, l_xScaleRules_0.max);
                end;
                if v46.y == 0 then
                    l_l_yScale_0_0 = l_yScale_0;
                else
                    local l_yScaleRules_0 = v25.props.yScaleRules;
                    l_l_yScale_0_0 = math.clamp(l_yScaleRules_0.min + v11.Round((l_yScale_0 + ((v46.y * v53.y) * l_yScaleRules_0.increment) * v54) - l_yScaleRules_0.min, l_yScaleRules_0.increment), l_yScaleRules_0.min, l_yScaleRules_0.max);
                end;
            else
                v25.totalMoveTime = 0;
                v25.unhandledTime = 0;
                v25.firstMove = true;
            end;
        else
            v25.totalMoveTime = v25.totalMoveTime + v43;
            local v57, v58 = v25.props.mapPositionToScales(v25.props.mapScalesToPosition(l_xScale_0, l_yScale_0) + (Vector2.new(v44.x, -v44.y) * 1) * v43);
            l_l_xScale_0_0 = v57;
            l_l_yScale_0_0 = v58;
            v25.unhandledTime = 0;
            v25.firstMove = false;
        end;
        if not (l_l_xScale_0_0 == l_xScale_0) or l_l_yScale_0_0 ~= l_yScale_0 then
            v25.props.setScales(l_l_xScale_0_0, l_l_yScale_0_0);
        end;
    end;
end;
v23.render = function(v59)
    local l_gamepadActive_0 = v59.state.gamepadActive;
    local l_isDisabled_0 = v59.props.isDisabled;
    local v62 = v59.props.mapScalesToPosition(v59.props.xScale, v59.props.yScale);
    return l_withSelectionCursorProvider_0(function(v63)
        return v5.createFragment({
            Knob = v5.createElement(l_Focusable_0[l_ImageSetLabel_0], {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v62.X, 0, v62.Y, 0), 
                Size = UDim2.fromOffset(30, 30), 
                Image = v18, 
                ImageColor3 = not not l_isDisabled_0 and l_Pumice_1 or v59.knobColorMapping, 
                ImageTransparency = not l_isDisabled_0 and 0 or 0.5, 
                Active = true, 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                [v5.Event.InputBegan] = v59.nonGamepadInputBegan, 
                [v5.Event.MouseEnter] = v59.mouseEnter, 
                [v5.Event.MouseLeave] = v59.mouseLeave, 
                [v5.Ref] = v59.knobRef, 
                onFocusLost = v59.disableGamepadInput, 
                inputBindings = {
                    ToggleGamepadInput = v6.Input.onBegin(Enum.KeyCode.ButtonA, v59.onAPressed), 
                    DisableGamepadInput = if not l_gamepadActive_0 then nil else v6.Input.onBegin(Enum.KeyCode.ButtonB, v59.disableGamepadInput), 
                    MoveSlider = not not l_gamepadActive_0 and v6.Input.onMoveStep(v59.moveSlider) or nil
                }, 
                NextSelectionLeft = not not l_gamepadActive_0 and v59.knobRef or nil, 
                NextSelectionRight = not not l_gamepadActive_0 and v59.knobRef or nil, 
                NextSelectionUp = not not l_gamepadActive_0 and v59.knobRef or nil, 
                NextSelectionDown = not not l_gamepadActive_0 and v59.knobRef or nil, 
                SelectionImageObject = v63(not not l_gamepadActive_0 and l_CursorKind_0.SelectedKnob or l_CursorKind_0.UnselectedKnob)
            }), 
            KnobShadow = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v62.X, 0, v62.Y, 0), 
                Size = UDim2.new(0, 48, 0, 48), 
                Image = v17, 
                ImageTransparency = if not l_isDisabled_0 then v59.knobShadowTransparencyMapping else 1, 
                Active = true, 
                BackgroundTransparency = 1, 
                ZIndex = 1
            })
        });
    end);
end;
v23.willUnmount = function(v64)
    v64:disconnectDragConnections();
    v64.pressedMotor:destroy();
    v64.hoveredMotor:destroy();
end;
return v23;
