local l_CoreGui_0 = game:GetService("CoreGui");
local l_memoize_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).memoize;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local function v15(v9, v10, v11, v12, v13, v14)
    if not v9[v11.typeId] or not v9[v11.typeId][v11.id] then
        v13[v11.id] = #v10 - v14;
        return ;
    else
        v12[v11.id] = {
            assetTypeId = v11.typeId, 
            order = #v10 - v14
        };
        return ;
    end;
end;
local v41 = l_memoize_0(function(v16, v17, v18, v19, v20, v21, v22, v23)
    local v24 = {};
    local v25 = nil;
    local v26 = {};
    local v27 = {};
    if v17 == v4.ItemType.Bundle then
        if not (not v21 or not v21.items) then
            assert(v21, "silence type checker");
            assert(v21.items, "silence type checker");
            for _, v29 in v21.items, nil, nil do
                local v30 = v23[v29.id] and v23[v29.id].assetType;
                if v30 then
                    local v31 = v4.LayeredAssetTypes[v30] ~= nil;
                    if not ((v20 or v4.LCIgnoredForSorting[v30]) or not v31) then
                        local v32, v33 = v5.getTableAndOrderAfterEquippingIntoSort(v19, {
                            id = v29.id, 
                            typeId = v30
                        });
                        v25 = v33;
                        v19 = v32;
                    end;
                    v24[tostring(v29.id)] = {
                        assetType = v30, 
                        order = v25 or v4.LayeredClothingOrder[v30]
                    };
                end;
            end;
            for v34, v35 in pairs(v19) do
                if v24[v35.id] == nil then
                    v15(v22, v19, v35, v26, v27, v34);
                end;
            end;
        end;
    else
        local v36 = v4.LayeredAssetTypes[v18] ~= nil;
        if not ((v20 or v4.LCIgnoredForSorting[v18]) or not v36) then
            local v37, v38 = v5.getTableAndOrderAfterEquippingIntoSort(v19, {
                id = v16, 
                typeId = v18
            });
            v25 = v38;
            for v39, v40 in v37, nil, nil do
                if v40.id ~= v16 then
                    v15(v22, v37, v40, v26, v27, v39);
                end;
            end;
        end;
    end;
    return {
        overrideOrder = v25, 
        bundleInfoMapping = v24, 
        equippedAssetsToSetOrder = v26, 
        itemIdToOrderMap = v27
    };
end);
return function(v42, v43, v44, v45, v46, v47)
    return v41(v43, v44, v45, v46, v47, v3.getBundleInfoFromState(v42, v43), v42.AvatarExperience.AvatarEditor.Character.EquippedAssets, v42.AvatarExperience.Common.AssetInfos);
end;
