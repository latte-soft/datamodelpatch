local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.SetEquippedInTryOnManager);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveFromTryOn);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.AddSelectedBundleInfo);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOutfitTryOns);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Common.ReducerUtils);
local v17 = require(l_Modules_0.LuaApp.mutedError);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v19 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v20 = 0;
local function v24(v21, v22)
    local v23 = {
        version = "1", 
        itemId = v21.itemId, 
        itemType = v21.itemType, 
        itemSubType = v21.itemSubType, 
        selectedInTryOnManager = v21.selectedInTryOnManager, 
        isUnequipped = v22, 
        receivedBundleInfo = not not v21.receivedBundleInfo or false, 
        bundleInfo = v21.bundleInfo, 
        widgetInfo = v21.widgetInfo
    };
    if v15.AssetTypeIdToAccessoryTypeEnum[v21.itemSubType] then
        v23 = v3.Dictionary.join(v23, {
            order = v21.overrideOrder or v15.LayeredClothingOrder[v21.itemSubType], 
            isLayered = v15.LayeredAssetTypes[v21.itemSubType] ~= nil
        });
    end;
    if not v22 then
        v23.itemRecency = v20;
        v20 = v20 + 1;
    end;
    return v23;
end;
local function v28(v25, v26)
    local v27 = {
        version = "1", 
        itemId = v25.itemId, 
        itemType = v25.itemType, 
        itemSubType = v25.itemSubType, 
        selectedInTryOnManager = true, 
        isUnequipped = false, 
        receivedBundleInfo = false
    };
    if v15.AssetTypeIdToAccessoryTypeEnum[v25.itemSubType] then
        v27 = v3.Dictionary.join(v27, {
            order = v15.LayeredClothingOrder[v25.itemSubType], 
            isLayered = v15.LayeredAssetTypes[v25.itemSubType] ~= nil
        });
    end;
    v27.itemRecency = if not not v19() and v26 == v15.LookType.Avatar then v25.tryOnItemOrder else v20;
    v20 = v20 + 1;
    return v27;
end;
local function v34(v29)
    local v30 = {
        version = "1", 
        selectedInTryOnManager = true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemType = v29.itemType, 
        itemId = v29.itemId
    };
    local v31 = {};
    for _, v33 in v29.items, nil, nil do
        v31[v33.itemId] = {
            assetType = v33.itemSubType, 
            order = v15.LayeredClothingOrder[v33.itemSubType]
        };
    end;
    v30.bundleInfo = v31;
    v30.itemRecency = v29.tryOnItemOrder or v20;
    v20 = v20 + 1;
    return v30;
end;
local function v39(v35, v36, v37)
    local v38 = v36[v37.itemId];
    v38.isUnequipped = true;
    return v3.Dictionary.join(v35, {
        TryOnItems = v3.Dictionary.join(v36, {
            [v37.itemId] = v3.None
        }), 
        LastToggledItem = v38
    });
end;
local v40 = {
    TryOnItems = {}, 
    LookId = nil, 
    LookType = nil
};
local function _(v41)
    if v41.itemType == v15.ItemType.Asset and v41.itemSubType == v15.AssetTypeIdStrings.EmoteAnimation then
        return true;
    elseif v41.itemType == v15.ItemType.Bundle and v41.itemSubType == tostring(v15.BundleTypeIdStrings.Animations) then
        return true;
    else
        return false;
    end;
