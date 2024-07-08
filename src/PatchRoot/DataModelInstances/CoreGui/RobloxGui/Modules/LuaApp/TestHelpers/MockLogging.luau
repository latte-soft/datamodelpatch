local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({
        loggedEvents = {}
    }, v0));
end;
v0.logEvent = function(v1, v2)
    if v1.loggedEvents[v2] == nil then
        v1.loggedEvents[v2] = 0;
    end;
    local l_loggedEvents_0 = v1.loggedEvents;
    l_loggedEvents_0[v2] = l_loggedEvents_0[v2] + 1;
end;
v0.logEventOnce = function(v4, v5)
    v4.loggedEvents[v5] = 1;
end;
return v0;
