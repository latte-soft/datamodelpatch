local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Utils);
return function(v3)
    return v2.getEquippedToolId(v3) ~= nil;
end;
