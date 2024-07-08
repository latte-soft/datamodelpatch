local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Symbol);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAccessoryAdjustmentEnabled);
local l_GetFFlagAdjustVRFloor_0 = v7.GetFFlagAdjustVRFloor;
local l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0 = v7.GetFIntMaquettesAppPanelDistanceMultiplierPercentage;
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v12 = l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0() / 100;
local v13 = {
    _150x150 = "w=150&h=150", 
    _420x420 = "w=420&h=420"
};
local v14 = {
    PageButtonCornerRadius = 12, 
    CatalogThumbnailTypeToSize = {
        Asset = v13, 
        BundleThumbnail = v13
    }, 
    DeviceType = {
        Android = "Android", 
        IOS = "iOS", 
        Other = "Other"
    }, 
    NumRecommendedItems = 6, 
    AnalyticsTag = "LuaAvatarExperience", 
    ProfileAnalyticsTag = "LuaProfile", 
    DefaultRigPosition = Vector3.new(11.7777386, 6.76653099, 0.274315476), 
    AvatarType = {
        R6 = "R6", 
        R15 = "R15"
    }, 
    ItemPromptType = {
        OpenPurchasePrompt = "OpenPurchasePrompt", 
        OpenGoToAvatarEditorPrompt = "OpenGoToAvatarEditorPrompt", 
        OpenPremiumUpsellPrompt = "OpenPremiumUpsellPrompt", 
        Disabled = "Disabled", 
        SoldOut = "SoldOut"
    }, 
    ItemTilePadding = 10, 
    ItemTilePaddingExtraSmall = if not v11() then nil else 5, 
    ItemTileTitleMaxLines = 2, 
    ItemTileInnerPadding = 4, 
    ItemTileTallAspectRatio = 0.7, 
    ImpressionsDetectionInterval = 1, 
    FocusType = {
        Legs = "Legs", 
        Face = "Face", 
        Arms = "Arms", 
        Head = "Head", 
        Neck = "Neck", 
        Waist = "Waist", 
        Shoulders = "Shoulders"
    }, 
    AssetCategories = {
        Animation = "Animation", 
        Body = "Body", 
        Clothing = "Clothing", 
        Accessory = "Accessory", 
        Emotes = "Emotes"
    }, 
    PageType = {
        Normal = "Normal", 
        Animation = "Animation", 
        BodyColors = "BodyColors", 
        BodyStyle = "BodyStyle", 
        Emotes = "Emotes", 
        Other = "Other", 
        AllAnimation = "AllAnimation"
    }, 
    ParticleType = {
        CatalogToAvatarEditor = "CatalogToAvatarEditor", 
        AvatarEditorToCatalog = "AvatarEditorToCatalog", 
        None = "None"
    }, 
    BackgroundType = {
        LargerShapes = "LargerShapes", 
        NoShapesNoWalls = "NoShapesNoWalls", 
        Walls = "Walls"
    }, 
    NavigationDirection = {
        IS_LEFT = "IS_LEFT", 
        IS_RIGHT = "IS_RIGHT"
    }, 
    ShimmerCardsToDisplay = 30, 
    UserInventoryKey = "avatar.inventory.", 
    OutfitsKey = "avatar.outfits.", 
    OutfitInfoKey = "avatar.outfit.info.", 
    RecommendedItemsKey = "avatar.recommendedItems.", 
    GetAvatarRulesKey = "avatareditor.getavatarrules", 
    SearchCatalogKey = "avatar.search.", 
    AvatarHomeRecKey = "avatar.home.recommendations", 
    NewOutfitNotificationKey = "avatar.newOutfitNotification", 
    NewDHOutfitNotificationKey = "avatar.newDHOutfitNotification", 
    PeekHeaderHeight = 25, 
    MainNavHeight = 40, 
    SubNavHeight = 40, 
    PillBarHeight = 52, 
    FocusedWidgetTitleHeight = 52, 
    ScrollYPositionDetectableEpsilon = 1, 
    LandscapeNavWidth = 0.6, 
    LandscapeUiMargin = 24, 
    LandscapeSceneWidth = 0.4, 
    LoadableGridViewCellPadding = 10, 
    PortraitSceneHeight = 0.4, 
    LandingPagePortraitSceneHeight = 0.5, 
    LandingPagePortraitMinItemsHeightPix = 300, 
    LandingPageMinTopFrameHeightPix = 100, 
    LandingPageMinBottomFrameHeightPix = 65, 
    PageButtonForegroundMinHeightPix = 100, 
    SceneButtonSize = 44, 
    SceneButtonCornerRadius = UDim.new(0, 8), 
    SceneButtonHorizontalPadding = 24, 
    DynamicHeadSplashMaxViews = 3, 
    CommunityCreationsCategoryFilter = "CommunityCreations", 
    PremiumCategoryFilter = "Premium", 
    MobileScreenXBreakpoint = if not v11() then nil else 792, 
    AccessoryAssetTypes = {
        tostring(Enum.AssetType.Hat.Value), 
        tostring(Enum.AssetType.FaceAccessory.Value), 
        tostring(Enum.AssetType.NeckAccessory.Value), 
        tostring(Enum.AssetType.ShoulderAccessory.Value), 
        tostring(Enum.AssetType.FrontAccessory.Value), 
        tostring(Enum.AssetType.BackAccessory.Value), 
        (tostring(Enum.AssetType.WaistAccessory.Value))
    }, 
    BundleTypeIdStrings = {}, 
    BundleTypeIdStringToName = {}
};
for _, v16 in (Enum.BundleType:GetEnumItems()), nil, nil do
    v14.BundleTypeIdStrings[v16.Name] = tostring(v16.Value);
    v14.BundleTypeIdStringToName[tostring(v16.Value)] = v16.Name;
