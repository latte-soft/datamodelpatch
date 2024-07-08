local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_UIBlox_0 = v5.UIBlox;
local l_t_0 = v5.t;
local l_Otter_0 = v5.Otter;
local v10 = require(script.Parent.Connection.FocusHandler);
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v14 = require(script.Parent.Parent.Utility.divideTransparency);
local v15 = require(script.Parent.AssetImage);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v17 = {
    frequency = 5
};
local function v20(v18)
    local v19 = true;
    if v18 ~= Enum.UserInputType.Gamepad1 then
        v19 = true;
        if v18 ~= Enum.UserInputType.Gamepad2 then
            v19 = true;
            if v18 ~= Enum.UserInputType.Gamepad3 then
                v19 = true;
                if v18 ~= Enum.UserInputType.Gamepad4 then
                    v19 = true;
                    if v18 ~= Enum.UserInputType.Gamepad5 then
                        v19 = true;
                        if v18 ~= Enum.UserInputType.Gamepad6 then
                            v19 = true;
                            if v18 ~= Enum.UserInputType.Gamepad7 then
                                v19 = v18 == Enum.UserInputType.Gamepad8;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v19;
end;
local v21 = {};
local function v27()
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    if v20(l_l_UserInputService_0_LastInputType_0) then
        if v21[l_l_UserInputService_0_LastInputType_0] == nil then
            local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(l_l_UserInputService_0_LastInputType_0);
            local v24 = {};
            for _, v26 in ipairs(l_l_UserInputService_0_GamepadState_0) do
                v24[v26.KeyCode] = v26;
            end;
            v21[l_l_UserInputService_0_LastInputType_0] = v24;
        end;
        return v21[l_l_UserInputService_0_LastInputType_0];
    else
        return nil;
    end;
end;
local v28 = l_Roact_0.PureComponent:extend("Slider");
v28.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    min = l_t_0.number, 
    max = l_t_0.number, 
    stepInterval = l_t_0.numberPositive, 
    value = l_t_0.number, 
    valueChanged = l_t_0.callback, 
    disabled = l_t_0.optional(l_t_0.boolean), 
    width = l_t_0.optional(l_t_0.UDim), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    NextSelectionRight = l_t_0.optional(l_t_0.table), 
    sliderDotRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}), function(v29)
    if v29.max < v29.min then
        return false, "min must be less than or equal to max";
    elseif not (v29.max >= v29.value) or v29.value < v29.min then
        return false, "value must be within min and max";
    else
        return true;
    end;
