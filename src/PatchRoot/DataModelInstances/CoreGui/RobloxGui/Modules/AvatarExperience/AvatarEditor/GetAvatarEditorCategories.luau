local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.LuaApp.SearchUuid);
local v5 = require(l_Modules_0.AvatarExperience.Common.getClothingCategories);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategories);
local v9 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogSubcategories);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
game:DefineFastFlag("HideAvatarBuildCategoryInVR", false);
local v11 = nil;
local function v12()
    return {
        Name = v3.CharacterKey, 
        Title = "Feature.Catalog.Label.Characters", 
        IconOn = "icons/menu/clothing/characters_on", 
        IconOff = "icons/menu/clothing/characters_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        SearchUuid = v3.CharacterKey, 
        CanAnimateCameraBasedMood = true, 
        Subcategories = {
            [1] = {
                Name = "Creations", 
                Title = "Feature.Avatar.Label.Creations", 
                IconOn = "icons/menu/clothing/creations_on", 
                IconOff = "icons/menu/clothing/creations_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                ManageOutfitsEnabled = true, 
                RecommendationsType = v3.RecommendationsType.BodyParts, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Characters
                }, 
                SearchUuid = v3.EditableCharacterKey, 
                BundleTypes = {
                    v2.BundleTypeIdStrings.BodyParts, 
                    v2.BundleTypeIdStrings.Animations
                }
            }, 
            [2] = {
                Name = "Purchased", 
                Title = "Feature.Avatar.Label.Purchased", 
                IconOn = "icons/menu/clothing/purchased_on", 
                IconOff = "icons/menu/clothing/purchased_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.BodyParts, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Characters
                }, 
                SearchUuid = v3.PurchasedCharacterKey, 
                OutfitType = v2.OutfitTypes.Avatar
            }
        } or nil
    };
end;
local function v13()
    return {
        Name = "Accessories", 
        Title = "Feature.Catalog.LabelAccessories", 
        IconOn = "icons/menu/clothing/accessories_on", 
        IconOff = "icons/menu/clothing/accessories_off", 
        SearchUuid = v4(), 
        HideTextUnderTile = true, 
        CanAnimateCameraBasedMood = true, 
        Subcategories = {
            [1] = {
                Name = "Hats", 
                Title = "Feature.Avatar.Label.Head", 
                IconOn = "icons/menu/clothing/hats_on", 
                IconOff = "icons/menu/clothing/hats_off", 
                DEPRECATED_AssetTypeId = "8", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Head, 
                CameraZoomRadius = 11, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Hats
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.Hat
                }, 
                SearchUuid = v4()
            }, 
            [2] = {
                Name = "Face", 
                Title = "Feature.Avatar.Label.Face", 
                IconOn = "icons/menu/clothing/face_on", 
                IconOff = "icons/menu/clothing/face_off", 
                DEPRECATED_AssetTypeId = "42", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Face, 
                CameraZoomRadius = 7, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Face
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.FaceAccessory
                }, 
                SearchUuid = v4()
            }, 
            [3] = {
                Name = "Neck", 
                Title = "Feature.Avatar.Label.Neck", 
                IconOn = "icons/menu/clothing/neck_on", 
                IconOff = "icons/menu/clothing/neck_off", 
                DEPRECATED_AssetTypeId = "43", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Neck, 
                CameraZoomRadius = 9, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Neck
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.NeckAccessory
                }, 
                SearchUuid = v4()
            }, 
            [4] = {
                Name = "Shoulder", 
                Title = "Feature.Avatar.Label.Shoulder", 
                IconOn = "icons/menu/clothing/shoulder_on", 
                IconOff = "icons/menu/clothing/shoulder_off", 
                DEPRECATED_AssetTypeId = "44", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Shoulders, 
                CameraZoomRadius = 11, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Shoulder
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.ShoulderAccessory
                }, 
                SearchUuid = v4()
            }, 
            [5] = {
                Name = "Front", 
                Title = "Feature.Avatar.Label.Front", 
                IconOn = "icons/menu/clothing/front_on", 
                IconOff = "icons/menu/clothing/front_off", 
                DEPRECATED_AssetTypeId = "45", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Arms, 
                CameraZoomRadius = 9.5, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Front
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.FrontAccessory
                }, 
                SearchUuid = v4()
            }, 
            [6] = {
                Name = "Back", 
                Title = "Feature.Avatar.Label.Back", 
                IconOn = "icons/menu/clothing/back_on", 
                IconOff = "icons/menu/clothing/back_off", 
                DEPRECATED_AssetTypeId = "46", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Arms, 
                CameraZoomRadius = 21, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Back
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.BackAccessory
                }, 
                SearchUuid = v4()
            }, 
            [7] = {
                Name = "Waist", 
                Title = "Feature.Avatar.Label.Waist", 
                IconOn = "icons/menu/clothing/waist_on", 
                IconOff = "icons/menu/clothing/waist_off", 
                DEPRECATED_AssetTypeId = "47", 
                RenderItemTiles = true, 
                CameraFocus = v2.FocusType.Waist, 
                CameraZoomRadius = 17, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Waist
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.WaistAccessory
                }, 
                SearchUuid = v4()
            }, 
            [8] = {
                Name = "Gear", 
                Title = "Feature.Avatar.Label.Gear", 
                IconOn = "icons/menu/clothing/gear_on", 
                IconOff = "icons/menu/clothing/gear_off", 
                DEPRECATED_AssetTypeId = "19", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.Asset, 
                MatchingCatalogPage = {
                    CategoryKey = v8.Accessories, 
                    SubcategoryKey = v9.Gear
                }, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.Gear
                }, 
                SearchUuid = v4()
            }
        }
    };
