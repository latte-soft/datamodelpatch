local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewAssetNotification);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewAssetNotification);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewOutfitNotification);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewOutfitNotification);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v4.createReducer({}, {
    [v6.name] = function(v11, v12)
        return v3.Dictionary.join(v11, {
            [v12.assetTypeId] = true
        });
    end, 
    [v7.name] = function(v13, v14)
        return v3.Dictionary.join(v13, {
            [v14.assetTypeId] = false
        });
    end, 
    [v8.name] = function(v15, v16)
        if v16.outfitType == v5.OutfitTypes.DynamicHead then
            return v3.Dictionary.join(v15, {
                [v5.NewDHOutfitNotificationKey] = true
            });
        else
            return v3.Dictionary.join(v15, {
                [v5.NewOutfitNotificationKey] = true
            });
        end;
    end, 
    [v9.name] = function(v17, v18)
        if v18.outfitType == v5.OutfitTypes.DynamicHead then
            return v3.Dictionary.join(v17, {
                [v5.NewDHOutfitNotificationKey] = false
            });
        else
            return v3.Dictionary.join(v17, {
                [v5.NewOutfitNotificationKey] = false
            });
        end;
    end
});
