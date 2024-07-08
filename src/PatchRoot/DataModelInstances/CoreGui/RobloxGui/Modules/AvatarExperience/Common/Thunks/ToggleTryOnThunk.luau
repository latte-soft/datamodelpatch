local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchOutfitInfoFromBundle);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v11 = require(l_CorePackages_0.tutils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList);
local v18 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems);
local _ = function(v19, v20)
    local _, v22 = v6.filterTryOns(v19, v20);
    return v22;
end;
return function(v24, v25, v26, v27, v28, v29, v30, v31, v32)
    return function(v33)
        local v34 = v33:getState();
        if not v34.AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
            if v27 then
                local v35 = nil;
                if v26 == v3.ItemType.Bundle then
                    v35 = v5.getOutfitInfoFromBundleId(v34, v28);
                    if not v35 then
                        v33:dispatch(v2(v24, v28));
                    end;
                end;
                local l_TryOnItems_0 = v33:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                local v37 = v11.fieldCount(l_TryOnItems_0);
                local v38 = l_TryOnItems_0[v28];
                if not (v30 and v4[v30.opaque.name].isMultiTryOn) then
                    if v38 then
                        if v31 then
                            v7.closeFiltersAndItemDetails(v31);
                        end;
                    else
                        v33:dispatch(v12());
                    end;
                else
                    local v39 = {
                        itemType = v26, 
                        itemSubType = v27, 
                        itemId = v28
                    };
                    local v40 = nil;
                    local v41 = nil;
                    if not v10 then
                        local v42 = v8(v33:getState().AvatarExperience.Common, v28, v26);
                        v40 = v42.priceInRobux;
                        v41 = v42.isOwned;
                    else
                        local v43 = v9(v33:getState().AvatarExperience, v28, v26);
                        if v43 then
                            v40 = v43.priceInRobux;
                            v41 = v43.isOwned;
                        end;
                    end;
                    local v44 = v5.getCurrentScreenIgnoreItemDetails(v30);
                    if not v38 then
                        local v45, v46 = v6.filterTryOns(l_TryOnItems_0, v39);
                        local l_v46_0 = v46;
                        v45 = l_v46_0 ~= nil;
                        if l_v46_0 then
                            v25.avatarShopUnequip(l_v46_0.itemId, l_v46_0.itemType, l_v46_0.priceInRobux, v45, v41, v44, v37);
                        end;
                        v25.avatarShopEquip(v28, v26, v40, v45, v41, v44, v37);
                    else
                        v25.avatarShopUnequip(v28, v26, v40, false, v41, v44, v37);
                    end;
                end;
                if v5.isBundleOrLCAsset(v26, v27) then
                    v33:dispatch(v13());
                end;
                local v48, v49 = v17(v34);
                local v50 = v18(v34, v28, v26, v27, v48, v49);
                if v50.equippedAssetsToSetOrder then
                    v33:dispatch(v16(v50.equippedAssetsToSetOrder));
                end;
                if v50.itemIdToOrderMap then
                    v33:dispatch(v15(v50.itemIdToOrderMap));
                end;
                v33:dispatch(v14(v26, v27, v28, v29, v50.overrideOrder, v50.bundleInfoMapping, v32, not not v35 or false));
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
