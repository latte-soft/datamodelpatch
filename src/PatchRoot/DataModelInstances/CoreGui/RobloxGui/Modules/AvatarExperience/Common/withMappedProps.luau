local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local _ = require(l_CorePackages_0.Packages.Dash);
return function(v6, v7)
    v3.assert(v4(v6), "withMappedProps must be called with a Roact component (stateful or functional)");
    v3.isType(v7, "function", "withMappedProps mapper");
    return function(v8)
        return v2.createElement(v6, (v7(v8)));
    end;
end;
