local v0 = require(game:GetService("CorePackages").Packages.Dash);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v11 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v12 = {};
v12.__index = v12;
v12.DynamicHeadMoodAnimationAssetId = "10687293613";
v12.DylanDefaultHeadAssetId = "10687288296";
v12.DylanDefaultOutfitId = "11164330909";
v12.GeckoMoodAnimationAssetId = "10647852134";
v12.GeckoBundleId = "965";
v12.GeckoOutfitId = "11625687672";
v12.DylanDefaultBundleId = "945";
v12.YellowSciFiJacketAssetId = "11449307353";
v12.NinjaIdleAnimationAssetId = "658832408";
v12.DefaultLocalUserId = "129687796";
v12.BodybuilderEmoteAssetId = "3994130516";
v12.BodybuilderKeyframeSequenceAssetId = "10713990381";
v12.PirateAnimationBundleId = "55";
v12.PirateIdleAnimationAssetId = "837024662";
v12.PirateRunAnimationAssetId = "837023444";
v12.PirateJumpAnimationAssetId = "837024350";
v12.DummySearchUid = "test_uuid";
v12.DummyKeyword = "test";
v12.DunceHatAssetId = "12536385254";
v12.PirateOutfitId = "132923221";
v12.NumPirateAnimations = 0;
v12.UnusedItemId = "1011011010";
local v13 = {
    [v12.PirateRunAnimationAssetId] = {
        assetType = "53"
    }, 
    ["837023892"] = {
        assetType = "55"
    }, 
    ["837024147"] = {
        assetType = "50"
    }, 
    [v12.PirateJumpAnimationAssetId] = {
        assetType = "52"
    }, 
    [v12.PirateIdleAnimationAssetId] = {
        assetType = "51"
    }, 
    ["837025054"] = {
        assetType = "54"
    }, 
    ["837025325"] = {
        assetType = "48"
    }
};
for _, _ in v13, nil, nil do
    v12.NumPirateAnimations = v12.NumPirateAnimations + 1;
end;
local v16 = {};
for v17, _ in v13, nil, nil do
    table.insert(v16, {
        id = v17, 
        type = v3.ItemType.Asset
    });
end;
table.insert(v16, {
    id = v12.PirateOutfitId, 
    type = v3.ItemType.Outfit
});
v12.new = function(v19)
    local v20 = {};
    setmetatable(v20, v12);
    v20.state = v19 or {};
    v20.itemRecency = 0;
    return v20;
end;
v12.basicScales = {
    bodyType = 1, 
    depth = 1, 
    head = 1, 
    height = 1, 
    proportion = 0, 
    width = 1
};
v12.makeBodyColors = function(v21)
    return {
        headColorId = v21, 
        leftArmColorId = v21, 
        leftLegColorId = v21, 
        rightArmColorId = v21, 
        rightLegColorId = v21, 
        torsoColorId = v21
    };
end;
v12.makeBodyColor3s = function(v22)
    return {
        headColor3 = v22, 
        torsoColor3 = v22, 
        rightArmColor3 = v22, 
        leftArmColor3 = v22, 
        rightLegColor3 = v22, 
        leftLegColor3 = v22
    };
end;
v12.makeSkeletonOutfitInfo = function()
    return {
        assets = {}, 
        avatarType = "R15", 
        containsDynamicHead = false, 
        isEditable = false, 
        name = "SkeletonOutfit", 
        outfitId = "1234", 
        outfitType = v3.OutfitTypes.Avatar, 
        updateCounter = 0, 
        bodyColor3s = v12.basicBodyColor3s, 
        bodyColors = v12.basicBodyColors, 
        scales = v12.basicScales
    };
end;
v12.makeSkeletonTryOnItem = function()
    return {
        version = "1", 
        itemId = "dummy", 
        itemType = v3.ItemType.Asset, 
        itemSubType = v3.AssetTypeIdStrings.JacketAccessory, 
        selectedInTryOnManager = true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemRecency = 0
    };
end;
v12.basicBodyColors = v12.makeBodyColors(v5.DefaultBodyColorBrickId);
v12.basicBodyColor3s = v12.makeBodyColor3s(v5.DefaultBodyColor3);
v12.getState = function(v23)
    return v23.state;
end;
v12.addCameraButtonStatus = function(v24, v25)
    v24.state = v0.joinDeep({
        AvatarExperience = {
            CameraButton = {
                enabled = v25
            }
        }
    }, v24.state);
    return v24;