end;
local function v15()
    local v14 = {
        CategoryKey = v8.AllAnimations, 
        SubcategoryKey = v9.AnimationBundles
    };
    return {
        Name = "Animation", 
        Title = "Feature.Catalog.Label.Animation", 
        IconOn = "icons/menu/clothing/animation_on", 
        IconOff = "icons/menu/clothing/animation_off", 
        SearchUuid = v4(), 
        CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
        PageType = v2.PageType.Animation, 
        CanAnimateCameraBasedMood = true, 
        Subcategories = {
            [1] = {
                Name = "Idle Animations", 
                Title = "Feature.Avatar.Label.Idle", 
                IconOn = "icons/menu/clothing/idle_on", 
                IconOff = "icons/menu/clothing/idle_off", 
                EmptyString = "Feature.Avatar.Label.IdleAnimations", 
                DEPRECATED_AssetTypeId = "51", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.IdleAnimation
                }, 
                SearchUuid = v4()
            }, 
            [2] = {
                Name = "Walk Animations", 
                Title = "Feature.Avatar.Label.Walk", 
                IconOn = "icons/menu/clothing/walk_on", 
                IconOff = "icons/menu/clothing/walk_off", 
                EmptyString = "Feature.Avatar.Label.WalkAnimations", 
                DEPRECATED_AssetTypeId = "55", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.WalkAnimation
                }, 
                SearchUuid = v4()
            }, 
            [3] = {
                Name = "Run Animations", 
                Title = "Feature.Avatar.Label.Run", 
                IconOn = "icons/menu/clothing/animation_on", 
                IconOff = "icons/menu/clothing/animation_off", 
                EmptyString = "Feature.Avatar.Label.RunAnimations", 
                DEPRECATED_AssetTypeId = "53", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.RunAnimation
                }, 
                SearchUuid = v4()
            }, 
            [4] = {
                Name = "Jump Animations", 
                Title = "Feature.Avatar.Label.Jump", 
                IconOn = "icons/menu/clothing/jump_on", 
                IconOff = "icons/menu/clothing/jump_off", 
                EmptyString = "Feature.Avatar.Label.JumpAnimations", 
                DEPRECATED_AssetTypeId = "52", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.JumpAnimation
                }, 
                SearchUuid = v4()
            }, 
            [5] = {
                Name = "Fall Animations", 
                Title = "Feature.Avatar.Label.Fall", 
                IconOn = "icons/menu/clothing/fall_on", 
                IconOff = "icons/menu/clothing/fall_off", 
                EmptyString = "Feature.Avatar.Label.FallAnimations", 
                DEPRECATED_AssetTypeId = "50", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.FallAnimation
                }, 
                SearchUuid = v4()
            }, 
            [6] = {
                Name = "Climb Animations", 
                Title = "Feature.Avatar.Label.Climb", 
                IconOn = "icons/menu/clothing/climb_on", 
                IconOff = "icons/menu/clothing/climb_off", 
                EmptyString = "Feature.Avatar.Label.ClimbAnimations", 
                DEPRECATED_AssetTypeId = "48", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.ClimbAnimation
                }, 
                SearchUuid = v4()
            }, 
            [7] = {
                Name = "Swim Animations", 
                Title = "Feature.Avatar.Label.Swim", 
                IconOn = "icons/menu/clothing/swim_on", 
                IconOff = "icons/menu/clothing/swim_off", 
                EmptyString = "Feature.Avatar.Label.SwimAnimations", 
                DEPRECATED_AssetTypeId = "54", 
                RenderItemTiles = true, 
                RecommendationsType = v3.RecommendationsType.AvatarAnimations, 
                MatchingCatalogPage = v14, 
                AssetTypeIdStrings = {
                    v2.AssetTypeIdStrings.SwimAnimation
                }, 
                SearchUuid = v4()
            }
        }
    };
