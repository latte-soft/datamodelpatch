local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Packages.Dash);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.LuaApp.SearchUuid);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogSubcategories);
local v8 = game:DefineFastString("AXCategories", "JacketAccessory.ClassicShirts.ClassicTShirts.ClassicPants");
local v9 = v1.collectSet(string.split(v8, "."));
local v10 = require(l_Modules_0.AvatarExperience.Flags.AXCatalogRefreshIXPTest);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage);
local v12 = not not v10.isEnabled() and require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils).readTestVariable(v10.EnabledForUser);
local v13 = {
    Tops = "Tops", 
    Outerwear = "Outerwear", 
    Bottoms = "Bottoms", 
    LeftShoeAccessory = "LeftShoeAccessory", 
    RightShoeAccessory = "RightShoeAccessory", 
    Shoes = "Shoes", 
    DivisibleShoes = "DivisibleShoes", 
    ClassicShirts = "ClassicShirts", 
    ClassicTShirts = "ClassicTShirts", 
    ClassicPants = "ClassicPants", 
    ShirtAccessory = "ShirtAccessory", 
    TShirtAccessory = "TShirtAccessory", 
    SweaterAccessory = "SweaterAccessory", 
    PantsAccessory = "PantsAccessory", 
    JacketAccessory = "JacketAccessory", 
    ShortsAccessory = "ShortsAccessory", 
    DressSkirtAccessory = "DressSkirtAccessory"
};
local function v14()
    return {
        [v13.ShirtAccessory] = {
            Name = "Shirts", 
            NavigationKey = v7.Shirts, 
            Title = "Feature.Avatar.Label.Shirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            key = v13.ShirtAccessory, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.ShirtAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.TShirtAccessory] = {
            Name = "TShirts", 
            NavigationKey = v7.TShirts, 
            Title = "Feature.Catalog.LabelTShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            key = v13.TShirtAccessory, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.TShirtAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.SweaterAccessory] = {
            Name = "Sweaters", 
            NavigationKey = v7.Sweaters, 
            Title = "Feature.Avatar.Label.Sweaters", 
            IconOn = "icons/menu/clothing/sweaters_on", 
            IconOff = "icons/menu/clothing/sweaters_off", 
            key = v13.SweaterAccessory, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.SweaterAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.JacketAccessory] = {
            Name = "Jackets", 
            NavigationKey = v7.Jackets, 
            Title = "Feature.Avatar.Label.Jackets", 
            IconOn = "icons/menu/clothing/jackets_on", 
            IconOff = "icons/menu/clothing/jackets_off", 
            key = v13.JacketAccessory, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.JacketAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.PantsAccessory] = {
            Name = "Pants", 
            NavigationKey = v7.Pants, 
            Title = "Feature.Avatar.Label.Pants", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            key = v13.PantsAccessory, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.PantsAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.DressSkirtAccessory] = {
            Name = "DressSkirt", 
            NavigationKey = v7.DressesAndSkirts, 
            Title = "Feature.Avatar.Label.DressesAndSkirts", 
            IconOn = "icons/menu/clothing/dresses_on", 
            IconOff = "icons/menu/clothing/dresses_off", 
            key = v13.DressSkirtAccessory, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.DressSkirtAccessory
            }, 
            SearchUuid = v4()
        }, 
        [v13.ShortsAccessory] = {
            Name = "Shorts", 
            NavigationKey = v7.Shorts, 
            Title = "Feature.Avatar.Label.Shorts", 
            IconOn = "icons/menu/clothing/shorts_on", 
            IconOff = "icons/menu/clothing/shorts_off", 
            key = v13.ShortsAccessory, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.ShortsAccessory
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.Shoes] = {
            Name = "Shoes", 
            NavigationKey = v7.Shoes, 
            Title = "Feature.Avatar.Label.Shoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            key = "Shoes", 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            BundleTypes = {
                v2.BundleTypeIdStrings.Shoes
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.ClassicShirts] = {
            Name = "Classic Shirts", 
            NavigationKey = v7.ClassicShirts, 
            Title = "Feature.Avatar.Label.ClassicShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            key = v13.ClassicShirts, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.Shirt
            }, 
            SearchUuid = v4()
        }, 
        [v13.ClassicTShirts] = {
            Name = "Classic T-Shirts", 
            NavigationKey = v7.ClassicTShirts, 
            Title = "Feature.Avatar.Label.ClassicTShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            key = v13.ClassicTShirts, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.TShirt
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        [v13.ClassicPants] = {
            Name = "Classic Pants", 
            NavigationKey = v7.ClassicPants, 
            Title = "Feature.Avatar.Label.ClassicPants", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            key = v13.ClassicPants, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.Pants
            }, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11()
        }
    };
