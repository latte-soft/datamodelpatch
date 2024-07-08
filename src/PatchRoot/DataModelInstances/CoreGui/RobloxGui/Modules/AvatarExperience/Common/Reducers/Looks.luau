local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v8 = {};
local _ = function(v9)
    local v10 = {};
    if v9 then
        for _, v12 in v9, nil, nil do
            v10[tostring(v12.id)] = v12;
        end;
    end;
    return v10;
end;
return v3.createReducer(v8, {
    [v4.name] = function(v14, v15)
        local v16 = v14 or v8;
        local v17 = nil;
        if not v7() then
            v17 = {};
            for _, v19 in v15.lookAssetInfos, nil, nil do
                v17[tostring(v19.id)] = v19;
            end;
        end;
        local v20 = {};
        local l_lookId_0 = v15.lookId;
        local v22 = {
            lookType = if not v7() then nil else v15.lookType, 
            totalValue = if not v7() then nil else v15.totalValue, 
            totalPrice = v15.totalPrice, 
            totalPremiumPrice = v15.totalPremiumPrice
        };
        local v23;
        if not v7() then
            v23 = v17;
        else
            local l_lookAssetInfos_0 = v15.lookAssetInfos;
            local v25 = {};
            if l_lookAssetInfos_0 then
                for _, v27 in l_lookAssetInfos_0, nil, nil do
                    v25[tostring(v27.id)] = v27;
                end;
            end;
            v23 = v25;
        end;
        v22.lookAssetInfos = v23;
        if not v7() then
            v23 = nil;
        else
            local l_lookBundleInfos_0 = v15.lookBundleInfos;
            local v29 = {};
            if l_lookBundleInfos_0 then
                for _, v31 in l_lookBundleInfos_0, nil, nil do
                    v29[tostring(v31.id)] = v31;
                end;
            end;
            v23 = v29;
        end;
        v22.lookBundleInfos = v23;
        v20[l_lookId_0] = v22;
        return v2.Dictionary.join(v16, v20);
    end, 
    [v5.name] = function(v32, v33)
        local v34 = v32 or v8;
        local v35 = if not v32 then nil else v32[v33.lookId];
        if v35 == nil then
            return v34;
        else
            assert(v35, "");
            local v36 = v35.totalPrice or 0;
            local v37 = v35.totalPremiumPrice or 0;
            local l_lookAssetInfos_1 = v35.lookAssetInfos;
            if l_lookAssetInfos_1 == nil then
                warn("Looks asset info does not exist");
                return v34;
            else
                for _, v40 in v33.purchasedAssetIds, nil, nil do
                    local v41 = tostring(v40);
                    local v42 = l_lookAssetInfos_1[v41];
                    if v42 == nil then
                        warn("Looks reducer could not find asset with id", v41);
                    else
                        l_lookAssetInfos_1[v41].quantityOwned = v42.quantityOwned + 1;
                        v36 = v36 - (v42.priceInRobux or 0);
                        v37 = v37 - (v42.premiumPriceInRobux or 0);
                    end;
                end;
                if v36 < 0 then
                    warn("Looks total price is below 0 after manual calculation");
                    v36 = 0;
                end;
                if v37 < 0 then
                    warn("Looks total premium price is below 0 after manual calculation");
                    v37 = 0;
                end;
                return v2.Dictionary.join(v34, {
                    [v33.lookId] = {
                        totalPrice = v36, 
                        totalPremiumPrice = v37, 
                        lookAssetInfos = l_lookAssetInfos_1
                    }
                });
            end;
        end;
    end
});
