local v0 = require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux);
local v1 = require(script.Invites);
return function(v2)
    return v0.combineReducers({
        Invites = v1(v2)
    });
end;
