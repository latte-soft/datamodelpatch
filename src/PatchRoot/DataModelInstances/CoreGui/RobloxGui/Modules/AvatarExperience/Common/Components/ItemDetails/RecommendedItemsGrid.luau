local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.RoactNavigation);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetRecommendedAssets);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetRecommendedBundles);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v28 = v3.PureComponent:extend("RecommendedItemsGrid");
v28.validateProps = v8.strictInterface({
    itemId = v8.string, 
    itemType = v8.string, 
    itemSubType = v8.optional(v8.string), 
    LayoutOrder = v8.optional(v8.integer), 
    hideItemTitle = v8.optional(v8.boolean), 
    getItemMetrics = v8.optional(v8.callback), 
    onActivatedMountAsFullView = v8.optional(v8.boolean), 
    recommendedItemSummaries = v8.optional(v8.array(v8.strictInterface({
        id = v8.string, 
        type = v8.string, 
        subType = v8.string
    }))), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    resultsListRef = v8.optional(v8.table), 
    forwardRef = v8.optional(v8.table), 
    itemDetailsPeekViewRefs = v8.optional(v8.table), 
    getRecommendedAssets = v8.callback, 
    getRecommendedBundles = v8.callback, 
    sendDetailedCatalogAnalytics = v8.callback, 
    maybePromptForR15Upgrade = v8.callback, 
    navigateDownToAvatarScreen = v8.callback, 
    navigation = v8.table, 
    analytics = v8.table
});
v28.defaultProps = {
    itemType = v12.ItemType.Asset
};
v28.init = function(v29)
    v29.selectRecommendedItem = function(v30, v31, _)
        local l_id_0 = v30.id;
        local l_type_0 = v30.type;
        local l_subType_0 = v30.subType;
        local function v37()
            local v36 = l_wasLastInputGamepad_0();
            v18("RecommendedItemsGrid", v36);
            if v36 then
                v29.props.focusController.captureFocus();
            end;
        end;
        local function v38()
            v29.navigateToRecommendedItem(l_id_0, l_type_0, l_subType_0, v31);
        end;
        local function _()
            return v29.props.maybePromptForR15Upgrade(v29.props.navigation, l_id_0, l_type_0, v37, v38);
        end;
        if not v29.props.maybePromptForR15Upgrade(v29.props.navigation, l_id_0, l_type_0, v37, v38) then
            v29.navigateToRecommendedItem(l_id_0, l_type_0, l_subType_0, v31);
            return ;
        else
            return ;
        end;
    end;
    v29.navigateToRecommendedItem = function(v40, v41, v42, v43)
        if not (not v40 or not v41) and v42 then
            local v44 = true;
            if v29.props.onActivatedMountAsFullView ~= nil then
                v44 = v29.props.onActivatedMountAsFullView;
            end;
            local v45 = v29.props.navigation.getParam("fromProfile");
            local v46 = {
                itemId = v40, 
                itemType = v41, 
                itemSubType = v42, 
                mountAsFullView = v44, 
                mountAnimation = false, 
                itemDetailsPeekViewRefs = v29.props.itemDetailsPeekViewRefs, 
                resultsListRef = v29.props.resultsListRef, 
                isFirstItemDetails = false, 
                fromProfile = v45, 
                showFullWithNoPeekView = v29.props.navigation.getParam("showFullWithNoPeekView")
            };
            if not v45 then
                v29.props.navigation.push(v10.ItemDetails, v46);
            else
                v29.props.navigateDownToAvatarScreen(v10.ItemDetails, v41 .. v40, v46);
            end;
            v29.props.sendDetailedCatalogAnalytics(v11.AnalyticsContext.ItemDetailsRecommendedItem, v29.props.analytics.clickCatalogItem, v40, v41, v43, v12.NumRecommendedItems, v45);
            return ;
        else
            return ;
        end;
    end;
    v29.renderRecommendedItem = function(v47, v48, v49)
        return v3.createElement(v16, {
            itemId = v47.id, 
            itemType = v47.type, 
            itemSubType = v47.subtype, 
            hideItemTitle = v29.props.hideItemTitle, 
            onActivated = function()
                v29.selectRecommendedItem(v47, v48, v49);
            end
        });
    end;
    v29.fetchRecommended = function()
        local l_itemId_0 = v29.props.itemId;
        local l_itemType_0 = v29.props.itemType;
        local l_itemSubType_0 = v29.props.itemSubType;
        if not (not l_itemId_0 or not l_itemType_0) and l_itemSubType_0 then
            if l_itemType_0 == v12.ItemType.Asset then
                v29.props.getRecommendedAssets(l_itemId_0, l_itemSubType_0, v12.NumRecommendedItems, true);
                return ;
            else
                v29.props.getRecommendedBundles(l_itemId_0, l_itemSubType_0, v12.NumRecommendedItems, true);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v28.didMount = function(v53)
    v53.fetchRecommended();
