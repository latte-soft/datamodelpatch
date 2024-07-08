local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Action);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v2(script.Name, function(v4)
    v3.isType(v4, "boolean", "SetModerationStatus action expects `modStatus` to be a boolean");
    return {
        userModerated = v4
    };
end);
