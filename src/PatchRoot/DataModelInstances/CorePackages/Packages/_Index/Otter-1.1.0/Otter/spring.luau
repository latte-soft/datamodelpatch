local l_assign_0 = require(script.Parent.Parent.Collections).Object.assign;
local _ = require(script.Parent.types);
local l_abs_0 = math.abs;
local l_exp_0 = math.exp;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_sqrt_0 = math.sqrt;
local function _(v7, v8, v9)
    return v7 / (2 * l_sqrt_0(v9 * v8)), (l_sqrt_0(v8 / v9) / 2) / 3.141592653589793;
end;
return function(v11, v12)
    local v13 = {
        dampingRatio = 1, 
        frequency = 1, 
        restingVelocityLimit = 0.001, 
        restingPositionLimit = 0.01
    };
    if v12 ~= nil then
        l_assign_0(v13, v12);
    end;
    local v14 = nil;
    local v15 = nil;
    local l_restingVelocityLimit_0 = v13.restingVelocityLimit;
    local l_restingPositionLimit_0 = v13.restingPositionLimit;
    local l_damping_0 = v13.damping;
    local l_stiffness_0 = v13.stiffness;
    local l_mass_0 = v13.mass;
    if (typeof(l_damping_0) == "number" and typeof(l_stiffness_0) == "number") and typeof(l_mass_0) == "number" then
        local v21 = l_damping_0 / (2 * l_sqrt_0(l_mass_0 * l_stiffness_0));
        local v22 = (l_sqrt_0(l_stiffness_0 / l_mass_0) / 2) / 3.141592653589793;
        local l_v21_0 = v21;
        local l_v22_0 = v22;
        v14 = l_v21_0;
        v15 = l_v22_0;
    else
        v14 = v13.dampingRatio;
        v15 = v13.frequency;
    end;
    local l_v14_0 = v14;
    local v26 = (v15 * 2) * 3.141592653589793;
    assert(l_restingVelocityLimit_0 >= 0, "Expected restingVelocityLimit >= 0");
    assert(l_restingPositionLimit_0 >= 0, "Expected restingPositionLimit >= 0");
    return {
        step = function(v27, v28)
            local l_value_0 = v27.value;
            local v30 = v27.velocity or 0;
            local v31 = l_value_0 - v11;
            local v32 = l_exp_0((-v28 * l_v14_0) * v26);
            local v33 = nil;
            local v34 = nil;
            if l_v14_0 == 1 then
                v33 = (v30 * v28 + v31 * (v26 * v28 + 1)) * v32 + v11;
                v34 = (v30 - (v26 * v28) * (v31 * v26 + v30)) * v32;
            elseif l_v14_0 < 1 then
                local v35 = l_sqrt_0(1 - l_v14_0 * l_v14_0);
                local v36 = l_cos_0((v26 * v35) * v28);
                local v37 = l_sin_0((v26 * v35) * v28);
                local v38 = nil;
                if v35 > 1.0E-4 then
                    v38 = v37 / v35;
                else
                    local v39 = v28 * v26;
                    v38 = v39 + (((((v39 * v39) * (v35 * v35)) * (v35 * v35)) / 20 - v35 * v35) * ((v39 * v39) * v39)) / 6;
                end;
                local v40 = nil;
                if v26 * v35 > 1.0E-4 then
                    v40 = v37 / (v26 * v35);
                else
                    local v41 = v26 * v35;
                    v40 = v28 + (((((v28 * v28) * (v41 * v41)) * (v41 * v41)) / 20 - v41 * v41) * ((v28 * v28) * v28)) / 6;
                end;
                v33 = (v31 * (v36 + l_v14_0 * v38) + v30 * v40) * v32 + v11;
                v34 = (v30 * (v36 - v38 * l_v14_0) - v31 * (v38 * v26)) * v32;
            else
                local v42 = l_sqrt_0(l_v14_0 * l_v14_0 - 1);
                local v43 = -v26 * (l_v14_0 - v42);
                local v44 = -v26 * (l_v14_0 + v42);
                local v45 = (v30 - v43 * v31) / ((2 * v26) * v42);
                local v46 = (v31 - v45) * l_exp_0(v43 * v28);
                local v47 = v45 * l_exp_0(v44 * v28);
                v33 = (v46 + v47) + v11;
                v34 = v43 * v46 + v44 * v47;
            end;
            local v48 = l_abs_0(v33 - v11);
            local v49 = l_abs_0(v34);
            local v50 = false;
            if v49 < l_restingVelocityLimit_0 then
                v50 = v48 < l_restingPositionLimit_0;
            end;
            if v50 then
                v33 = v11;
                v34 = 0;
            end;
            return {
                value = v33, 
                velocity = v34, 
                complete = v50
            };
        end
    };
end;
