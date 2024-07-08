local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.StateTable);
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        transitionTable = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.withName = function(v3, v4)
    assert(typeof(v4) == "string", "stateTableName must be a string");
    assert(#v4 > 0, "stateTableName must not be empty");
    assert(v3.stateTableName == nil, "Cannot call withName twice");
    v3.stateTableName = v4;
    return v3;
end;
v1.withInitialState = function(v5, v6)
    assert(typeof(v6) == "string", "initialState must be a string");
    assert(#v6 > 0, "initialState must not be empty");
    assert(v5.initialState == nil, "Cannot call withInitialState twice");
    v5.initialState = v6;
    return v5;
end;
v1.withInitialContext = function(v7, v8)
    assert(typeof(v8) == "table", "initialContext must be a table");
    assert(v7.initialContext == nil, "Cannot call withInitialContext twice");
    v7.initialContext = v8;
    return v7;
end;
v1.addState = function(v9, v10)
    assert(typeof(v10) == "string", "stateName must be a string");
    assert(#v10 > 0, "stateName must not be empty");
    assert(v9.transitionTable[v10] == nil, string.format("Cannot add the same state '%s' twice", v10));
    v9.transitionTable[v10] = {};
    v9.currentStateName = v10;
    v9.currentEventName = nil;
    return v9;
end;
v1.withEvent = function(v11, v12)
    assert(typeof(v12) == "string", "eventName must be a string");
    assert(#v12 > 0, "eventName must not be empty");
    assert(v11.currentStateName ~= nil, "Cannot add an event without first specifying a state via addState()");
    assert(v11.transitionTable[v11.currentStateName][v12] == nil, "Cannot add an event to the same state more than once");
    v11.transitionTable[v11.currentStateName][v12] = {};
    v11.currentEventName = v12;
    return v11;
end;
v1.nextState = function(v13, v14)
    assert(typeof(v14) == "string", "stateName must be a string");
    assert(#v14 > 0, "stateName must not be empty");
    assert(v13.currentEventName ~= nil, "Must specify an event before attaching nextState, via withEvent()");
    assert(v13.transitionTable[v13.currentStateName][v13.currentEventName].nextState == nil, "Cannot set nextState twice for the same event transition");
    v13.transitionTable[v13.currentStateName][v13.currentEventName].nextState = v14;
    return v13;
end;
v1.action = function(v15, v16)
    assert(typeof(v16) == "function", "actionFunctor must be a function");
    assert(v15.currentEventName ~= nil, "Must specify an event before attaching action, via withEvent()");
    assert(v15.transitionTable[v15.currentStateName][v15.currentEventName].action == nil, "Cannot set action twice for the same event transition");
    v15.transitionTable[v15.currentStateName][v15.currentEventName].action = v16;
    return v15;
end;
v1.build = function(v17)
    local v18 = false;
    if v17.stateTableName ~= nil then
        v18 = #v17.stateTableName > 0;
    end;
    assert(v18, "State table name was not set via withName()");
    v18 = false;
    if v17.initialState ~= nil then
        v18 = #v17.initialState > 0;
    end;
    assert(v18, "Initial state was not set via withInitialState()");
    assert(typeof(v17.transitionTable[v17.initialState]) == "table", "Initial state was not added to state table");
    return v0.new(v17.stateTableName, v17.initialState, v17.initialContext, v17.transitionTable);
end;
return v1;
