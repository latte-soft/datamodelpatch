local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
return function()
    return v2.useContext(v3);
end;