end;
v14.AssetTypeIdStrings = {};
v14.AssetTypeIdStringToName = {};
for _, v18 in (Enum.AvatarAssetType:GetEnumItems()), nil, nil do
    v14.AssetTypeIdStrings[v18.Name] = tostring(v18.Value);
    v14.AssetTypeIdStringToName[tostring(v18.Value)] = v18.Name;
end;
v14.DynamicHeadAssetTypes = {
    [v14.AssetTypeIdStrings.EyebrowAccessory] = true, 
    [v14.AssetTypeIdStrings.EyelashAccessory] = true, 
    [v14.AssetTypeIdStrings.MoodAnimation] = true, 
    [v14.AssetTypeIdStrings.DynamicHead] = true
};
v14.OutfitTypes = {
    Avatar = "Avatar", 
    DynamicHead = "DynamicHead"
};
v14.ItemTileType = {
    AvatarEditorTile = "AvatarEditorTile", 
    BodyColorButton = "BodyColorButton", 
    BundleItemTile = "BundleItemTile", 
    BundleItemTileNoText = "BundleItemTileNoText", 
    CatalogItemTile = "CatalogItemTile", 
    RecommendedCatalogItemTile = "RecommendedCatalogItemTile", 
    TallCatalogItemTile = "TallCatalogItemTile", 
    LookItemTile = "LookItemTile"
};
v14.ItemType = {
    Bundle = "Bundle", 
    Asset = "Asset", 
    Outfit = "UserOutfit"
};
v14.LookType = {
    Avatar = "Avatar", 
    Outfit = "Outfit"
};
v14.confirmItemType = function(v19)
    if v19 == v14.ItemType.Asset then
        return v14.ItemType.Asset;
    elseif v19 == v14.ItemType.Bundle then
        return v14.ItemType.Bundle;
    elseif v19 == v14.ItemType.Outfit then
        return v14.ItemType.Asset;
    else
        return nil;
    end;
