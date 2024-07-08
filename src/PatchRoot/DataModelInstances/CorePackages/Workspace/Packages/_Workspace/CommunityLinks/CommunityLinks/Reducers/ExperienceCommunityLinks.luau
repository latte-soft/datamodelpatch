local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.Parent.Models.CommunityInfo);
return v1.createReducer({}, {
    [require(script.Parent.Parent.Actions.SetExperienceCommunityLink).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            [v5.universeId] = v5.communityLink
        });
    end
});
