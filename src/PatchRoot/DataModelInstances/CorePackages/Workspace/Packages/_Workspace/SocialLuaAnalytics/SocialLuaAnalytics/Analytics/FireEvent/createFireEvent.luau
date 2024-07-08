local v0 = require(script.Parent.fireEventStream);
local v1 = require(script.Parent.fireDiag);
local _ = require(script.Parent.Parent.Types);
local function v9(v3, v4)
    local v5 = if not not v3.analytics.EventStream and v4.EventStream then v0({
        eventStreamImpl = v3.analytics.EventStream, 
        eventList = v4.EventStream, 
        infoForAllEvents = v3.infoForAllEvents, 
        loggerImpl = v3.loggerImpl
    }) else nil;
    local v6 = if not not v3.analytics.Diag and v4.Diag then v1({
        diagImpl = v3.analytics.Diag, 
        eventList = v4.Diag, 
        loggerImpl = v3.loggerImpl
    }) else nil;
    return function(v7, v8)
        if not ((not v6 or not v4.Diag) or not v4.Diag[v7]) then
            v6(v7, v8);
        end;
        if not ((not v5 or not v4.EventStream) or not v4.EventStream[v7]) then
            v5(v7, v8);
        end;
        return v7, v8;
    end;
end;
return function(v10)
    return function(v11)
        return (v9(v11, v10));
    end;
end;