end;
v28.didUpdate = function(v54, v55)
    local l_itemSubType_1 = v55.itemSubType;
    if not (not v54.props.itemSubType or l_itemSubType_1) then
        v54.fetchRecommended();
    end;
end;
v28.render = function(v57)
    if v57.props.itemId == nil then
        return ;
    else
        local l_LayoutOrder_0 = v57.props.LayoutOrder;
        local l_recommendedItemSummaries_0 = v57.props.recommendedItemSummaries;
        return l_withStyle_0(function(v60)
            local l_Font_0 = v60.Font;
            local l_forwardRef_0 = v57.props.forwardRef;
            return v4.withFocusController(function(v63)
                return v3.createElement(l_Focusable_0[v17], {
                    items = l_recommendedItemSummaries_0, 
                    renderItem = function(v64, v65)
                        return v57.renderRecommendedItem(v64, v65, v63);
                    end, 
                    getItemHeight = function(v66)
                        return (v66 + 10) + v13.getRecommendedItemsGridItemTitleHeight(l_Font_0);
                    end, 
                    LayoutOrder = l_LayoutOrder_0, 
                    totalNumItems = v12.NumRecommendedItems, 
                    getItemMetrics = v57.props.getItemMetrics, 
                    NextSelectionUp = v57.props.NextSelectionUp, 
                    NextSelectionDown = v57.props.NextSelectionDown, 
                    NextSelectionLeft = v57.props.NextSelectionLeft, 
                    [v3.Ref] = l_forwardRef_0, 
                    inputBindings = {
                        MoveToActionBar = v4.Input.onBegin(Enum.KeyCode.ButtonR2, function()
                            v63.moveFocusTo(v57.props.NextSelectionDown);
                        end)
                    }
                });
            end);
        end);
    end;
end;
v28 = v6.withNavigation((l_RoactServices_0.connect({
    analytics = v20
})((v7.connect(function(v67, v68)
    if not v26 then
        local v69 = v24(v67.AvatarExperience.Common, v68.itemId, v68.itemType);
        return {
            recommendedItemSummaries = v69 and v69.recommendedItemSummaries
        };
    else
        local v70 = v25(v67.AvatarExperience, v68.itemId, v68.itemType);
        return {
            recommendedItemSummaries = v70 and v70.recommendedItemSummaries
        };
    end;
end, function(v71)
    return {
        getRecommendedAssets = function(v72, v73, v74, v75)
            v71(v14(v72, v73, v74, v75));
        end, 
        getRecommendedBundles = function(v76, v77, v78, v79)
            v71(v15(v76, v77, v78, v79));
        end, 
        sendDetailedCatalogAnalytics = function(v80, v81, v82, v83, v84, v85, v86)
            v71(v21(v80, v81, v82, v83, v84, v85, v86));
        end, 
        maybePromptForR15Upgrade = function(v87, v88, v89, v90, v91)
            return v71(v22(v87, v88, v89, v90, v91, false));
        end, 
        navigateDownToAvatarScreen = function(v92, v93, v94)
            return v71(v19(v92, v93, v94));
        end
    };
end)(v28)))));
return v3.forwardRef(function(v95, v96)
    return v3.createElement(v28, v2.Dictionary.join(v95, {
        forwardRef = v96
    }));
end);