end;
local function v34()
    local v16 = v12();
    local v17 = {
        Name = "HeadAndBody", 
        Title = "Feature.Avatar.Label.HeadBody", 
        IconOn = "icons/menu/clothing/body_on", 
        IconOff = "icons/menu/clothing/body_off", 
        SearchUuid = v4(), 
        CanAnimateCameraBasedMood = true
    };
    local v18 = {
        Name = "Style", 
        Title = "Feature.Avatar.Label.Heads", 
        IconOn = "icons/menu/clothing/type_on", 
        IconOff = "icons/menu/clothing/type_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        CameraFocus = v2.FocusType.Face, 
        CameraZoomRadius = 6.5, 
        RecommendationsType = v3.RecommendationsType.DynamicHeads, 
        MatchingCatalogPage = {
            CategoryKey = v8.Head, 
            SubcategoryKey = v9.Heads
        }, 
        OutfitType = v2.OutfitTypes.DynamicHead, 
        OutfitFilter = Enum.OutfitSource.Purchased, 
        SearchUuid = v4()
    };
    local v19 = {
        Name = "Hair", 
        Title = "Feature.Avatar.Label.Hair", 
        IconOn = "icons/menu/clothing/hair_on", 
        IconOff = "icons/menu/clothing/hair_off", 
        DEPRECATED_AssetTypeId = "41", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Head, 
        CameraZoomRadius = 8.5, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = {
            CategoryKey = v8.Head, 
            SubcategoryKey = v9.Hair
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.HairAccessory
        }, 
        SearchUuid = v4()
    };
    local v20 = {
        Name = "Skin", 
        Title = "Feature.Avatar.Label.Skin", 
        IconOn = "icons/menu/clothing/skin_on", 
        IconOff = "icons/menu/clothing/skin_off", 
        RenderItemTiles = false, 
        RecommendationsType = v3.RecommendationsType.None, 
        PageType = v2.PageType.BodyColors, 
        SearchUuid = v4()
    };
    local v21 = {
        Name = "Classic Heads", 
        Title = "Feature.Avatar.Label.ClassicHeads", 
        IconOn = "icons/menu/clothing/classicHead_on", 
        IconOff = "icons/menu/clothing/classicHead_off", 
        DEPRECATED_AssetTypeId = "17", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Face, 
        CameraZoomRadius = 6.5, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = {
            CategoryKey = v8.Head, 
            SubcategoryKey = v9.ClassicHeads
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.Head
        }, 
        SearchUuid = v4()
    };
    local v22 = {
        Name = "Classic Faces", 
        Title = "Feature.Avatar.Label.ClassicFaces", 
        IconOn = "icons/menu/clothing/faces_on", 
        IconOff = "icons/menu/clothing/faces_off", 
        DEPRECATED_AssetTypeId = "18", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Face, 
        CameraZoomRadius = 7, 
        RecommendationsType = v3.RecommendationsType.Asset, 
        MatchingCatalogPage = {
            CategoryKey = v8.Head, 
            SubcategoryKey = v9.ClassicFaces
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.Face
        }, 
        SearchUuid = v4()
    };
    local v23 = {
        Name = "Torsos", 
        Title = "Feature.Avatar.Label.Torsos", 
        IconOn = "icons/menu/clothing/torsos_on", 
        IconOff = "icons/menu/clothing/torsos_off", 
        DEPRECATED_AssetTypeId = "27", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Arms, 
        CameraZoomRadius = 9, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.Torso
        }, 
        SearchUuid = v4()
    };
    local v24 = {
        Name = "Left Arms", 
        Title = "Feature.Avatar.Label.LeftArms", 
        IconOn = "icons/menu/clothing/arms_on", 
        IconOff = "icons/menu/clothing/arms_off", 
        DEPRECATED_AssetTypeId = "29", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Arms, 
        CameraZoomRadius = 13, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.LeftArm
        }, 
        SearchUuid = v4()
    };
    local v25 = {
        Name = "Right Arms", 
        Title = "Feature.Avatar.Label.RightArms", 
        IconOn = "icons/menu/clothing/arms_on", 
        IconOff = "icons/menu/clothing/arms_off", 
        DEPRECATED_AssetTypeId = "28", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Arms, 
        CameraZoomRadius = 13, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.RightArm
        }, 
        SearchUuid = v4()
    };
    local v26 = {
        Name = "Left Legs", 
        Title = "Feature.Avatar.Label.LeftLegs", 
        IconOn = "icons/menu/clothing/legs_on", 
        IconOff = "icons/menu/clothing/legs_off", 
        DEPRECATED_AssetTypeId = "30", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Legs, 
        CameraZoomRadius = 13.5, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.LeftLeg
        }, 
        SearchUuid = v4()
    };
    local v27 = {
        Name = "Right Legs", 
        Title = "Feature.Avatar.Label.RightLegs", 
        IconOn = "icons/menu/clothing/legs_on", 
        IconOff = "icons/menu/clothing/legs_off", 
        DEPRECATED_AssetTypeId = "31", 
        RenderItemTiles = true, 
        CameraFocus = v2.FocusType.Legs, 
        CameraZoomRadius = 13.5, 
        RecommendationsType = v3.RecommendationsType.BodyParts, 
        MatchingCatalogPage = {
            CategoryKey = v8.Characters
        }, 
        AssetTypeIdStrings = {
            v2.AssetTypeIdStrings.RightLeg
        }, 
        SearchUuid = v4()
    };
    local v28 = {
        Name = "Build", 
        Title = "Feature.Avatar.Label.Build", 
        IconOn = "icons/menu/clothing/build_on", 
        IconOff = "icons/menu/clothing/build_off", 
        RenderItemTiles = false, 
        RecommendationsType = v3.RecommendationsType.None, 
        PageType = v2.PageType.BodyStyle, 
        SearchUuid = v4()
    };
    local v29 = {};
    table.insert(v29, v18);
    table.insert(v29, v19);
    table.insert(v29, v20);
    table.insert(v29, v21);
    table.insert(v29, v22);
    table.insert(v29, v23);
    table.insert(v29, v24);
    table.insert(v29, v25);
    table.insert(v29, v26);
    table.insert(v29, v27);
    if not (game:GetFastFlag("HideAvatarBuildCategoryInVR") and l_IsVRAppBuild_0()) then
        table.insert(v29, v28);
    end;
    v17.Subcategories = v29;
    v11 = {
        v16, 
        v17, 
        v5().avatarEditorCategories, 
        v13(), 
        {
            Name = v2.AssetCategories.Emotes, 
            Title = "Feature.Avatar.Heading.Emotes", 
            IconOn = "icons/menu/clothing/emotes_on", 
            IconOff = "icons/menu/clothing/emotes_off", 
            CameraZoomRadius = v2.AnimationCategoryCameraZoomRadius, 
            EquipSlotsCount = 8, 
            DEPRECATED_AssetTypeId = "61", 
            RenderItemTiles = true, 
            PageType = v2.PageType.Emotes, 
            CanAnimateCameraBasedMood = false, 
            RecommendationsType = v3.RecommendationsType.Asset, 
            MatchingCatalogPage = {
                CategoryKey = v8.AllAnimations, 
                SubcategoryKey = v9.Emotes
            }, 
            AssetTypeIdStrings = {
                v2.AssetTypeIdStrings.EmoteAnimation
            }, 
            SearchUuid = v4()
        }, 
        (v15())
    };
    for v30, v31 in v11, nil, nil do
        v31.Category = v30;
        v31.Subcategory = nil;
        if v31.Subcategories then
            for v32, v33 in v31.Subcategories, nil, nil do
                v33.Category = v30;
                v33.Subcategory = v32;
            end;
        end;
    end;
