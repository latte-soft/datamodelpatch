local v0 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.LuaApp.TestHelpers.MockRequest);
local v5 = {
    dummyAssetId = "0", 
    dummyBundleId = "0", 
    dummyProductId = "0", 
    dummyUserId = "0", 
    dummyUniverseId = "0", 
    dummyCollectibleItemId = "0", 
    isLimited = false, 
    isLimitedUnique = false, 
    emptyRecommendations = false, 
    hasAttribution = false
};
local v6 = "model.assetTypeIds=8&model.assetTypeIds=41&model.assetTypeIds=42&model.assetTypeIds=43" .. "&model.assetTypeIds=44&model.assetTypeIds=45&model.assetTypeIds=46&model.assetTypeIds=47&model.assetTypeIds=18" .. "&model.assetTypeIds=19&model.assetTypeIds=61";
local v7 = "model.assetTypeIds=8&model.assetTypeIds=41&model.assetTypeIds=42&model.assetTypeIds=43" .. "&model.assetTypeIds=44&model.assetTypeIds=45&model.assetTypeIds=46&model.assetTypeIds=47&model.assetTypeIds=18" .. "&model.assetTypeIds=19";
return function(v8)
    local v9 = v0.Dictionary.join(v5, v8 or {});
    local v10 = {};
    if not v9.isLimited then
        if v9.isLimitedUnique then
            v10 = {
                v2.ItemRestrictions.LimitedUnique
            };
        end;
    else
        v10 = {
            v2.ItemRestrictions.Limited
        };
    end;
    local v11 = v4.simpleSuccessRequest({
        keyword = "Tie", 
        previousPageCursor = nil, 
        nextPageCursor = "testcursorstring", 
        data = {
            {
                id = 1818, 
                itemType = "Asset", 
                assetType = 43, 
                name = "Space Tie", 
                description = "For a look that's out of this world", 
                productId = 95344840, 
                genres = {
                    "TownAndCity"
                }, 
                itemStatus = {}, 
                itemRestrictions = v10, 
                creatorType = "User", 
                creatorTargetId = 1, 
                creatorName = "ROBLOX", 
                price = 30, 
                favoriteCount = 1985
            }
        }
    });
    local v12 = {
        userAssetId = 12321, 
        seller = {
            id = 261, 
            type = "User", 
            name = "Shedletsky"
        }, 
        price = 10000, 
        serialNumber = 101
    };
    local v13 = {
        item = {
            assetId = 71037101, 
            name = "Dagger of Shattered Dimensions", 
            price = 10294, 
            absoluteUrl = "https://www.roblox.com/catalog/71037101/Dagger-of-Shattered-Dimensions"
        }, 
        creator = {
            creatorId = 1, 
            creatorType = "User", 
            name = "ROBLOX", 
            creatorProfileLink = "https://www.roblox.com/users/1/profile/"
        }, 
        product = {
            id = 11008410, 
            priceInRobux = nil, 
            isForSale = false, 
            isPublicDomain = false, 
            isResellable = false, 
            isLimited = false, 
            isLimitedUnique = true, 
            isRental = false, 
            bcRequirement = 0, 
            totalPrivateSales = 0, 
            sellerId = 0, 
            sellerName = nil, 
            lowestPrivateSaleUserAssetId = nil, 
            isXboxExclusiveItem = false, 
            offsaleDeadline = nil, 
            noPriceText = "", 
            isFree = false
        }
    };
    local v14 = {
        id = 70386604, 
        itemType = "Asset", 
        assetType = 19, 
        name = "Limited Skeleton Bomb", 
        description = "It's a limited item.", 
        productId = 10912719, 
        genres = {
            "All"
        }, 
        itemStatus = {}, 
        itemRestrictions = {
            "LimitedUnique"
        }, 
        creatorType = "User", 
        creatorTargetId = 1, 
        creatorName = "ROBLOX", 
        unitsAvailableForConsumption = 19195, 
        favoriteCount = 3
    };
    local v15 = v4.simpleSuccessRequest({
        previousPageCursor = nil, 
        nextPageCursor = "testCursor", 
        data = {
            {
                name = "Nec Protec", 
                userAssetId = 61105953107, 
                assetId = 4911671338, 
                assetType = "NeckAccessory", 
                owner = {
                    userId = 2231221, 
                    username = "TheGamer101", 
                    buildersClubMembershipType = 0
                }, 
                created = "2020-04-19T13:41:06.37", 
                updated = "2020-04-19T13:41:06.37"
            }
        }
    });
    return {
        {
            url = "/v1/catalog/sponsored-items?model.placementLocation=AvatarShop" .. "&model.catalogCategoryType=Recommended&model.count=10", 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v1/search/items/details?limit=30&model.category=Featured&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v1/search/items/details?limit=30&model.category=All&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v1/search/items/details?category=Featured&limit=30", 
            request = v11
        }, 
        {
            url = "/v1/recommendations/asset/61?numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v13, 
                    v13
                }
            })
        }, 
        {
            url = "/v1/recommendations/asset/46?contextAssetId=1818&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v13, 
                    v13
                }
            })
        }, 
        {
            url = string.format("/v1/favorites/users/%s/assets/1818/favorite", v9.dummyUserId), 
            request = v4.simpleSuccessRequest({
                data = 100
            })
        }, 
        {
            url = "v2/recommendations/user-inventory?bundleTypeId=1&details=true&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/user-inventory?bundleTypeId=2&details=true&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/assets?assetTypeId=0&assetId=1818&details=true&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/user-inventory?assetTypeId=64&details=true&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/user-inventory?assetTypeId=61&details=true&numItems=6", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/user-inventory/details?limit=120&bundleTypeId=", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "v2/recommendations/user-inventory/details?limit=120&assetTypeId=", 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14, 
                    v14
                }
            })
        }, 
        {
            url = "/v2/search/items/details?model.categoryFilter=None&limit=30&model.bundleTypeIds=1", 
            request = v11
        }, 
        {
            url = "/v2/search/items/details?model.categoryFilter=Recommended&limit=28&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v2/search/items/details%?model.categoryFilter=Recommended&limit=30[&model.assetTypeIds=%d+]+" .. "&model.bundleTypeIds=2&model.bundleTypeIds=1&model.sortType=Relevance", 
            usePatterns = true, 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v2/search/items/details%?model.categoryFilter=Recommended&limit=120[&model.assetTypeIds=%d+]+", 
            usePatterns = true, 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "v2/search/items/details?model.categoryFilter=Recommended&limit=30&model.keyword=&model.sortType=Relevance", 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v2/search/items/details?model.categoryFilter=Recommended&limit=30&model.sortType=Relevance", 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("/v2/search/items/details?model.categoryFilter=Recommended&limit=30&%s&model.sortType=Relevance", v7), 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v1/users//outfits?page=1&itemsPerPage=25&isEditable=", 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("/v2/search/items/details?model.categoryFilter=Recommended&limit=30&%s&%s&model.sortType=Relevance", v6, "model.bundleTypeIds=2&model.bundleTypeIds=1"), 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("/v2/search/items/details?model.categoryFilter=Recommended&limit=30&%s&model.sortType=Relevance", v6), 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = "/v2/users//inventory/61/?sortOrder=Desc&limit=25&cursor=", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=&limit=25" .. "&assetTypes=ShirtAccessory&assetTypes=TShirtAccessory&assetTypes=SweaterAccessory", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=testCursor&limit=25" .. "&assetTypes=ShirtAccessory&assetTypes=TShirtAccessory&assetTypes=SweaterAccessory", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=&limit=25&assetTypes=IdleAnimation", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=testCursor&limit=25&assetTypes=IdleAnimation", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=&limit=25&assetTypes=EmoteAnimation", 
            request = v15
        }, 
        {
            url = "/v2/users//inventory/?sortOrder=Desc&cursor=testCursor&limit=25&assetTypes=EmoteAnimation", 
            request = v15
        }, 
        {
            url = "/v2/users/2231221/inventory/?sortOrder=Desc&cursor=&limit=25&assetTypes=EmoteAnimation", 
            request = v15
        }, 
        {
            url = "/v1/search/items/details?limit=30&model.category=Featured&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v1/catalog/items", 
            request = v4.simpleSuccessRequest({
                isForRent = false, 
                expectedSellerId = 1, 
                owned = false, 
                isPurchasable = true, 
                id = v9.dummyAssetId, 
                itemType = v3.ItemType.Asset, 
                assetType = 46, 
                name = "Test Asset", 
                description = "Test Description", 
                productId = 50, 
                genres = {
                    "All"
                }, 
                creatorType = "User", 
                creatorTargetId = 1, 
                creatorName = "ROBLOX", 
                itemRestrictions = v10, 
                price = 100, 
                favoriteCount = 100
            })
        }, 
        {
            url = string.format("/v1/catalog/items/%s/details?itemType=%s", v9.dummyBundleId, v3.ItemType.Bundle), 
            request = v4.simpleSuccessRequest({
                isForRent = false, 
                expectedSellerId = 1, 
                owned = false, 
                isPurchasable = true, 
                id = v9.dummyBundleId, 
                itemType = v3.ItemType.Bundle, 
                assetType = 10, 
                name = "Test Bundle", 
                description = "Test Description", 
                productId = 100, 
                genres = {
                    "All"
                }, 
                creatorType = "User", 
                creatorTargetId = 1, 
                creatorName = "ROBLOX", 
                price = 100, 
                itemRestrictions = v10, 
                favoriteCount = 100
            })
        }, 
        {
            url = string.format("/v1/assets/%s/resale-data", v9.dummyAssetId), 
            request = v4.simpleSuccessRequest({
                assetStock = 500, 
                sales = 500, 
                numberRemaining = 0, 
                recentAveragePrice = 2237, 
                originalPrice = 1500
            })
        }, 
        {
            url = string.format("/v1/assets/%s/resellers?limit=10", v9.dummyAssetId), 
            request = v4.simpleSuccessRequest({
                data = {
                    v12, 
                    v12
                }
            })
        }, 
        {
            url = string.format("/v1/recommendations/asset/0?contextAssetId=%s&numItems=6", v9.dummyAssetId), 
            request = v4.simpleSuccessRequest({
                data = not not v9.emptyRecommendations and {} or {
                    v13, 
                    v13
                }
            })
        }, 
        {
            url = "/v1/search/items/details?limit=30&model.keyword=Tie&model.category=All&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v2/search/items/details?model.categoryFilter=None&limit=30&model.keyword=Tie&model.sortType=Relevance", 
            request = v11
        }, 
        {
            url = "/v1/resale-tax-rate", 
            request = v4.simpleSuccessRequest({
                taxRate = 0.3, 
                minimumFee = 1
            })
        }, 
        {
            url = "/v1/assets/2929/users//resellable-copies", 
            request = v4.simpleSuccessRequest({
                data = {
                    v12, 
                    {
                        userAssetId = 12321, 
                        seller = {
                            id = 261, 
                            type = "User", 
                            name = "Shedletsky"
                        }, 
                        serialNumber = 101
                    }
                }
            })
        }, 
        {
            url = "/v1/assets/1818/users//resellable-copies", 
            request = v4.simpleSuccessRequest({
                data = {
                    v12
                }
            })
        }, 
        {
            url = string.format("/v1/assets/%s/resellers", v9.dummyAssetId), 
            request = v4.simpleSuccessRequest({
                data = {
                    v12
                }
            })
        }, 
        {
            url = "/v1/catalog/metadata", 
            request = v4.simpleSuccessRequest({
                LCEnabledInEditorAndCatalog = true
            })
        }, 
        {
            url = "/v1/avatar/thumbnail-customizations", 
            request = v4.simpleSuccessRequest({
                avatarThumbnailCustomizations = {
                    {
                        thumbnailType = 1, 
                        emoteAssetId = 4689362868, 
                        camera = {
                            fieldOfViewDeg = 30, 
                            xRotDeg = 0, 
                            yRotDeg = 20, 
                            distanceScale = 1
                        }
                    }, 
                    {
                        thumbnailType = 2, 
                        emoteAssetId = 4689362868, 
                        camera = {
                            fieldOfViewDeg = 30, 
                            xRotDeg = 0, 
                            yRotDeg = 20, 
                            distanceScale = 1
                        }
                    }
                }
            })
        }, 
        {
            url = "/v1/avatar", 
            request = v4.simpleSuccessRequest({
                scales = {
                    height = 1.05, 
                    width = 1, 
                    head = 1, 
                    depth = 1, 
                    proportion = 0, 
                    bodyType = 0
                }, 
                playerAvatarType = "R15", 
                bodyColors = {
                    headColorId = 24, 
                    torsoColorId = 24, 
                    rightArmColorId = 24, 
                    leftArmColorId = 24, 
                    rightLegColorId = 24, 
                    leftLegColorId = 24
                }, 
                assets = {
                    {
                        id = 44179202, 
                        name = "TheGamer101 Name tag.", 
                        assetType = {
                            id = 2, 
                            name = "T-Shirt"
                        }
                    }, 
                    {
                        id = 106690045, 
                        name = "Classic Swordpack Throwback", 
                        assetType = {
                            id = 46, 
                            name = "Back Accessory"
                        }
                    }
                }
            })
        }, 
        {
            url = "/v2/avatar/avatar", 
            request = v4.simpleSuccessRequest({
                scales = {
                    height = 1.05, 
                    width = 1, 
                    head = 1, 
                    depth = 1, 
                    proportion = 0, 
                    bodyType = 0
                }, 
                playerAvatarType = "R15", 
                bodyColor3s = {
                    headColor3 = "112233", 
                    torsoColor3 = "223344", 
                    rightArmColor3 = "334455", 
                    leftArmColor3 = "445566", 
                    rightLegColor3 = "556677", 
                    leftLegColor3 = "778899"
                }, 
                assets = {
                    {
                        id = 44179202, 
                        name = "TheGamer101 Name tag.", 
                        assetType = {
                            id = 2, 
                            name = "T-Shirt"
                        }
                    }, 
                    {
                        id = 106690045, 
                        name = "Classic Swordpack Throwback", 
                        assetType = {
                            id = 46, 
                            name = "Back Accessory"
                        }
                    }
                }
            })
        }, 
        {
            url = "/account-security-service/v1/prompt-assignments", 
            request = v4.simpleSuccessRequest({})
        }, 
        {
            url = string.format("/v1/purchases/products/%s", v9.dummyProductId), 
            request = v4.simpleSuccessRequest({
                purchased = v9.failedPurchaseReason == nil, 
                reason = v9.failedPurchaseReason
            })
        }, 
        {
            url = string.format("/v1/users/%s/configuration", v9.dummyUserId), 
            request = v4.simpleSuccessRequest({
                methods = {
                    {
                        enabled = true
                    }
                }
            })
        }, 
        {
            url = "/v2/spend-friction/two-step-verification/generate", 
            request = v4.simpleSuccessRequest("GENERATED_CHALLENGE_ID")
        }, 
        {
            url = string.format("/v1/users/%s/currency", v9.dummyUserId), 
            request = v4.simpleSuccessRequest({
                robux = 0
            })
        }, 
        {
            url = "/v1/users//currency", 
            request = v4.simpleSuccessRequest({
                robux = 0
            })
        }, 
        {
            url = "/marketplace-widgets/v1/widgets", 
            request = v4.simpleSuccessRequest({
                data = {}
            })
        }, 
        {
            url = string.format("/v1/assets/%s/saved-versions", v9.dummyAssetId), 
            request = v4.simpleSuccessRequest({
                data = {
                    {
                        creatingUniverseId = if not v9.hasAttribution then nil else 17
                    }
                }
            })
        }, 
        {
            url = string.format("//v1/settings/verify/show-age-verification-overlay/%s", v9.dummyUniverseId), 
            request = v4.simpleSuccessRequest({
                showAgeVerificationOverlay = false, 
                showVoiceOptInOverlay = false, 
                universePlaceVoiceEnabledSettings = {
                    isUniverseEnabledForVoice = false, 
                    isUniverseEnabledForAvatarVideo = false
                }, 
                voiceSettings = {
                    isVoiceEnabled = false
                }
            })
        }, 
        {
            url = "/v1/private-servers/enabled-in-universe/56", 
            request = v4.simpleSuccessRequest({
                privateServersEnabled = false
            })
        }, 
        {
            url = "/marketplace-items/v1/items/details", 
            request = v4.simpleSuccessRequest({
                {}
            })
        }, 
        {
            url = "/v1/topic/get-topics", 
            request = v4.simpleSuccessRequest({
                topics = {}
            })
        }
    };
end;
