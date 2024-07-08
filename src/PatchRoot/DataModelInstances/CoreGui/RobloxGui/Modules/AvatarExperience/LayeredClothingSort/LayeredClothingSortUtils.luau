local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Models.AssetMetadata);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
return {
    createAssetIdToOrderMapping = l_memoize_0(function(v8)
        local v9 = {};
        for v10, v11 in v8, nil, nil do
            v9[v11.id] = {
                order = #v8 - v10, 
                assetTypeId = v11.typeId
            };
        end;
        return v9;
    end), 
    formatForSetOrder = l_memoize_0(function(v12, v13)
        if v13 then
            local v14 = {};
            for v15, v16 in v12, nil, nil do
                if not (not (v13[v16.typeId] and v13[v16.typeId][v16.id]) and not v16.equipped) then
                    v14[v16.id] = {
                        order = #v12 - v15, 
                        assetTypeId = v16.typeId
                    };
                end;
            end;
            return v14;
        else
            return nil;
        end;
    end), 
    formatForSetOrderWithTryOns = l_memoize_0(function(v17, v18, v19)
        if v18 then
            local v20 = {};
            local v21 = {};
            for v22, v23 in v17, nil, nil do
                if not (v18[v23.typeId] and v18[v23.typeId][v23.id]) and not v23.equipped then
                    if not v19 or not v19[v23.id] then
                        assert(v19 ~= nil, "tryOnItems should not be nil");
                        for _, v25 in v19, nil, nil do
                            if not (not v25.bundleInfo or not v25.bundleInfo[v23.id]) then
                                v21[v23.id] = #v17 - v22;
                                break;
                            end;
                        end;
                    else
                        v21[v23.id] = #v17 - v22;
                    end;
                else
                    v20[v23.id] = {
                        order = #v17 - v22, 
                        assetTypeId = v23.typeId
                    };
                end;
            end;
            return v20, v21;
        else
            return nil;
        end;
    end), 
    formatForEquipOutfit = l_memoize_0(function(v26, v27)
        if v27 then
            local v28 = {};
            for v29, v30 in v26, nil, nil do
                if not (not (v27[v30.typeId] and v27[v30.typeId][v30.id]) and not v30.equipped) then
                    local v31 = v4.getDefaultMetadata(v30.typeId);
                    v31.order = #v26 - v29;
                    v28[v30.typeId] = {
                        [v30.id] = v31
                    };
                end;
            end;
            return v28;
        else
            return nil;
        end;
    end), 
    getTableAndOrderAfterEquippingIntoSort = l_memoize_0(function(v32, v33)
        if v3.LayeredClothingOrder[v33.typeId] then
            local v34 = 0;
            local v35 = 0;
            for v36, v37 in v32, nil, nil do
                if v37.typeId == v33.typeId then
                    v34 = v36;
                elseif v34 == 0 and v3.LayeredClothingOrder[v33.typeId] < v3.LayeredClothingOrder[v37.typeId] then
                    v35 = v36;
                end;
            end;
            local v38 = 1;
            if v34 > 0 then
                v38 = v34;
            elseif v35 > 0 then
                v38 = v35 + 1;
            end;
            table.insert(v32, v38, v33);
            return v32, #v32 - v38;
        else
            return v32, 0;
        end;
    end), 
    getSortedEquippedLCIfNoDefault = l_memoize_0(function(v39)
        if v39 then
            local v40 = {};
            local v41 = {};
            local v42 = true;
            for v43, v44 in v39, nil, nil do
                for v45, v46 in v44, nil, nil do
                    if v46.order and v46.order ~= v3.LayeredClothingOrder[v43] then
                        v42 = false;
                    end;
                    if v46.isLayered then
                        v40[v45] = v46.order or v3.LayeredClothingOrder[v43];
                        table.insert(v41, {
                            id = v45, 
                            typeId = v43
                        });
                    end;
                end;
            end;
            if not v42 then
                table.sort(v41, function(v47, v48)
                    return v40[v48.id] < v40[v47.id];
                end);
                return v41;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end)
};