end;
local function _(v35)
    v7.isNotNil(v35.IconOn, (("category %* is missing iconOn"):format(v35.Name)));
    v7.isNotNil(v35.IconOff, (("category %* is missing IconOff"):format(v35.Name)));
    v7.isNotNil(v35.SearchUuid, (("category %* is missing SearchUuid"):format(v35.Name)));
end;
local function v42(v37)
    for _, v39 in v37, nil, nil do
        v7.isNotNil(v39.IconOn, (("category %* is missing iconOn"):format(v39.Name)));
        v7.isNotNil(v39.IconOff, (("category %* is missing IconOff"):format(v39.Name)));
        v7.isNotNil(v39.SearchUuid, (("category %* is missing SearchUuid"):format(v39.Name)));
        if v39.Subcategories then
            for _, v41 in v39.Subcategories, nil, nil do
                v7.isNotNil(v41.IconOn, (("category %* is missing iconOn"):format(v41.Name)));
                v7.isNotNil(v41.IconOff, (("category %* is missing IconOff"):format(v41.Name)));
                v7.isNotNil(v41.SearchUuid, (("category %* is missing SearchUuid"):format(v41.Name)));
            end;
        end;
    end;
end;
return function()
    if not v11 then
        v34();
        v42(v11);
    end;
    return v11;
end;
