local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(script.Parent.Parent.Actions.SetExperienceInfo).name] = function(v2, v3)
        local l_experienceInfo_0 = v3.experienceInfo;
        local l_universeId_0 = l_experienceInfo_0.universeId;
        assert(l_universeId_0 ~= nil, "Expected a universe id when setting an experiences's information.");
        return {
            [l_universeId_0] = v1.Dictionary.join(v2[l_universeId_0] or {}, l_experienceInfo_0)
        };
    end
});
