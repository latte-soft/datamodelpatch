local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_AppUserLayers_0 = v1.AppUserLayers;
local l_t_0 = v1.t;
local v6 = require(l_Parent_0.ProfileContext);
local v7 = require(l_Parent_0.Common.ContextPropsTypes);
local v8 = require(l_Parent_0.Common.ProfileScreens);
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_GridMetrics_0 = v1.UIBlox.App.Grid.GridMetrics;
local l_Dash_0 = v1.Dash;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v14 = require(l_Parent_0.Common.Constants);
local _ = require(l_Parent_0.Reducers.Root);
local _ = require(l_Parent_0.Reducers.Assets);
local v17 = require(l_Parent_0.Analytics);
local v18 = require(l_Parent_0.Flags.SortCurrentlyWearingItemsIXP);
local l_IsVRAppBuild_0 = v1.IsVRAppBuild;
local v20 = require(script.Parent.CurrentlyWearingCarousel);
local v21 = l_Roact_0.PureComponent:extend("CurrentlyWearingCarouselContainer");
local function v30(v22, v23, v24, v25)
    local v26 = v24[v22];
    local v27 = v24[v23];
    local v28 = {
        isOffSale = v26.isOffSale or false, 
        price = (v26.price or v26.lowestResalePrice) or 0, 
        favoriteCount = v26.favoriteCount or 0
    };
    local v29 = {
        isOffSale = v27.isOffSale or false, 
        price = (v27.price or v27.lowestResalePrice) or 0, 
        favoriteCount = v27.favoriteCount or 0
    };
    if v28.isOffSale ~= v29.isOffSale then
        return not v28.isOffSale;
    elseif v28.price == 0 then
        return false;
    elseif v29.price == 0 then
        return true;
    elseif v25 == v18.Variants.FavoriteCount and v28.favoriteCount ~= v29.favoriteCount then
        return v29.favoriteCount < v28.favoriteCount;
    elseif v25 == v18.Variants.PriceDecreasing and v28.price ~= v29.price then
        return v29.price < v28.price;
    elseif v25 == v18.Variants.PriceIncreasing and v28.price ~= v29.price then
        return v28.price < v29.price;
    else
        return tonumber(v22) < tonumber(v23);
    end;
end;
local function v39(v31, v32)
    local v33 = v31.Profile.CurrentlyWearing[v32.profileUserId] or {};
    local l_Assets_0 = v31.Profile.Assets;
    v33 = l_Dash_0.filter(v33, function(v35)
        return l_Assets_0[v35] ~= nil;
    end);
    if (v18.FFlagIsSetupEnabled() and v32.sortCurrentlyWearingItemsVariant ~= nil) and v32.sortCurrentlyWearingItemsVariant ~= v18.Variants.Default then
        table.sort(v33, function(v36, v37)
            return (v30(v36, v37, l_Assets_0, v32.sortCurrentlyWearingItemsVariant));
        end);
    end;
    local v38 = l_GridMetrics_0.getSmallMetrics(v31.ScreenSize.X, v14.CardMargin);
    return {
        assetIds = v33, 
        itemCardWidth = v38.itemWidth, 
        fractionalCardsPerRow = v38.itemsPerRow + 1, 
        formFactor = v31.FormFactor
    };
end;
v21.defaultProps = {
    currentlyWearingCarouselComponent = v20
};
v21.validateProps = l_t_0.strictInterface({
    profileUserId = l_t_0.string, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    currentlyWearingCarouselComponent = l_t_0.any, 
    navigateToLuaAppPages = l_t_0.optional(v7.validateNavigateToLuaAppPages), 
    catalogAnalytics = l_t_0.table, 
    profileAnalytics = l_t_0.table, 
    assetIds = l_t_0.table, 
    itemCardWidth = l_t_0.optional(l_t_0.number), 
    fractionalCardsPerRow = l_t_0.optional(l_t_0.number), 
    formFactor = l_t_0.string, 
    sortCurrentlyWearingItemsVariant = l_t_0.optional(l_t_0.string)
});
v21.init = function(v40)
    v40.itemClickHandlers = {};
    v40.getItemClickHandler = function(v41)
        if not l_IsVRAppBuild_0() then
            if not v40.itemClickHandlers[v41] then
                v40.itemClickHandlers[v41] = function()
                    local l_props_0 = v40.props;
                    local l_v41_0 = v41;
                    l_props_0.navigateToLuaAppPages[v8.ItemDetails](l_v41_0, "Asset", false);
                    l_props_0.profileAnalytics:viewCatalogItem();
                    l_props_0.catalogAnalytics.clickCatalogItemFromProfile(v14.AnalyticsContext.PlayerProfile, l_v41_0, "Asset");
                end;
            end;
            return v40.itemClickHandlers[v41];
        else
            return nil;
        end;
    end;
end;
v21.render = function(v44)
    local l_props_1 = v44.props;
    return l_Roact_0.createElement(l_props_1.currentlyWearingCarouselComponent, {
        layoutOrder = l_props_1.layoutOrder, 
        assetIds = l_props_1.assetIds, 
        itemCardWidth = l_props_1.itemCardWidth, 
        fractionalCardsPerRow = l_props_1.fractionalCardsPerRow, 
        formFactor = l_props_1.formFactor, 
        getItemClickHandler = v44.getItemClickHandler
    });
end;
return {
    Container = l_compose_0(l_RoactAppExperiment_0.connectUserLayer({
        l_AppUserLayers_0.SocialProfilePeekViewLayer
    }, function(v46)
        return {
            sortCurrentlyWearingItemsVariant = if not v18.FFlagIsSetupEnabled() then nil else v18.getExperimentVariant(v46)
        };
    end), l_RoactRodux_0.connect(v39, nil), v6.connect(function(v47)
        return {
            navigateToLuaAppPages = v47.navigateToLuaAppPages, 
            catalogAnalytics = v47.catalogAnalytics
        };
    end), v17.connect(function(v48)
        return {
            profileAnalytics = v48
        };
    end))(v21), 
    mapStateToProps = v39
};
