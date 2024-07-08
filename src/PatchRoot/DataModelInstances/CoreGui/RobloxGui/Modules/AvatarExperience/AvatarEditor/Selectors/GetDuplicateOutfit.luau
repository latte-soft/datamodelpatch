local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_memoize_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).memoize;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.Character);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v17(v6, v7, v8)
    local l_AvatarType_0 = v8.AvatarType;
    local l_BodyColors_0 = v8.BodyColors;
    local l_BodyColor3s_0 = v8.BodyColor3s;
    local l_EquippedAssets_0 = v8.EquippedAssets;
    local l_AvatarScales_0 = v8.AvatarScales;
    for _, v15 in v6, nil, nil do
        local v16 = v7[tostring(v15)];
        if not (not v16 or not v3.isWearingOutfitNoState(v16, l_AvatarType_0, l_BodyColors_0, l_BodyColor3s_0, l_EquippedAssets_0, l_AvatarScales_0)) then
            return v15;
        end;
    end;
    return nil;
end;
local v22 = l_memoize_0(function(v18, v19, v20, v21)
    return v17(v19, v21, v20) or v17(v18, v21, v20);
end);
return function(v23)
    local l_OwnedItemIdsBySubtype_0 = v23.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    return v22(l_OwnedItemIdsBySubtype_0[v2.PurchasedCharacterKey] or {}, l_OwnedItemIdsBySubtype_0[v2.EditableCharacterKey] or {}, v23.AvatarExperience.AvatarEditor.Character, v23.AvatarExperience.AvatarEditor.OutfitInfos);
end;
