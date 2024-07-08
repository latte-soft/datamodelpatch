local v0 = require(script:FindFirstAncestor("RoduxCall").Parent.Rodux);
local v1 = require(script.currentCall);
local v2 = require(script.suggestedCallees);
return function(v3)
    return v0.combineReducers({
        currentCall = v1(), 
        suggestedCallees = v2(v3)
    });
end;
