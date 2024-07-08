local v0 = require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux);
local v1 = require(script.Users.byUserId);
local v2 = require(script.Users.byUsername);
return function(v3)
    return v0.combineReducers({
        byUserId = v1(v3), 
        byUsername = v2(v3)
    });
end;
