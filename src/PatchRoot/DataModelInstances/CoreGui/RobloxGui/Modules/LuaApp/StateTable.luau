local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_CorePackages_0.Logging);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7, v8)
    assert(typeof(v5) == "string", "name must be a string");
    assert(#v5 > 0, "name must not be an empty string");
    assert(typeof(v6) == "string", "initialState must be a string");
    assert(#v6 > 0, "initialState must not be an empty string");
    local v9 = true;
    if v7 ~= nil then
        v9 = typeof(v7) == "table";
    end;
    assert(v9, "initialContext must be a table or nil");
    assert(typeof(v8) == "table", "transitionTable must be a table");
    assert(typeof(v8[v6]) == "table", "initialState must be present in transitionTable");
    local v10 = {};
    setmetatable(v10, v4);
    v10.loggingEnabled = false;
    v10.name = v5;
    v10.currentState = v6;
    v10.currentContext = v7 or {};
    v10.transitionTable = {};
    v10.events = {};
    for v11, v12 in pairs(v8) do
        assert(typeof(v11) == "string", string.format("state name '%s' must be a string", (tostring(v11))));
        assert(typeof(v12) == "table", string.format("state name '%s' must map to a table", v11));
        local v13 = {};
        for v14, v15 in pairs(v12) do
            assert(typeof(v14) == "string", string.format("event name '%s' must be a string", (tostring(v14))));
            assert(typeof(v15) == "table", string.format("event name '%s' must map to a table", v14));
            local l_nextState_0 = v15.nextState;
            local l_action_0 = v15.action;
            if l_nextState_0 ~= nil then
                assert(typeof(l_nextState_0) == "string", string.format("nextState '%s' must be a string or nil", (tostring(l_nextState_0))));
                assert(v8[l_nextState_0] ~= nil, string.format("nextState '%s' does not exist in transitionTable", l_nextState_0));
            end;
            local v18 = true;
            if l_action_0 ~= nil then
                v18 = typeof(l_action_0) == "function";
            end;
            assert(v18, "action must be a function");
            v13[v14] = v15;
            if v10.events[v14] == nil then
                v10.events[v14] = function(v19)
                    return v10:handleEvent(v14, v19);
                end;
            end;
        end;
        v10.transitionTable[v11] = v13;
    end;
    setmetatable(v10.events, {
        __index = function(_, v21)
            error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(v21), v10.name), 2);
        end
    });
    return v10;
end;
v4.handleEvent = function(v22, v23, v24)
    assert(typeof(v23) == "string", "eventKey must be a string");
    assert(#v23 > 0, "eventKey must not be an empty string");
    local v25 = true;
    if v24 ~= nil then
        v25 = typeof(v24) == "table";
    end;
    assert(v25, "args must be nil or valid table");
    local l_currentState_0 = v22.currentState;
    v25 = v22.transitionTable[l_currentState_0];
    assert(v25 ~= nil);
    if v25[v23] ~= nil then
        local v27 = v25[v23];
        local v28 = v27.nextState or l_currentState_0;
        local l_action_1 = v27.action;
        if v22.loggingEnabled then
            print(string.format("%s: changing state, '%s' [%s] --> '%s'", v22.name, l_currentState_0, v23, v28));
        end;
        local l_currentContext_0 = v22.currentContext;
        if l_action_1 ~= nil then
            l_currentContext_0 = v2.JoinDictionaries(v22.currentContext, l_action_1(l_currentState_0, v28, v24, v22.currentContext) or {});
            v22.currentContext = l_currentContext_0;
        end;
        v22.currentState = v28;
        if v22.stateChangeHandler ~= nil then
            v22.stateChangeHandler(l_currentState_0, v28, l_currentContext_0);
            return ;
        end;
    elseif v22.loggingEnabled then
        v3.warn(string.format("%s: unhandled state transition (%s[%s])", v22.name, l_currentState_0, v23));
    end;
end;
v4.onStateChange = function(v31, v32)
    local v33 = true;
    if v32 ~= nil then
        v33 = typeof(v32) == "function";
    end;
    assert(v33, "stateChangeHandler must be nil or a function");
    v31.stateChangeHandler = v32;
end;
return v4;
