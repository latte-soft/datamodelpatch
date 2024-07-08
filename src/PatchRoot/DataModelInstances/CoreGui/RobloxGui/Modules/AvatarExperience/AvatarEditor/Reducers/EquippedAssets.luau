local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UnequipOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v10 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v11 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function _(v15, v16)
    if not v15 or not v15[v16] then
        return false;
    else
        return true;
    end;
end;
local function v20(v18, v19)
    return v3.Dictionary.join(v18, v19);
end;
return v2.createReducer(nil, {
    [v7.name] = function(v21, v22)
        local l_assets_0 = v22.avatarData.assets;
        if l_assets_0 == nil then
            return v21;
        else
            v21 = {};
            for _, v25 in l_assets_0, nil, nil do
                local v26 = tostring(v25.assetType.id);
                local v27 = tostring(v25.id);
                local v28 = v21[v26] or {};
                v28[v27] = v11.fromMetadata(v25.meta, v26);
                v21[v26] = v28;
            end;
            return v21;
        end;
    end, 
    [v4.name] = function(v29, v30)
        v29 = v29 or {};
        if v30.assetTypeId == v8.AssetTypeIdStrings.EmoteAnimation then
            return v29;
        else
            local v31 = v29[v30.assetTypeId];
            if not (not not v31 and (v31[v30.assetId] and true or false)) then
                v31 = v11.getDefaultMetadata(v30.assetTypeId);
                if not v30.overrideOrder then
                    if v31.isLayered then
                        local v32 = v10.getSortedEquippedLCIfNoDefault(v29);
                        if v32 then
                            local v33, _ = v10.getTableAndOrderAfterEquippingIntoSort(v32, {
                                id = v30.assetId, 
                                typeId = v30.assetTypeId
                            });
                            for v35, v36 in v33, nil, nil do
                                if v36.id ~= v30.assetId then
                                    v29 = v3.Dictionary.join(v29, {
                                        [v36.typeId] = v3.Dictionary.join(v29[v36.typeId], {
                                            [v36.id] = v3.Dictionary.join(v29[v36.typeId][v36.id], {
                                                order = #v33 - v35
                                            })
                                        })
                                    });
                                else
                                    v31.order = #v33 - v35;
                                end;
                            end;
                        end;
                    end;
                else
                    v31.order = v30.overrideOrder;
                end;
                local v37 = {
                    [v30.assetId] = v31
                };
                local v38 = v29[v30.assetTypeId] or {};
                if v30.assetTypeId == v8.AssetTypeIdStrings.Hat then
                    if v9.MaxHats <= #v3.Dictionary.keys(v38) then
                        return v29;
                    else
                        return v3.Dictionary.join(v29, {
                            [v30.assetTypeId] = v3.Dictionary.join(v38, v37)
                        });
                    end;
                else
                    local v39 = v8.AssetTypeToAssetCategory[v30.assetTypeId];
                    if v39 then
                        for _, v41 in v8.AssetCategoryToAssetTypes[v39], nil, nil do
                            if not (not v29[v41] or not next(v29[v41])) then
                                v29 = v3.Dictionary.join(v29, {
                                    [v41] = {}
                                });
                            end;
                        end;
                    end;
                    if v30.assetTypeId == v8.AssetTypeIdStrings.Head then
                        for v42, _ in v8.DynamicHeadAssetTypes, nil, nil do
                            v29 = v3.Dictionary.join(v29, {
                                [v42] = {}
                            });
                        end;
                    end;
                    if v30.assetTypeId == v8.AssetTypeIdStrings.DynamicHead then
                        v29 = v3.Dictionary.join(v29, {
                            [v8.AssetTypeIdStrings.Head] = {}
                        });
                    end;
                    return v3.Dictionary.join(v29, {
                        [v30.assetTypeId] = v37
                    });
                end;
            else
                return v3.Dictionary.join(v29, {
                    [v30.assetTypeId] = v3.Dictionary.join(v29[v30.assetTypeId] or {}, {
                        [v30.assetId] = v3.None
                    })
                });
            end;
        end;
    end, 
    [v5.name] = function(v44, v45)
        v44 = v44 or {};
        if not v45.fullReset then
            return v20(v44, v45.assets);
        else
            return v45.assets;
        end;
    end, 
    [v6.name] = function(v46, v47)
        v46 = v46 or {};
        for v48, v49 in v47.assetTypeIdToAssetIdToAssetMetadataModel, nil, nil do
            for v50, _ in v49, nil, nil do
                v46 = v3.Dictionary.join(v46, {
                    [v48] = v3.Dictionary.join(v46[v48], {
                        [v50] = v3.None
                    })
                });
            end;
        end;
        return v46;
    end, 
    [v12.name] = function(v52, v53)
        v52 = v52 or {};
        local v54 = false;
        local v55 = {};
        for v56, v57 in pairs(v52) do
            local v58 = {};
            local v59 = false;
            for v60, v61 in v57, nil, nil do
                if not (v61.isLayered and (not (v56 == v8.AssetTypeIdStrings.HairAccessory) or v53.hasLayeredHair)) then
                    v58[v60] = v61;
                else
                    v59 = true;
                end;
            end;
            if not v59 then
                v55[v56] = v57;
            else
                v54 = true;
                v55[v56] = v58;
            end;
        end;
        if not v54 then
            return v52;
        else
            return v55;
        end;
    end, 
    [v13.name] = function(v62, v63)
        for v64, v65 in v63.assetIdToOrderAndAssetTypeId, nil, nil do
            local l_assetTypeId_0 = v65.assetTypeId;
            local l_order_0 = v65.order;
            local v68 = v62[l_assetTypeId_0];
            v62 = v3.Dictionary.join(v62, {
                [l_assetTypeId_0] = v3.Dictionary.join(v68, {
                    [v64] = v3.Dictionary.join(v68[v64], {
                        order = l_order_0
                    })
                })
            });
        end;
        return v62;
    end
});
