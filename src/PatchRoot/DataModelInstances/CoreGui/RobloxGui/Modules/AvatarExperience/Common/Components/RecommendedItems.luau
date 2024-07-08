local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v5 = require(l_CorePackages_0.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.AvatarExperienceDeps);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactFitComponents_0 = v8.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_withStyle_0 = v7.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetRecommendedItems);
local v24 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v26 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRoute);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.RecommendedItemCard);
local v30 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetCategoryAndSubcategory);
local v32 = require(l_Modules_0.AvatarExperience.Flags.AEInfiniteScrollRecommendationsIXPTest);
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v34 = v2.PureComponent:extend("RecommendedItems");
v34.validateProps = v3.strictInterface({
    categoryInfo = v3.table, 
    LayoutOrder = v3.optional(v3.number), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    baseRef = v3.optional(v3.table), 
    listFrameRef = v3.optional(v3.table), 
    itemDetailsPeekViewRefs = v3.table, 
    sendShopForMoreAnalytics = v3.callback, 
    itemsOverride = if not v32.isEnabled() then nil else v3.optional(v3.table), 
    screenSize = v3.Vector2, 
    itemType = v3.string, 
    dataStatus = v3.string, 
    items = v3.table, 
    setCatalogIndicies = v3.callback, 
    getRecommendedItems = v3.callback, 
    navigateWithLock = v3.callback, 
    navigation = v3.table, 
    avatarRoute = v27.Interface, 
    catalogAnalytics = v3.table, 
    networking = v3.callback
});
v34.init = function(v35)
    v35.loadableGridViewRef = v2.createRef();
    v35.shopMoreRef = v2.createRef();
    v35.onActivated = function()
        v35.props.setCatalogIndicies(v35.props.categoryInfo, v35.props.catalogAnalytics);
        v35.props.navigateWithLock(function()
            v35.props.navigation.navigate(v20.Catalog);
            v35.props.sendShopForMoreAnalytics();
        end);
    end;
    v35.getRecommendedItems = function()
        if v35.props.itemsOverride ~= nil then
            return ;
        elseif v35.props.categoryInfo.RecommendationsType == v19.RecommendationsType.None then
            return ;
        else
            v35.props.getRecommendedItems(v35.props.networking, v18.getRecommendedAssetTypeIdStringFromCategoryInfo(v35.props.categoryInfo), v35.props.categoryInfo.RecommendationsType, true);
            return ;
        end;
    end;
end;
v34.maybeFetchRecommendedItems = function(v36)
    if v36.props.itemsOverride ~= nil then
        return ;
    else
        if v36.props.dataStatus ~= v26.Fetching then
            v36.getRecommendedItems();
        end;
        return ;
    end;
end;
v34.didMount = function(v37)
    v37:maybeFetchRecommendedItems();
end;
v34.didUpdate = function(v38, v39)
    if v38.props.avatarRoute.current.name == v20.AvatarEditor and v18.getRecommendedKey(v39.categoryInfo) ~= v18.getRecommendedKey(v38.props.categoryInfo) then
        v38:maybeFetchRecommendedItems();
    end;