end;
return v2.createReducer(v40, {
    [v5.name] = function(v43, v44)
        local v45 = v43 or v40;
        local v46 = v45.TryOnItems or {};
        local v47 = v45.LookId ~= nil;
        local v48 = false;
        if v46[v44.itemId] ~= nil then
            v48 = not v47;
        end;
        if not v48 then
            local v49 = v16.filterTryOns(v46, v44);
            local v50 = v24(v44, false);
            local v51 = nil;
            if v50.itemType == v15.ItemType.Asset and v50.itemSubType == v15.AssetTypeIdStrings.EmoteAnimation or v50.itemType == v15.ItemType.Bundle and v50.itemSubType == tostring(v15.BundleTypeIdStrings.Animations) then
                v51 = v50;
            end;
            if not v47 then
                return v3.Dictionary.join(v45, {
                    TryOnItems = v3.Dictionary.join(v49, {
                        [v44.itemId] = v50
                    }), 
                    LastToggledItem = v50, 
                    LastAnimOrEmoteToggledItem = v51
                });
            else
                return v3.Dictionary.join(v45, {
                    TryOnItems = {
                        [v44.itemId] = v50
                    }, 
                    LastToggledItem = v50, 
                    LastAnimOrEmoteToggledItem = v51, 
                    LookId = v3.None
                });
            end;
        else
            if v46[v44.itemId].itemType ~= v44.itemType then
                v17(string.format("itemId: %s collided in Outfit Try On Reducer as the user tried on a bundle and asset of the same itemId", (tostring(v44.itemId))));
            end;
            return v39(v45, v46, v44);
        end;
    end, 
    [v4.name] = function(v52, v53)
        local v54 = v52 or v40;
        local v55 = {};
        for _, v57 in v53.assetItemIdTypeAndSubtype, nil, nil do
            v55[if not v19() then v57.itemId else v16.generateTryOnItemIdKey(v57.itemId, v57.itemType, v53.lookType)] = v28(v57, v53.lookType);
        end;
        if v19() and v53.bundleItemIdTypeAndSubtype ~= nil then
            for _, v59 in v53.bundleItemIdTypeAndSubtype, nil, nil do
                v55[v16.generateTryOnItemIdKey(v59.itemId, v59.itemType, v53.lookType)] = v34(v59);
            end;
        end;
        return v3.Dictionary.join(v54, {
            TryOnItems = v55, 
            LookId = if not v53.lookId then v3.None else v53.lookId, 
            LookAnalyticsInfo = if not v53.analyticsInfo then v3.None else v53.analyticsInfo, 
            LookType = if not v19() then nil else v53.lookType
        });
    end, 
    [v6.name] = function(v60, v61)
        local v62 = v60 or v40;
        local v63 = v62.TryOnItems or {};
        local v64 = if not v19() then v61.itemId else v16.generateTryOnItemIdKey(v61.itemId, v61.itemType, v62.LookType);
        if v63[v64] == nil then
            return v62;
        else
            return v3.Dictionary.join(v62, {
                TryOnItems = v3.Dictionary.join(v63, {
                    [v64] = v3.Dictionary.join(v63[v64], {
                        selectedInTryOnManager = v61.selectedInTryOnManager
                    })
                })
            });
        end;
    end, 
    [v7.name] = function(v65, _)
        local v67 = v65 or v40;
        local v68 = v67.TryOnItems or {};
        local v69 = {};
        for v70, v71 in v68, nil, nil do
            if v71.selectedInTryOnManager then
                v69[v70] = v71;
            end;
        end;
        return v3.Dictionary.join(v67, {
            TryOnItems = v69
        });
    end, 
    [v8.name] = function(v72, v73)
        local v74 = v72 or v40;
        local v75 = v74.TryOnItems or {};
        if v75[v73.itemId] ~= nil then
            return v39(v74, v75, v73);
        else
            return v74;
        end;
    end, 
    [v9.name] = function(v76, v77)
        local v78 = v76 or v40;
        if v77.lookId == v78.LookId then
            local v79 = v78.TryOnItems or {};
            for _, v81 in v77.assetIds, nil, nil do
                local l_v81_0 = v81;
                if v19() then
                    l_v81_0 = v16.generateTryOnItemIdKey(v81, v15.ItemType.Asset, v78.LookType);
                end;
                if v79[l_v81_0] ~= nil then
                    v79 = v3.Dictionary.join(v79, {
                        [l_v81_0] = v3.None
                    });
                end;
            end;
            if v19() and v77.bundleIds ~= nil then
                for _, v84 in v77.bundleIds, nil, nil do
                    local v85 = v16.generateTryOnItemIdKey(v84, v15.ItemType.Bundle, v78.LookType);
                    if v79[v85] ~= nil then
                        v79 = v3.Dictionary.join(v79, {
                            [v85] = v3.None
                        });
                    end;
                end;
            end;
            v78 = v3.Dictionary.join(v78, {
                TryOnItems = v79, 
                LookId = v3.None
            });
        end;
        return v78;
    end, 
    [v10.name] = function(v86, v87)
        local v88 = v86 or v40;
        local v89 = v88.TryOnItems or {};
        if not v89[v87.itemId] then
            return v88;
        else
            return v3.Dictionary.join(v88, {
                TryOnItems = v3.Dictionary.join(v89, {
                    [v87.itemId] = v3.Dictionary.join(v89[v87.itemId], {
                        receivedBundleInfo = true
                    })
                })
            });
        end;
    end, 
    [v11.name] = function(_, _)
        return v40;
    end, 
    [v12.name] = function(v92, v93)
        local l_itemIdToOrderMap_0 = v93.itemIdToOrderMap;
        local v95 = v92 or v40;
        for v96, v97 in l_itemIdToOrderMap_0, nil, nil do
            local v98 = v95.TryOnItems or {};
            if v98[v96] and v98[v96].itemType ~= v15.ItemType.Bundle then
                v95 = v3.Dictionary.join(v95, {
                    TryOnItems = v3.Dictionary.join(v98, {
                        [v96] = v3.Dictionary.join(v98[v96], {
                            order = v97
                        })
                    })
                });
            elseif not v98[v96] then
                for v99, v100 in v98, nil, nil do
                    if not (not v100.bundleInfo or not v100.bundleInfo[v96]) then
                        local l_bundleInfo_0 = v100.bundleInfo;
                        v95 = v3.Dictionary.join(v92, {
                            TryOnItems = v3.Dictionary.join(v98, {
                                [v99] = v3.Dictionary.join(v98[v99], {
                                    bundleInfo = v3.Dictionary.join(l_bundleInfo_0, {
                                        [v96] = v3.Dictionary.join(l_bundleInfo_0[v96], {
                                            order = v97
                                        })
                                    })
                                })
                            })
                        });
                        break;
                    end;
                end;
            end;
        end;
        return v95;
    end, 
    [v13.name] = function(v102, v103)
        local v104 = v102 or v40;
        local v105 = v104.TryOnItems or {};
        if not v105[v103.bundleId] then
            return v104;
        else
            return v3.Dictionary.join(v104, {
                TryOnItems = v3.Dictionary.join(v105, {
                    [v103.bundleId] = v3.Dictionary.join(v105[v103.bundleId], {
                        bundleInfo = v103.bundleInfo
                    })
                })
            });
        end;
    end, 
    [v14.name] = function(_, v107)
        return v107.outfitTryOns;
    end
});
