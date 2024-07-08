local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
return v2.makeActionCreator(script.Name, function(v4, v5)
    return {
        category = v4, 
        items = v5
    };
end);
