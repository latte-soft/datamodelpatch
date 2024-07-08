local v0 = require(game:GetService("CorePackages").Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v3 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
return v0.makeActionCreator(script.Name, function(v4, v5, v6)
    return {
        itemId = v4, 
        selectedInTryOnManager = v5, 
        itemType = if not v3() then nil else v6
    };
end);
