local v0 = require(game:GetService("CorePackages").Cryo);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    assert(v2, "BlockingAnalytics must be passed the ID of the local user");
    local v4 = {
        _eventStreamImpl = v3.EventStream, 
        localUserId = v2
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.action = function(v5, v6, v7, v8)
    v5._eventStreamImpl:SendEventDeferred("AccountSettingsApi", v6, v7, (v0.Dictionary.join(v8 or {}, {
        blockerUserId = v5.localUserId
    })));
end;
return v1;
