local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
return function(v10)
    v3.isType(v10, "function", "GetEditableOutfits thunk expects networkImpl to be a function");
    return function(v11)
        local v12 = v11:getState();
        if v12.AvatarExperience.AvatarEditor.PageFinished[v7.CharacterKey] then
            local l_OutfitInfos_0 = v12.AvatarExperience.AvatarEditor.OutfitInfos;
            local v14 = v12.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v7.CharacterKey];
            local v15 = true;
            v14 = v4.List.filter(v14, function(v16)
                local v17 = l_OutfitInfos_0[tostring(v16)];
                if not v17 then
                    v15 = false;
                    return false;
                else
                    return not v8.isPresetOutfit(v17);
                end;
            end);
            if not v15 then
                --[[ close >= 6 ]]
            else
                v11:dispatch(v5(v7.EditableCharacterKey, v14));
                v11:dispatch(v6(v7.EditableCharacterKey, true));
                return v2.resolve();
            end;
        end;
        return v11:dispatch(v9(v10, v7.EditableCharacterKey, true));
    end;
end;
