local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = {};
v3.__index = v3;
local function v5(v4)
    assert(v1.optional(v1.strictInterface({
        avatarRules = v1.optional(v1.table), 
        recommendedAssets = v1.optional(v1.table), 
        recommendedBundles = v1.optional(v1.table), 
        favorite = v1.optional(v1.boolean), 
        itemDetails = v1.optional(v1.table), 
        outfitDetails = v1.optional(v1.table), 
        currentOutfitPage = v1.optional(v1.table), 
        currentInventoryPage = v1.optional(v1.table), 
        currentSearchPage = v1.optional(v1.table), 
        setFavoriteSuccess = v1.optional(v1.boolean), 
        setFavoriteResult = v1.optional(v1.enum(Enum.AvatarPromptResult)), 
        createOutfitSuccess = v1.optional(v1.boolean), 
        createOutfitResult = v1.optional(v1.enum(Enum.AvatarPromptResult)), 
        createOutfitFailureType = v1.optional(v1.enum(Enum.CreateOutfitFailure))
    }))(v4));
end;
local function _(v6)
    v2.isType(v6, "EnumItem", "assetTypeEnum");
    if v6.EnumType ~= Enum.AssetType and v6.EnumType ~= Enum.AvatarAssetType then
        assert(false, "assetTypeEnum should be Enum.AssetType or Enum.AvatarAssetType");
    end;
end;
local _ = function(v8)
    if v8 then
        for _, v10 in v8, nil, nil do
            v2.isType(v10, "EnumItem", "assetTypeEnum");
            if v10.EnumType ~= Enum.AssetType and v10.EnumType ~= Enum.AvatarAssetType then
                assert(false, "assetTypeEnum should be Enum.AssetType or Enum.AvatarAssetType");
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v15(v12)
    return {
        GetCurrentPage = function(_)
            return v12;
        end, 
        AdvanceToNextPageAsync = function(_)
        end, 
        IsFinished = true
    };
end;
v3.new = function(v16)
    v5(v16);
    local v37 = {
        GetAvatarRules = function(_)
            return not not v16 and v16.avatarRules or {};
        end, 
        GetRecommendedAssets = function(_, v19)
            v2.isType(v19, "EnumItem", "assetTypeEnum");
            if v19.EnumType ~= Enum.AssetType and v19.EnumType ~= Enum.AvatarAssetType then
                assert(false, "assetTypeEnum should be Enum.AssetType or Enum.AvatarAssetType");
            end;
            return not not v16 and v16.recommendedAssets or {};
        end, 
        GetRecommendedBundles = function(_)
            return not not v16 and v16.recommendedBundles or {};
        end, 
        GetFavorite = function(_)
            if v16 and v16.favorite ~= nil then
                return v16.favorite;
            else
                return true;
            end;
        end, 
        GetItemDetails = function(_)
            return not not v16 and v16.itemDetails or {};
        end, 
        GetOutfitDetails = function(_)
            return not not v16 and v16.outfitDetails or {};
        end, 
        GetOutfits = function(_)
            return (v15(not not v16 and v16.currentOutfitPage or {}));
        end, 
        GetInventory = function(_, v26)
            v2.isType(v26, "table", "enumList");
            if v26 then
                for _, v28 in v26, nil, nil do
                    v2.isType(v28, "EnumItem", "assetTypeEnum");
                    if v28.EnumType ~= Enum.AssetType and v28.EnumType ~= Enum.AvatarAssetType then
                        assert(false, "assetTypeEnum should be Enum.AssetType or Enum.AvatarAssetType");
                    end;
                end;
            end;
            return (v15(not not v16 and v16.currentInventoryPage or {}));
        end, 
        SearchCatalog = function(_, v30)
            v2.isType(v30, "CatalogSearchParams", "searchParameters");
            local l_AssetTypes_0 = v30.AssetTypes;
            if l_AssetTypes_0 then
                for _, v33 in l_AssetTypes_0, nil, nil do
                    v2.isType(v33, "EnumItem", "assetTypeEnum");
                    if v33.EnumType ~= Enum.AssetType and v33.EnumType ~= Enum.AvatarAssetType then
                        assert(false, "assetTypeEnum should be Enum.AssetType or Enum.AvatarAssetType");
                    end;
                end;
            end;
            return (v15(not not v16 and v16.currentSearchPage or {}));
        end, 
        NoPromptSetFavorite = function(_)
            if v16 and v16.setFavoriteSuccess ~= nil then
                return v16.setFavoriteSuccess;
            else
                return true;
            end;
        end, 
        PromptSetFavoriteCompleted = {
            Wait = function()
                return not not v16 and v16.setFavoriteResult or Enum.AvatarPromptResult.Success;
            end
        }, 
        NoPromptSaveAvatarThumbnailCustomization = function(_)
            if v16 and v16.saveAvatarThumbnailCustomizationSuccess ~= nil then
                return v16.saveAvatarThumbnailCustomizationSuccess;
            else
                return true;
            end;
        end, 
        NoPromptCreateOutfit = function(_)
            if v16 and v16.createOutfitSuccess ~= nil then
                return v16.createOutfitSuccess;
            else
                return true;
            end;
        end, 
        PromptCreateOutfitCompleted = {
            Wait = function()
                return not not v16 and v16.createOutfitResult or Enum.AvatarPromptResult.Success, not not v16 and v16.createOutfitFailureType or nil;
            end
        }, 
        PromptSaveAvatarThumbnailCustomizationCompleted = {
            Wait = function()
                return not not v16 and v16.saveAvatarThumbnailCustomizationResult or Enum.AvatarPromptResult.Success, not not v16 and v16.saveAvatarThumbnailCustomizationFailureType or nil;
            end
        }
    };
    setmetatable(v37, {
        __index = v3
    });
    return v37;
end;
return v3;
