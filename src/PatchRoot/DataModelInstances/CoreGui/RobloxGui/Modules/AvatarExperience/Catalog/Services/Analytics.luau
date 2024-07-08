local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.avatarToCatalogButton);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.catalogOpenedFromLandingPage);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.catalogSearch);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickCustomizeAvatarFromItemDetailPage);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickNavigationTab);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickCatalogItem);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.closeItemDetailPage);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.expandItemDetailPage);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.moreMenuToCatalogButton);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.purchaseAsset);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.purchaseBundle);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.premiumUpsellCancelled);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsSchema);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableKeywordAnalyticsForSearch);
local v23 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v24 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local v25 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v26 = {};
local function _(v27)
    local v28 = nil;
    if v27 then
        local v29 = v13()[v27];
        v28 = v29 and v29.Name;
    end;
    return v28 or "";
end;
local function _(v31, v32)
    local v33 = nil;
    if v31 then
        local v34 = v13()[v31];
        if v34 then
            local v35 = v34.Subcategories and v34.Subcategories[v32];
            v33 = v35 and v35.Name;
        end;
    end;
    return v33 or "";
end;
v26.get = function(v37)
    local v38 = v23.get(v37);
    return {
        clickCatalogItem = function(v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50)
            local v51 = nil;
            if v41 then
                local v52 = v13()[v41];
                v51 = v52 and v52.Name;
            end;
            local v53 = v51 or "";
            local v54 = nil;
            if v41 then
                local v55 = v13()[v41];
                if v55 then
                    local v56 = v55.Subcategories and v55.Subcategories[v42];
                    v54 = v56 and v56.Name;
                end;
            end;
            v6(v38.EventStream, v39, v40, v53, v54 or "", v43, v44, v45, v46, v47, v48, v49, v50);
        end, 
        clickCatalogItemFromProfile = function(v57, v58, v59)
            v38.EventStream:sendEventDeferred(v57, "itemDetailReferral", {
                feature = v15.ProfileAnalyticsTag, 
                itemID = v58, 
                itemType = v59, 
                subpage = "peekView", 
                page = "playerProfile"
            });
        end, 
        purchaseAsset = function(v60, v61, v62, v63)
            v10(v38.EventStream, "purchaseAsset", v60, v61, v62, v63);
            v24(v38, "AXPurchaseAsset");
        end, 
        purchaseBundle = function(v64, v65, v66, v67)
            v11(v38.EventStream, "purchaseBundle", v64, v65, v66, v67);
            v24(v38, "AXPurchaseBundle");
        end, 
        sendCounter = function(v68)
            v24(v38, v68);
        end, 
        sendAXCounter = function(v69)
            v24(v38, v25.Counter.PREFIX .. v69);
        end, 
        clickNavigationTab = function(v70, v71)
            local v72 = nil;
            if v70 then
                local v73 = v13()[v70];
                v72 = v73 and v73.Name;
            end;
            local v74 = v72 or "";
            local v75 = nil;
            if v70 then
                local v76 = v13()[v70];
                if v76 then
                    local v77 = v76.Subcategories and v76.Subcategories[v71];
                    v75 = v77 and v77.Name;
                end;
            end;
            v5(v38.EventStream, "clickNavigationTab", v74, v75 or "");
        end, 
        catalogSearch = function(v78, v79, v80, v81, v82, v83)
            v3(v38.EventStream, v78, v79, v83, v80, v81, v82);
        end, 
        clickCustomizeAvatarFromItemDetailPage = function()
            v4(v38.EventStream, "clickCustomizeAvatarFromItemDetailPage");
        end, 
        closeItemDetailPage = function(v84, v85)
            v7(v38.EventStream, "closeItemDetailPage", v84, v85);
        end, 
        popItemDetailPage = function(v86)
            v38.EventStream:sendEventDeferred("itemDetailsPeekView", "popItemDetailPage", {
                feature = v15.AnalyticsTag, 
                itemDetailsPeekViewBackType = tostring(v86)
            });
        end, 
        expandItemDetailPage = function(v87, v88)
            v8(v38.EventStream, "expandItemDetailPage", v87, v88);
        end, 
        avatarToCatalogButton = function()
            v1(v38.EventStream, "avatarToCatalogButton");
        end, 
        moreMenuToCatalogButton = function()
            v9(v38.EventStream, "moreMenuToCatalogButton");
        end, 
        catalogOpenedFromLandingPage = function()
            v2(v38.EventStream, "catalogOpenedFromLandingPage");
        end, 
        premiumUpsellCancelled = function(v89, v90)
            v12(v38.EventStream, v89, v90);
        end, 
        clickPurchaseItemButton = function(v91, v92, v93, v94, v95, v96)
            local l_enumMap_0 = v20.defaultItem.enumMap;
            v38.EventStream:sendEventDeferred("itemDetailPageBottomButtonClick", "marketplaceOrganicFELog", {
                feature = not not v93 and v15.ProfileAnalyticsTag or v15.AnalyticsTag, 
                btn = "PriceButton", 
                itemId = v91, 
                actionType = v21.ActionType.PURCHASE_ATTEMPT, 
                contentType = if not not l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v92] else nil, 
                requestId = v95, 
                subpage = if not v93 then nil else "peekView", 
                page = if not v93 then nil else "playerProfile", 
                fromScreen = v94, 
                keyword = if not v22() then nil else v96
            });
            v38.EventStream:sendEventDeferred("itemDetailPageBottomButtonClick", "buttonClick", {
                feature = not not v93 and v15.ProfileAnalyticsTag or v15.AnalyticsTag, 
                btn = "PriceButton", 
                itemID = v91, 
                itemType = v92, 
                subpage = if not v93 then nil else "peekView", 
                page = if not v93 then nil else "playerProfile", 
                fromScreen = v94
            });
        end, 
        clickCancelPurchaseItem = function(v98, v99)
            v38.EventStream:sendEventDeferred("purchaseAsset", "cancelPurchaseAsset", {
                feature = v15.AnalyticsTag, 
                cstm = "AvatarCustomize", 
                itemID = v98, 
                itemType = v99
            });
        end, 
        clickWearItemAfterPurchase = function(v100, v101, v102)
            v38.EventStream:sendEventDeferred("purchaseAsset", "wearItemAfterPurchase", {
                feature = v15.AnalyticsTag, 
                cstm = "AvatarCustomize", 
                itemID = v100, 
                itemType = v101, 
                checked = v102
            });
        end, 
        shownEnableTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "ShownEnableTwoStepAuth");
            v24(v38, "CatalogPurchaseShownEnableTwoStepAuth");
        end, 
        shownTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "ShownTwoStepAuth");
            v24(v38, "CatalogPurchaseShownTwoStepAuth");
        end, 
        failedShowTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "FailedShowTwoStepAuth");
            v24(v38, "CatalogPurchaseFailedShowTwoStepAuth");
        end, 
        completedTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "CompletedTwoStepAuth");
            v24(v38, "CatalogPurchaseCompletedTwoStepAuth");
        end, 
        invalidatedTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "InvalidatedTwoStepAuth");
            v24(v38, "CatalogPurchaseInvalidatedTwoStepAuth");
        end, 
        abandonedTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "AbandonedTwoStepAuth");
            v24(v38, "CatalogPurchaseAbandonedTwoStepAuth");
        end, 
        loadFailedTwoStepAuthOnPurchase = function()
            v38.EventStream:sendEventDeferred("CatalogPurchaseTwoStep", "LoadFailedTwoStepAuth");
            v24(v38, "CatalogPurchaseLoadFailedTwoStepAuth");
        end, 
        clickCustomizeItemButton = function(v103, v104)
            v38.EventStream:sendEventDeferred("itemDetailPageBottomButtonClick", "buttonClick", {
                feature = v15.AnalyticsTag, 
                itemID = v103, 
                itemType = v104, 
                btn = "Customize", 
                cstm = "Shop"
            });
        end, 
        clickFavoriteItemButton = function(v105, v106, v107)
            v38.EventStream:sendEventDeferred("itemDetailPageBottomButtonClick", "buttonClick", {
                feature = v15.AnalyticsTag, 
                itemID = v105, 
                itemType = v106, 
                btn = "Favorite", 
                cstm = "Shop", 
                checked = v107
            });
        end, 
        clickShareItemButton = function(v108, v109)
            v38.EventStream:sendEventDeferred("itemDetailPageBottomButtonClick", "buttonClick", {
                feature = v15.AnalyticsTag, 
                itemID = v108, 
                itemType = v109, 
                btn = "Share", 
                cstm = "Shop"
            });
        end, 
        applySortAndFilters = function(v110)
            v38.EventStream:sendEventDeferred("SortAndFilters", "buttonClick", {
                feature = v15.AnalyticsTag, 
                btn = "Apply", 
                minPrice = v110.minPrice, 
                maxPrice = v110.maxPrice, 
                sortType = v110.sortType, 
                sortAggregation = v110.sortAggregation, 
                salesTypeFilter = v110.salesTypeFilter, 
                creatorFilter = v110.creatorFilter, 
                includeOffSale = v110.includeOffSale
            });
        end, 
        applyPriceFilter = function(v111, v112)
            v38.EventStream:sendEventDeferred("PriceFilter", "buttonClick", {
                feature = v15.AnalyticsTag, 
                btn = "Apply", 
                PriceLowerBound = v111, 
                PriceUpperBound = v112
            });
        end, 
        profileTryOnAvatarItem = function(v113, v114, v115, v116)
            v38.EventStream:sendEventDeferred(v113, "tryOnAvatarItem", {
                feature = v15.ProfileAnalyticsTag, 
                itemID = v114, 
                itemType = v115, 
                itemSubType = v116, 
                subpage = "peekView", 
                page = "playerProfile"
            });
        end, 
        navigateToProfile = function(v117)
            v24(v38, v117 .. "LuaProfile");
            v38.EventStream:sendEventDeferred(v117, "buttonClick", {
                feature = v15.ProfileAnalyticsTag, 
                btn = "creator", 
                subpage = "peekView", 
                page = "playerProfile"
            });
        end, 
        sendSponsoredItemsImpressions = function(v118, v119)
            if not v118 or #v118 == 0 then
                return ;
            else
                local l_Catalog_0 = v14.AnalyticsContext.Catalog;
                local v121 = {};
                local v122 = {};
                local v123 = {};
                local v124 = {};
                local v125 = {};
                for _, v127 in v118, nil, nil do
                    table.insert(v121, v127.encryptedAdTrackingData);
                    table.insert(v122, 1);
                    table.insert(v123, v127.index + v119);
                    table.insert(v124, v127.id);
                    table.insert(v125, v127.productId or 0);
                end;
                v38.EventStream:sendEventDeferred(l_Catalog_0, "catalogImpressions", {
                    adIds = table.concat(v121, ","), 
                    adFlags = table.concat(v122, ","), 
                    absPositions = table.concat(v123, ","), 
                    assetIds = table.concat(v124, ","), 
                    productIds = table.concat(v125, ",")
                });
                return ;
            end;
        end, 
        selectTopic = function(v128, v129, v130, v131, v132, v133, v134)
            local l_Catalog_1 = v14.AnalyticsContext.Catalog;
            local v136 = nil;
            if v130 then
                local v137 = v13()[v130];
                v136 = v137 and v137.Name;
            end;
            local v138 = v136 or "";
            local v139 = nil;
            if v131 then
                local v140 = v13()[v131];
                if v140 then
                    local v141 = v140.Subcategories and v140.Subcategories[nil];
                    v139 = v141 and v141.Name;
                end;
            end;
            v38.EventStream:sendEventDeferred(l_Catalog_1, "selectCatalogTopic", {
                topic = v128, 
                allTopics = if not v133 then nil else table.concat(v133, ","), 
                previousSelectedTopics = if not v134 then nil else table.concat(v134, ","), 
                rank = v129, 
                category = v138, 
                subcategory = v139 or "", 
                query = v132
            });
        end, 
        deselectTopic = function(v142, v143, v144, v145, v146, v147, v148)
            local l_Catalog_2 = v14.AnalyticsContext.Catalog;
            local v150 = nil;
            if v144 then
                local v151 = v13()[v144];
                v150 = v151 and v151.Name;
            end;
            local v152 = v150 or "";
            local v153 = nil;
            if v145 then
                local v154 = v13()[v145];
                if v154 then
                    local v155 = v154.Subcategories and v154.Subcategories[nil];
                    v153 = v155 and v155.Name;
                end;
            end;
            v38.EventStream:sendEventDeferred(l_Catalog_2, "deselectCatalogTopic", {
                topic = v142, 
                allTopics = if not v147 then nil else table.concat(v147, ","), 
                previousSelectedTopics = if not v148 then nil else table.concat(v148, ","), 
                rank = v143, 
                category = v152, 
                subcategory = v153 or "", 
                query = v146
            });
        end, 
        clearAllTopics = function(v156, v157, v158, v159, v160)
            local l_Catalog_3 = v14.AnalyticsContext.Catalog;
            local v162 = nil;
            if v157 then
                local v163 = v13()[v157];
                v162 = v163 and v163.Name;
            end;
            local v164 = v162 or "";
            local v165 = nil;
            if v158 then
                local v166 = v13()[v158];
                if v166 then
                    local v167 = v166.Subcategories and v166.Subcategories[nil];
                    v165 = v167 and v167.Name;
                end;
            end;
            v38.EventStream:sendEventDeferred(l_Catalog_3, "clearAllTopics", {
                topics = table.concat(v156, ","), 
                allTopics = if not v160 then nil else table.concat(v160, ","), 
                category = v164, 
                subcategory = v165 or "", 
                query = v159
            });
        end, 
        avatarShopEquip = function(v168, v169, v170, v171, v172, v173, v174)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "avatarShopEquip", {
                assetId = v168, 
                assetType = v169, 
                price = v170, 
                shopSwap = v171, 
                ownedItem = v172, 
                entryPoint = v173, 
                numCartItems = v174
            });
        end, 
        characterBundleSwapAction = function(v175, v176)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "characterBundleSwapAction", {
                outfitReset = v175, 
                numCartItems = v176
            });
        end, 
        openItemDetails = function(v177, v178, v179, v180)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "openItemDetails", {
                assetId = v177, 
                assetType = v178, 
                price = v179, 
                entryPoint = v180
            });
        end, 
        openOutfitScreen = function(v181)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "openOutfitScreen", {
                numCartItems = v181
            });
        end, 
        resizeOutfitScreen = function(v182)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "openOutfitScreen", {
                stateChange = v182
            });
        end, 
        avatarShopUnequip = function(v183, v184, v185, v186, v187, v188, v189)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "avatarShopUnequip", {
                assetId = v183, 
                assetType = v184, 
                price = v185, 
                ownedItem = v187, 
                shopSwap = v186, 
                entryPoint = v188, 
                numCartItems = v189
            });
        end, 
        avatarShopBuyItem = function(v190, v191, v192, v193, v194, v195)
            local l_AvatarShop_0 = v14.AnalyticsContext.AvatarShop;
            local l_enumMap_1 = v20.defaultItem.enumMap;
            v38.EventStream:sendEventDeferred(l_AvatarShop_0, "marketplaceOrganicFELog", {
                itemId = v190, 
                actionType = v21.ActionType.PURCHASE_SUCCESS, 
                contentType = if not not l_enumMap_1 and l_enumMap_1.contentType then l_enumMap_1.contentType[v191] else nil, 
                price = v192, 
                entryPoint = v193, 
                requestId = v194, 
                keyword = if not v22() then nil else v195
            });
            v38.EventStream:sendEventDeferred(l_AvatarShop_0, "avatarShopBuyItem", {
                assetId = v190, 
                assetType = v191, 
                price = v192, 
                entryPoint = v193
            });
        end, 
        avatarShopBuyOutfit = function(v198, v199, v200, v201)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "avatarShopBuyOutfit", {
                assetNumber = v198, 
                totalPrice = v199, 
                failed = v200, 
                failureReason = v201
            });
        end, 
        avatarShopLeave = function(v202, v203)
            v38.EventStream:sendEventDeferred(v14.AnalyticsContext.AvatarShop, "avatarShopLeave", {
                numCartItems = v202, 
                targetPage = v203
            });
        end, 
        widgetInteraction = function(v204, v205, v206, v207, v208, v209, v210)
            v38.EventStream:sendEventDeferred("catalog", "widgetApiFELog", {
                request_id = v204, 
                action_type = v205, 
                item_position = v206, 
                widget_position = v207, 
                item_id = v208, 
                item_type = v209, 
                widget_id = v210
            });
        end, 
        widgetInteractionV2 = function(v211, v212)
            v38.EventStream:sendEventDeferred("catalog", "widgetApiFELog", {
                action_type = v212, 
                request_id = v211.requestId, 
                item_position = v211.itemPosition, 
                widget_position = v211.widgetPosition, 
                item_id = v211.itemId, 
                item_type = v211.itemType, 
                widget_id = v211.widgetId, 
                widget_type = v211.widgetType, 
                widget_abs_position = v211.widgetAbsPosition, 
                widget_item_ids = if not v211.widgetItemIds then nil else table.concat(v211.widgetItemIds, ","), 
                kwd = v211.query, 
                organic_result_ids = if not v211.organicResultIds then nil else table.concat(v211.organicResultIds, ","), 
                time_spent_sec = v211.timeSpentSec, 
                asset_ids = if not v211.assetIds then nil else table.concat(v211.assetIds, ","), 
                total_robux = v211.totalRobux
            });
        end
    };
end;
return v26;
