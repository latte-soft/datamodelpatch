local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfit);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewOutfitNotification);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType);
local v13 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function _(v15, v16)
    local v17 = v16 == v9.AvatarEditor;
    local l_category_0 = v15.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v15.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v20 = v8()[l_category_0];
    local v21 = not not v20 and v20.Subcategories or nil;
    if not (not v17 or not v21) and v21[l_subcategory_0].SearchUuid == v10.PurchasedCharacterKey then
        return true;
    else
        return false;
    end;
end;
local v27 = l_memoize_0(function()
    for _, v24 in (v8()), nil, nil do
        if not (not v24 or not v24.Subcategories) then
            for _, v26 in v24.Subcategories, nil, nil do
                if v26 and v26.OutfitType == v11.OutfitTypes.DynamicHead then
                    return v26.SearchUuid;
                end;
            end;
        end;
    end;
    return nil;
end);
return function(v28, v29, v30)
    v13.isType(v29, "string", "GrantOutfit thunk expects networkImpl to be a function");
    return function(v31)
        local l_OwnedItemIdsBySubtype_0 = v31:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        v31:dispatch(v3(v29));
        local l_OwnedItemIdsBySubtype_1 = v31:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        v31:dispatch(v7(v28, v29)):andThen(function()
            local v34 = v31:getState();
            local v35 = v34.AvatarExperience.AvatarEditor.OutfitInfos[tostring(v29)];
            if v29 and v35.outfitType == v11.OutfitTypes.DynamicHead then
                local v36 = v27();
                if v36 then
                    v31:dispatch(v12(v36, v29));
                    v31:dispatch(v4(v11.OutfitTypes.DynamicHead));
                end;
                return ;
            elseif not v29 or not v35.isEditable then
                if l_OwnedItemIdsBySubtype_0 ~= l_OwnedItemIdsBySubtype_1 then
                    if not (not v29 or v35.isEditable) then
                        v31:dispatch(v6(v29));
                    end;
                    local v37 = v30 == v9.AvatarEditor;
                    local l_category_1 = v34.AvatarExperience.AvatarEditor.Categories.category;
                    local l_subcategory_1 = v34.AvatarExperience.AvatarEditor.Categories.subcategory;
                    local v40 = v8()[l_category_1];
                    local v41 = not not v40 and v40.Subcategories or nil;
                    if not (not not v37 and if v41 then v41[l_subcategory_1].SearchUuid == v10.PurchasedCharacterKey else false) then
                        v31:dispatch(v4(v11.OutfitTypes.Avatar));
                    end;
                end;
                return ;
            else
                v31:dispatch(v5(v29));
                return ;
            end;
        end);
    end;
end;
