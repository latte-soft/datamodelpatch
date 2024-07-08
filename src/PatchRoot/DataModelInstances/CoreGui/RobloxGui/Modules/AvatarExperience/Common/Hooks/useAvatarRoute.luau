local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v4 = require(l_CorePackages_0.Packages.React);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function()
    return v2.isNotNil(v4.useContext(v3), "AvatarRouteContext");
end;
