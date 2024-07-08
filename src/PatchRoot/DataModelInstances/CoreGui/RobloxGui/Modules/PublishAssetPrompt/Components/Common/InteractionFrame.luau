local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local function _(v6)
    local v7 = v6.UserInputType == Enum.UserInputType.Touch;
    local v8 = v6.UserInputType == Enum.UserInputType.MouseButton1;
    local v9 = v6.UserInputType == Enum.UserInputType.MouseButton2;
    return v7, v8 or v9, v8, v9;
end;
local v11 = v4.PureComponent:extend("InteractionFrame");
v11.defaultProps = {
    Visible = true
};
v11.validateProps = v5.interface({
    panByPixels = v5.callback, 
    rotateByPixels = v5.callback, 
    setAngularVelocityByPixels = v5.callback, 
    zoomToPoint = v5.callback, 
    doubleTap = v5.optional(v5.callback), 
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2), 
    Visible = v5.optional(v5.boolean), 
    ZIndex = v5.optional(v5.number)
});
v11.disconnectEvents = function(v12)
    v12.inputChangedConnection:Disconnect();
    v12.inputEndedConnection:Disconnect();
    v12.renderSteppedConnection:Disconnect();
    v12.inputChangedConnection = nil;
    v12.inputEndedConnection = nil;
    v12.renderSteppedConnection = nil;
end;
v11.getActiveInput = function(v13, v14)
    local v15 = v14.UserInputType == Enum.UserInputType.Touch;
    local v16 = v14.UserInputType == Enum.UserInputType.MouseButton1 or v14.UserInputType == Enum.UserInputType.MouseButton2;
    local l_v15_0 = v15;
    local v18 = v14.UserInputType == Enum.UserInputType.MouseMovement or v16;
    if v18 or l_v15_0 then
        local v19 = nil;
        if not v18 then
            if l_v15_0 then
                v19 = v13.activeTouchInputs[v14];
            end;
            return v19;
        else
            return v13.activeMouseInput;
        end;
    else
        return ;
    end;
end;
v11.removeActivePointerInput = function(v20, v21, v22)
    if not v22 then
        v20.activeTouchInputs[v21] = nil;
        v20.numActiveTouchInputs = v20.numActiveTouchInputs - 1;
    elseif l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        return ;
    else
        v20.activeMouseInput = nil;
    end;
    v20.numActiveInputs = v20.numActiveInputs - 1;
    if v20.numActiveInputs == 0 then
        v20:disconnectEvents();
    end;
end;
v11.handleDoubleTap = function(v23, v24, v25)
    if v23.lastPrimaryPointerInputBeganPosition then
        local v26 = v23.lastPrimaryPointerInputBeganPosition - v24.Position;
        local v27 = v25 - v23.lastPrimaryPointerInputBeganTime;
        if (v23.props.doubleTap and v26.Magnitude < 30) and v27 < 0.25 then
            v23.props.doubleTap();
        end;
    end;
    v23.lastPrimaryPointerInputBeganPosition = v24.Position;
    v23.lastPrimaryPointerInputBeganTime = v25;
end;
v11.addActivePointerInput = function(v28, v29, v30, v31)
    if not v28:getActiveInput(v29) then
        local v32 = {
            lastPosition = v29.Position, 
            lastTime = v31
        };
        if not v30 then
            v28.activeTouchInputs[v29] = v3.Dictionary.join(v32, {
                lastDeltaTime = 0, 
                lastDeltaPosition = Vector3.new(0, 0, 0)
            });
            v28.numActiveTouchInputs = v28.numActiveTouchInputs + 1;
        else
            v28.activeMouseInput = v32;
        end;
        v28.numActiveInputs = v28.numActiveInputs + 1;
        if v28.numActiveInputs == 1 then
            v28.props.setAngularVelocityByPixels(0);
            v28.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(v28.onInputChanged);
            v28.inputEndedConnection = l_UserInputService_0.InputEnded:Connect(v28.onInputEnded);
            v28.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(v28.setInputNotChanged);
        end;
        return ;
    else
        return ;
    end;