end;
v14.AnalyticsContext = {
    [v4.AvatarExperienceLandingPage] = v4.AvatarExperienceLandingPage, 
    [v4.Catalog] = v4.Catalog, 
    [v4.CatalogSearch] = v4.CatalogSearch, 
    [v4.AvatarEditor] = v4.AvatarEditor, 
    [v4.ProfilePictureEditorEmotes] = v4.ProfilePictureEditorEmotes, 
    [v4.AccessoryAdjustment] = if not v8() then nil else v4.AccessoryAdjustment, 
    [v4.LayeredClothingSort] = v4.LayeredClothingSort
};
v14.PagePlayParticleType = {
    [v4.AvatarEditor] = v14.ParticleType.CatalogToAvatarEditor, 
    [v4.ProfilePictureEditorEmotes] = v14.ParticleType.CatalogToAvatarEditor, 
    [v4.ProfilePictureEditorCamera] = v14.ParticleType.None, 
    [v4.ProfilePictureEditorFinal] = v14.ParticleType.None, 
    [v4.AvatarBackground] = v14.ParticleType.None, 
    [v4.Catalog] = v14.ParticleType.AvatarEditorToCatalog
};
v14.PageBackgroundType = {
    [v4.AvatarEditor] = v14.BackgroundType.LargerShapes, 
    [v4.ProfilePictureEditorEmotes] = v14.BackgroundType.LargerShapes, 
    [v4.ProfilePictureEditorCamera] = v14.BackgroundType.NoShapesNoWalls, 
    [v4.ProfilePictureEditorFinal] = v14.BackgroundType.NoShapesNoWalls, 
    [v4.AvatarBackground] = v14.BackgroundType.Walls, 
    [v4.Catalog] = v14.BackgroundType.Walls, 
    [v4.AvatarExperienceLandingPage] = v14.BackgroundType.Walls
};
v14.AttachmentName = {
    BodyBackAttachment = "BodyBackAttachment", 
    BodyFrontAttachment = "BodyFrontAttachment", 
    Bone = "Bone", 
    FaceCenterAttachment = "FaceCenterAttachment", 
    FaceFrontAttachment = "FaceFrontAttachment", 
    HairAttachment = "HairAttachment", 
    HatAttachment = "HatAttachment", 
    LeftAnkleRigAttachment = "LeftAnkleRigAttachment", 
    LeftCollarAttachment = "LeftCollarAttachment", 
    LeftElbowRigAttachment = "LeftElbowRigAttachment", 
    LeftFootAttachment = "LeftFootAttachment", 
    LeftGripAttachment = "LeftGripAttachment", 
    LeftHipRigAttachment = "LeftHipRigAttachment", 
    LeftKneeRigAttachment = "LeftKneeRigAttachment", 
    LeftShoulderAttachment = "LeftShoulderAttachment", 
    LeftShoulderRigAttachment = "LeftShoulderRigAttachment", 
    LeftWristRigAttachment = "LeftWristRigAttachment", 
    NeckAttachment = "NeckAttachment", 
    NeckRigAttachment = "NeckRigAttachment", 
    RightAnkleRigAttachment = "RightAnkleRigAttachment", 
    RightCollarAttachment = "RightCollarAttachment", 
    RightElbowRigAttachment = "RightElbowRigAttachment", 
    RightFootAttachment = "RightFootAttachment", 
    RightGripAttachment = "RightGripAttachment", 
    RightHipRigAttachment = "RightHipRigAttachment", 
    RightKneeRigAttachment = "RightKneeRigAttachment", 
    RightShoulderAttachment = "RightShoulderAttachment", 
    RightShoulderRigAttachment = "RightShoulderRigAttachment", 
    RightWristRigAttachment = "RightWristRigAttachment", 
    RootRigAttachment = "RootRigAttachment", 
    WaistBackAttachment = "WaistBackAttachment", 
    WaistCenterAttachment = "WaistCenterAttachment", 
    WaistFrontAttachment = "WaistFrontAttachment", 
    WaistRigAttachment = "WaistRigAttachment"
};
v14.PartName = {
    Head = "Head", 
    R6_BODY_PARTS = {
        Torso = "Torso", 
        LeftLeg = "Left Leg", 
        RightLeg = "Right Leg", 
        LeftArm = "Left Arm", 
        RightArm = "Right Arm"
    }, 
    R15_BODY_PARTS = {
        UpperTorso = "UpperTorso", 
        LowerTorso = "LowerTorso", 
        LeftUpperLeg = "LeftUpperLeg", 
        LeftLowerLeg = "LeftLowerLeg", 
        LeftFoot = "LeftFoot", 
        RightUpperLeg = "RightUpperLeg", 
        RightLowerLeg = "RightLowerLeg", 
        RightFoot = "RightFoot", 
        LeftUpperArm = "LeftUpperArm", 
        LeftLowerArm = "LeftLowerArm", 
        LeftHand = "LeftHand", 
        RightUpperArm = "RightUpperArm", 
        RightLowerArm = "RightLowerArm", 
        RightHand = "RightHand"
    }
};
v14.AssetTypeIdToPartsAndAttachments = {
    [v14.AvatarType.R6] = {
        [v14.AssetTypeIdStrings.Hat] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HatAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.HairAccessory] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HairAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.FaceAccessory] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.NeckAccessory] = {
            {
                Part = v14.PartName.Head
            }
        }, 
        [v14.AssetTypeIdStrings.FrontAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.BackAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.WaistAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.Shirt] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftArm
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.TShirt] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftArm
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.Pants] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.AssetTypeIdStrings.Head] = {
            {
                Part = v14.PartName.Head
            }
        }, 
        [v14.AssetTypeIdStrings.Face] = {
            {
                Part = v14.PartName.Head
            }
        }, 
        [v14.AssetTypeIdStrings.Torso] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.RightArm] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightArm
            }
        }, 
        [v14.AssetTypeIdStrings.LeftArm] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftArm
            }
        }, 
        [v14.AssetTypeIdStrings.RightLeg] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }
        }, 
        [v14.AssetTypeIdStrings.LeftLeg] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.AssetTypeIdStrings.ClimbAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.FallAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.IdleAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.JumpAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.RunAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.SwimAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.WalkAnimation] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.TShirtAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.ShirtAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.PantsAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.AssetTypeIdStrings.JacketAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.SweaterAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.AssetTypeIdStrings.ShortsAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.AssetTypeIdStrings.LeftShoeAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.AssetTypeIdStrings.RightShoeAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }
        }, 
        [v14.AssetTypeIdStrings.DressSkirtAccessory] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }
    }, 
    [v14.AvatarType.R15] = {
        [v14.AssetTypeIdStrings.Hat] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HatAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.HairAccessory] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HairAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.FaceAccessory] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.NeckAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v14.AttachmentName.NeckAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.FrontAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v14.AttachmentName.BodyFrontAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.BackAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v14.AttachmentName.BodyBackAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.WaistAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.LowerTorso, 
                Attachment = v14.AttachmentName.WaistCenterAttachment
            }
        }, 
        [v14.AssetTypeIdStrings.Shirt] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.TShirt] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.Pants] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v14.AssetTypeIdStrings.Head] = {
            {
                Part = v14.PartName.Head
            }
        }, 
        [v14.AssetTypeIdStrings.Face] = {
            {
                Part = v14.PartName.Head
            }
        }, 
        [v14.AssetTypeIdStrings.Torso] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.RightArm] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightLowerArm
            }
        }, 
        [v14.AssetTypeIdStrings.LeftArm] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftLowerArm
            }
        }, 
        [v14.AssetTypeIdStrings.RightLeg] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightLowerLeg
            }
        }, 
        [v14.AssetTypeIdStrings.LeftLeg] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v14.AssetTypeIdStrings.ClimbAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.FallAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.IdleAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.JumpAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.RunAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.SwimAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.WalkAnimation] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.TShirtAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.ShirtAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.PantsAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v14.AssetTypeIdStrings.JacketAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.SweaterAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.AssetTypeIdStrings.ShortsAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }, 
        [v14.AssetTypeIdStrings.LeftShoeAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftFoot
            }
        }, 
        [v14.AssetTypeIdStrings.RightShoeAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightFoot
            }
        }, 
        [v14.AssetTypeIdStrings.DressSkirtAccessory] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }
    }
};
v14.AvatarTypeFocusGroups = {
    [v14.AvatarType.R15] = {
        [v14.FocusType.Legs] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v14.FocusType.Face] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v14.FocusType.Arms] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.FocusType.Head] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HatAttachment
            }, 
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.NeckRigAttachment
            }
        }, 
        [v14.FocusType.Neck] = {
            {
                Part = v14.PartName.Head
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v14.FocusType.Waist] = {
            {
                Part = v14.PartName.R15_BODY_PARTS.LowerTorso
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }, 
        [v14.FocusType.Shoulders] = {
            {
                Part = v14.PartName.Head
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v14.PartName.R15_BODY_PARTS.LeftUpperArm
            }
        }
    }, 
    [v14.AvatarType.R6] = {
        [v14.FocusType.Legs] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.FocusType.Face] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v14.FocusType.Arms] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.FocusType.Head] = {
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.HatAttachment
            }, 
            {
                Part = v14.PartName.Head, 
                Attachment = v14.AttachmentName.NeckRigAttachment
            }
        }, 
        [v14.FocusType.Neck] = {
            {
                Part = v14.PartName.Head
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v14.FocusType.Waist] = {
            {
                Part = v14.PartName.R6_BODY_PARTS.Torso
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v14.FocusType.Shoulders] = {
            {
                Part = v14.PartName.Head
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v14.PartName.R6_BODY_PARTS.LeftArm
            }
        }
    }
};
v14.AssetTypeIdToCategory = {
    [v14.AssetTypeIdStrings.TShirt] = v14.AssetCategories.Clothing, 
    [v14.AssetTypeIdStrings.Hat] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.HairAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.FaceAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.NeckAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.ShoulderAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.FrontAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.BackAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.WaistAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.Shirt] = v14.AssetCategories.Clothing, 
    [v14.AssetTypeIdStrings.Pants] = v14.AssetCategories.Clothing, 
    [v14.AssetTypeIdStrings.Gear] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.Head] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.Face] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.Torso] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.RightArm] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.LeftArm] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.RightLeg] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.LeftLeg] = v14.AssetCategories.Body, 
    [v14.AssetTypeIdStrings.ClimbAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.FallAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.IdleAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.JumpAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.RunAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.SwimAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.WalkAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.EmoteAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.TShirtAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.ShirtAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.PantsAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.JacketAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.SweaterAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.ShortsAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.LeftShoeAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.RightShoeAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.DressSkirtAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.MoodAnimation] = v14.AssetCategories.Animation, 
    [v14.AssetTypeIdStrings.EyebrowAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.EyelashAccessory] = v14.AssetCategories.Accessory, 
    [v14.AssetTypeIdStrings.DynamicHead] = v14.AssetCategories.Body
};
v14.GradientBackgroundAssetTypeIds = {
    [v14.AssetTypeIdStrings.TShirtAccessory] = true, 
    [v14.AssetTypeIdStrings.ShirtAccessory] = true, 
    [v14.AssetTypeIdStrings.PantsAccessory] = true, 
    [v14.AssetTypeIdStrings.JacketAccessory] = true, 
    [v14.AssetTypeIdStrings.SweaterAccessory] = true, 
    [v14.AssetTypeIdStrings.ShortsAccessory] = true, 
    [v14.AssetTypeIdStrings.LeftShoeAccessory] = true, 
    [v14.AssetTypeIdStrings.RightShoeAccessory] = true, 
    [v14.AssetTypeIdStrings.DressSkirtAccessory] = true
};
v14.AssetCategoriesLocalized = {
    [v14.AssetCategories.Animation] = "Feature.Catalog.Label.Animation", 
    [v14.AssetCategories.Body] = "Feature.Catalog.Label.Body", 
    [v14.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing", 
    [v14.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory", 
    [v14.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
};
v14.AssetTypeLocalized = {
    [v14.AssetTypeIdStrings.TShirt] = "Feature.Avatar.Label.ClassicTShirts", 
    [v14.AssetTypeIdStrings.Hat] = "Feature.Avatar.Label.Hat", 
    [v14.AssetTypeIdStrings.HairAccessory] = "Feature.Avatar.Label.Hair", 
    [v14.AssetTypeIdStrings.FaceAccessory] = "Feature.Avatar.Label.Face", 
    [v14.AssetTypeIdStrings.NeckAccessory] = "Feature.Avatar.Label.Neck", 
    [v14.AssetTypeIdStrings.ShoulderAccessory] = "Feature.Avatar.Label.Shoulder", 
    [v14.AssetTypeIdStrings.FrontAccessory] = "Feature.Avatar.Label.Front", 
    [v14.AssetTypeIdStrings.BackAccessory] = "Feature.Avatar.Label.Back", 
    [v14.AssetTypeIdStrings.WaistAccessory] = "Feature.Avatar.Label.Waist", 
    [v14.AssetTypeIdStrings.Shirt] = "Feature.Avatar.Label.ClassicShirts", 
    [v14.AssetTypeIdStrings.Pants] = "Feature.Avatar.Label.ClassicPants", 
    [v14.AssetTypeIdStrings.Gear] = "Feature.Avatar.Label.Gear", 
    [v14.AssetTypeIdStrings.Head] = "Feature.Avatar.Label.Head", 
    [v14.AssetTypeIdStrings.Face] = "Feature.Avatar.Label.Face", 
    [v14.AssetTypeIdStrings.Torso] = "Feature.Avatar.Label.Torso", 
    [v14.AssetTypeIdStrings.RightArm] = "Feature.Avatar.Label.RightArms", 
    [v14.AssetTypeIdStrings.LeftArm] = "Feature.Avatar.Label.LeftArms", 
    [v14.AssetTypeIdStrings.LeftLeg] = "Feature.Avatar.Label.LeftLegs", 
    [v14.AssetTypeIdStrings.RightLeg] = "Feature.Avatar.Label.RightLegs", 
    [v14.AssetTypeIdStrings.ClimbAnimation] = "Feature.Avatar.Label.Climb", 
    [v14.AssetTypeIdStrings.FallAnimation] = "Feature.Avatar.Label.Fall", 
    [v14.AssetTypeIdStrings.IdleAnimation] = "Feature.Avatar.Label.Idle", 
    [v14.AssetTypeIdStrings.JumpAnimation] = "Feature.Avatar.Label.Jump", 
    [v14.AssetTypeIdStrings.RunAnimation] = "Feature.Avatar.Label.Run", 
    [v14.AssetTypeIdStrings.SwimAnimation] = "Feature.Avatar.Label.Swim", 
    [v14.AssetTypeIdStrings.WalkAnimation] = "Feature.Avatar.Label.Walk", 
    [v14.AssetTypeIdStrings.EmoteAnimation] = "Feature.Avatar.Label.Emote", 
    [v14.AssetTypeIdStrings.TShirtAccessory] = "Feature.Avatar.Label.TShirt", 
    [v14.AssetTypeIdStrings.ShirtAccessory] = "Feature.Avatar.Label.Shirt", 
    [v14.AssetTypeIdStrings.PantsAccessory] = "Feature.Avatar.Label.Pants", 
    [v14.AssetTypeIdStrings.JacketAccessory] = "Feature.Avatar.Label.Jacket", 
    [v14.AssetTypeIdStrings.SweaterAccessory] = "Feature.Avatar.Label.Sweater", 
    [v14.AssetTypeIdStrings.ShortsAccessory] = "Feature.Avatar.Label.Shorts", 
    [v14.AssetTypeIdStrings.LeftShoeAccessory] = "Feature.Avatar.Label.LeftShoe", 
    [v14.AssetTypeIdStrings.RightShoeAccessory] = "Feature.Avatar.Label.RightShoe", 
    [v14.AssetTypeIdStrings.DressSkirtAccessory] = "Feature.Avatar.Label.DressesAndSkirts", 
    [v14.AssetTypeIdStrings.EyelashAccessory] = "Feature.Catalog.Label.Eyelash", 
    [v14.AssetTypeIdStrings.EyebrowAccessory] = "Feature.Catalog.Label.Eyebrow", 
    [v14.AssetTypeIdStrings.MoodAnimation] = "Feature.Avatar.Label.Mood", 
    [v14.AssetTypeIdStrings.DynamicHead] = "Feature.Avatar.Label.DynamicHead"
};
v14.AssetTypeIdStringToHumanoidDescriptionProp = {
    [tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt", 
    [tostring(Enum.AssetType.Hat.Value)] = "HatAccessory", 
    [tostring(Enum.AssetType.Shirt.Value)] = "Shirt", 
    [tostring(Enum.AssetType.Pants.Value)] = "Pants", 
    [tostring(Enum.AssetType.Head.Value)] = "Head", 
    [tostring(Enum.AssetType.Face.Value)] = "Face", 
    [tostring(Enum.AssetType.Torso.Value)] = "Torso", 
    [tostring(Enum.AssetType.RightArm.Value)] = "RightArm", 
    [tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm", 
    [tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg", 
    [tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg", 
    [tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory", 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory", 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory", 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory", 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory", 
    [tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory", 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory", 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation", 
    [tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation", 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation", 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation", 
    [tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation", 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation", 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation", 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = "MoodAnimation", 
    [tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
};
v14.HumanoidDescriptionScaleToName = {
    bodyType = "BodyTypeScale", 
    head = "HeadScale", 
    height = "HeightScale", 
    proportion = "ProportionScale", 
    depth = "DepthScale", 
    width = "WidthScale"
};
v14.HumanoidDescriptionBodyColorIdToName = {
    headColorId = "HeadColor", 
    leftArmColorId = "LeftArmColor", 
    leftLegColorId = "LeftLegColor", 
    rightArmColorId = "RightArmColor", 
    rightLegColorId = "RightLegColor", 
    torsoColorId = "TorsoColor"
};
v14.BodyPartForSkinColoringIdToHumanoidDescription = {
    headColor3 = "HeadColor", 
    leftArmColor3 = "LeftArmColor", 
    leftLegColor3 = "LeftLegColor", 
    rightArmColor3 = "RightArmColor", 
    rightLegColor3 = "RightLegColor", 
    torsoColor3 = "TorsoColor"
};
v14.GamepadInputTypes = {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
v14.ThumbstickDeadzone = 0.2;
v14.SceneGamepad = {
    FullViewIndicatorTag = v3.named("FullViewIndicatorTag")
};
v14.AnimationCategoryCameraZoomRadius = 5;
v14.SceneRowHeight = 28;
v14.LayeredClothingOrder = {
    [v14.AssetTypeIdStrings.EyebrowAccessory] = 0, 
    [v14.AssetTypeIdStrings.EyelashAccessory] = 1, 
    [v14.AssetTypeIdStrings.Pants] = 2, 
    [v14.AssetTypeIdStrings.Shirt] = 3, 
    [v14.AssetTypeIdStrings.TShirt] = 4, 
    [v14.AssetTypeIdStrings.LeftShoeAccessory] = 5, 
    [v14.AssetTypeIdStrings.RightShoeAccessory] = 5, 
    [v14.AssetTypeIdStrings.PantsAccessory] = 6, 
    [v14.AssetTypeIdStrings.ShortsAccessory] = 7, 
    [v14.AssetTypeIdStrings.DressSkirtAccessory] = 8, 
    [v14.AssetTypeIdStrings.TShirtAccessory] = 9, 
    [v14.AssetTypeIdStrings.ShirtAccessory] = 10, 
    [v14.AssetTypeIdStrings.SweaterAccessory] = 11, 
    [v14.AssetTypeIdStrings.JacketAccessory] = 12, 
    [v14.AssetTypeIdStrings.HairAccessory] = 13
};
v14.LCIgnoredForSorting = {
    [v14.AssetTypeIdStrings.HairAccessory] = true, 
    [v14.AssetTypeIdStrings.EyebrowAccessory] = true, 
    [v14.AssetTypeIdStrings.EyelashAccessory] = true
};
v14.AssetTypeIdToAccessoryTypeEnum = {
    [tostring(Enum.AssetType.Hat.Value)] = Enum.AccessoryType.Hat, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = Enum.AccessoryType.Face, 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = Enum.AccessoryType.Neck, 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = Enum.AccessoryType.Shoulder, 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = Enum.AccessoryType.Front, 
    [tostring(Enum.AssetType.BackAccessory.Value)] = Enum.AccessoryType.Back, 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = Enum.AccessoryType.Waist, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
};
v14.AccessoryTypeEnumToAssetTypeId = {};
for v20, v21 in v14.AssetTypeIdToAccessoryTypeEnum, nil, nil do
    v14.AccessoryTypeEnumToAssetTypeId[v21] = v20;
end;
v14.LayeredAssetTypes = {
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
};
v14.AssetCategory = {
    LCTops = "LCTops", 
    LCBottoms = "LCBottoms"
};
v14.AssetCategoryToAssetTypes = {
    [v14.AssetCategory.LCTops] = {
        v14.AssetTypeIdStrings.ShirtAccessory, 
        v14.AssetTypeIdStrings.TShirtAccessory, 
        v14.AssetTypeIdStrings.SweaterAccessory
    }, 
    [v14.AssetCategory.LCBottoms] = {
        v14.AssetTypeIdStrings.PantsAccessory, 
        v14.AssetTypeIdStrings.ShortsAccessory, 
        v14.AssetTypeIdStrings.DressSkirtAccessory
    }
};
v14.NavOuterPadding = 6;
v14.NavInnerPadding = 6;
v14.NavButtonElementPadding = 4;
v14.NavButtonElementMargin = 4;
v14.NavCornerSize = 8;
v14.NavButtonBorderSize = 2;
v14.NavSubButtonInnerPadding = 4;
v14.AssetTypeToAssetCategory = {};
for v22, v23 in v14.AssetCategoryToAssetTypes, nil, nil do
    for _, v25 in v23, nil, nil do
        v14.AssetTypeToAssetCategory[v25] = v22;
    end;
end;
v14.MinTileWidthToFontHeightRatio = 6;
v14.SmallRadioButtonHeight = 56;
v14.SortAndFiltersRowHeight = 45;
v14.SortAndFiltersSmallRowHeight = 32;
v14.SortAndFiltersSectionPadding = 8;
v14.FullViewPageDefaults = {
    [v4.AccessoryAdjustment] = v5.None, 
    [v4.LayeredClothingSort] = v5.None, 
    [v4.AvatarEditor] = v5.None, 
    [v4.AvatarExperienceLandingPage] = v5.None, 
    [v4.Catalog] = v5.None, 
    [v4.CatalogSearch] = v5.None, 
    [v4.ProfilePictureEditorEmotes] = v5.None
};
local v26 = not l_GetFFlagAdjustVRFloor_0() and 4.6 or -0.4;
local v27 = -2 * v12;
local v28 = -4.4 * v12;
local v29 = 3.2 * v12;
local v30 = (3.52 * v12 - 3.52) / 2;
v14.VR = {
    SPACE_BETWEEN_STACKED_PANELS = 0.01, 
    PanelInfo = {
        Left = {
            PartSize = Vector2.new(2.2, 3.52) * v12, 
            Offset = not not l_GetFFlagAdjustVRFloor_0() and Vector3.new(-v29, v26, v27) or CFrame.lookAt(Vector3.new(-v29, v26, v27), (Vector3.new(0, v26, 0))), 
            VirtualScreenSize = Vector2.new(360, 704)
        }, 
        Right = {
            PartSize = Vector2.new(2.2, 3.52) * v12, 
            Offset = not not l_GetFFlagAdjustVRFloor_0() and Vector3.new(v29, v26, v27) or CFrame.lookAt(Vector3.new(v29, v26, v27), (Vector3.new(0, v26, 0))), 
            VirtualScreenSize = Vector2.new(360, 704)
        }, 
        Center = {
            PartSize = Vector2.new(3, 3.52) * v12, 
            Offset = not not l_GetFFlagAdjustVRFloor_0() and Vector3.new(0, v26, v28) or CFrame.lookAt(Vector3.new(0, v26, v28), (Vector3.new(0, v26, 0))), 
            VirtualScreenSize = Vector2.new(600, 704)
        }
    }, 
    AvatarEditorNavBarSize = Vector2.new(2.5, 0.3) * v12, 
    AvatarEditorNavBarPosition = Vector3.new(0, (not l_GetFFlagAdjustVRFloor_0() and 6.9 or 1.9) + v30, v28), 
    AvatarEditorNavBarOrientation = Vector3.new(0, 7 + v30, 0), 
    AvatarEditorNavBarResolution = Vector2.new(650, 75)
};
v14.Counter = {
    PREFIX = "AvatarExperience_", 
    CatalogView = "CatalogView", 
    SearchView = "SearchView", 
    EditorView = "EditorView", 
    CatalogItemDetailsView = "CatalogItemDetailsView", 
    SearchItemDetailsView = "SearchItemDetailsView", 
    CatalogFiltersView = "CatalogFiltersView", 
    SearchFiltersView = "SearchFiltersView", 
    OthersView = "OthersView", 
    TopLevelErrors = {
        CatalogViewError = "CatalogViewError", 
        SearchViewError = "SearchViewError", 
        EditorViewError = "EditorViewError", 
        CatalogItemDetailsViewError = "CatalogItemDetailsViewError", 
        SearchItemDetailsViewError = "SearchItemDetailsViewError", 
        CatalogFiltersViewError = "CatalogFiltersViewError", 
        SearchFiltersViewError = "SearchFiltersViewError", 
        UnknownViewError = "UnknownViewError"
    }, 
    TopLevelLatency = {
        CatalogViewLatency = "CatalogViewLatency", 
        SearchViewLatency = "SearchViewLatency", 
        EditorViewLatency = "EditorViewLatency", 
        CatalogItemDetailsViewLatency = "CatalogItemDetailsViewLatency", 
        SearchItemDetailsViewLatency = "SearchItemDetailsViewLatency", 
        CatalogFiltersViewLatency = "CatalogFiltersViewLatency", 
        SearchFiltersViewLatency = "SearchFiltersViewLatency", 
        UnknownViewLatency = "UnknownViewLatency"
    }, 
    TopLevelFPS = {
        Catalog = "tracking-pattern:catalog-view", 
        Search = "tracking-pattern:search-view", 
        Editor = "tracking-pattern:editor-view", 
        CatalogItemDetails = "tracking-pattern:catalog-item-details-view", 
        SearchItemDetails = "tracking-pattern:search-item-details-view", 
        CatalogFilters = "tracking-pattern:catalog-filters-view", 
        SearchFilters = "tracking-pattern:search-filters-view", 
        Unknown = "tracking-pattern:unknown-view-latency"
    }, 
    PopularLooksWidgetHomeView = "PopularLooksWidgetHomeView", 
    PopularLooksWidgetHomeTileClicked = "PopularLooksWidgetHomeTileClicked", 
    PopularLooksWidgetSearchTileClicked = "PopularLooksWidgetSearchTileClicked", 
    PopularLooksWidgetHomeBuyClicked = "PopularLooksWidgetHomeBuyClicked", 
    PopularLooksWidgetSearchBuyClicked = "PopularLooksWidgetSearchBuyClicked", 
    CatalogRefresh = {
        StaleResults = "CatalogRefreshStaleResults"
    }, 
    AvatarEditorServiceErrors = {
        GetRecommendedAssets = "AvatarEditorServiceGetRecommendedAssetsError", 
        GetOutfits = "AvatarEditorServiceGetOutfitsError", 
        CreateOutfit = "AvatarEditorServiceCreateOutfitError", 
        GetAvatarRules = "AvatarEditorServiceGetAvatarRulesError", 
        GetInventory = "AvatarEditorServiceGetInventoryError", 
        SearchCatalog = "AvatarEditorServiceSearchCatalogError", 
        GetBatchItemDetails = "AvatarEditorServiceGetBatchItemDetailsError", 
        GetRecommendedBundles = "AvatarEditorServiceGetRecommendedBundlesError", 
        NoPromptSetFavorite = "AvatarEditorServiceNoPromptSetFavoriteError", 
        NoPromptSaveAvatarThumbnailCustomization = "AvatarEditorServiceNoPromptSaveAvatarThumbnailCustomizationError", 
        NoPromptCreateOutfit = "AvatarEditorServiceNoPromptCreateOutfitError", 
        GetOutfitDetails = "AvatarEditorServiceGetOutfitDetailsError", 
        FetchAssetOrBundleInfo = "AvatarEditorServiceFetchAssetOrBundleInfoError", 
        FetchBundleInfo = "AvatarEditorServiceFetchBundleInfoError", 
        GetAssetFavorite = "AvatarEditorServiceGetAssetFavoriteError", 
        GetBundleFavorite = "AvatarEditorServiceGetBundleFavoriteError", 
        SetBundleFavorite = "AvatarEditorServiceSetBundleFavoriteError", 
        SetAssetFavorite = "AvatarEditorServiceSetAssetFavoriteError", 
        ConformToAvatarRules = "AvatarEditorServiceConformToAvatarRulesError", 
        NoPromptSaveAvatar = "AvatarEditorServiceNoPromptSaveAvatarError", 
        PromptSaveAvatarCompleted = "AvatarEditorServicePromptSaveAvatarCompletedError"
    }
};
return v14;
