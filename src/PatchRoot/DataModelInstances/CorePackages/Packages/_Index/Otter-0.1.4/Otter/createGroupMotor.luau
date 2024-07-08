local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.assign);
local v2 = require(script.Parent.createSignal);
local v3 = {
    prototype = {}
};
v3.__index = v3.prototype;
local function v9(v4)
    assert(typeof(v4) == "table");
    local v5 = {};
    for v6, v7 in pairs(v4) do
        v5[v6] = {
            value = v7, 
            complete = true
        };
    end;
    local v8 = {
        __goals = {}, 
        __states = v5, 
        __allComplete = true, 
        __onComplete = v2(), 
        __onStep = v2(), 
        __running = false
    };
    setmetatable(v8, v3);
    return v8;
end;
v3.prototype.start = function(v10)
    if not v10.__running then
        v10.__connection = l_RunService_0.Heartbeat:Connect(function(v11)
            v10:step(v11);
        end);
        v10.__running = true;
        return ;
    else
        return ;
    end;
end;
v3.prototype.stop = function(v12)
    if v12.__connection ~= nil then
        v12.__connection:Disconnect();
        v12.__running = false;
    end;
end;
v3.prototype.step = function(v13, v14)
    assert(typeof(v14) == "number");
    if not v13.__allComplete then
        local v15 = true;
        local v16 = {};
        for v17, v18 in pairs(v13.__states) do
            if not v18.complete then
                local v19 = v13.__goals[v17];
                if v19 ~= nil then
                    local v20 = v19:step(v18, v14);
                    if v20 ~= nil then
                        v18 = v20;
                        v13.__states[v17] = v20;
                    end;
                else
                    v18.complete = true;
                end;
                if not v18.complete then
                    v15 = false;
                end;
            end;
            v16[v17] = v18.value;
        end;
        local l___allComplete_0 = v13.__allComplete;
        v13.__allComplete = v15;
        v13.__onStep:fire(v16);
        if not ((not v13.__allComplete or l___allComplete_0) or not v13.__running) then
            v13:stop();
            v13.__onComplete:fire(v16);
        end;
        return ;
    else
        return ;
    end;
end;
v3.prototype.setGoal = function(v22, v23)
    assert(typeof(v23) == "table");
    v22.__goals = v1({}, v22.__goals, v23);
    for v24 in pairs(v23) do
        local v25 = v22.__states[v24];
        if v25 == nil then
            error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(v24))), 2);
        end;
        v25.complete = false;
    end;
    v22.__allComplete = false;
    v22:start();
end;
v3.prototype.onStep = function(v26, v27)
    assert(typeof(v27) == "function");
    return v26.__onStep:subscribe(v27);
end;
v3.prototype.onComplete = function(v28, v29)
    assert(typeof(v29) == "function");
    return v28.__onComplete:subscribe(v29);
end;
v3.prototype.destroy = function(v30)
    v30:stop();
end;
return v9;
