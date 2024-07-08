local v0 = require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux);
local v1 = require(script.currentSquad);
local v2 = require(script.currentExperienceInvite);
local v3 = require(script.partialSquads);
return function(v4)
    return v0.combineReducers({
        currentSquad = v1(v4), 
        currentExperienceInvite = v2(v4), 
        partialSquads = v3()
    });
end;
