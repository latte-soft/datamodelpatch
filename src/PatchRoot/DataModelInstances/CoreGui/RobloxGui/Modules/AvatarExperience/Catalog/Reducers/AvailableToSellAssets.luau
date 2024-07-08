local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAvailableToSellAssetsFromFetchSellData);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvailableToSellAsset);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveAvailableToSellAsset);
local v6 = require(l_CorePackages_0.Cryo);
return v2.createReducer({}, {
    [v3.name] = function(v7, v8)
        return v6.Dictionary.join(v7, {
            [v8.assetId] = v8.userAssetIdList
        });
    end, 
    [v4.name] = function(v9, v10)
        local l_assetId_0 = v10.assetId;
        local v12 = {
            v10.userAssetId
        };
        local v13 = v9[l_assetId_0];
        if v13 then
            v12 = v6.List.join(v13, v12);
        end;
        return v6.Dictionary.join(v9, {
            [l_assetId_0] = v12
        });
    end, 
    [v5.name] = function(v14, v15)
        local l_assetId_1 = v15.assetId;
        local v17 = v14[l_assetId_1];
        if v17 then
            return v6.Dictionary.join(v14, {
                [l_assetId_1] = v6.List.removeValue(v17, v15.userAssetId)
            });
        else
            return v14;
        end;
    end
});
