local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Experiment.getAllAppUserLayers);
local v2 = require(l_CorePackages_0.Packages.Dash);
return function()
    return v2.values((v1()));
end;
