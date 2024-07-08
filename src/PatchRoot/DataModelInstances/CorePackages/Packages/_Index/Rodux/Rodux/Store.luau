local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.NoYield);
local v10 = {
    reportReducerError = function(_, _, v5)
        error(string.format("Received error: %s\n\n%s", v5.message, v5.thrownValue));
    end, 
    reportUpdateError = function(_, _, _, v9)
        error(string.format("Received error: %s\n\n%s", v9.message, v9.thrownValue));
    end
};
local function v12(v11)
    return debug.traceback((tostring(v11)));
end;
local v13 = {
    _flushEvent = l_RunService_0.Heartbeat
};
v13.__index = v13;
v13.new = function(v14, v15, v16, v17, v18)
    assert(typeof(v14) == "function", "Bad argument #1 to Store.new, expected function.");
    local v19 = true;
    if v16 ~= nil then
        v19 = typeof(v16) == "table";
    end;
    assert(v19, "Bad argument #3 to Store.new, expected nil or table.");
    v19 = true;
    if v18 ~= nil then
        v19 = false;
        if typeof(v18) == "table" then
            v19 = v18.__className == "Devtools";
        end;
    end;
    assert(v19, "Bad argument #5 to Store.new, expected nil or Devtools object.");
    if v16 ~= nil then
        for v20 = 1, #v16 do
            assert(typeof(v16[v20]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(v16[v20]), v20));
        end;
    end;
    local v21 = {
        _source = string.match(debug.traceback(), "^.-\n(.-)\n"), 
        _errorReporter = v17 or v10, 
        _isDispatching = false, 
        _lastState = nil
    };
    v21.changed = v1.new(v21);
    v21._reducer = v14;
    v21._flushHandler = function(v22)
        v21.changed:fire(v22, v21._lastState);
    end;
    if v18 then
        v21._devtools = v18;
        v18:_hookIntoStore(v21);
    end;
    v19 = {
        type = "@@INIT"
    };
    v21._actionLog = {
        v19
    };
    local v23, v24 = xpcall(function()
        v21._state = v21._reducer(v15, v19);
    end, v12);
    if not v23 then
        v21._errorReporter.reportReducerError(v15, v19, {
            message = "Caught error in reducer with init", 
            thrownValue = v24
        });
        v21._state = v15;
    end;
    v21._lastState = v21._state;
    v21._mutatedSinceFlush = false;
    v21._connections = {};
    setmetatable(v21, v13);
    table.insert(v21._connections, (v21._flushEvent:Connect(function()
        v21:flush();
    end)));
    if v16 then
        local l_dispatch_0 = v21.dispatch;
        local function v26(...)
            return l_dispatch_0(v21, ...);
        end;
        for v27 = #v16, 1, -1 do
            v26 = v16[v27](v26, v21);
        end;
        do
            local l_v26_0 = v26;
            v21.dispatch = function(_, ...)
                return l_v26_0(...);
            end;
        end;
    end;
    return v21;
end;
v13.getState = function(v30)
    if v30._isDispatching then
        error(("You may not call store:getState() while the reducer is executing. " .. "The reducer (%s) has already received the state as an argument. " .. "Pass it down from the top reducer instead of reading it from the store."):format((tostring(v30._reducer))));
    end;
    return v30._state;
end;
v13.dispatch = function(v31, v32)
    if typeof(v32) ~= "table" then
        error(("Actions must be tables. " .. "Use custom middleware for %q actions."):format((typeof(v32))), 2);
    end;
    if v32.type == nil then
        error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(v32), 2);
    end;
    if v31._isDispatching then
        error("Reducers may not dispatch actions.");
    end;
    local l_status_0, l_result_0 = pcall(function()
        v31._isDispatching = true;
        v31._state = v31._reducer(v31._state, v32);
        v31._mutatedSinceFlush = true;
    end);
    v31._isDispatching = false;
    if not l_status_0 then
        v31._errorReporter.reportReducerError(v31._state, v32, {
            message = "Caught error in reducer", 
            thrownValue = l_result_0
        });
    end;
    if #v31._actionLog == 3 then
        table.remove(v31._actionLog, 1);
    end;
    table.insert(v31._actionLog, v32);
end;
v13.destruct = function(v35)
    for _, v37 in ipairs(v35._connections) do
        v37:Disconnect();
    end;
    v35._connections = nil;
end;
v13.flush = function(v38)
    if v38._mutatedSinceFlush then
        v38._mutatedSinceFlush = false;
        local l__state_0 = v38._state;
        local v40, v41 = xpcall(function()
            v2(v38._flushHandler, l__state_0);
        end, v12);
        if not v40 then
            v38._errorReporter.reportUpdateError(v38._lastState, l__state_0, v38._actionLog, {
                message = "Caught error flushing store updates", 
                thrownValue = v41
            });
        end;
        v38._lastState = l__state_0;
        return ;
    else
        return ;
    end;
end;
return v13;