end;
v11.init = function(v33)
    v33.inputChangedConnection = nil;
    v33.inputEndedConnection = nil;
    v33.lastPinchDistance = 1;
    v33.lastPanTime = 0;
    v33.lastPrimaryPointerInputBeganTime = 0;
    v33.lastPrimaryPointerInputBeganPosition = nil;
    v33.activeTouchInputs = {};
    v33.numActiveTouchInputs = 0;
    v33.activeMouseInput = nil;
    v33.numActiveInputs = 0;
    v33.handleScroll = function(_, v35)
        if v35.UserInputType == Enum.UserInputType.MouseWheel then
            v33.props.zoomToPoint(-v35.Position.Z, l_UserInputService_0:GetMouseLocation());
        end;
    end;
    v33.setInputNotChanged = function(_)
        for _, v38 in v33.activeTouchInputs, nil, nil do
            v38.changedThisFrame = false;
        end;
    end;
    v33.onInputChanged = function(v39, _)
        local v41 = v39.UserInputType == Enum.UserInputType.MouseMovement;
        local v42 = v39.UserInputType == Enum.UserInputType.Touch;
        if v41 or v42 then
            local v43 = v33:getActiveInput(v39);
            if v43 then
                local v44 = tick();
                local v45 = v44 - v43.lastTime;
                local v46 = v39.Position - v43.lastPosition;
                local v47 = Vector2.new(v46.X, v46.Y) * Vector2.new(-1, 1);
                local v48 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1);
                local v49 = l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
                local v50 = v44 - v33.lastPanTime > 0.1;
                if not (not (v41 and v48 or v42 and v33.numActiveTouchInputs == 1) or not v50) then
                    v33.props.rotateByPixels(-v47);
                end;
                if v41 and v49 or v42 and v33.numActiveTouchInputs == 2 then
                    v33.props.panByPixels(v47 / v33.numActiveInputs);
                    v33.lastPanTime = v44;
                end;
                v43.lastPosition = v39.Position;
                v43.lastTime = v44;
                if v42 then
                    if not v43.changedThisFrame then
                        v43.lastDeltaPosition = v46;
                        v43.lastDeltaTime = v45;
                        v43.changedThisFrame = true;
                    else
                        v43.lastDeltaPosition = v46 + v43.lastDeltaPosition;
                        v43.lastDeltaTime = v45 + v43.lastDeltaTime;
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v33.onInputEnded = function(v51, _)
        local v53 = v51.UserInputType == Enum.UserInputType.Touch;
        local v54 = v51.UserInputType == Enum.UserInputType.MouseButton1;
        local v55 = v54 or v51.UserInputType == Enum.UserInputType.MouseButton2;
        local l_v53_0 = v53;
        local l_v55_0 = v55;
        local l_v54_0 = v54;
        if l_v53_0 or l_v55_0 then
            v54 = v33:getActiveInput(v51);
            if v54 then
                local v59 = tick();
                v55 = v59 - v33.lastPanTime;
                local v60 = l_v53_0 and v54.changedThisFrame;
                local v61 = false;
                if v33.numActiveInputs == 1 then
                    v61 = v55 > 0.1;
                end;
                if not (not v60 and not l_v54_0 or not v61) then
                    local v62 = nil;
                    local v63 = nil;
                    if not l_v54_0 then
                        v62 = v54.lastDeltaPosition;
                        v63 = v54.lastDeltaTime;
                    else
                        v62 = v51.Position - v54.lastPosition;
                        v63 = v59 - v54.lastTime;
                    end;
                    v33.props.setAngularVelocityByPixels(v62.X / v63);
                end;
                v33:removeActivePointerInput(v51, l_v55_0);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v33.onInputBegan = function(v64, v65)
        v33.handleScroll(v64, v65);
        local v66 = v65.UserInputType == Enum.UserInputType.Touch;
        local v67 = v65.UserInputType == Enum.UserInputType.MouseButton1;
        local v68 = v67 or v65.UserInputType == Enum.UserInputType.MouseButton2;
        local l_v66_0 = v66;
        local l_v68_0 = v68;
        local l_v67_0 = v67;
        if l_v66_0 or l_v68_0 then
            v67 = l_v66_0 or l_v67_0;
            local v72 = tick();
            if v67 then
                v33:handleDoubleTap(v65, v72);
            end;
            v33:addActivePointerInput(v65, l_v68_0, v72);
            return ;
        else
            return ;
        end;
    end;
    v33.onTouchPinch = function(_, v74, _, _, v77)
        if v74[2] == nil then
            return ;
        elseif v77 == Enum.UserInputState.Begin then
            v33.lastPinchDistance = (v74[1] - v74[2]).Magnitude;
            return ;
        else
            local l_Magnitude_0 = (v74[1] - v74[2]).Magnitude;
            local v79 = l_Magnitude_0 - v33.lastPinchDistance;
            v33.lastPinchDistance = l_Magnitude_0;
            v33.props.zoomToPoint(v79 * -0.05, (v74[1] + v74[2]) / 2);
            return ;
        end;
    end;
end;
v11.willUnmount = function(v80)
    if v80.inputChangedConnection then
        v80:disconnectEvents();
    end;
end;
v11.render = function(v81)
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v81.props.Size or UDim2.new(1, 0, 1, 0), 
        Position = v81.props.Position, 
        ZIndex = v81.props.ZIndex, 
        Visible = v81.props.Visible, 
        Active = true, 
        [v4.Event.InputBegan] = v81.onInputBegan, 
        [v4.Event.InputChanged] = v81.handleScroll, 
        [v4.Event.TouchPinch] = v81.onTouchPinch
    }, v81.props[v4.Children]);
end;
return v11;
