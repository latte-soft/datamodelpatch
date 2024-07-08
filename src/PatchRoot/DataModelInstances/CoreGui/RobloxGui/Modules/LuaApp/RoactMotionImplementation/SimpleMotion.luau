local l_RunService_0 = game:GetService("RunService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local v2 = require(script.Parent.stepSpring);
local v3 = require(script.Parent.merge);
local v4 = require(script.Parent.Config);
local v5 = require(script.Parent.MotionType);
local v6 = require(script.Parent.MotionSpecifier);
local v7 = v1.Component:extend("SimpleMotion");
local v8 = {};
l_RunService_0.RenderStepped:Connect(function(v9)
    for v10 in pairs(v8) do
        v10(v9);
    end;
end);
v7.init = function(v11)
    local v12 = {};
    local v13 = {};
    for v14, v15 in pairs(v11.props.style) do
        v13[v14] = 0;
        v12[v14] = v6.extractValue(v15);
    end;
    if v11.props.defaultStyle then
        for v16, v17 in pairs(v11.props.defaultStyle) do
            v12[v16] = v17;
        end;
    end;
    v11.resting = false;
    v11.wasResting = true;
    v11.accumulator = 0;
    v11.state = {
        values = v12, 
        velocities = v13
    };
end;
v7.render = function(v18)
    return v18.props.render(v18.state.values);
end;
v7.update = function(v19, v20)
    if not v19.resting then
        local v21 = v3(v19.state.values);
        local v22 = v3(v19.state.velocities);
        local v23 = false;
        v19.accumulator = v19.accumulator + v20 % v4.MAX_ACCUMULATION;
        while v4.UPDATE_RATE <= v19.accumulator do
            v19.accumulator = v19.accumulator - v4.UPDATE_RATE;
            local v24 = true;
            for v25, v26 in pairs(v19.props.style) do
                local v27 = v6.getType(v26);
                local v28 = nil;
                local v29 = nil;
                if v27 == v5.Instant then
                    v28 = v26;
                    v29 = 0;
                    v19.wasResting = false;
                elseif v27 == v5.Spring then
                    local v30, v31 = v2(v4.UPDATE_RATE * v4.TIME_FACTOR, v21[v25], v22[v25], v26.value, v26.stiffness, v26.damping, v26.precision);
                    v28 = v30;
                    v29 = v31;
                else
                    error(("Unsupported MotionType %q"):format(v27));
                end;
                v21[v25] = v28;
                v22[v25] = v29;
                if not (v28 == v19.state.values[v25]) or v29 ~= v19.state.velocities[v25] then
                    v23 = true;
                end;
                if not (v28 == v6.extractValue(v26)) or v29 ~= 0 then
                    v24 = false;
                end;
            end;
            if v24 then
                v19.resting = true;
                v19.accumulator = 0;
                break;
            end;
        end;
        if v23 then
            v19:setState({
                values = v21, 
                velocities = v22
            });
        end;
        if not ((v19.wasResting or not v19.resting) or not v19.props.onRested) then
            v19.props.onRested();
        end;
        v19.wasResting = v19.resting;
        return ;
    else
        return ;
    end;
end;
v7.didMount = function(v32)
    v32.renderCallback = function(v33)
        v32:update(v33);
    end;
    v8[v32.renderCallback] = true;
end;
v7.willUnmount = function(v34)
    v8[v34.renderCallback] = nil;
end;
v7.didUpdate = function(v35, v36)
    if v36 == v35.props then
        return ;
    else
        v35.resting = false;
        return ;
    end;
end;
return v7;
