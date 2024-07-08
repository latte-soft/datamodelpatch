local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.createSignal);
local v2 = {
    prototype = {}
};
v2.__index = v2.prototype;
local function v5(v3)
    assert(typeof(v3) == "number");
    local v4 = {
        __goal = nil, 
        __state = {
            value = v3, 
            complete = true
        }, 
        __onComplete = v1(), 
        __onStep = v1(), 
        __running = false
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.prototype.start = function(v6)
    if not v6.__running then
        v6.__connection = l_RunService_0.Heartbeat:Connect(function(v7)
            v6:step(v7);
        end);
        v6.__running = true;
        return ;
    else
        return ;
    end;
end;
v2.prototype.stop = function(v8)
    if v8.__connection ~= nil then
        v8.__connection:Disconnect();
    end;
    v8.__running = false;
end;
v2.prototype.step = function(v9, v10)
    assert(typeof(v10) == "number");
    if not v9.__state.complete then
        if v9.__goal == nil then
            return ;
        else
            local v11 = v9.__goal:step(v9.__state, v10);
            if v11 ~= nil then
                v9.__state = v11;
            end;
            v9.__onStep:fire(v9.__state.value);
            if not (not v9.__state.complete or not v9.__running) then
                v9:stop();
                v9.__onComplete:fire(v9.__state.value);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v2.prototype.setGoal = function(v12, v13)
    v12.__goal = v13;
    v12.__state.complete = false;
    v12:start();
end;
v2.prototype.onStep = function(v14, v15)
    assert(typeof(v15) == "function");
    return v14.__onStep:subscribe(v15);
end;
v2.prototype.onComplete = function(v16, v17)
    assert(typeof(v17) == "function");
    return v16.__onComplete:subscribe(v17);
end;
v2.prototype.destroy = function(v18)
    v18:stop();
end;
return v5;
