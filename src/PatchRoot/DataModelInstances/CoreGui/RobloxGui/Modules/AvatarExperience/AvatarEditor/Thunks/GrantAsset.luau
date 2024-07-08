local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewAssetNotification);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function v20(v9, v10, v11)
    local v12 = v10 == v6.AvatarEditor;
    local l_category_0 = v9.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v9.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v15 = v7()[l_category_0];
    if v12 then
        local v16 = not not v15 and v15.Subcategories or nil;
        local v17 = not not v16 and v16[l_subcategory_0].AssetTypeIdStrings or v15.AssetTypeIdStrings;
        if v17 then
            for _, v19 in v17, nil, nil do
                if v19 == v11 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
return function(v21, v22, v23, v24, v25)
    v0.isType(v22, "string", "GrantAsset request expects assetId");
    v0.isType(v21, "string", "GrantAsset request expects assetTypeIdString");
    return function(v26)
        local l_OwnedItemIdsBySubtype_0 = v26:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        v26:dispatch(v2(v21, v22));
        v26:dispatch(v4(v23, v24, v22, v5.ItemType.Asset));
        if not (not (l_OwnedItemIdsBySubtype_0 ~= v26:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype) or v20(v26:getState(), v25, v21)) then
            v26:dispatch(v3(v21));
        end;
    end;
end;
