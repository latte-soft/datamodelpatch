local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Rodux);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Models.SortResults);
return v4.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.AppendUserInventoryRecommendations).name] = function(v6, v7)
        local v8 = v6[v7.searchUuid];
        if v8 and not v7.forceUpdate then
            return v3.Dictionary.join(v6, {
                [v7.searchUuid] = {
                    items = v3.List.join(v8.items, v7.sortResults.items), 
                    initialStorageTime = v8.initialStorageTime, 
                    nextPageCursor = v7.sortResults.nextPageCursor, 
                    previousPageCursor = v7.sortResults.previousPageCursor, 
                    keyword = v7.sortResults.keyword
                }
            });
        else
            return v3.Dictionary.join(v6, {
                [v7.searchUuid] = v3.Dictionary.join(v7.sortResults, {
                    initialStorageTime = tick()
                })
            });
        end;
    end
});