end;
v12.addCameraButtonErrorOccurred = function(v26, v27)
    v26.state = v0.joinDeep({
        AvatarExperience = {
            CameraButton = {
                errorOccurred = v27
            }
        }
    }, v26.state);
    return v26;
end;
v12.addFetchStatus = function(v28, v29, v30)
    v28.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                UserInventoryRecommendationsFetchStatus = {
                    [v29] = v30
                }
            }
        }
    }, v28.state);
    return v28;
end;
v12.addCurrentCharacter = function(v31, v32, v33)
    if not v32 then
        local l_Players_0 = game:GetService("Players");
        local _ = nil;
        v32 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), if not v33 then Enum.HumanoidRigType.R15 else Enum.HumanoidRigType.R6);
    end;
    assert(v32, "character is not nil.");
    v32.Parent = workspace;
    v31.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    AvatarType = if not v33 then v8.AvatarType.R15 else v8.AvatarType.R6
                }
            }, 
            AvatarScene = {
                Character = {
                    CurrentCharacter = v32
                }
            }
        }
    }, v31.state);
    return v31;
end;
v12.addPPEStartState = function(v36)
    v36.state = v0.joinDeep({
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    ppeVersion = {
                        [v7.Closeup] = 0, 
                        [v7.FullBody] = 0
                    }, 
                    ppeEmoteLoadingCount = 0
                }
            }
        }
    }, v36.state);
    return v36;
end;
v12.addLocalUserId = function(v37, v38)
    if not v38 then
        v38 = v12.DefaultLocalUserId;
    end;
    v37.state = v0.joinDeep({
        LocalUserId = v38
    }, v37.state);
    return v37;
end;
v12.addEquippedItem = function(v39, v40, v41)
    v39.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    EquippedAssets = {
                        [v40] = v41
                    }
                }
            }
        }
    }, v39.state);
    return v39;
end;
v12.addEquippedNinjaIdleAnimation = function(v42)
    return v42:addEquippedItem(v3.AssetTypeIdStrings.IdleAnimation, {
        [v12.NinjaIdleAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v12.addEquippedYellowSciFiJacket = function(v43)
    return v43:addEquippedItem(v3.AssetTypeIdStrings.JacketAccessory, {
        [v12.YellowSciFiJacketAssetId] = {
            isLayered = true, 
            order = 12, 
            type = Enum.AccessoryType.Jacket, 
            version = "1"
        }
    });
end;
v12.addEquippedHat = function(v44)
    return v44:addEquippedItem(v3.AssetTypeIdStrings.Hat, {
        [v12.DunceHatAssetId] = {
            isLayered = false, 
            type = Enum.AccessoryType.Hat, 
            version = "1"
        }
    });
end;
v12.addEquippedShirt = function(v45)
    return v45:addEquippedItem(v3.AssetTypeIdStrings.ShirtAccessory, {
        ["9512497883"] = {
            isLayered = true, 
            order = 10, 
            type = Enum.AccessoryType.Shirt, 
            version = "1"
        }
    });
end;
v12.addEquippedGear = function(v46)
    return v46:addEquippedItem(v3.AssetTypeIdStrings.Gear, {
        ["1132887630"] = {
            version = "1"
        }
    });
end;
v12.addEquippedDynamicHead = function(v47)
    return v47:addEquippedItem(v3.AssetTypeIdStrings.DynamicHead, {
        [v12.DylanDefaultHeadAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v12.addEquippedMoodAnimation = function(v48)
    return v48:addEquippedItem(v3.AssetTypeIdStrings.MoodAnimation, {
        [v12.DynamicHeadMoodAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v12.addOutfitTryOnItem = function(v49, v50, v51)
    v51.itemRecency = v49.itemRecency;
    v49.itemRecency = v49.itemRecency + 1;
    v49.state = v0.joinDeep({
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v50] = v51
                    }
                }
            }
        }
    }, v49.state);
    return v49;
end;
v12.addOutfitTryOnLastToggledItem = function(v52, v53)
    v52.state = v0.joinDeep({
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    LastToggledItem = v53
                }
            }
        }
    }, v52.state);
    return v52;
end;
v12.addOutfitTryOnItemAsAsset = function(v54, v55, v56)
    local v57 = v12.makeSkeletonTryOnItem();
    v57.itemId = v55;
    v57.itemType = v3.ItemType.Asset;
    v57.itemSubType = v56;
    v57.itemRecency = v54.itemRecency;
    v54.itemRecency = v54.itemRecency + 1;
    v54.state = v0.joinDeep({
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v55] = v57
                    }
                }
            }
        }
    }, v54.state);
    return v54;
