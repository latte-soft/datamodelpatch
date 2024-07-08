local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Types);
return v2.makeActionCreator(script.Name, function(v4)
    return {
        outfitType = v4
    };
end);
