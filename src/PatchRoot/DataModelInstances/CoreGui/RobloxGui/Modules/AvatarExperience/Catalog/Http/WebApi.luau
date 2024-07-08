local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Http.Url);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
local v13 = string.format("https://develop.%s", v5.DOMAIN);
local v54 = {
    FetchSponsoredItems = function(v14, v15, v16)
        local v17 = string.format("%sv1/catalog/sponsored-items?model.placementLocation=AvatarShop", v5.CATALOG_URL);
        if v15 then
            v17 = v17 .. "&model.catalogCategoryType=" .. v15;
        end;
        if v16 then
            v17 = v17 .. "&model.count=" .. tostring(v16);
        end;
        return v14(v17, "GET");
    end, 
    FetchWidgets = function(v18, v19, v20)
        return v18(string.format("%smarketplace-widgets/v1/widgets?%s", v5.APIS_URL, (v5:makeQueryString({
            requestId = v19, 
            context = if not v12() then nil else v20
        }))), "GET");
    end, 
    FetchWidgetsSearch = function(v21, v22, v23)
        return v21(string.format("%smarketplace-widgets/v1/widgets/search?%s", v5.APIS_URL, (v5:makeQueryString({
            query = v23, 
            requestId = v22
        }))), "GET");
    end, 
    HydrateWidgetContent = function(v24, v25)
        return v24(string.format("%smarketplace-widgets/v1/widgets/hydrate", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                Content = v25
            })
        });
    end, 
    TrackSponsoredItemClick = function(v26, v27)
        return v26(string.format("%sv2/tracking/click", v5.AD_CONFIGURATION_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                encryptedAdTrackingData = v27, 
                campaignTargetType = "Asset", 
                placementLocation = "AvatarShop"
            })
        });
    end, 
    FetchItemDetails = function(v28, v29)
        return v28(string.format("%sv1/catalog/items/details", v5.CATALOG_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                items = v29
            })
        });
    end, 
    FetchCollectibleItemDetails = function(v30, v31)
        return v30(string.format("%smarketplace-items/v1/items/details", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                itemIds = v31
            })
        });
    end, 
    PurchaseProduct = function(v32, v33, v34, v35, v36)
        v6.isType(v33, "string", "CatalogWebApi.PurchaseProduct: productId");
        v6.isNonNegativeNumber(v34, "CatalogWebApi.PurchaseProduct: expectedPrice");
        v6.isType(v35, "string", "CatalogWebApi.PurchaseProduct: expectedSellerId");
        return v32(string.format("%sv1/purchases/products/%s", v5.ECONOMY_URL, v33), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v34), 
                expectedSellerId = tostring(v35), 
                userAssetId = v36
            })
        });
    end, 
    PurchaseCollectibleItem = function(v37, v38, v39, v40, v41, v42, v43, v44)
        return v37(string.format("%smarketplace-sales/v1/item/%s/purchase-item", v5.APIS_URL, v38), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v40), 
                expectedSellerId = tostring(v41), 
                expectedPurchaserId = v43, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v42, 
                collectibleProductId = v39, 
                idempotencyKey = v44
            })
        });
    end, 
    PurchaseCollectibleItemResale = function(v45, v46, v47, v48, v49, v50, v51, v52, v53)
        return v45(string.format("%smarketplace-sales/v1/item/%s/purchase-resale", v5.APIS_URL, v46), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v49), 
                expectedSellerId = tostring(v50), 
                expectedPurchaserId = v52, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v51, 
                collectibleProductId = v48, 
                collectibleItemInstanceId = v47, 
                idempotencyKey = v53
            })
        });
    end
};
if v11 then
    v54.RedeemQRCodeItem = function(v55, v56)
        v6.isType(v56, "string", "CatalogWebApi.RedeemQRCodeItem: assetId");
        return v55(string.format("%sv2/qr-code-auto-redeem/%s", v5.ECONOMY_URL, v56), "POST", {
            postBody = ""
        });
    end;
end;
v54.FetchSellPageData = function(v57, v58, v59)
    return v57(string.format("%s/v1/assets/%s/users/%s/resellable-copies", v5.ECONOMY_URL, v58, v59), "GET");
end;
v54.FetchCollectibleResellableInstances = function(v60, v61, v62)
    return v60(string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", v5.APIS_URL, v61, (v5:makeQueryString({
        ownerId = v62, 
        ownerType = v7.CreatorType.User, 
        cursor = "", 
        limit = v7.MaxOwnedCopiesPerPage
    }))), "GET");
end;
v54.FetchAssetResellers = function(v63, v64, v65, _)
    return v63(string.format("%s/v1/assets/%s/resellers?%s", v5.ECONOMY_URL, v64, (v5:makeQueryString({
        cursor = v65, 
        limit = v7.MaxResellersPerPage
    }))), "GET");
end;
v54.FetchAssetResaleData = function(v67, v68)
    return v67(string.format("%s/v1/assets/%s/resale-data", v5.ECONOMY_URL, v68), "GET");
