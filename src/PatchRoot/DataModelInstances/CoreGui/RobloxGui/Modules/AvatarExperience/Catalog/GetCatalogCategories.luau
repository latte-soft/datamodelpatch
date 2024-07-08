local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v5 = require(l_Modules_0.LuaApp.SearchUuid);
local v6 = require(l_Modules_0.AvatarExperience.Common.getClothingCategories);
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v9 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogSubcategories);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v11 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v12 = require(l_Modules_0.AvatarExperience.Flags.AXCatalogRefreshIXPTest);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage);
local v14 = not not v12.isEnabled() and v11.readTestVariable(v12.EnabledForUser);
local function v15()
    return {
        {
            Name = "All", 
            NavigationKey = v8.Recommended, 
            IconOn = "icons/menu/clothing/recommended_on", 
            IconOff = "icons/menu/clothing/recommended_off", 
            Title = "Feature.Avatar.Heading.All", 
            CategoryFilter = "Recommended", 
            DisableFilters = true, 
            ShowSponsored = true, 
            ShowWidgets = true, 
            ShowTopics = true, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v5(), 
            TimeToRefresh = if not v14 then v4.MinSecsToRefreshRecommendedCatalogPage else v13()
        }, 
        {
            Name = "Characters", 
            NavigationKey = v8.Characters, 
            Title = "Feature.Catalog.Label.Characters", 
            IconOn = "icons/menu/clothing/characters_on", 
            IconOff = "icons/menu/clothing/characters_off", 
            BundleTypes = {
                v3.BundleTypeIdStrings.BodyParts
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v5(), 
            TimeToRefresh = if not v14 then nil else v13()
        }, 
        v6().catalogCategories, 
        {
            Name = "Accessories", 
            NavigationKey = v8.Accessories, 
            Title = "Feature.Catalog.LabelAccessories", 
            IconOn = "icons/menu/clothing/accessories_on", 
            IconOff = "icons/menu/clothing/accessories_off", 
            TimeToRefresh = if not v14 then nil else v13(), 
            AssetTypeIdStrings = {
                v3.AssetTypeIdStrings.Hat, 
                v3.AssetTypeIdStrings.FaceAccessory, 
                v3.AssetTypeIdStrings.NeckAccessory, 
                v3.AssetTypeIdStrings.ShoulderAccessory, 
                v3.AssetTypeIdStrings.FrontAccessory, 
                v3.AssetTypeIdStrings.BackAccessory, 
                v3.AssetTypeIdStrings.WaistAccessory, 
                v3.AssetTypeIdStrings.Gear
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v5(), 
            Subcategories = {
                [1] = {
                    Name = "Hats", 
                    NavigationKey = v9.Hats, 
                    Title = "Feature.Avatar.Label.Head", 
                    IconOn = "icons/menu/clothing/hats_on", 
                    IconOff = "icons/menu/clothing/hats_off", 
                    CameraFocus = v3.FocusType.Head, 
                    CameraZoomRadius = 11, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.Hat
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [2] = {
                    Name = "Face", 
                    NavigationKey = v9.Face, 
                    Title = "Feature.Avatar.Label.Face", 
                    IconOn = "icons/menu/clothing/face_on", 
                    IconOff = "icons/menu/clothing/face_off", 
                    CameraFocus = v3.FocusType.Face, 
                    CameraZoomRadius = 4.5, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.FaceAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [3] = {
                    Name = "Neck", 
                    NavigationKey = v9.Neck, 
                    Title = "Feature.Avatar.Label.Neck", 
                    IconOn = "icons/menu/clothing/neck_on", 
                    IconOff = "icons/menu/clothing/neck_off", 
                    CameraFocus = v3.FocusType.Neck, 
                    CameraZoomRadius = 9, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.NeckAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [4] = {
                    Name = "Shoulder", 
                    NavigationKey = v9.Shoulder, 
                    Title = "Feature.Avatar.Label.Shoulder", 
                    IconOn = "icons/menu/clothing/shoulder_on", 
                    IconOff = "icons/menu/clothing/shoulder_off", 
                    CameraFocus = v3.FocusType.Shoulders, 
                    CameraZoomRadius = 11, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.ShoulderAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [5] = {
                    Name = "Front", 
                    NavigationKey = v9.Front, 
                    Title = "Feature.Avatar.Label.Front", 
                    IconOn = "icons/menu/clothing/front_on", 
                    IconOff = "icons/menu/clothing/front_off", 
                    CameraFocus = v3.FocusType.Arms, 
                    CameraZoomRadius = 9.5, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.FrontAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [6] = {
                    Name = "Back", 
                    NavigationKey = v9.Back, 
                    Title = "Feature.Avatar.Label.Back", 
                    IconOn = "icons/menu/clothing/back_on", 
                    IconOff = "icons/menu/clothing/back_off", 
                    CameraFocus = v3.FocusType.Arms, 
                    CameraZoomRadius = 21, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.BackAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [7] = {
                    Name = "Waist", 
                    NavigationKey = v9.Waist, 
                    Title = "Feature.Avatar.Label.Waist", 
                    IconOn = "icons/menu/clothing/waist_on", 
                    IconOff = "icons/menu/clothing/waist_off", 
                    CameraFocus = v3.FocusType.Waist, 
                    CameraZoomRadius = 17, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.WaistAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [8] = {
                    Name = "Gear", 
                    NavigationKey = v9.Gear, 
                    Title = "Feature.Catalog.Label.Gear", 
                    IconOn = "icons/menu/clothing/gear_on", 
                    IconOff = "icons/menu/clothing/gear_off", 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.Gear
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }
            }
        }, 
        {
            Name = "Heads", 
            NavigationKey = v8.Head, 
            Title = "Feature.Avatar.Label.Heads", 
            IconOn = "icons/menu/clothing/classicHead_on", 
            IconOff = "icons/menu/clothing/classicHead_off", 
            AssetTypeIdStrings = {
                v3.AssetTypeIdStrings.HairAccessory, 
                v3.AssetTypeIdStrings.Head, 
                v3.AssetTypeIdStrings.Face, 
                v3.AssetTypeIdStrings.DynamicHead
            }, 
            BundleTypes = {
                v3.BundleTypeIdStrings.DynamicHead
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v5(), 
            TimeToRefresh = if not v14 then nil else v13(), 
            Subcategories = {
                [1] = {
                    Name = "Heads", 
                    NavigationKey = v9.Heads, 
                    Title = "Feature.Avatar.Label.Heads", 
                    IconOn = "icons/menu/clothing/type_on", 
                    IconOff = "icons/menu/clothing/type_off", 
                    CameraFocus = v3.FocusType.Head, 
                    CameraZoomRadius = 8.5, 
                    BundleTypes = {
                        v3.BundleTypeIdStrings.DynamicHead
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [2] = {
                    Name = "Hair", 
                    NavigationKey = v9.Hair, 
                    Title = "Feature.Catalog.Label.Hair", 
                    IconOn = "icons/menu/clothing/hair_on", 
                    IconOff = "icons/menu/clothing/hair_off", 
                    CameraFocus = v3.FocusType.Head, 
                    CameraZoomRadius = 8.5, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.HairAccessory
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [3] = {
                    Name = "Classic Heads", 
                    NavigationKey = v9.ClassicHeads, 
                    Title = "Feature.Avatar.Label.ClassicHeads", 
                    IconOn = "icons/menu/clothing/classicHead_on", 
                    IconOff = "icons/menu/clothing/classicHead_off", 
                    CameraFocus = v3.FocusType.Head, 
                    CameraZoomRadius = 6.5, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.Head
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [4] = {
                    Name = "Classic Faces", 
                    NavigationKey = v9.ClassicFaces, 
                    Title = "Feature.Avatar.Label.ClassicFaces", 
                    IconOn = "icons/menu/clothing/faces_on", 
                    IconOff = "icons/menu/clothing/faces_off", 
                    CameraFocus = v3.FocusType.Face, 
                    CameraZoomRadius = 7, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.Face
                    }, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }
            }
        }, 
        {
            Name = "AllAnimations", 
            NavigationKey = v8.AllAnimations, 
            Title = "Feature.Avatar.Heading.Animations", 
            IconOn = "icons/menu/clothing/animation_on", 
            IconOff = "icons/menu/clothing/animation_off", 
            CameraZoomRadius = v3.AnimationCategoryCameraZoomRadius, 
            AssetTypeIdStrings = {
                v3.AssetTypeIdStrings.EmoteAnimation
            }, 
            BundleTypes = {
                v3.BundleTypeIdStrings.Animations
            }, 
            PageType = v3.PageType.AllAnimation, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v5(), 
            TimeToRefresh = if not v14 then nil else v13(), 
            Subcategories = {
                [1] = {
                    Name = "AnimationBundles", 
                    NavigationKey = v9.AnimationBundles, 
                    Title = "Feature.Catalog.Label.Bundles", 
                    IconOn = "icons/menu/clothing/animation_on", 
                    IconOff = "icons/menu/clothing/animation_off", 
                    CameraZoomRadius = v3.AnimationCategoryCameraZoomRadius, 
                    CanAnimateCameraBasedMood = true, 
                    BundleTypes = {
                        v3.BundleTypeIdStrings.Animations
                    }, 
                    PageType = v3.PageType.Animation, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }, 
                [2] = {
                    Name = "Emotes", 
                    NavigationKey = v9.Emotes, 
                    Title = "Feature.Catalog.Label.Emotes", 
                    IconOn = "icons/menu/clothing/emotes_on", 
                    IconOff = "icons/menu/clothing/emotes_off", 
                    CameraZoomRadius = v3.AnimationCategoryCameraZoomRadius, 
                    CanAnimateCameraBasedMood = false, 
                    AssetTypeIdStrings = {
                        v3.AssetTypeIdStrings.EmoteAnimation
                    }, 
                    PageType = v3.PageType.Emotes, 
                    SearchUuid = v5(), 
                    TimeToRefresh = if not v14 then nil else v13()
                }
            }
        }
    };
end;
local v16 = nil;
local function _(v17)
    v7.isNotNil(v17.IconOn, "category " .. v17.Name .. " is missing iconOn");
    v7.isNotNil(v17.IconOff, "category  " .. v17.Name .. " is missing IconOff");
    v7.isNotNil(v17.SearchUuid, "category  " .. v17.Name .. " is missing SearchUuid");
end;
local function v24(v19)
    for _, v21 in v19, nil, nil do
        v7.isNotNil(v21.IconOn, "category " .. v21.Name .. " is missing iconOn");
        v7.isNotNil(v21.IconOff, "category  " .. v21.Name .. " is missing IconOff");
        v7.isNotNil(v21.SearchUuid, "category  " .. v21.Name .. " is missing SearchUuid");
        if v21.Subcategories then
            for _, v23 in v21.Subcategories, nil, nil do
                v7.isNotNil(v23.IconOn, "category " .. v23.Name .. " is missing iconOn");
                v7.isNotNil(v23.IconOff, "category  " .. v23.Name .. " is missing IconOff");
                v7.isNotNil(v23.SearchUuid, "category  " .. v23.Name .. " is missing SearchUuid");
            end;
        end;
    end;
end;
return function(v25)
    if not v25 then
        if not v16 then
            v16 = v15();
            v24(v16);
        end;
        return v16;
    else
        local v26 = v15();
        v24(v26);
        return v26;
    end;
end;
