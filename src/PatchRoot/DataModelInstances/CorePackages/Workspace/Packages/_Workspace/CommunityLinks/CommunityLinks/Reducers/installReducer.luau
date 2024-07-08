local v0 = require(script:FindFirstAncestor("CommunityLinks").Parent.Rodux);
local v1 = require(script.Parent.ExperienceCommunityLinks);
return function()
    return v0.combineReducers({
        ExperienceCommunityLinks = v1
    });
end;
