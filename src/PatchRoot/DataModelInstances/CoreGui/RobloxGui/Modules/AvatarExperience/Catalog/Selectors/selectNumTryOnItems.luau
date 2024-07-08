local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_CorePackages_0.tutils);
local v5 = l_memoize_0(function(v4)
    return v3.fieldCount(v4);
end);
return function(v6)
    return v5(v6.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