end;
local function v17(v15)
    local v16 = {};
    if v15[v13.ShirtAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.ShirtAccessory);
    end;
    if v15[v13.TShirtAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.TShirtAccessory);
    end;
    if v15[v13.SweaterAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.SweaterAccessory);
    end;
    if v15[v13.JacketAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.JacketAccessory);
    end;
    if v15[v13.PantsAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.PantsAccessory);
    end;
    if v15[v13.ShortsAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.ShortsAccessory);
    end;
    if v15[v13.DressSkirtAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.DressSkirtAccessory);
    end;
    if v15[v13.LeftShoeAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.LeftShoeAccessory);
    end;
    if v15[v13.RightShoeAccessory] then
        table.insert(v16, v2.AssetTypeIdStrings.RightShoeAccessory);
    end;
    if v15[v13.ClassicShirts] then
        table.insert(v16, v2.AssetTypeIdStrings.Shirt);
    end;
    if v15[v13.ClassicTShirts] then
        table.insert(v16, v2.AssetTypeIdStrings.TShirt);
    end;
    if v15[v13.ClassicPants] then
        table.insert(v16, v2.AssetTypeIdStrings.Pants);
    end;
    return v16;
end;
local function v21(v18, v19)
    local v20 = {};
    if v18[v13.ShirtAccessory] then
        table.insert(v20, v19[v13.ShirtAccessory]);
    end;
    if v18[v13.TShirtAccessory] then
        table.insert(v20, v19[v13.TShirtAccessory]);
    end;
    if v18[v13.SweaterAccessory] then
        table.insert(v20, v19[v13.SweaterAccessory]);
    end;
    if v18[v13.JacketAccessory] then
        table.insert(v20, v19[v13.JacketAccessory]);
    end;
    if v18[v13.PantsAccessory] then
        table.insert(v20, v19[v13.PantsAccessory]);
    end;
    if v18[v13.DressSkirtAccessory] then
        table.insert(v20, v19[v13.DressSkirtAccessory]);
    end;
    if v18[v13.ShortsAccessory] then
        table.insert(v20, v19[v13.ShortsAccessory]);
    end;
    if v18[v13.LeftShoeAccessory] then
        table.insert(v20, v19[v13.Shoes]);
    end;
    if v18[v13.ClassicShirts] then
        table.insert(v20, v19[v13.ClassicShirts]);
    end;
    if v18[v13.ClassicTShirts] then
        table.insert(v20, v19[v13.ClassicTShirts]);
    end;
    if v18[v13.ClassicPants] then
        table.insert(v20, v19[v13.ClassicPants]);
    end;
    return v20;