end);
v28.defaultProps = {
    width = UDim.new(1, 0), 
    disabled = false
};
v28.init = function(v30)
    v30.state = {
        dragging = false, 
        hovering = false, 
        entryMode = false
    };
    v30.totalMoveTime = 0;
    v30.isFirstMove = true;
    v30.unhandledTime = 0;
    v30.rootButtonRef = l_Roact_0.createRef();
    v30.hoverRef = l_Roact_0.createRef();
    v30.hoverMotor = l_Otter_0.createSingleMotor(0);
    v30.hoverMotor:onStep(function(v31)
        local l_current_0 = v30.hoverRef.current;
        if l_current_0 ~= nil then
            l_current_0.Size = UDim2.new(0, v31, 0, v31);
        end;
    end);
    v30.onInputBegan = function(_, v34)
        if not v30.props.disabled then
            local l_UserInputType_0 = v34.UserInputType;
            if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                return ;
            else
                v30:processDrag(v34.Position.X);
                v30:startListeningForDrag();
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v28.renderFocusHandler = function(v36)
    return l_Roact_0.createElement(v10, {
        isFocused = v36.state.entryMode and v36.props.canCaptureFocus, 
        didFocus = function()
            l_GuiService_0.CoreGuiNavigationEnabled = false;
            v36.joystickListener = l_RunService_0.Heartbeat:Connect(function(v37)
                v36:onMoveStep(v37, (v27()));
            end);
            local l_value_0 = v36.props.value;
            l_ContextActionService_0:BindCoreAction("LeaveEntryMode", function(_, v40)
                if v40 == Enum.UserInputState.End then
                    v36:setState({
                        entryMode = false
                    });
                    v36.props.valueChanged(l_value_0);
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end, 
        didBlur = function()
            v36.joystickListener:Disconnect();
            l_GuiService_0.CoreGuiNavigationEnabled = true;
            l_ContextActionService_0:UnbindCoreAction("LeaveEntryMode");
            v36:setState({
                entryMode = false
            });
        end
    }) or nil;
end;
v28.renderWithSelectionCursor = function(v41, v42)
    local l_min_0 = v41.props.min;
    local v44 = (v41.props.value - l_min_0) / (v41.props.max - l_min_0);
    local v45 = math.abs(v44);
    local v46 = v44 / 2;
    local v47 = v41.state.entryMode and v41.props.canCaptureFocus;
    return l_withStyle_0(function(v48)
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            AnchorPoint = v41.props.AnchorPoint, 
            BackgroundTransparency = 1, 
            Image = "", 
            LayoutOrder = v41.props.LayoutOrder, 
            Position = v41.props.Position, 
            Size = UDim2.new(v41.props.width.Scale, v41.props.width.Offset, 0, 36), 
            [l_Roact_0.Ref] = v41.rootButtonRef, 
            [l_Roact_0.Event.InputBegan] = v41.onInputBegan, 
            Selectable = false
        }, {
            FocusHandler = v41:renderFocusHandler(), 
            Gutter = l_Roact_0.createElement(v15.Label, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                imageKey = "SliderCircle", 
                ImageColor3 = v48.Theme.UIMuted.Color, 
                ImageTransparency = v48.Theme.UIMuted.Transparency, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, 4)
            }, {
                FilledGutter = l_Roact_0.createElement(v15.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderCircle", 
                    ImageColor3 = v48.Theme.ContextualPrimaryDefault.Color, 
                    ImageTransparency = v14(v48.Theme.ContextualPrimaryDefault.Transparency, not v41.props.disabled and 1 or 2), 
                    Position = UDim2.new(v46, 0, 0.5, 0), 
                    Size = UDim2.new(v45, 0, 1, 0)
                })
            }), 
            DotTrack = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, -12, 1, 0), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ZIndex = 4, 
                Selectable = false
            }, {
                Dot = l_Roact_0.createElement(v15.Button, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderButton", 
                    Position = UDim2.new(v44, 0, 0.5, 0), 
                    Size = UDim2.new(0, 42, 0, 42), 
                    ImageTransparency = not v41.props.disabled and 0 or 0.5, 
                    ZIndex = 2, 
                    SelectionImageObject = v42(not not v47 and l_CursorKind_0.SelectedKnob or l_CursorKind_0.UnselectedKnob), 
                    [l_Roact_0.Event.Activated] = function(_, v50)
                        if v50.KeyCode == Enum.KeyCode.ButtonA then
                            v41:setState({
                                entryMode = not v41.state.entryMode
                            });
                        end;
                    end, 
                    [l_Roact_0.Event.InputBegan] = function(v51, v52)
                        if not v41.props.disabled then
                            if v52.UserInputType == Enum.UserInputType.MouseMovement then
                                v41:setState({
                                    hovering = true
                                });
                                return ;
                            else
                                v41.onInputBegan(v51, v52);
                                return ;
                            end;
                        else
                            return ;
                        end;
                    end, 
                    [l_Roact_0.Event.InputEnded] = function(_, v54)
                        if not v41.props.disabled then
                            if v54.UserInputType == Enum.UserInputType.MouseMovement then
                                v41:setState({
                                    hovering = false
                                });
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end, 
                    [l_Roact_0.Ref] = v41.props.sliderDotRef, 
                    [l_Roact_0.Event.SelectionLost] = v41.props.onSelectionLost, 
                    [l_Roact_0.Event.SelectionGained] = v41.props.onSelectionGained, 
                    NextSelectionRight = v41.props.NextSelectionRight
                }), 
                HoverOverlay = l_Roact_0.createElement(v15.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    imageKey = "SliderHover", 
                    Position = UDim2.new(v44, 0, 0.5, 0), 
                    Size = UDim2.new(0, 0, 0, 0), 
                    [l_Roact_0.Ref] = v41.hoverRef
                })
            })
        });
    end);
end;
v28.render = function(v55)
    return l_withSelectionCursorProvider_0(function(v56)
        return v55:renderWithSelectionCursor(v56);
    end);
end;
v28.didMount = function(v57)
    local l_current_1 = v57.rootButtonRef.current;
    local v59 = nil;
    v59 = l_current_1.AncestryChanged:Connect(function()
        if l_current_1:IsDescendantOf(game) then
            v59:Disconnect();
            v57.canUseUserInputService = l_current_1:FindFirstAncestorWhichIsA("PluginGui") == nil;
            return ;
        else
            return ;
        end;
    end);
    v57.hoverMotor:start();
end;
v28.didUpdate = function(v60)
    if v60.props.disabled then
        v60:stopListeningForDrag();
    end;
    local v61 = 0;
    if not (v60.props.disabled or not v60.state.dragging and not v60.state.hovering) then
        v61 = 42;
    end;
    v60.hoverMotor:setGoal(l_Otter_0.spring(v61, v17));
end;
v28.willUnmount = function(v62)
    v62.hoverMotor:stop();
    v62:disconnectDragEvents();
