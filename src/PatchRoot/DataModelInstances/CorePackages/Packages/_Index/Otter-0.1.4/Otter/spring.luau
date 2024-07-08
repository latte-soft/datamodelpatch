local v0 = require(script.Parent.assign);
local l_abs_0 = math.abs;
local l_exp_0 = math.exp;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_sqrt_0 = math.sqrt;
local function v36(v6, v7, v8)
    local l___dampingRatio_0 = v6.__dampingRatio;
    local v10 = (v6.__frequency * 2) * 3.141592653589793;
    local l___goalPosition_0 = v6.__goalPosition;
    local l___restingVelocityLimit_0 = v6.__restingVelocityLimit;
    local l___restingPositionLimit_0 = v6.__restingPositionLimit;
    local l_value_0 = v7.value;
    local v15 = v7.velocity or 0;
    local v16 = l_value_0 - l___goalPosition_0;
    local v17 = l_exp_0((-v8 * l___dampingRatio_0) * v10);
    local v18 = nil;
    local v19 = nil;
    if l___dampingRatio_0 == 1 then
        v18 = (v15 * v8 + v16 * (v10 * v8 + 1)) * v17 + l___goalPosition_0;
        v19 = (v15 - (v10 * v8) * (v16 * v10 + v15)) * v17;
    elseif l___dampingRatio_0 < 1 then
        local v20 = l_sqrt_0(1 - l___dampingRatio_0 * l___dampingRatio_0);
        local v21 = l_cos_0((v10 * v20) * v8);
        local v22 = l_sin_0((v10 * v20) * v8);
        local v23 = nil;
        if v20 > 1.0E-4 then
            v23 = v22 / v20;
        else
            local v24 = v8 * v10;
            v23 = v24 + (((((v24 * v24) * (v20 * v20)) * (v20 * v20)) / 20 - v20 * v20) * ((v24 * v24) * v24)) / 6;
        end;
        local v25 = nil;
        if v10 * v20 > 1.0E-4 then
            v25 = v22 / (v10 * v20);
        else
            local v26 = v10 * v20;
            v25 = v8 + (((((v8 * v8) * (v26 * v26)) * (v26 * v26)) / 20 - v26 * v26) * ((v8 * v8) * v8)) / 6;
        end;
        v18 = (v16 * (v21 + l___dampingRatio_0 * v23) + v15 * v25) * v17 + l___goalPosition_0;
        v19 = (v15 * (v21 - v23 * l___dampingRatio_0) - v16 * (v23 * v10)) * v17;
    else
        local v27 = l_sqrt_0(l___dampingRatio_0 * l___dampingRatio_0 - 1);
        local v28 = -v10 * (l___dampingRatio_0 - v27);
        local v29 = -v10 * (l___dampingRatio_0 + v27);
        local v30 = (v15 - v28 * v16) / ((2 * v10) * v27);
        local v31 = (v16 - v30) * l_exp_0(v28 * v8);
        local v32 = v30 * l_exp_0(v29 * v8);
        v18 = (v31 + v32) + l___goalPosition_0;
        v19 = v28 * v31 + v29 * v32;
    end;
    local v33 = l_abs_0(v18 - v6.__goalPosition);
    local v34 = l_abs_0(v19);
    local v35 = false;
    if v34 < l___restingVelocityLimit_0 then
        v35 = v33 < l___restingPositionLimit_0;
    end;
    if v35 then
        v18 = v6.__goalPosition;
        v19 = 0;
    end;
    return {
        value = v18, 
        velocity = v19, 
        complete = v35
    };
end;
return function(v37, v38)
    assert(typeof(v37) == "number");
    local v39 = {
        dampingRatio = 1, 
        frequency = 1, 
        restingVelocityLimit = 0.001, 
        restingPositionLimit = 0.01
    };
    if v38 ~= nil then
        assert(typeof(v38) == "table");
        v0(v39, v38);
    end;
    local l_dampingRatio_0 = v39.dampingRatio;
    local l_frequency_0 = v39.frequency;
    local l_restingVelocityLimit_0 = v39.restingVelocityLimit;
    local l_restingPositionLimit_0 = v39.restingPositionLimit;
    assert(typeof(l_dampingRatio_0) == "number");
    assert(typeof(l_frequency_0) == "number");
    assert(typeof(l_restingVelocityLimit_0) == "number");
    assert(typeof(l_restingPositionLimit_0) == "number");
    assert(l_restingVelocityLimit_0 >= 0, "Expected restingVelocityLimit >= 0");
    assert(l_restingPositionLimit_0 >= 0, "Expected restingPositionLimit >= 0");
    return {
        __dampingRatio = l_dampingRatio_0, 
        __frequency = l_frequency_0, 
        __restingVelocityLimit = l_restingVelocityLimit_0, 
        __restingPositionLimit = l_restingPositionLimit_0, 
        __goalPosition = v37, 
        step = v36
    };
end;