end;
v34.renderWithProviders = function(v40, v41, v42)
    local l_items_0 = v40.props.items;
    local l_itemType_0 = v40.props.itemType;
    local l_key_0 = v40.props.avatarRoute.current.key;
    local v46 = #l_items_0 == 0;
    local l_LayoutOrder_0 = v40.props.LayoutOrder;
    local l_screenSize_0 = v40.props.screenSize;
    local l_Font_0 = v41.Font;
    local l_Theme_0 = v41.Theme;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v52 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v53 = v18.GridItemHeightGetter(if not v33() then v30.ItemTileType.CatalogItemTile else v30.ItemTileType.RecommendedCatalogItemTile, v52);
    local v54 = v2.createElement(l_Focusable_0[l_Button_0], {
        buttonType = l_ButtonType_0.Secondary, 
        layoutOrder = 3, 
        size = UDim2.new(1, 0, 0, 48), 
        text = v42.shopForMore, 
        onActivated = v40.onActivated, 
        [v2.Ref] = v40.shopMoreRef, 
        NextSelectionUp = not not v46 and v40.props.NextSelectionUp or v40.loadableGridViewRef
    });
    local function v57(v55, v56)
        return v2.createElement(v29, {
            itemId = v55, 
            index = v56, 
            itemType = l_itemType_0, 
            getRecommendedItems = v40.getRecommendedItems, 
            itemDetailsPeekViewRefs = v40.props.itemDetailsPeekViewRefs, 
            resultsListRef = v40.props.listFrameRef
        });
    end;
    local l_NumRecommendedItems_0 = v30.NumRecommendedItems;
    if v40.props.itemsOverride ~= nil then
        v57 = function(v59, v60)
            return v2.createElement(v29, {
                itemId = v59.id, 
                index = v60, 
                itemType = v59.type, 
                getRecommendedItems = v40.getRecommendedItems, 
                itemDetailsPeekViewRefs = v40.props.itemDetailsPeekViewRefs, 
                resultsListRef = v40.props.listFrameRef
            });
        end;
        l_NumRecommendedItems_0 = #l_items_0;
    end;
    return v2.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        width = UDim.new(1, 0), 
        contentPadding = UDim.new(0, 10), 
        margin = l_RoactFitComponents_0.Rect.quad(24, 15, 15, 15), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        restorePreviousChildFocus = true, 
        defaultChild = not not v46 and v40.shopMoreRef or v40.loadableGridViewRef, 
        [v2.Ref] = v40.props.baseRef
    }, {
        YouMayAlsoLikeTextLabel = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            Text = v42.youMayAlsoLike, 
            TextSize = v52, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }), 
        GridView = v2.createElement(v28, {
            LayoutOrder = 2, 
            items = l_items_0, 
            totalNumItems = l_NumRecommendedItems_0, 
            getItemHeight = v53, 
            windowHeight = l_screenSize_0.Y, 
            renderItem = v57, 
            [v2.Ref] = v40.loadableGridViewRef, 
            NextSelectionUp = v40.props.NextSelectionUp, 
            NextSelectionDown = v40.shopMoreRef, 
            NextSelectionRight = l_key_0 and v40.props.itemDetailsPeekViewRefs[l_key_0]
        }), 
        ShopForMoreButton = v54
    });
end;
v34.render = function(v61)
    return l_withStyle_0(function(v62)
        return l_withLocalization_0({
            shopForMore = "Feature.Avatar.Action.ShopForMore", 
            youMayAlsoLike = "Feature.Catalog.Label.Recommendations"
        })(function(v63)
            return v61:renderWithProviders(v62, v63);
        end);
    end);
end;
return v5.connect(function(v64, v65)
    local v66 = v18.getRecommendedKey(v65.categoryInfo);
    local v67 = if not ((v66 ~= v19.RecommendationsType.BodyParts and v66 ~= v19.RecommendationsType.AvatarAnimations) and v66 ~= v19.RecommendationsType.Shoes) or v66 == v19.RecommendationsType.DynamicHeads then v30.ItemType.Bundle else v30.ItemType.Asset;
    local _ = nil;
    return {
        dataStatus = l_PerformFetch_0.GetStatus(v64, v30.RecommendedItemsKey .. tostring(v66)), 
        screenSize = v64.ScreenSize, 
        itemType = v67, 
        items = if v65.itemsOverride then v65.itemsOverride else v64.AvatarExperience.AvatarEditor.RecommendedItems[v66] or {}
    };
end, function(v69)
    return {
        getRecommendedItems = function(v70, v71, v72)
            v69(v23(v70, v71, v72));
        end, 
        setCatalogIndicies = function(v73, v74)
            local v75, v76 = v18.GetCategoryIndexes(v73.MatchingCatalogPage.CategoryKey, v73.MatchingCatalogPage.SubcategoryKey);
            v69(v31(v75, v76, v74));
        end, 
        navigateWithLock = function(v77)
            v69(v24(v77));
        end
    };
end)((v22((l_withNavigation_0((l_RoactServices_0.connect({
    catalogAnalytics = v21, 
    networking = v17
})(v34)))))));
