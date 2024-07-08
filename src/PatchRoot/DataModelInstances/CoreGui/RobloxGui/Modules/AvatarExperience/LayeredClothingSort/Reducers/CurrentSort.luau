local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
return v2.createReducer({
    OrderedList = {}, 
    RemovedList = {}
}, {
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort).name] = function(v5, v6)
        return v3.Dictionary.join(v5, {
            OrderedList = v6.currentSort
        });
    end, 
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort).name] = function(v7, _)
        return v3.Dictionary.join(v7, {
            OrderedList = {}, 
            RemovedList = {}
        });
    end, 
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.AddRemovedItem).name] = function(v9, v10)
        return v3.Dictionary.join(v9, {
            RemovedList = v3.Dictionary.join(v9.RemovedList or {}, {
                [v10.removedAssetId] = v10.removedAssetTypeId
            })
        });
    end, 
    [require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems).name] = function(v11, _)
        return v3.Dictionary.join(v11, {
            RemovedList = {}
        });
    end
});
