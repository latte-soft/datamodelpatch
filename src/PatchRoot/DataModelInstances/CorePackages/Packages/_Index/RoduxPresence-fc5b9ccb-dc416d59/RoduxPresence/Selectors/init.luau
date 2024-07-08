local v0 = require(script.getUserPresenceByUserId);
return function(v1)
    return {
        getUserPresenceByUserId = v0(v1)
    };
end;
