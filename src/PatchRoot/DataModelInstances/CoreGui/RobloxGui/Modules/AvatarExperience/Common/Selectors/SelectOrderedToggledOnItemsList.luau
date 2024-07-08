local l_CoreGui_0 = game:GetService("CoreGui");
local l_memoize_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).memoize;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v25 = l_memoize_0(function(v6, v7)
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = true;
    if v6 and v7 then
        for v12, v13 in v7, nil, nil do
            if v13.itemType == v3.ItemType.Asset then
                local l_itemSubType_0 = v13.itemSubType;
                if not (v3.LCIgnoredForSorting[l_itemSubType_0] or not v13.isLayered) then
                    v10[l_itemSubType_0] = true;
                    v9[v12] = v13.order or v3.LayeredClothingOrder[l_itemSubType_0];
                    if v13.order and v13.order ~= v3.LayeredClothingOrder[l_itemSubType_0] then
                        v11 = false;
                    end;
                    table.insert(v8, {
                        id = v12, 
                        typeId = l_itemSubType_0
                    });
                end;
            elseif v13.bundleInfo then
                for v15, v16 in v13.bundleInfo, nil, nil do
                    local l_assetType_0 = v16.assetType;
                    local v18 = v3.LayeredAssetTypes[l_assetType_0] ~= nil;
                    if not (v3.LCIgnoredForSorting[l_assetType_0] or not v18) then
                        v10[l_assetType_0] = true;
                        v9[v15] = v16.order or v3.LayeredClothingOrder[l_assetType_0];
                        if v16.order and v16.order ~= v3.LayeredClothingOrder[l_assetType_0] then
                            v11 = false;
                        end;
                        table.insert(v8, {
                            id = v15, 
                            typeId = l_assetType_0
                        });
                    end;
                end;
            end;
        end;
        for v19, v20 in v6, nil, nil do
            for v21, v22 in v20, nil, nil do
                if not ((v10[v19] or v3.LCIgnoredForSorting[v19]) or not v22.isLayered) then
                    v9[v21] = v22.order or v3.LayeredClothingOrder[v19];
                    if v22.order and v22.order ~= v3.LayeredClothingOrder[v19] then
                        v11 = false;
                    end;
                    table.insert(v8, {
                        id = v21, 
                        typeId = v19
                    });
                end;
            end;
        end;
        if not v11 then
            table.sort(v8, function(v23, v24)
                return v9[v24.id] < v9[v23.id];
            end);
            return v8, v11;
        else
            return {}, v11;
        end;
    else
        return {}, v11;
    end;
end);
return function(v26)
    return v25(v26.AvatarExperience.AvatarEditor.Character.EquippedAssets, v26.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems);
end;
