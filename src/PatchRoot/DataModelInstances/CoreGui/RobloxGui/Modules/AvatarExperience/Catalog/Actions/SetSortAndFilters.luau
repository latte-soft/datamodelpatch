local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
return v2.makeActionCreator(script.Name, function(v8)
    return v8 or {};
end);
