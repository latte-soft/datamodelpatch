local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.Cryo);
return v4.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTopics).name] = function(v6, v7)
        return v5.Dictionary.join(v6, {
            [v3.getTopicRequestKey(v7.selectedTopics, v7.initialItems, v7.searchKeyword)] = v7.newTopics
        });
    end
});
