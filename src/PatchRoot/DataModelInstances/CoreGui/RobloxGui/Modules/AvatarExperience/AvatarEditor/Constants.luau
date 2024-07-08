local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
local v1 = game:DefineFastInt("DefaultInfiniteScrollRecommendationsFetchSize", 120);
local v2 = {
    "headColor3", 
    "leftArmColor3", 
    "leftLegColor3", 
    "rightArmColor3", 
    "rightLegColor3", 
    "torsoColor3"
};
return {
    allBodyPartForSkinColoringIds = v2, 
    AvatarType = {
        R6 = "R6", 
        R15 = "R15"
    }, 
    AvatarSettings = {
        minDeltaBodyColorDifference = "minDeltaBodyColorDifference", 
        scalesRules = "scalesRules"
    }, 
    RecommendationsType = {
        Asset = "Asset", 
        BodyParts = "BodyParts", 
        AvatarAnimations = "AvatarAnimations", 
        Shoes = "Shoes", 
        DynamicHeads = "DynamicHeads", 
        None = "None"
    }, 
    DefaultUserRecommendationsFetchSize = v1, 
    RecommendationsExpirationTime = 300, 
    ShimmerColorCardsToDisplay = 30, 
    ItemFetchLimit = 25, 
    ItemFetchSortOrder = "Desc", 
    ItemsGridMetrics = {
        minimumItemsPerRow = 4, 
        minimumItemWidth = 140
    }, 
    ItemsGridTopPadding = 15, 
    ItemsGridTopPaddingNew = 10, 
    ItemsGridSidePadding = 30, 
    ItemsGridBottomPadding = 24, 
    ItemsGridBottomPaddingNew = 12, 
    CreateOutfitKey = "avatar.createOutfit", 
    UpdateOutfitKey = "avatar.updateOutfit", 
    RenameOutfitKey = "avatar.renameOutfit", 
    DeleteOutfitsKey = "avatar.deleteOutfit", 
    GetAvatarDataKey = "avatareditor.getavatardata", 
    AddOutfitButton = "ADD_OUTFIT_BUTTON", 
    CharacterKey = "Character", 
    HeadAndBody = "HeadAndBody", 
    EditableCharacterKey = "EditableCharacter", 
    PurchasedCharacterKey = "PurchasedCharacter", 
    ReachedLastPage = "LastPage", 
    Outfits = "Outfits", 
    OutfitOrAsset = {
        Outfit = "Outfit", 
        Asset = "Asset"
    }, 
    MaxPreloadEditableCharacters = 50, 
    MaxHats = 3, 
    BodyPartButtonData = {
        {
            textKey = "Feature.Avatar.Label.BodyColorAllLimbs", 
            bodyPartForSkinColoringIds = v2, 
            bodyParts = {
                "headColorId", 
                "leftArmColorId", 
                "leftLegColorId", 
                "rightArmColorId", 
                "rightLegColorId", 
                "torsoColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorHead", 
            bodyPartForSkinColoringIds = {
                "headColor3"
            }, 
            bodyParts = {
                "headColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorTorso", 
            bodyPartForSkinColoringIds = {
                "torsoColor3"
            }, 
            bodyParts = {
                "torsoColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorLeftArm", 
            bodyPartForSkinColoringIds = {
                "leftArmColor3"
            }, 
            bodyParts = {
                "leftArmColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorRightArm", 
            bodyPartForSkinColoringIds = {
                "rightArmColor3"
            }, 
            bodyParts = {
                "rightArmColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorLeftLeg", 
            bodyPartForSkinColoringIds = {
                "leftLegColor3"
            }, 
            bodyParts = {
                "leftLegColorId"
            }
        }, 
        {
            textKey = "Feature.Avatar.Label.BodyColorRightLeg", 
            bodyPartForSkinColoringIds = {
                "rightLegColor3"
            }, 
            bodyParts = {
                "rightLegColorId"
            }
        }
    }, 
    ColorPickerViewSettings = {
        StandardView = "Standard", 
        AdvancedView = "Advanced"
    }, 
    DefaultBodyColorRanges = {
        {
            Color3.fromRGB(49, 44, 37), 
            Color3.fromRGB(61, 46, 36), 
            Color3.fromRGB(78, 55, 49)
        }, 
        {
            Color3.fromRGB(62, 53, 42), 
            Color3.fromRGB(75, 56, 46), 
            Color3.fromRGB(96, 57, 45)
        }, 
        {
            Color3.fromRGB(90, 76, 46), 
            Color3.fromRGB(86, 66, 54), 
            Color3.fromRGB(92, 66, 49), 
            Color3.fromRGB(94, 64, 53)
        }, 
        {
            Color3.fromRGB(82, 69, 54), 
            Color3.fromRGB(90, 76, 66), 
            Color3.fromRGB(98, 70, 58)
        }, 
        {
            Color3.fromRGB(116, 87, 62), 
            Color3.fromRGB(124, 92, 70), 
            Color3.fromRGB(115, 92, 61), 
            Color3.fromRGB(137, 110, 74), 
            Color3.fromRGB(138, 102, 70), 
            Color3.fromRGB(140, 95, 77), 
            Color3.fromRGB(118, 82, 67)
        }, 
        {
            Color3.fromRGB(199, 172, 120), 
            Color3.fromRGB(188, 155, 93), 
            Color3.fromRGB(170, 138, 98), 
            Color3.fromRGB(173, 130, 96), 
            Color3.fromRGB(174, 121, 102)
        }, 
        {
            Color3.fromRGB(145, 123, 90), 
            Color3.fromRGB(175, 148, 131), 
            Color3.fromRGB(149, 121, 119)
        }, 
        {
            Color3.fromRGB(215, 197, 154), 
            Color3.fromRGB(218, 182, 142), 
            Color3.fromRGB(211, 167, 131), 
            Color3.fromRGB(212, 158, 140), 
            Color3.fromRGB(204, 142, 105)
        }, 
        {
            Color3.fromRGB(230, 199, 158), 
            Color3.fromRGB(229, 186, 152), 
            Color3.fromRGB(234, 184, 146), 
            Color3.fromRGB(232, 186, 170)
        }, 
        {
            Color3.fromRGB(255, 204, 153), 
            Color3.fromRGB(238, 203, 173), 
            Color3.fromRGB(240, 212, 185), 
            Color3.fromRGB(237, 213, 180), 
            Color3.fromRGB(239, 220, 191), 
            Color3.fromRGB(243, 223, 212), 
            Color3.fromRGB(240, 205, 196)
        }, 
        {
            Color3.fromRGB(17, 17, 17), 
            Color3.fromRGB(27, 42, 53)
        }, 
        {
            Color3.fromRGB(99, 95, 98), 
            Color3.fromRGB(163, 162, 165), 
            Color3.fromRGB(205, 205, 205), 
            Color3.fromRGB(229, 228, 223), 
            Color3.fromRGB(242, 243, 243), 
            Color3.fromRGB(248, 248, 248)
        }, 
        {
            Color3.fromRGB(255, 0, 0), 
            Color3.fromRGB(196, 40, 28), 
            Color3.fromRGB(163, 75, 75), 
            Color3.fromRGB(218, 134, 122)
        }, 
        {
            Color3.fromRGB(105, 64, 40), 
            Color3.fromRGB(170, 85, 0), 
            Color3.fromRGB(160, 95, 53)
        }, 
        {
            Color3.fromRGB(213, 115, 61), 
            Color3.fromRGB(218, 133, 65), 
            Color3.fromRGB(226, 155, 64)
        }, 
        {
            Color3.fromRGB(255, 175, 0), 
            Color3.fromRGB(245, 205, 48), 
            Color3.fromRGB(248, 217, 109), 
            Color3.fromRGB(253, 234, 141), 
            Color3.fromRGB(255, 255, 204)
        }, 
        {
            Color3.fromRGB(255, 255, 0), 
            Color3.fromRGB(193, 190, 66), 
            Color3.fromRGB(164, 189, 71)
        }, 
        {
            Color3.fromRGB(0, 255, 0), 
            Color3.fromRGB(58, 125, 21), 
            Color3.fromRGB(75, 151, 75), 
            Color3.fromRGB(91, 154, 76), 
            Color3.fromRGB(161, 196, 140), 
            Color3.fromRGB(204, 255, 204)
        }, 
        {
            Color3.fromRGB(39, 70, 45), 
            Color3.fromRGB(40, 127, 71), 
            Color3.fromRGB(124, 156, 107), 
            Color3.fromRGB(127, 142, 100), 
            Color3.fromRGB(120, 144, 130)
        }, 
        {
            Color3.fromRGB(0, 32, 96), 
            Color3.fromRGB(0, 0, 255), 
            Color3.fromRGB(4, 175, 236), 
            Color3.fromRGB(128, 187, 220), 
            Color3.fromRGB(116, 134, 157)
        }, 
        {
            Color3.fromRGB(0, 143, 156), 
            Color3.fromRGB(0, 255, 255), 
            Color3.fromRGB(18, 238, 212), 
            Color3.fromRGB(159, 243, 233), 
            Color3.fromRGB(200, 245, 240)
        }, 
        {
            Color3.fromRGB(33, 84, 185), 
            Color3.fromRGB(13, 105, 172), 
            Color3.fromRGB(82, 124, 174), 
            Color3.fromRGB(110, 153, 202), 
            Color3.fromRGB(175, 221, 255), 
            Color3.fromRGB(180, 210, 228)
        }, 
        {
            Color3.fromRGB(255, 0, 191), 
            Color3.fromRGB(255, 102, 204), 
            Color3.fromRGB(255, 152, 220), 
            Color3.fromRGB(255, 201, 201), 
            Color3.fromRGB(232, 186, 200)
        }, 
        {
            Color3.fromRGB(98, 37, 209), 
            Color3.fromRGB(180, 128, 255), 
            Color3.fromRGB(177, 167, 255)
        }, 
        {
            Color3.fromRGB(107, 50, 124), 
            Color3.fromRGB(140, 91, 159)
        }, 
        {
            Color3.fromRGB(170, 0, 170), 
            Color3.fromRGB(167, 94, 155)
        }
    }, 
    BodyColorsSliderFrameHeight = 50, 
    BodyColorsSliderTrackHeight = 24, 
    SkinColorGridPadding = 12, 
    SkinColorSliderPadding = 24, 
    DefaultBodyColorBrickId = 194, 
    DefaultBodyColor3 = Color3.fromRGB(163, 162, 165)
};
