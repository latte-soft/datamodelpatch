local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v6 = require(l_Parent_1.Utility.isCallable);
local v7 = require(l_Parent_0.CarouselHeader);
local v8 = require(l_Parent_0.HorizontalCarousel);
local v9 = v3.PureComponent:extend("FreeFlowCarousel");
v9.validateProps = v4.strictInterface({
    identifier = v4.optional(v4.callback), 
    headerText = v4.optional(v4.string), 
    onSeeAll = v4.optional(v4.callback), 
    itemList = v4.array(v4.any), 
    renderItem = v4.callback, 
    itemSize = v4.optional(v4.Vector2), 
    itemPadding = v4.optional(v4.number), 
    carouselMargin = v4.optional(v4.number), 
    innerPadding = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.integer), 
    loadNext = v4.optional(v4.callback), 
    maxNumOfItemsVisible = v4.optional(v4.integer), 
    viewabilityConfigCallbackPairs = v4.optional(v4.array(v4.strictInterface({
        viewabilityConfig = v4.strictInterface({
            minimumViewTime = v4.optional(v4.number), 
            viewAreaCoveragePercentThreshold = v4.optional(v4.number), 
            itemVisiblePercentThreshold = v4.optional(v4.number), 
            waitForInteraction = v4.optional(v4.boolean)
        }), 
        onViewableItemsChanged = v6
    })))
});
v9.defaultProps = {
    headerText = "", 
    innerPadding = 12, 
    itemPadding = 12, 
    carouselMargin = 24
};
v9.render = function(v10)
    local l_innerPadding_0 = v10.props.innerPadding;
    local l_carouselMargin_0 = v10.props.carouselMargin;
    return v3.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Vertical, 
        minimumSize = UDim2.fromScale(1, 0), 
        LayoutOrder = v10.props.layoutOrder, 
        contentPadding = UDim.new(0, l_innerPadding_0), 
        BackgroundTransparency = 1
    }, {
        CarouselHeader = v3.createElement(v7, {
            headerText = v10.props.headerText, 
            onSeeAll = v10.props.onSeeAll, 
            carouselMargin = l_carouselMargin_0, 
            layoutOrder = 1
        }), 
        Carousel = v3.createElement(v8, {
            identifier = v10.props.identifier, 
            itemList = v10.props.itemList, 
            renderItem = v10.props.renderItem, 
            itemSize = v10.props.itemSize, 
            itemPadding = l_innerPadding_0, 
            carouselMargin = l_carouselMargin_0, 
            layoutOrder = 2, 
            loadNext = v10.props.loadNext, 
            maxNumOfItemsVisible = v10.props.maxNumOfItemsVisible, 
            viewabilityConfigCallbackPairs = v10.props.viewabilityConfigCallbackPairs
        })
    });
end;
return v9;
