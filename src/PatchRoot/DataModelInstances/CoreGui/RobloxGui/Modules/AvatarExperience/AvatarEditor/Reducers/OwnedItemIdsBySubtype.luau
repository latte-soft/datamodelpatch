local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeAsset);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local function _()
    return v15().AssetTypeToSearchUuids;
end;
return v2.createReducer({}, {
    [v4.name] = function(v17, v18)
        local v19 = {};
        local v20 = not not v17[v18.itemSubType] and v17[v18.itemSubType] or {};
        for _, v22 in v20, nil, nil do
            v19[v22] = v22;
        end;
        for _, v24 in v18.itemIds, nil, nil do
            if not v19[v24] then
                v20[#v20 + 1] = v24;
                v19[v24] = v24;
            end;
        end;
        return v3.Dictionary.join(v17, {
            [v18.itemSubType] = v20
        });
    end, 
    [v5.name] = function(v25, v26)
        local v27 = {};
        local v28 = tostring(v26.assetTypeId);
        local v29 = tostring(v26.assetId);
        local v30 = v15().AssetTypeToSearchUuids[v28];
        if v30 then
            for _, v32 in v30, nil, nil do
                local v33 = not not v25[v32] and v25[v32] or {};
                local v34 = {
                    v29
                };
                local v35 = false;
                for v36, v37 in v33, nil, nil do
                    if v37 == v29 then
                        v35 = true;
                        break;
                    else
                        v34[v36 + 1] = v37;
                    end;
                end;
                if not v35 then
                    v27[v32] = v34;
                end;
            end;
            if not next(v27) then
                return v25;
            else
                return v3.Dictionary.join(v25, v27);
            end;
        else
            return v25;
        end;
    end, 
    [v6.name] = function(v38, v39)
        local v40 = {};
        local v41 = tostring(v39.assetTypeId);
        local v42 = tostring(v39.assetId);
        local v43 = v15().AssetTypeToSearchUuids[v41];
        if v43 then
            for _, v45 in v43, nil, nil do
                local v46 = not not v38[v45] and v38[v45] or {};
                local v47 = v3.List.removeValue(v46, v42);
                if #v46 ~= #v47 then
                    v40[v45] = v47;
                end;
            end;
            if not next(v40) then
                return v38;
            else
                return v3.Dictionary.join(v38, v40);
            end;
        else
            return v38;
        end;
    end, 
    [v10.name] = function(v48, v49)
        local v50 = tostring(v49.outfitId);
        local l_outfitTypeId_0 = v49.outfitTypeId;
        local v52 = v48[l_outfitTypeId_0] or {};
        local v53 = {
            v50
        };
        for _, v55 in v52, nil, nil do
            if v55 == v50 then
                return v48;
            else
                table.insert(v53, v55);
            end;
        end;
        return v3.Dictionary.join(v48, {
            [l_outfitTypeId_0] = v53
        });
    end, 
    [v7.name] = function(v56, v57)
        local v58 = tostring(v57.outfitId);
        local v59 = v56[v14.CharacterKey] or {};
        local v60 = {
            v58
        };
        for v61, v62 in v59, nil, nil do
            if v62 == v58 then
                return v56;
            else
                v60[v61 + 1] = v62;
            end;
        end;
        return v3.Dictionary.join(v56, {
            [v14.CharacterKey] = v60
        });
    end, 
    [v8.name] = function(v63, v64)
        local v65 = tostring(v64.outfitId);
        local v66 = v63[v14.EditableCharacterKey] or {};
        local v67 = {
            v65
        };
        for v68, v69 in v66, nil, nil do
            if v69 == v65 then
                return v63;
            else
                v67[v68 + 1] = v69;
            end;
        end;
        return v3.Dictionary.join(v63, {
            [v14.EditableCharacterKey] = v67
        });
    end, 
    [v9.name] = function(v70, v71)
        local v72 = tostring(v71.outfitId);
        local v73 = v70[v14.PurchasedCharacterKey] or {};
        local v74 = {
            v72
        };
        for v75, v76 in v73, nil, nil do
            if v76 == v72 then
                return v70;
            else
                v74[v75 + 1] = v76;
            end;
        end;
        return v3.Dictionary.join(v70, {
            [v14.PurchasedCharacterKey] = v74
        });
    end, 
    [v12.name] = function(v77, v78)
        local v79 = tostring(v78.outfitId);
        return v3.Dictionary.join(v77, {
            [v14.CharacterKey] = v3.List.join({
                v79
            }, v3.List.removeValue(v77[v14.CharacterKey] or {}, v79)), 
            [v14.EditableCharacterKey] = v3.List.join({
                v79
            }, v3.List.removeValue(v77[v14.EditableCharacterKey] or {}, v79))
        });
    end, 
    [v11.name] = function(v80, v81)
        local v82 = tostring(v81.outfitId);
        return v3.Dictionary.join(v80, {
            [v14.CharacterKey] = v3.List.removeValue(v80[v14.CharacterKey] or {}, v82), 
            [v14.EditableCharacterKey] = v3.List.removeValue(v80[v14.EditableCharacterKey] or {}, v82)
        });
    end
});
