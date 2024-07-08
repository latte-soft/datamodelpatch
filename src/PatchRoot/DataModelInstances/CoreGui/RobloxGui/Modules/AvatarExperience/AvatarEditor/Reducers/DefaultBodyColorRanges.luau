local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Rodux);
local v2 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return (v1.createReducer({}, {
    [v3.name] = function(_, v6)
        return (v2.convertDefaultBodyColorRanges(v6.defaultBodyColorRanges));
    end
}));
