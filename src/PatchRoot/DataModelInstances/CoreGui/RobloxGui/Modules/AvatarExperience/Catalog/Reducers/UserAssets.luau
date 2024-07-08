local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetUserAssetsFromSellPageAndResellers);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Models.UserAssetModel);
local v6 = require(l_CorePackages_0.Cryo);
return v2.createReducer({}, {
    [v3.name] = function(v7, v8)
        local v9 = {};
        for _, v11 in v8.userAssets, nil, nil do
            local v12 = tostring(v11.userAssetId);
            local v13 = v5.fromSellPageAndResellers(v11);
            local v14 = v7[v12];
            if not v14 then
                v9[v12] = v13;
            else
                v9[v12] = v6.Dictionary.join(v14, v13);
            end;
        end;
        return v6.Dictionary.join(v7, v9);
    end, 
    [v4.name] = function(v15, v16)
        local v17 = tostring(v16.userAssetId);
        local v18 = v5.fromPriceInRobux(v17, v16.priceInRobux);
        local v19 = v15[v17];
        if not v19 then
            return v6.Dictionary.join(v15, {
                [v17] = v18
            });
        else
            return v6.Dictionary.join(v15, {
                [v17] = v6.Dictionary.join(v19, v18)
            });
        end;
    end
});