end;
v54.FetchCollectibleResaleData = function(v69, v70)
    return v69(string.format("%smarketplace-sales/v1/item/%s/resale-data", v5.APIS_URL, v70), "GET");
end;
v54.GetCollectibleResellers = function(v71, v72, v73, v74)
    return v71(string.format("%smarketplace-sales/v1/item/%s/resellers?%s", v5.APIS_URL, v72, (v5:makeQueryString({
        cursor = v73, 
        limit = v74
    }))), "GET");
end;
v54.RemoveCurrentlySellingAsset = function(v75, v76, v77)
    return v75(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v76, v77), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = ""
        })
    });
end;
v54.RemoveAvailableToSell = function(v78, v79, v80, v81)
    return v78(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v79, v80), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = v81
        })
    });
end;
v54.UpdateCollectibleInstanceResaleState = function(v82, v83, v84, v85, v86, v87, v88)
    return v82(string.format("%smarketplace-sales/v1/item/%s/instance/%s/resale", v5.APIS_URL, v83, v84), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = v86, 
            isOnSale = v87, 
            sellerId = v88, 
            sellerType = v7.CreatorType.User, 
            collectibleProductId = v85
        })
    });
end;
v54.GetMarketplaceFee = function(v89)
    return v89(string.format("%s/v1/resale-tax-rate", v5.ECONOMY_URL), "GET");
end;
v54.GetCollectibleMarketplaceResaleParameters = function(v90, v91)
    return v90(string.format("%smarketplace-sales/v1/item/%s/get-resale-parameters", v5.APIS_URL, v91), "GET");
end;
v54.ReportItem = function(v92, v93, v94, v95)
    local v96 = l_HttpService_0:JSONEncode({
        reportingItemTypeName = v92, 
        reportingItemId = v93, 
        reportCategoryId = v94, 
        comment = v95
    });
    if v96 then
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpRbxApiService_0:PostAsync("moderation/reportabuse", v96, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_0 then
            return l_result_0;
        end;
    end;
    return nil;
end;
v54.ReportItemV2 = function(v99, v100, v101, v102, v103, v104, v105, v106, v107)
    local v108 = l_HttpService_0:JSONEncode({
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v104
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v99
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v101
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v106
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v105
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v107
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v100
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v102
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v103
                    }
                }
            }
        }
    });
    local v109 = v5.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if v108 then
        local l_status_1, l_result_1 = pcall(function()
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v109, v108, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v54.AbuseReport = function(v112, v113)
    local v114 = {
        tags = {}
    };
    for v115, v116 in v113, nil, nil do
        if typeof(v116) ~= "table" then
            v116 = {
                v116
            };
        end;
        local v117 = {};
        for _, v119 in v116, nil, nil do
            table.insert(v117, {
                data = v119
            });
        end;
        v114.tags[v115] = {
            valueList = v117
        };
    end;
    return v112(v5.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", {
        postBody = l_HttpService_0:JSONEncode(v114)
    });
end;
v54.GetTopics = function(v120, v121, v122)
    return v120(string.format("%sv1/topic/get-topics", v5.CATALOG_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            selectTopics = v121, 
            inputQuery = v122, 
            maxResult = v7.MaxTopics
        })
    });
end;
v54.GetInitialTopics = function(v123, v124)
    local v125 = string.format("%sv1/topic/get-topics", v5.CATALOG_URL);
    if v7.MaxItemsInTopicsRequest < #v124 then
        v124 = v8.slice(v124, 1, v7.MaxItemsInTopicsRequest);
    end;
    return v123(v125, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            items = v124, 
            maxResult = v7.MaxTopics
        })
    });
end;
v54.GetCatalogMetadata = function(v126)
    return v126(string.format("%s/v1/catalog/metadata", v5.CATALOG_URL), "GET");
end;
v54.FetchAssetVersionData = function(v127, v128)
    return v127(string.format("%sv1/assets/%s/saved-versions", v13, v128), "GET");
end;
v54.GetLookDetails = function(v129, v130)
    return v129(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v130), "GET");
end;
v54.GetLookDetailsV2 = function(v131, v132)
    return v131(string.format("%slook-api/v2/looks/%s", v5.APIS_URL, v132), "GET");
end;
v54.PurchaseLook = function(v133, v134, v135, v136, v137, v138)
    return v133(string.format("%slook-api/v1/looks/%s/purchase", v5.APIS_URL, v134), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v134, 
            idempotencyKey = v135, 
            expectedPrice = v136, 
            salesLocationId = v137, 
            excludedItems = v138
        })
    });
end;
v54.PurchaseLookV2 = function(v139, v140, v141, v142, v143, v144, v145)
    return v139(string.format("%slook-api/v2/looks/%s/purchase", v5.APIS_URL, v140), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v140, 
            idempotencyKey = v141, 
            expectedPrice = v142, 
            salesLocationId = v143, 
            excludedAssets = v144, 
            excludedBundles = v145
        })
    });
end;
return v54;
