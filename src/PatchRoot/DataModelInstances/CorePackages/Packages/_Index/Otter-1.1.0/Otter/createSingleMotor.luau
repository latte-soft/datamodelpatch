local l_createSignal_0 = require(script.Parent.Parent.Signal).createSignal;
local v1 = require(script.Parent.Heartbeat);
local _ = require(script.Parent.types);
local v3 = {};
v3.__index = v3;
local function v10(v4)
    local v5, v6 = l_createSignal_0();
    local v7, v8 = l_createSignal_0();
    local v9 = {
        __goal = nil, 
        __state = {
            value = v4, 
            complete = true
        }, 
        __onComplete = v5, 
        __fireOnComplete = v6, 
        __onStep = v7, 
        __fireOnStep = v8, 
        __running = false
    };
    setmetatable(v9, v3);
    return v9;
end;
v3.start = function(v11)
    if not v11.__running then
        v11.__connection = v1:Connect(function(v12)
            v11:step(v12);
        end);
        v11.__running = true;
        return ;
    else
        return ;
    end;
end;
v3.stop = function(v13)
    if v13.__connection ~= nil then
        v13.__connection:Disconnect();
    end;
    v13.__running = false;
end;
v3.step = function(v14, v15)
    if not v14.__state.complete then
        if v14.__goal == nil then
            return ;
        else
            local v16 = v14.__goal.step(v14.__state, v15);
            if v16 ~= nil then
                v14.__state = v16;
            end;
            v14.__fireOnStep(v14.__state.value);
            if not (not v14.__state.complete or not v14.__running) then
                v14:stop();
                v14.__fireOnComplete(v14.__state.value);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v3.setGoal = function(v17, v18)
    v17.__goal = v18;
    v17.__state.complete = false;
    v17:start();
end;
v3.onStep = function(v19, v20)
    local v21 = v19.__onStep:subscribe(v20);
    return function()
        v21:unsubscribe();
    end;
end;
v3.onComplete = function(v22, v23)
    local v24 = v22.__onComplete:subscribe(v23);
    return function()
        v24:unsubscribe();
    end;
end;
v3.destroy = function(v25)
    v25:stop();
end;
return v10;
