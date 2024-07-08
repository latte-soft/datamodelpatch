local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v4 = require(l_CorePackages_0.Cryo);
return v2.createReducer({}, {
    [v3.name] = function(v5, v6)
        return (v4.Dictionary.join(v5, v6.bodyPartRangeIds));
    end
});
