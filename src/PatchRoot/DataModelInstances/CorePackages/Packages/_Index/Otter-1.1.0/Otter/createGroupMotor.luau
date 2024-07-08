local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.Collections).Object;
local l_createSignal_0 = require(l_Parent_0.Signal).createSignal;
local v3 = require(script.Parent.Heartbeat);
local _ = require(script.Parent.types);
local v5 = {};
v5.__index = v5;
local function v15(v6)
    local v7 = {};
    for v8, v9 in pairs(v6) do
        v7[v8] = {
            value = v9, 
            complete = true
        };
    end;
    local v10, v11 = l_createSignal_0();
    local v12, v13 = l_createSignal_0();
    local v14 = {
        __goals = {}, 
        __states = v7, 
        __allComplete = true, 
        __onComplete = v10, 
        __fireOnComplete = v11, 
        __onStep = v12, 
        __fireOnStep = v13, 
        __running = false
    };
    setmetatable(v14, v5);
    return v14;
end;
v5.start = function(v16)
    if not v16.__running then
        v16.__connection = v3:Connect(function(v17)
            v16:step(v17);
        end);
        v16.__running = true;
        return ;
    else
        return ;
    end;
end;
v5.stop = function(v18)
    if v18.__connection ~= nil then
        v18.__connection:Disconnect();
        v18.__running = false;
    end;
end;
v5.step = function(v19, v20)
    if not v19.__allComplete then
        local v21 = true;
        local v22 = {};
        for v23, v24 in pairs(v19.__states) do
            if not v24.complete then
                local v25 = v19.__goals[v23];
                if v25 ~= nil then
                    local v26 = v25.step(v24, v20);
                    if v26 ~= nil then
                        v24 = v26;
                        v19.__states[v23] = v26;
                    end;
                else
                    v24.complete = true;
                end;
                if not v24.complete then
                    v21 = false;
                end;
            end;
            v22[v23] = v24.value;
        end;
        local l___allComplete_0 = v19.__allComplete;
        v19.__allComplete = v21;
        v19.__fireOnStep(v22);
        if not ((not v19.__allComplete or l___allComplete_0) or not v19.__running) then
            v19:stop();
            v19.__fireOnComplete(v22);
        end;
        return ;
    else
        return ;
    end;
end;
v5.setGoal = function(v28, v29)
    v28.__goals = l_Object_0.assign({}, v28.__goals, v29);
    for v30 in pairs(v29) do
        local v31 = v28.__states[v30];
        if v31 == nil then
            error(("Cannot set goal for the value %s because it doesn't exist"):format((tostring(v30))), 2);
        end;
        v31.complete = false;
    end;
    v28.__allComplete = false;
    v28:start();
end;
v5.onStep = function(v32, v33)
    local v34 = v32.__onStep:subscribe(v33);
    return function()
        v34:unsubscribe();
    end;
end;
v5.onComplete = function(v35, v36)
    local v37 = v35.__onComplete:subscribe(v36);
    return function()
        v37:unsubscribe();
    end;
end;
v5.destroy = function(v38)
    v38:stop();
end;
return v15;
