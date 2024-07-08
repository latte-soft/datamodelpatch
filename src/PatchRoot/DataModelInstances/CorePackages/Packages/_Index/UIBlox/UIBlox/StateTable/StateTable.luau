local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = {};
v1.__index = v1;
local function _(v2, v3)
    local v4 = typeof(v2);
    local v5 = true;
    if v4 ~= "string" then
        v5 = v4 == "userdata";
    end;
    assert(v5, string.format("%s '%s' must be a string or userdata but is a %s", v3, tostring(v2), v4));
end;
v1.new = function(v7, v8, v9, v10)
    assert(typeof(v7) == "string", "name must be a string");
    assert(#v7 > 0, "name must not be an empty string");
    local v11 = typeof(v8);
    local v12 = true;
    if v11 ~= "string" then
        v12 = v11 == "userdata";
    end;
    assert(v12, string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(v8), v11));
    v12 = true;
    if v9 ~= nil then
        v12 = typeof(v9) == "table";
    end;
    assert(v12, "initialContext must be a table or nil");
    assert(typeof(v10) == "table", "transitionTable must be a table");
    assert(typeof(v10[v8]) == "table", "initialState must be present in transitionTable");
    v11 = {};
    setmetatable(v11, v1);
    v11.name = v7;
    v11.currentState = v8;
    v11.currentContext = v9 or {};
    v11.transitionTable = {};
    v11.events = {};
    for v13, v14 in pairs(v10) do
        local v15 = typeof(v13);
        local v16 = true;
        if v15 ~= "string" then
            v16 = v15 == "userdata";
        end;
        assert(v16, string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(v13), v15));
        assert(typeof(v14) == "table", string.format("state '%s' must map to a table", (tostring(v13))));
        v15 = {};
        for v17, v18 in pairs(v14) do
            local v19 = typeof(v17);
            local v20 = true;
            if v19 ~= "string" then
                v20 = v19 == "userdata";
            end;
            assert(v20, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v17), v19));
            assert(typeof(v18) == "table", string.format("event '%s' must map to a table", (tostring(v17))));
            v19 = v18.nextState;
            v20 = v18.action;
            if v19 ~= nil then
                local v21 = typeof(v19);
                local v22 = true;
                if v21 ~= "string" then
                    v22 = v21 == "userdata";
                end;
                assert(v22, string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(v19), v21));
                assert(v10[v19] ~= nil, string.format("nextState '%s' does not exist in transitionTable", (tostring(v19))));
            end;
            local v23 = true;
            if v20 ~= nil then
                v23 = typeof(v20) == "function";
            end;
            assert(v23, "action must be a function");
            v15[v17] = v18;
            if v11.events[v17] == nil then
                v11.events[v17] = function(v24)
                    return v11:handleEvent(v17, v24);
                end;
            end;
        end;
        v11.transitionTable[v13] = v15;
    end;
    setmetatable(v11.events, {
        __index = function(_, v26)
            error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(v26), v11.name), 2);
        end
    });
    return v11;
end;
v1.handleEvent = function(v27, v28, v29)
    local v30 = typeof(v28);
    local v31 = true;
    if v30 ~= "string" then
        v31 = v30 == "userdata";
    end;
    assert(v31, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v28), v30));
    v31 = true;
    if v29 ~= nil then
        v31 = typeof(v29) == "table";
    end;
    assert(v31, "args must be nil or valid table");
    v30 = v27.currentState;
    v31 = v27.transitionTable[v30];
    assert(v31 ~= nil, "no transition events for current state");
    if v31[v28] ~= nil then
        local v32 = v31[v28];
        local v33 = v32.nextState or v30;
        local l_action_0 = v32.action;
        local l_currentContext_0 = v27.currentContext;
        if l_action_0 ~= nil then
            l_currentContext_0 = v0.Dictionary.join(v27.currentContext, l_action_0(v30, v33, v29, v27.currentContext) or {});
            v27.currentContext = l_currentContext_0;
        end;
        v27.currentState = v33;
        if v27.stateChangeHandler ~= nil then
            v27.stateChangeHandler(v30, v33, l_currentContext_0);
        end;
    end;
end;
v1.onStateChange = function(v36, v37)
    local v38 = true;
    if v37 ~= nil then
        v38 = typeof(v37) == "function";
    end;
    assert(v38, "stateChangeHandler must be nil or a function");
    v36.stateChangeHandler = v37;
end;
return v1;
