local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Models.SortResults);
return v2.makeActionCreator(script.Name, function(v4, v5, v6)
    return {
        searchUuid = v4, 
        sortResults = v5, 
        forceUpdate = v6
    };
end);
