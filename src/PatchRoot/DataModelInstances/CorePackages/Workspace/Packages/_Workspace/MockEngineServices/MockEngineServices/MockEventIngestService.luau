local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {
        methodCalls = {}
    };
    setmetatable(v1, {
        __index = v0
    });
    return v1;
end;
v0._resetMockData = function(v2)
    v2.methodCalls = {};
end;
v0.setRBXEvent = function(v3, v4, v5, v6)
    table.insert(v3.methodCalls, {
        name = "setRBXEvent", 
        args = {
            eventContext = v4, 
            eventName = v5, 
            additionalArgs = v6
        }
    });
end;
v0.setRBXEventStream = function(v7, v8, v9, v10)
    table.insert(v7.methodCalls, {
        name = "setRBXEventStream", 
        args = {
            eventContext = v8, 
            eventName = v9, 
            additionalArgs = v10
        }
    });
end;
v0.sendEventImmediately = function(v11, v12, v13, v14)
    table.insert(v11.methodCalls, {
        name = "sendEventImmediately", 
        args = {
            eventContext = v12, 
            eventName = v13, 
            additionalArgs = v14
        }
    });
end;
v0.sendEventDeferred = function(v15, v16, v17, v18)
    table.insert(v15.methodCalls, {
        name = "sendEventDeferred", 
        args = {
            eventContext = v16, 
            eventName = v17, 
            additionalArgs = v18
        }
    });
end;
return v0;
