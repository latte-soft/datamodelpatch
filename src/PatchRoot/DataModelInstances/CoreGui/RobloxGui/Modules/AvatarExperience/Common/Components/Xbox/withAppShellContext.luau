local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Components.Xbox.AppShellContext);
local v2 = require(l_Modules_0.AvatarExperience.Common.withContextValue);
return function(v3)
    return v2(v3, v1.Consumer, "appShell", {
        required = false
    });
end;
