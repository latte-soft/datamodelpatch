local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = nil;
local function _(v4, v5)
    return {
        category = v4, 
        subcategory = v5
    };
end;
local function v35()
    local v7 = {};
    local v8 = nil;
    local v9 = {};
    for _, v11 in (v1()), nil, nil do
        local l_Subcategories_0 = v11.Subcategories;
        if not l_Subcategories_0 then
            if not v11.AssetTypeIdStrings then
                if v11.OutfitType then
                    v9[v11.OutfitType] = {
                        category = v11.Category, 
                        subcategory = v11.Subcategory
                    };
                end;
            else
                for _, v14 in v11.AssetTypeIdStrings, nil, nil do
                    v7[v14] = {
                        category = v11.Category, 
                        subcategory = v11.Subcategory
                    };
                end;
            end;
        else
            for _, v16 in l_Subcategories_0, nil, nil do
                if not v16.AssetTypeIdStrings then
                    if not v16.BundleTypes then
                        if v16.OutfitType then
                            v9[v16.OutfitType] = {
                                category = v11.Category, 
                                subcategory = v11.Subcategory
                            };
                        end;
                    else
                        v8 = {
                            category = v11.Category, 
                            subcategory = v11.Subcategory
                        };
                    end;
                else
                    for _, v18 in v16.AssetTypeIdStrings, nil, nil do
                        v7[v18] = {
                            category = v16.Category, 
                            subcategory = v16.Subcategory
                        };
                    end;
                end;
            end;
        end;
    end;
    local v19 = {};
    local function v25(v20, v21)
        for _, v23 in v21, nil, nil do
            if not v19[v23] then
                v19[v23] = {};
            end;
            local v24 = v19[v23];
            v24[#v24 + 1] = v20;
        end;
    end;
    local function v26(v27)
        for _, v29 in v27, nil, nil do
            if not (not v29.AssetTypeIdStrings or not v29.SearchUuid) then
                v25(v29.SearchUuid, v29.AssetTypeIdStrings);
            end;
            if v29.Subcategories then
                v26(v29.Subcategories);
            end;
        end;
    end;
    local _ = function()
        for v30, _ in v2.DynamicHeadAssetTypes, nil, nil do
            if not v7[v30] then
                v7[v30] = v9[v2.OutfitTypes.DynamicHead];
            end;
        end;
    end;
    v26(v1());
    for v33, _ in v2.DynamicHeadAssetTypes, nil, nil do
        if not v7[v33] then
            v7[v33] = v9[v2.OutfitTypes.DynamicHead];
        end;
    end;
    return {
        AssetTypeToCategorySubcategory = v7, 
        AssetTypeToSearchUuids = v19, 
        BundleToCategorySubcategory = v8, 
        OutfitTypeToCategorySubcategory = v9
    };
end;
return function()
    if not v3 then
        v3 = v35();
    end;
    return v3;
end;
