local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({
        trackers = {}
    }, v0));
end;
v0.toggle = function(v1, v2)
    v1[v2] = not v1[v2];
    return v1[v2];
end;
v0.set = function(v3, v4, v5)
    v3.trackers[v4] = v5;
end;
v0.get = function(v6, v7)
    return v6.trackers[v7];
end;
v0.reset = function(v8, v9)
    v8.trackers[v9] = nil;
end;
v0.startTime = function(v10, v11)
    v10.trackers[v11] = DateTime.now().UnixTimestampMillis;
end;
v0.finishTime = function(v12, v13)
    if not v12.trackers[v13] then
        return 0;
    else
        local v14 = DateTime.now().UnixTimestampMillis - v12.trackers[v13];
        v12.trackers[v13] = 0;
        return v14;
    end;
end;
return v0;