end;
v28.startListeningForDrag = function(v63)
    local l_current_2 = v63.rootButtonRef.current;
    if l_current_2 == nil then
        return ;
    elseif not v63.state.dragging then
        if not v63.canUseUserInputService then
            local l_l_current_2_FirstAncestorWhichIsA_0 = l_current_2:FindFirstAncestorWhichIsA("PluginGui");
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.Name = "SliderPluginGuiInputCapturer";
            l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageButton_0.ZIndex = 100000;
            v63.moveConnection = l_ImageButton_0.MouseMoved:Connect(function(v67)
                v63:processDrag(v67);
            end);
            v63.releaseConnection = l_ImageButton_0.MouseButton1Up:Connect(function(v68)
                v63:stopListeningForDrag();
                v63:processDrag(v68);
            end);
            v63.focusLostConnection = l_ImageButton_0.MouseLeave:Connect(function(v69)
                v63:stopListeningForDrag();
                v63:processDrag(v69);
            end);
            l_ImageButton_0.Parent = l_l_current_2_FirstAncestorWhichIsA_0;
            v63.inputCapturerButton = l_ImageButton_0;
        else
            v63.moveConnection = l_UserInputService_0.InputChanged:Connect(function(v70)
                if v63.state.dragging then
                    local l_UserInputType_1 = v70.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return ;
                    elseif v70.UserInputState ~= Enum.UserInputState.Change then
                        return ;
                    else
                        v63:processDrag(v70.Position.X);
                        return ;
                    end;
                else
                    return ;
                end;
            end);
            v63.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v72)
                local l_UserInputType_2 = v72.UserInputType;
                if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                    return ;
                else
                    v63:stopListeningForDrag();
                    v63:processDrag(v72.Position.X);
                    return ;
                end;
            end);
            v63.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function()
                v63:stopListeningForDrag();
            end);
        end;
        v63:setState({
            dragging = true
        });
        return ;
    else
        return ;
    end;
end;
v28.processDrag = function(v74, v75)
    local l_current_3 = v74.rootButtonRef.current;
    if l_current_3 == nil then
        return ;
    else
        local l_min_1 = v74.props.min;
        local l_max_0 = v74.props.max;
        local l_stepInterval_0 = v74.props.stepInterval;
        local l_X_0 = l_current_3.AbsoluteSize.X;
        local v81 = math.floor(((math.clamp(v75 - l_current_3.AbsolutePosition.X, 0, l_X_0) / l_X_0) * (l_max_0 - l_min_1) + l_min_1) / l_stepInterval_0 + 0.5) * l_stepInterval_0;
        if v81 ~= v74.props.value then
            v74.props.valueChanged(v81);
        end;
        return ;
    end;
end;
v28.disconnectDragEvents = function(v82)
    if v82.moveConnection ~= nil then
        v82.moveConnection:Disconnect();
        v82.moveConnection = nil;
    end;
    if v82.releaseConnection ~= nil then
        v82.releaseConnection:Disconnect();
        v82.releaseConnection = nil;
    end;
    if v82.focusLostConnection ~= nil then
        v82.focusLostConnection:Disconnect();
        v82.focusLostConnection = nil;
    end;
    if v82.inputCapturerButton ~= nil then
        v82.inputCapturerButton:Destroy();
        v82.inputCapturerButton = nil;
    end;
end;
v28.stopListeningForDrag = function(v83)
    if v83.state.dragging then
        v83:disconnectDragEvents();
        v83:setState({
            dragging = false
        });
        return ;
    else
        return ;
    end;
end;
v28.processGamepadInput = function(v84, v85, v86)
    local v87 = math.max(math.min(v84.props.value + (v84.props.stepInterval * v85) * v86, v84.props.max), v84.props.min);
    if v87 ~= v84.props.value then
        v84.props.valueChanged(v87);
    end;
end;
v28.onMoveStep = function(v88, v89, v90)
    local l_Position_0 = v90[Enum.KeyCode.Thumbstick1].Position;
    local v92 = l_Position_0.Magnitude > 0.2;
    local v93 = 0;
    local v94 = nil;
    local v95 = nil;
    local v96 = nil;
    v88.totalMoveTime = v88.totalMoveTime + v89;
    if not v92 then
        v95 = (v90[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (v90[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0);
        v94 = 0.5;
        v96 = 8;
    else
        v95 = l_Position_0.x > 0 and 1 or -1;
        v94 = 0.2;
        v96 = 12;
    end;
    if v95 ~= 0 then
        if not v88.isFirstMove then
            if v94 < v88.totalMoveTime then
                local v97 = (v89 - math.max((v94 - v88.totalMoveTime) - v89, 0)) + v88.unhandledTime;
                v93 = math.floor(v96 * v97);
                v88.unhandledTime = v97 - v93 / v96;
            else
                v93 = 0;
                v88.unhandledTime = 0;
            end;
        else
            v88.isFirstMove = false;
            v88.totalMoveTime = 0;
            v88.unhandledTime = 0;
            v93 = 1;
        end;
    else
        v88.totalMoveTime = 0;
        v88.isFirstMove = true;
    end;
    if v93 > 0 then
        v88:processGamepadInput(v95, v93);
    end;
end;
v28.getDerivedStateFromProps = function(v98)
    if v98.isMenuOpen then
        return nil;
    else
        return {
            entryMode = false
        };
    end;
end;
return v28;
