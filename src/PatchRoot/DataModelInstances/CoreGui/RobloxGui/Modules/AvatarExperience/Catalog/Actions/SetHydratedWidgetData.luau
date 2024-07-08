local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Types);
return v2.makeActionCreator(script.Name, function(v5)
    v3.isType(v5, "table", "payload");
    return {
        payload = v5
    };
end);
