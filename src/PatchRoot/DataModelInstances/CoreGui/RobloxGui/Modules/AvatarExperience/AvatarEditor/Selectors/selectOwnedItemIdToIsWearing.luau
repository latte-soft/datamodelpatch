local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local function v25(v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    local v21 = v19.slotInfo[v19.selectedSlot];
    local v22 = v12.RenderOutfitItemTiles == true;
    if v12.PageType == v5.PageType.Emotes then
        if not v21 then
            return false;
        else
            return v21.assetId == v11;
        end;
    elseif v13 then
        if v12.Sort and v20[v11] == v7.OutfitOrAsset.Outfit then
            v22 = true;
        end;
        if not v22 or not v18[v11] then
            for _, v24 in v13, nil, nil do
                if v24[v11] then
                    return true;
                end;
            end;
            return false;
        else
            return v6.isWearingOutfitNoState(v18[v11], v17, v14, v15, v13, v16);
        end;
    else
        return false;
    end;
end;
local v50 = l_memoize_0(function(v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
    local v37 = {};
    local v38 = false;
    if v26 then
        local v39 = v28[v26];
        if not (v26 ~= v7.EditableCharacterKey) or v26 == v7.PurchasedCharacterKey then
            v39 = v3.List.join(v28[v7.PurchasedCharacterKey] or {}, v28[v7.EditableCharacterKey] or {});
        end;
        if v39 then
            for _, v41 in v39, nil, nil do
                local v42 = v25(v41, v27, v29, v30, v31, v32, v33, v34, v35, v36);
                v37[v41] = v42;
                if v42 then
                    v38 = v42;
                end;
            end;
            if v27.Sort then
                local v43 = v27.AssetTypeIdStrings or {};
                for _, v45 in v43, nil, nil do
                    for v46, v47 in v29, nil, nil do
                        for v48, _ in v47, nil, nil do
                            if v45 == v46 then
                                v37[v48] = true;
                                v38 = true;
                            end;
                        end;
                    end;
                end;
            end;
            return v37, v38;
        else
            return v37, v38;
        end;
    else
        return v37, v38;
    end;
end);
return function(v51, v52)
    return v50(v52, v8.getAvatarEditorCategoryInfoFromState(v51), v51.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, v51.AvatarExperience.AvatarEditor.Character.EquippedAssets, v51.AvatarExperience.AvatarEditor.Character.BodyColors, v51.AvatarExperience.AvatarEditor.Character.BodyColor3s, v51.AvatarExperience.AvatarEditor.Character.AvatarScales, v51.AvatarExperience.AvatarEditor.Character.AvatarType, v51.AvatarExperience.AvatarEditor.OutfitInfos, v51.AvatarExperience.AvatarEditor.EquippedEmotes, v51.AvatarExperience.AvatarEditor.Character.OutfitOrAsset);
end;
