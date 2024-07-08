local v0 = require(game:GetService("CorePackages").Rodux);
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
return v0.makeActionCreator(script.Name, function(v2, v3)
    return {
        outfitId = v2, 
        name = v3
    };
end);
