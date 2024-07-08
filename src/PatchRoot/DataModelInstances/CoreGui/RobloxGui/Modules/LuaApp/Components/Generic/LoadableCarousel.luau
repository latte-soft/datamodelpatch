local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_FreeFlowCarousel_0 = v4.App.Container.Carousel.FreeFlowCarousel;
local l_GAME_CAROUSEL_PADDING_0 = require(l_Modules_0.LuaApp.Constants).GAME_CAROUSEL_PADDING;
local v9 = v2.PureComponent:extend("LoadableCarousel");
v9.validateProps = v3.strictInterface({
    fetchingStatus = v3.string, 
    itemList = v3.array(v3.any), 
    renderItem = v3.callback, 
    identifier = v3.optional(v3.callback), 
    headerText = v3.optional(v3.string), 
    onSeeAll = v3.optional(v3.callback), 
    itemSize = v3.optional(v3.Vector2), 
    itemPadding = v3.optional(v3.number), 
    carouselMargin = v3.optional(v3.number), 
    innerPadding = v3.optional(v3.number), 
    layoutOrder = v3.optional(v3.integer), 
    loadNext = v3.optional(v3.callback), 
    onRetry = v3.optional(v3.callback)
});
v9.defaultProps = {
    carouselMargin = l_GAME_CAROUSEL_PADDING_0
};
v9.init = function(v10)
    v10.renderOnLoading = function()
        return nil;
    end;
end;
v9.render = function(v11)
    local v12 = v2.createElement(l_FreeFlowCarousel_0, {
        identifier = v11.props.identifier, 
        headerText = v11.props.headerText, 
        onSeeAll = v11.props.onSeeAll, 
        itemList = v11.props.itemList, 
        renderItem = v11.props.renderItem, 
        itemSize = v11.props.itemSize, 
        itemPadding = v11.props.itemPadding, 
        carouselMargin = v11.props.carouselMargin, 
        innerPadding = v11.props.innerPadding, 
        layoutOrder = v11.props.layoutOrder, 
        loadNext = v11.props.loadNext
    });
    return v2.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v11.props.fetchingStatus), 
        onRetry = v11.props.onRetry, 
        renderOnLoading = v11.renderOnLoading, 
        renderOnLoaded = function()
            return v12;
        end
    });
end;
return v9;
