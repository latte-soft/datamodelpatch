local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v6 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesSaleLocationCheck);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLimitedBundlesHandleNewData);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixInExperienceOnlyUnlimitedCollectibles);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v14 = l_GuiService_0:IsTenFootInterface();
local v42 = l_memoize_0(function(v15, v16, v17, v18, v19, v20, v21)
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    if not v13 then
        assert(v15, "silence type checker");
        v22 = v15.isOwned;
        v23 = v15.isPurchasable;
        v24 = v7.DEPRECATED_IsResellable(v15);
        v25 = v15.isForRent;
        v26 = v15.collectibleItemId;
        v27 = if not v11() then v15.collectibleItemId ~= nil else v7.DEPRECATED_isLimitedCollectible(v15);
        v28 = v7.DEPRECATED_IsPremiumExclusive(v15);
    else
        assert(v16, "silence type checker");
        v22 = v16.isOwned;
        v23 = v16.isPurchasable;
        v24 = v16.isResellable;
        v25 = v16.isForRent;
        v26 = v16.collectibleItemId;
        v27 = v16.isLimitedCollectible;
        v28 = v16.isPremiumExclusive;
    end;
    local v29 = v24 and v17 == nil;
    local l_None_0 = v4.ResaleRestriction.None;
    local v31 = true;
    local v32 = true;
    local v33 = ((not v22 and not v23 or v29) or v25) or v18 == nil;
    if not v27 then
        if not (not v26 or not v12()) then
            local v34 = v20[v26];
            if v34 then
                v33 = not v7.isOriginalStockSellableInShop(v34);
            end;
        end;
    else
        local v35 = v20[v26];
        local v36 = v35 and v35.hasResellers;
        l_None_0 = if not v35 then v4.ResaleRestriction.None else v35.resaleRestriction;
        v32 = (v35 and v35.unitsAvailableForConsumption) and v35.unitsAvailableForConsumption > 0;
        v31 = if not v10() then v32 or v36 else v7.isCollectibleSellableInShop(v35);
        local v37 = not v36 and v7.reachQuantityLimit(v35, v21);
        local v38 = not v31;
        if not v38 then
            v38 = v25;
            if not v38 then
                v38 = true;
                if v18 ~= nil then
                    v38 = v37;
                end;
            end;
        end;
        v33 = v38;
    end;
    local v39 = v22 and not v24;
    local v40 = nil;
    if not v13 then
        v40 = v15.assetType;
    else
        assert(v16, "silence type checker");
        if v16.itemType == v3.ItemType.Asset then
            v40 = v16.itemSubType;
        end;
    end;
    if not ((not v40 or not (v3.AssetTypeIdStringToName[v40] == nil)) or not v39) then
        v33 = true;
    end;
    local v41 = v28 and not (v19 == Enum.MembershipType.Premium);
    if not (v26 and l_None_0 == v4.ResaleRestriction.Disabled) or v32 then
        if not v33 then
            if not v39 then
                if not v41 then
                    return v3.ItemPromptType.OpenPurchasePrompt;
                elseif not v14 then
                    return v3.ItemPromptType.OpenPremiumUpsellPrompt;
                else
                    return v3.ItemPromptType.Disabled;
                end;
            else
                return v3.ItemPromptType.OpenGoToAvatarEditorPrompt;
            end;
        else
            return v3.ItemPromptType.Disabled;
        end;
    else
        return v3.ItemPromptType.SoldOut;
    end;
end);
return function(v43, v44, v45)
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    if not v13 then
        v47 = v5(v43.AvatarExperience.Common, v44, v45);
        if v47 then
            assert(v47, "silence type checker");
            v48 = v47.resellerUserAssetIds;
            v49 = v47.collectibleItemId;
        else
            return v3.ItemPromptType.Disabled;
        end;
    else
        v46 = v6(v43.AvatarExperience, v44, v45);
        if v46 then
            assert(v46, "silence type checker");
            v48 = v46.resellerUserAssetIds;
            v49 = v46.collectibleItemId;
        else
            return v3.ItemPromptType.Disabled;
        end;
    end;
    local v50 = v43.AvatarExperience.Catalog.UserAssets[v48 and v48[1]];
    local v51 = v43.UserRobux[v43.LocalUserId];
    local v52 = not not v43.Users[v43.LocalUserId] and v43.Users[v43.LocalUserId].membership or Enum.MembershipType.None;
    local l_CollectiblesItemInfo_0 = v43.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
    local v54 = nil;
    if v49 then
        v54 = v43.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v49];
    end;
    return v42(v47, v46, v50, v51, v52, l_CollectiblesItemInfo_0, v54);
end;
