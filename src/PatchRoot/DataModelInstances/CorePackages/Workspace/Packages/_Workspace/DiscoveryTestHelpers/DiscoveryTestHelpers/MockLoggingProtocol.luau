local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {
        StandardizedFields = {}, 
        sentEvents = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.logRobloxTelemetryEvent = function(v2, v3, _, _)
    table.insert(v2.sentEvents, v3);
end;
v0.mockGetSentEvents = function(v6)
    return v6.sentEvents;
end;
v0.mockClearSentEvents = function(v7)
    v7.sentEvents = {};
end;
return v0;
