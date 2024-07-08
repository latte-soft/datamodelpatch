local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
return v2.makeActionCreator(script.Name, function(v6, v7)
    v3.isType(v6, "string", "sort");
    v3.isTypeOrNil(v7, "string", "sortAggregation");
    return {
        sort = v6, 
        sortAggregation = v7
    };
end);
