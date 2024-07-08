local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Parent.Parent.Parent.React);
local _ = require(script.Parent.Types);
local v4 = require(script.Parent.ProgressIcon);
local function v28(v5, v6, v7)
    local v8 = v2.useRef(0);
    local v9 = v2.useRef(0);
    local l_isAnimationRunning_0 = v5.isAnimationRunning;
    local l_isKeyPressed_0 = v5.isKeyPressed;
    local l_isKeyHolding_0 = v5.isKeyHolding;
    local l_onKeyHolding_0 = v6.onKeyHolding;
    local l_onAnimationRunning_0 = v6.onAnimationRunning;
    local l_onComplete_0 = v6.onComplete;
    local l_onReset_0 = v6.onReset;
    local l_animationTriggerTime_0 = v7.animationTriggerTime;
    local l_animationKeyHoldingTime_0 = v7.animationKeyHoldingTime;
    local l_animationCoolDownTime_0 = v7.animationCoolDownTime;
    local v21 = v2.useCallback(function(v20)
        v9.current = v9.current + v20;
        if l_animationTriggerTime_0 <= v9.current then
            l_onKeyHolding_0();
        end;
    end, {
        l_onKeyHolding_0, 
        l_animationTriggerTime_0
    });
    local v23 = v2.useCallback(function(v22)
        v8.current = math.clamp(v8.current + v22 / l_animationKeyHoldingTime_0, 0, 1);
        l_onAnimationRunning_0(v8.current);
        if v8.current >= 1 then
            l_onComplete_0();
        end;
    end, {
        l_onAnimationRunning_0, 
        l_animationKeyHoldingTime_0, 
        l_onComplete_0
    });
    local v25 = v2.useCallback(function(v24)
        v8.current = math.clamp(v8.current - v24 / l_animationCoolDownTime_0, 0, 1);
        l_onAnimationRunning_0(v8.current);
        if v8.current <= 0 then
            l_onReset_0();
        end;
    end, {
        l_onAnimationRunning_0, 
        l_animationCoolDownTime_0, 
        l_onReset_0
    });
    v2.useEffect(function()
        local v26 = nil;
        local v27 = nil;
        if not l_isKeyHolding_0 then
            if not l_isKeyPressed_0 then
                if l_isAnimationRunning_0 then
                    v27 = v25;
                end;
            else
                v27 = v21;
            end;
        else
            v8.current = 0;
            v27 = v23;
        end;
        if v27 then
            v26 = l_RunService_0.RenderStepped:Connect(v27);
        end;
        if not v26 then
            return function()
            end;
        else
            return function()
                if l_isKeyPressed_0 then
                    v9.current = 0;
                end;
                v26:Disconnect();
            end;
        end;
    end, {
        l_isKeyPressed_0, 
        l_isKeyHolding_0, 
        l_isAnimationRunning_0, 
        v21, 
        v23, 
        v25
    });
end;
return function(v29)
    local v30, v31 = v2.useState(false);
    local v32, v33 = v2.useState(false);
    local v34, v35 = v2.useState(false);
    local v36, v37 = v2.useState(false);
    local v38, v39 = v2.useBinding(nil);
    v28({
        isKeyPressed = v30, 
        isKeyHolding = v32, 
        isAnimationRunning = v34
    }, {
        onKeyHolding = v2.useCallback(function()
            v33(true);
            v35(true);
        end, {}), 
        onAnimationRunning = v2.useCallback(function(v40)
            v39(v40);
        end, {}), 
        onComplete = v2.useCallback(function()
            v31(false);
            v33(false);
            v35(false);
            v37(true);
            if v29.onHoldComplete then
                v29.onHoldComplete();
            end;
        end, {
            v29.onHoldComplete
        }), 
        onReset = v2.useCallback(function()
            v35(false);
            v39(nil);
        end, {})
    }, {
        animationTriggerTime = v29.animationTriggerTime, 
        animationKeyHoldingTime = v29.animationKeyHoldingTime, 
        animationCoolDownTime = v29.animationCoolDownTime
    });
    local v42 = v2.useCallback(function(v41)
        if v41.UserInputType ~= Enum.UserInputType.Keyboard and v41.UserInputType ~= Enum.UserInputType.Gamepad1 then
            return ;
        else
            if v41.KeyCode == v29.keyCode then
                if v41.UserInputState == Enum.UserInputState.Begin then
                    v31(true);
                    v37(false);
                    if not v34 then
                        v39(nil);
                        return ;
                    else
                        v33(true);
                        return ;
                    end;
                elseif v41.UserInputState == Enum.UserInputState.End then
                    v31(false);
                    v33(false);
                end;
            end;
            return ;
        end;
    end, {
        v29.keyCode, 
        v34
    });
    v2.useEffect(function()
        if not v29.progress then
            local v43 = l_UserInputService_0.InputBegan:Connect(v42);
            local v44 = l_UserInputService_0.InputEnded:Connect(v42);
            return function()
                v43:Disconnect();
                v44:Disconnect();
            end;
        else
            return function()
            end;
        end;
    end, {
        v42, 
        v29.progress
    });
    local v45 = false;
    if not (not ((v29.progress or v32) or v34) and not v36) then
        v45 = true;
    end;
    return v2.createElement(v4, {
        progress = v29.progress or v38, 
        icon = v29.icon, 
        iconHolding = v29.iconHolding, 
        isHolding = v45
    });
end;