end;
local v22 = nil;
local function v37()
    v8 = game:GetFastString("AXCategories");
    v9 = v1.collectSet(string.split(v8, "."));
    local v23 = v14();
    local v24 = v17(v9);
    local v25 = v21(v9, v23);
    local v26 = {
        Name = "Clothing", 
        NavigationKey = v6.Clothing, 
        Title = "Feature.Catalog.Label.Clothing", 
        IconOn = "icons/menu/clothing/clothing_on", 
        IconOff = "icons/menu/clothing/clothing_off", 
        CanAnimateCameraBasedMood = true, 
        AssetTypeIdStrings = v24, 
        SearchUuid = v4(), 
        Subcategories = v25, 
        TimeToRefresh = if not v12 then nil else v11()
    };
    local v27 = {};
    for v28, v29 in v25, nil, nil do
        v27[v29.key] = v28;
    end;
    local v30 = {};
    if v9[v13.ShirtAccessory] then
        table.insert(v30, v2.AssetTypeIdStrings.ShirtAccessory);
    end;
    if v9[v13.TShirtAccessory] then
        table.insert(v30, v2.AssetTypeIdStrings.TShirtAccessory);
    end;
    if v9[v13.SweaterAccessory] then
        table.insert(v30, v2.AssetTypeIdStrings.SweaterAccessory);
    end;
    local v31 = if not v9[v13.TShirtAccessory] then v30[1] else v2.AssetTypeIdStrings.TShirtAccessory;
    local v32 = {};
    if v9[v13.PantsAccessory] then
        table.insert(v32, v2.AssetTypeIdStrings.PantsAccessory);
    end;
    if v9[v13.ShortsAccessory] then
        table.insert(v32, v2.AssetTypeIdStrings.ShortsAccessory);
    end;
    if v9[v13.DressSkirtAccessory] then
        table.insert(v32, v2.AssetTypeIdStrings.DressSkirtAccessory);
    end;
    local v33 = if not v9[v13.PantsAccessory] then v32[1] else v2.AssetTypeIdStrings.PantsAccessory;
    local v34 = {
        Tops = {
            Name = "Tops", 
            Title = "Feature.Catalog.Label.Tops", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            RecommendedAssetTypeIdString = v31, 
            DEPRECATED_AssetTypeId = v31, 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.TShirts
            }, 
            AssetTypeIdStrings = v30, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        Outerwear = {
            Name = "Outerwear", 
            Title = "Feature.Avatar.Label.Outerwear", 
            IconOn = "icons/menu/clothing/jackets_on", 
            IconOff = "icons/menu/clothing/jackets_off", 
            DEPRECATED_AssetTypeId = v2.AssetTypeIdStrings.JacketAccessory, 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.Jackets
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.JacketAccessory
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        Bottoms = {
            Name = "Bottoms", 
            Title = "Feature.Avatar.Label.Bottoms", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            RecommendedAssetTypeIdString = v33, 
            DEPRECATED_AssetTypeId = v33, 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.Pants
            }, 
            AssetTypeIdStrings = v32, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        LeftShoes = {
            Name = "Left Shoes", 
            Title = "Feature.Avatar.Label.LeftShoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            DEPRECATED_AssetTypeId = v2.AssetTypeIdStrings.LeftShoeAccessory, 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Shoes, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.Shoes
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.LeftShoeAccessory
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        RightShoes = {
            Name = "Right Shoes", 
            Title = "Feature.Avatar.Label.RightShoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            DEPRECATED_AssetTypeId = v2.AssetTypeIdStrings.RightShoeAccessory, 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Shoes, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.Shoes
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.RightShoeAccessory
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        DivisibleShoes = {
            Name = "Divisible Shoes", 
            Title = "Feature.Avatar.Label.Shoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11(), 
            SubButtons = {
                [1] = {
                    Name = "Left", 
                    Title = "Feature.Avatar.Label.LeftInitial", 
                    AssetTypeIdStrings = {
                        v2.AssetTypeIdStrings.LeftShoeAccessory
                    }, 
                    SearchUuid = v4(), 
                    TimeToRefresh = if not v12 then nil else v11()
                }, 
                [2] = {
                    Name = "Right", 
                    Title = "Feature.Avatar.Label.RightInitial", 
                    AssetTypeIdStrings = {
                        v2.AssetTypeIdStrings.RightShoeAccessory
                    }, 
                    SearchUuid = v4(), 
                    TimeToRefresh = if not v12 then nil else v11()
                }
            }, 
            RecommendationsType = v3.RecommendationsType.Shoes, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.Shoes
            }, 
            Category = 2
        }, 
        ClassicShirts = {
            Name = "Classic Shirts", 
            Title = "Feature.Avatar.Label.ClassicShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            DEPRECATED_AssetTypeId = "11", 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.ClassicShirts
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.Shirt
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        ClassicTShirts = {
            Name = "Classic T-Shirts", 
            Title = "Feature.Avatar.Label.ClassicTShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            DEPRECATED_AssetTypeId = "2", 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Arms, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.ClassicTShirts
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.TShirt
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }, 
        ClassicPants = {
            Name = "Classic Pants", 
            Title = "Feature.Avatar.Label.ClassicPants", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            DEPRECATED_AssetTypeId = "12", 
            RenderItemTiles = true, 
            CameraFocus = v2.FocusType.Legs, 
            CameraZoomRadius = 12, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v6.Clothing, 
                SubcategoryKey = v7.ClassicPants
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.Pants
            }, 
            SearchUuid = v4(), 
            Category = 2, 
            TimeToRefresh = if not v12 then nil else v11()
        }
    };
    local v35 = {};
    local v36 = 0;
    if v9[v13.Tops] then
        v36 = v36 + 1;
        v34.Tops.Subcategory = v36;
        table.insert(v35, v34.Tops);
    end;
    if not (not v9[v13.Outerwear] and not v9[v13.JacketAccessory]) then
        v36 = v36 + 1;
        v34.Outerwear.Subcategory = v36;
        table.insert(v35, v34.Outerwear);
    end;
    if v9[v13.Bottoms] then
        v36 = v36 + 1;
        v34.Bottoms.Subcategory = v36;
        table.insert(v35, v34.Bottoms);
    end;
    if v9[v13.LeftShoeAccessory] then
        v36 = v36 + 1;
        v34.LeftShoes.Subcategory = v36;
        table.insert(v35, v34.LeftShoes);
    end;
    if v9[v13.RightShoeAccessory] then
        v36 = v36 + 1;
        v34.RightShoes.Subcategory = v36;
        table.insert(v35, v34.RightShoes);
    end;
    if v9[v13.ClassicShirts] then
        v36 = v36 + 1;
        v34.ClassicShirts.Subcategory = v36;
        table.insert(v35, v34.ClassicShirts);
    end;
    if v9[v13.ClassicTShirts] then
        v36 = v36 + 1;
        v34.ClassicTShirts.Subcategory = v36;
        table.insert(v35, v34.ClassicTShirts);
    end;
    if v9[v13.ClassicPants] then
        v34.ClassicPants.Subcategory = v36 + 1;
        table.insert(v35, v34.ClassicPants);
    end;
    return {
        avatarEditorCategories = {
            Name = "Clothing", 
            Title = "Feature.Catalog.Label.Clothing", 
            IconOn = "icons/menu/clothing/clothing_on", 
            IconOff = "icons/menu/clothing/clothing_off", 
            Category = 2, 
            Subcategory = nil, 
            Subcategories = v35, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v4(), 
            TimeToRefresh = if not v12 then nil else v11(), 
            HideTextUnderTile = true
        }, 
        catalogCategories = v26
    };
end;
return function(v38)
    if not (v22 and not v38) then
        v22 = v37();
    end;
    return v22;
end;
