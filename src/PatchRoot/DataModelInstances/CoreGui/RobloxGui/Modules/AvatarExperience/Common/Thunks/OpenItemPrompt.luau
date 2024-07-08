local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.tutils);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v6 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectItemPromptType);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPurchasePrompt);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenPremiumUpsellPrompt);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.OpenGoToAvatarEditorPrompt);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesSaleLocationCheck);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagCollectiblesCatalogFollowUpForSaleLocation);
local v18 = {
    toastMessage = "Feature.Catalog.LabelNoResellers", 
    toastSubMessage = "Feature.Catalog.Label.NoSellersWarning", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local v19 = {
    toastMessage = "Feature.Catalog.Heading.NotForSale", 
    toastSubMessage = "Feature.Catalog.Label.NoLongerAvailable", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local v20 = {
    toastMessage = "Feature.Catalog.Heading.InExperienceOnly", 
    toastSubMessage = "Feature.Catalog.Label.InExperienceOnly", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local v21 = {
    toastMessage = "Feature.Catalog.Heading.QuantityLimitReached", 
    toastSubMessage = "Feature.Catalog.Label.QuantityLimitReached", 
    isLocalized = false, 
    toastType = v9.SuccessConfirmation
};
local function _(v22, v23, v24)
    local l_LocalUserId_0 = v23.LocalUserId;
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v22:dispatch(v15(v24, l_LocalUserId_0, false));
    end;
end;
local function v42(v27, v28, v29, v30, v31)
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    if not v7 then
        v32 = v29 and v29.resellerUserAssetIds;
        v33 = v8.DEPRECATED_IsResellable(v29);
        v34 = v29 and v29.collectibleItemId;
    elseif v30 then
        v32 = v30.resellerUserAssetIds;
        v33 = v30.isResellable;
        v34 = v30.collectibleItemId;
    end;
    local v35 = v33 and v28.AvatarExperience.Catalog.UserAssets[v32 and v32[1]] == nil;
    if not (v28.UserRobux[v28.LocalUserId] == nil) then
        local v36 = false;
        if not (not v16() or not v34) then
            local v37 = v28.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v34];
            v36 = not v8.isCollectibleSellableInShop(v37);
            v35 = not v37 and true or not v37.hasResellers;
        end;
        local v38 = false;
        if v34 then
            local v39 = v28.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v34];
            local v40 = v28.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[v34];
            v35 = not v39 and true or not v39.hasResellers;
            v38 = v35 and v8.reachQuantityLimit(v39, v40);
        end;
        if not v36 then
            if not v38 then
                if not v35 then
                    return v27:dispatch(v14(v19));
                else
                    return v27:dispatch(v14(v18));
                end;
            else
                return v27:dispatch(v14(v21));
            end;
        elseif not v17() then
            return v27:dispatch(v14(v19));
        else
            return v27:dispatch(v14(v20));
        end;
    else
        local l_LocalUserId_1 = v28.LocalUserId;
        if typeof(l_LocalUserId_1) == "string" and l_LocalUserId_1 ~= "" then
            v27:dispatch(v15(v31, l_LocalUserId_1, false));
        end;
        return ;
    end;
end;
return function(v43, v44, v45, v46, v47, v48, v49, v50, v51)
    return function(v52)
        local v53 = v52:getState();
        local v54 = nil;
        local v55 = nil;
        if not v48 or not v49 then
            v54 = v47.current.params.itemId;
            v55 = v47.current.params.itemType;
        else
            v54 = v48;
            v55 = v49;
        end;
        local v56 = v10(v53, v54, v55);
        local l_fromProfile_0 = v47.current.params.fromProfile;
        local l_widgetInfo_0 = v47.current.params.widgetInfo;
        if not l_widgetInfo_0 then
            local l_TryOnItems_0 = v53.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
            if v3.fieldCount(l_TryOnItems_0) == 1 then
                local _, v61 = next(l_TryOnItems_0);
                l_widgetInfo_0 = v61.widgetInfo;
            end;
        end;
        if v56 == v4.ItemPromptType.OpenPurchasePrompt then
            v52:dispatch(v11(v43, v45, v46, v44, l_fromProfile_0, v47, v54, v55, v50, v51, l_widgetInfo_0));
            return ;
        elseif v56 == v4.ItemPromptType.OpenGoToAvatarEditorPrompt then
            v52:dispatch(v13(v45, v46, v47, v54, v55));
            return ;
        elseif v56 == v4.ItemPromptType.OpenPremiumUpsellPrompt then
            v52:dispatch(v12(v43, v44, v45, v46, nil, v54, v55));
            return ;
        else
            if v56 == v4.ItemPromptType.Disabled then
                local v62 = nil;
                local v63 = nil;
                if not v7 then
                    v62 = v5(v53.AvatarExperience.Common, v54, v55);
                else
                    v63 = v6(v53.AvatarExperience, v54, v55);
                end;
                v42(v52, v53, v62, v63, v43);
            end;
            return ;
        end;
    end;
end;
