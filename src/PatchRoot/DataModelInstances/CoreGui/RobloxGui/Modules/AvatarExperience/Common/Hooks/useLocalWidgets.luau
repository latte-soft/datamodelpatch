local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSponsoredItemsLocalWidget);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSearchResultsCategories);
return function(v6, v7, v8)
    local v10 = v2.filter({
        v3(v6, v7, if not v5() then nil else v8)
    }, function(v9)
        return v9.isEnabled;
    end);
    table.sort(v10, function(v11, v12)
        return v11.row < v12.row;
    end);
    return v10;
end;