end;
v12.addOutfitTryOnItemAsPartsBundleAsset = function(v58, v59, v60, v61)
    local v62 = v12.makeSkeletonTryOnItem();
    v62.itemId = v59;
    v62.itemType = v3.ItemType.Bundle;
    v62.itemSubType = v3.BundleTypeIdStrings.BodyParts;
    v62.itemRecency = v58.itemRecency;
    v62.bundleInfo = {
        [v60] = {
            assetType = v61
        }
    };
    v58.itemRecency = v58.itemRecency + 1;
    v58.state = v0.joinDeep({
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v60] = v62
                    }
                }
            }
        }
    }, v58.state);
    return v58;
end;
v12.addDylanDefaultOutfitTryOnItem = function(v63)
    return v63:addOutfitTryOnItem(v12.DylanDefaultBundleId, {
        bundleInfo = {
            [v12.DylanDefaultHeadAssetId] = {
                assetType = v3.AssetTypeIdStrings.DynamicHead
            }, 
            [v12.DynamicHeadMoodAnimationAssetId] = {
                assetType = v3.AssetTypeIdStrings.MoodAnimation
            }
        }, 
        isUnequipped = false, 
        itemId = v12.DylanDefaultBundleId, 
        itemRecency = 0, 
        itemSubType = v3.BundleTypeIdStrings.DynamicHead, 
        itemType = v3.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v12.addGeckoOutfitTryOnItem = function(v64)
    return v64:addOutfitTryOnItem(v12.GeckoBundleId, {
        bundleInfo = {
            ["10407915508"] = {
                assetType = v3.AssetTypeIdStrings.DynamicHead
            }, 
            [v12.GeckoMoodAnimationAssetId] = {
                assetType = v3.AssetTypeIdStrings.MoodAnimation
            }, 
            ["2510230574"] = {
                assetType = "48"
            }, 
            ["2510233257"] = {
                assetType = "50"
            }, 
            ["2510235063"] = {
                assetType = "51"
            }, 
            ["2510236649"] = {
                assetType = "52"
            }, 
            ["2510238627"] = {
                assetType = "53"
            }, 
            ["2510240941"] = {
                assetType = "54"
            }, 
            ["2510242378"] = {
                assetType = "55"
            }, 
            ["7200822331"] = {
                assetType = "29"
            }, 
            ["7200822888"] = {
                assetType = "30"
            }, 
            ["7200823471"] = {
                assetType = "28"
            }, 
            ["7200824015"] = {
                assetType = "31"
            }, 
            ["7200824885"] = {
                assetType = "27"
            }, 
            ["7200826678"] = {
                assetType = "47"
            }
        }, 
        isUnequipped = false, 
        itemId = v12.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = v3.BundleTypeIdStrings.BodyParts, 
        itemType = v3.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v12.addPirateAnimationOutfitTryOnItem = function(v65)
    return v65:addOutfitTryOnItem(v12.PirateAnimationBundleId, {
        bundleInfo = v13, 
        isUnequipped = false, 
        itemId = v12.PirateAnimationBundleId, 
        itemRecency = 0, 
        itemSubType = v3.BundleTypeIdStrings.Animations, 
        itemType = v3.ItemType.Bundle, 
        receivedBundleInfo = true, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v12.addPirateAnimationOutfitTryOnLastToggledItem = function(v66)
    local v67 = v12.makeSkeletonTryOnItem();
    v67.itemId = v12.PirateAnimationBundleId;
    v67.itemType = v3.ItemType.Bundle;
    return v66:addOutfitTryOnLastToggledItem(v67);
end;
v12.addDHWithNoMoodOutfitTryOnItem = function(v68)
    return v68:addOutfitTryOnItem(v12.GeckoBundleId, {
        bundleInfo = {
            ["10407915508"] = {
                assetType = v3.AssetTypeIdStrings.DynamicHead
            }, 
            ["2510230574"] = {
                assetType = "48"
            }, 
            ["2510233257"] = {
                assetType = "50"
            }, 
            ["2510235063"] = {
                assetType = "51"
            }, 
            ["2510236649"] = {
                assetType = "52"
            }, 
            ["2510238627"] = {
                assetType = "53"
            }, 
            ["2510240941"] = {
                assetType = "54"
            }, 
            ["2510242378"] = {
                assetType = "55"
            }, 
            ["7200822331"] = {
                assetType = "29"
            }, 
            ["7200822888"] = {
                assetType = "30"
            }, 
            ["7200823471"] = {
                assetType = "28"
            }, 
            ["7200824015"] = {
                assetType = "31"
            }, 
            ["7200824885"] = {
                assetType = "27"
            }, 
            ["7200826678"] = {
                assetType = "47"
            }
        }, 
        isUnequipped = false, 
        itemId = v12.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = "1", 
        itemType = v3.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v12.addTryOnAnimation = function(v69, v70)
    v69.state = v0.joinDeep({
        AvatarExperience = {
            AvatarScene = {
                TryOn = {
                    AnimationPreview = v70
                }
            }
        }
    }, v69.state);
    return v69;
end;
v12.addPirateTryOnAnimation = function(v71)
    return v71:addTryOnAnimation(v12.PirateIdleAnimationAssetId);
end;
v12.addAssetInfo = function(v72, v73)
    local l_id_0 = v73.id;
    assert(l_id_0 ~= nil, "assetInfo should have an id");
    v72.state = v0.joinDeep({
        AvatarExperience = {
            Common = {
                AssetInfos = {
                    [l_id_0] = v73
                }
            }
        }
    }, v72.state);
    return v72;
end;
v12.addBundleInfo = function(v75, v76)
    local l_id_1 = v76.id;
    assert(l_id_1 ~= nil, "bundleInfo should have an id");
    v75.state = v0.joinDeep({
        AvatarExperience = {
            Common = {
                BundleInfos = {
                    [l_id_1] = v76
                }
            }
        }
    }, v75.state);
    return v75;
end;
v12.addPirateAnimationAssetInfos = function(v78)
    for v79, v80 in v13, nil, nil do
        local v81 = v11.mock();
        v81.id = v79;
        v81.assetType = v80.assetType;
        v78 = v78:addAssetInfo(v81);
    end;
    return v78;
end;
v12.addDunceHatAssetInfo = function(v82)
    return v82:addAssetInfo((v11.fromGetCatalogItemData({
        receivedCatalogData = true, 
        id = v12.DunceHatAssetId, 
        assetType = Enum.AvatarAssetType.Hat.Name, 
        name = "Dunce Hat", 
        description = "Go sit in the corner", 
        product = {
            id = "1379526016"
        }, 
        creator = {
            id = "13805545", 
            name = "BRICK UGC", 
            type = "Group", 
            hasVerifiedBadge = true
        }, 
        price = 69, 
        favoriteCount = 7486, 
        isOwned = false, 
        isPurchasable = true, 
        itemStatus = {}, 
        itemRestrictions = {}
    })));
end;
v12.addDylanDefaultBundleInfo = function(v83)
    return v83:addBundleInfo({
        bundleType = tostring(Enum.BundleType.DynamicHead.Value), 
        description = "A look that never goes out of style.", 
        expectedSellerId = "1", 
        favoriteCount = 196358, 
        id = v12.DylanDefaultBundleId, 
        isOwned = true, 
        isPublicDomain = true, 
        isPurchasable = false, 
        itemStatus = {}, 
        itemType = v3.ItemType.Bundle, 
        items = {
            [1] = {
                id = v12.DylanDefaultHeadAssetId, 
                type = v3.ItemType.Asset
            }, 
            [2] = {
                id = v12.DynamicHeadMoodAnimationAssetId, 
                type = v3.ItemType.Asset
            }, 
            [3] = {
                id = v12.DylanDefaultOutfitId, 
                type = v3.ItemType.Outfit
            }
        }, 
        name = "Dylan Default", 
        priceInRobux = 0, 
        priceStatus = "Free", 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v12.addGeckoBundleInfo = function(v84)
    return v84:addBundleInfo({
        bundleType = v3.BundleTypeIdStrings.BodyParts, 
        creator = {
            hasVerifiedBadge = true, 
            id = "1", 
            name = "Roblox", 
            type = "User"
        }, 
        description = "Some geckos have been seen running across the surface of water. Other geckos refer to them as \"overachievers.\"", 
        expectedSellerId = "1", 
        favoriteCount = 24889, 
        id = v12.GeckoBundleId, 
        isOwned = false, 
        isPublicDomain = false, 
        isPurchasable = true, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = v3.ItemType.Bundle, 
        items = {
            [1] = {
                id = "7200822331", 
                type = v3.ItemType.Asset
            }, 
            [2] = {
                id = "7200822888", 
                type = v3.ItemType.Asset
            }, 
            [3] = {
                id = "7200823471", 
                type = v3.ItemType.Asset
            }, 
            [4] = {
                id = "7200824015", 
                type = v3.ItemType.Asset
            }, 
            [5] = {
                id = "7200824885", 
                type = v3.ItemType.Asset
            }, 
            [6] = {
                id = "10407915508", 
                type = v3.ItemType.Asset
            }, 
            [7] = {
                id = "7200826678", 
                type = v3.ItemType.Asset
            }, 
            [8] = {
                id = "2510230574", 
                type = v3.ItemType.Asset
            }, 
            [9] = {
                id = "2510233257", 
                type = v3.ItemType.Asset
            }, 
            [10] = {
                id = "2510235063", 
                type = v3.ItemType.Asset
            }, 
            [11] = {
                id = "2510236649", 
                type = v3.ItemType.Asset
            }, 
            [12] = {
                id = "2510238627", 
                type = v3.ItemType.Asset
            }, 
            [13] = {
                id = "2510240941", 
                type = v3.ItemType.Asset
            }, 
            [14] = {
                id = "2510242378", 
                type = v3.ItemType.Asset
            }, 
            [15] = {
                id = v12.GeckoMoodAnimationAssetId, 
                type = v3.ItemType.Asset
            }, 
            [16] = {
                id = v12.GeckoOutfitId, 
                type = v3.ItemType.Outfit
            }, 
            [17] = {
                id = "11625698220", 
                type = v3.ItemType.Outfit
            }
        }, 
        name = "Galloping Gecko", 
        priceInRobux = 500, 
        product = {
            id = "1324726369", 
            isForSale = true, 
            type = "productType"
        }, 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v12.addPirateAnimationBundleInfo = function(v85)
    return v85:addBundleInfo({
        bundleType = "2", 
        creator = {
            hasVerifiedBadge = true, 
            id = "1", 
            name = "Roblox", 
            type = "User"
        }, 
        description = "This animation pack only works with R15 avatars. Arr, I'll wipe the deck with ya blasted swabbies", 
        expectedSellerId = "1", 
        favoriteCount = 99606, 
        id = "55", 
        isOwned = true, 
        isPublicDomain = false, 
        isPurchasable = false, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = v3.ItemType.Bundle, 
        items = v16, 
        name = "Pirate Animation Package", 
        priceInRobux = 750, 
        product = {
            id = "1324726369", 
            isForSale = true, 
            type = "productType"
        }, 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v12.addOutfitInfo = function(v86, v87, v88)
    v86.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                OutfitInfos = {
                    [v87] = v88
                }
            }
        }
    }, v86.state);
    return v86;
end;
v12.addDylanDefaultOutfitInfo = function(v89)
    local v90 = v12.makeSkeletonOutfitInfo();
    v90.assets = {
        [v3.AssetTypeIdStrings.MoodAnimation] = {
            [v12.DynamicHeadMoodAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v3.AssetTypeIdStrings.DynamicHead] = {
            [v12.DylanDefaultHeadAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v90.containsDynamicHead = true;
    v90.name = "Dylan Default";
    v90.outfitId = v12.DylanDefaultOutfitId;
    v90.outfitType = v3.OutfitTypes.DynamicHead;
    return v89:addOutfitInfo(v12.DylanDefaultOutfitId, v90);
end;
v12.addGeckoOutfitInfo = function(v91)
    local v92 = v12.makeSkeletonOutfitInfo();
    v92.assets = {
        ["27"] = {
            ["7200824885"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["28"] = {
            ["7200823471"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["29"] = {
            ["7200822331"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["30"] = {
            ["7200822888"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["31"] = {
            ["7200824015"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["47"] = {
            ["7200826678"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["48"] = {
            ["2510230574"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["50"] = {
            ["2510233257"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["51"] = {
            ["2510235063"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["52"] = {
            ["2510236649"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["53"] = {
            ["2510238627"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["54"] = {
            ["2510240941"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["55"] = {
            ["2510242378"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v3.AssetTypeIdStrings.MoodAnimation] = {
            [v12.GeckoMoodAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v3.AssetTypeIdStrings.DynamicHead] = {
            ["10407915508"] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v92.outfitType = v3.OutfitTypes.Avatar;
    v92.name = "Galloping Gecko";
    v92.outfitId = v12.GeckoOutfitId;
    v92.containsDynamicHead = true;
    return v91:addOutfitInfo(v12.GeckoOutfitId, v92);
end;
v12.addPirateAnimationOutfitInfo = function(v93)
    local v94 = v12.makeSkeletonOutfitInfo();
    v94.assets = {
        ["48"] = {
            ["837025325"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["50"] = {
            ["837024147"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["51"] = {
            [v12.PirateIdleAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["52"] = {
            [v12.PirateJumpAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["53"] = {
            [v12.PirateRunAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["54"] = {
            ["837025054"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["55"] = {
            ["837023892"] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v94.name = "Pirate Animation Package";
    v94.outfitId = v12.PirateOutfitId;
    return v93:addOutfitInfo(v12.PirateOutfitId, v94);
end;
v12.addCategory = function(v95, v96)
    v95.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v96
                }
            }
        }
    }, v95.state);
    return v95;
end;
v12.addEquippedEmote = function(v97, v98, v99)
    v97.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                EquippedEmotes = {
                    selectedSlot = v98, 
                    slotInfo = {
                        {
                            assetId = v99
                        }
                    }
                }
            }
        }
    }, v97.state);
    return v97;
end;
v12.addBodybuilderEquippedEmote = function(v100)
    return v100:addEquippedEmote(1, v12.BodybuilderEmoteAssetId);
end;
v12.addIsInAx = function(v101)
    v101.state = v0.joinDeep({
        Navigation = {
            history = {
                {
                    {
                        name = v6.AvatarExperienceRoot
                    }
                }
            }
        }
    }, v101.state);
    return v101;
end;
v12.addPPEFinalPageFullView = function(v102)
    v102.state = v0.joinDeep({
        AvatarExperience = {
            ProfilePictureEditor = {
                FinalPageViewMode = {
                    finalPageViewMode = v7.FullBody
                }
            }
        }
    }, v102.state);
    return v102;
end;
v12.addSelectedPPEEmote = function(v103, v104)
    v103.state = v0.joinDeep({
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    emoteAssetId = v104
                }
            }
        }
    }, v103.state);
    return v103;
end;
v12.addBodyBuilderSelectedPPEEmote = function(v105)
    return v105:addSelectedPPEEmote(v12.BodybuilderEmoteAssetId);
end;
v12.addAvatarEditorCategoryAndSubcategory = function(v106, v107, v108)
    v106.state = v0.joinDeep({
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v107, 
                    subcategory = v108
                }
            }
        }
    }, v106.state);
    return v106;
end;
v12.addAvatarEditorCategoryAndSubcategoryByName = function(v109, v110, v111)
    local v112 = nil;
    local v113 = nil;
    for v114, v115 in (v9()), nil, nil do
        if v115.Name == v110 then
            v112 = v114;
            if v111 then
                assert(v115.Subcategories, "category.Subcategories should be non-nil");
                for v116, v117 in v115.Subcategories, nil, nil do
                    if v117.Name == v111 then
                        v113 = v116;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                break;
            else
                break;
            end;
        end;
    end;
    ::label0::;
    assert(v112, "categoryIndex should be non-nil");
    if v111 then
        assert(v113, "subcategoryIndex should be non-nil");
    end;
    return v109:addAvatarEditorCategoryAndSubcategory(v112, v113);
end;
v12.addSortAndFilters = function(v118)
    v118.state = v0.joinDeep({
        AvatarExperience = {
            Catalog = {
                SortAndFilters = v10(nil, {})
            }
        }
    }, v118.state);
    return v118;
end;
v12.addSearchInCatalog = function(v119, v120)
    v119.state = v0.joinDeep({
        AvatarExperience = {
            Search = {
                SearchesInCatalog = {
                    [v12.DummySearchUid] = {
                        keyword = v12.DummyKeyword, 
                        items = v120
                    }
                }
            }
        }
    }, v119.state);
    return v119;
end;
v12.addItemDetailsPeekViewState = function(v121, v122)
    v121.state = v0.joinDeep({
        AvatarExperience = {
            Common = {
                ItemDetailsPeekView = {
                    viewState = v122
                }
            }
        }
    }, v121.state);
    return v121;
end;
v12.addFetchingStatus = function(v123, v124, v125)
    v123.state = v0.joinDeep({
        FetchingStatus = {
            [v124] = v125
        }
    }, v123.state);
    return v123;
end;
return v12;
