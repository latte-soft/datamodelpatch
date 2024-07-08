local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_1.ImageSet.Images);
local v7 = require(l_Parent_0.ScrollButton);
local v8 = require(l_Parent_2.Utility.isCallable);
local l_BidirectionalFlatList_0 = require(l_Parent_3.VirtualizedList).BidirectionalFlatList;
local v10 = require(l_Parent_3.Promise);
local v11 = require(l_Parent_3.LuauPolyfill);
local v12 = v6["icons/actions/cycleLeft"];
local v13 = v6["icons/actions/cycleRight"];
local v14 = v4.PureComponent:extend("HorizontalCarousel");
v14.validateProps = v5.strictInterface({
    itemList = v5.array(v5.any), 
    renderItem = v5.callback, 
    identifier = v5.optional(v5.callback), 
    itemSize = v5.optional(v5.Vector2), 
    itemPadding = v5.optional(v5.number), 
    carouselMargin = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    loadNext = v5.optional(v5.callback), 
    loadPrevious = v5.optional(v5.callback), 
    animateScrolling = v5.optional(v5.boolean), 
    maxNumOfItemsVisible = v5.optional(v5.integer), 
    onContentSizeChange = v5.optional(v5.callback), 
    viewabilityConfigCallbackPairs = v5.optional(v5.array(v5.strictInterface({
        viewabilityConfig = v5.strictInterface({
            minimumViewTime = v5.optional(v5.number), 
            viewAreaCoveragePercentThreshold = v5.optional(v5.number), 
            itemVisiblePercentThreshold = v5.optional(v5.number), 
            waitForInteraction = v5.optional(v5.boolean)
        }), 
        onViewableItemsChanged = v8
    })))
});
v14.defaultProps = {
    itemSize = Vector2.new(1, 1), 
    itemPadding = 12, 
    maxNumOfItemsVisible = 0
};
local function v22(v15, v16, v17, _)
    if v15 == nil then
        return {};
    elseif not (v17 ~= nil) or v17 == 0 then
        return {
            showLeftButton = false, 
            showRightButton = false
        };
    else
        local l_v15_0 = v15;
        local v20 = true;
        local v21 = true;
        if l_v15_0 <= 1 then
            l_v15_0 = 1;
            v20 = false;
        elseif v17 < l_v15_0 then
            l_v15_0 = v17;
            v21 = false;
        end;
        if v17 < l_v15_0 + v16 then
            v21 = false;
        end;
        return {
            index = l_v15_0, 
            showLeftButton = v20, 
            showRightButton = v21, 
            numOfItems = v17
        };
    end;
end;
local function _(v23)
    if v23 then
        return not not v10.is(v23) and v23 or v10.promisify(v23);
    else
        return nil;
    end;
end;
v14.getDerivedStateFromProps = function(v25, v26)
    local v27 = #v25.itemList;
    if v26.numOfItems ~= v27 then
        return (v22(v26.index, v26.maxNumOfItemsVisible, v27));
    else
        return nil;
    end;
end;
v14.init = function(v28)
    v28.frameRef = v4.createRef();
    v28.listRef = v4.createRef();
    local v29 = {
        anchorIndex = 1
    };
    v28:setState({
        index = 1, 
        hovering = false, 
        showLeftButton = false, 
        showRightButton = false, 
        maxNumOfItemsVisible = v28.props.maxNumOfItemsVisible, 
        numOfItems = 0
    });
    v28.onMouseEnter = function(_, v31)
        if v31.UserInputType == Enum.UserInputType.MouseMovement then
            v28:setState(function(v32)
                return v11.Object.assign(v22(v29.anchorIndex, v32.maxNumOfItemsVisible, v32.numOfItems), {
                    hovering = true
                });
            end);
        end;
    end;
    v28.onMouseLeave = function(_, v34)
        if v34.UserInputType == Enum.UserInputType.MouseMovement then
            v28:setState({
                hovering = false
            });
        end;
    end;
    v28.onResize = function(v35)
        local l_X_0 = v35.AbsoluteSize.X;
        v28:setState(function(_, v38)
            return {
                maxNumOfItemsVisible = math.floor(l_X_0 / (v38.itemSize.X + v38.itemPadding))
            };
        end);
    end;
    v28.onScrollUpdate = function(v39)
        v29 = {
            anchorIndex = math.floor((v39.CanvasPosition.X > 0 and v39.CanvasPosition.X or 0) / (v28.props.itemSize.X + v28.props.itemPadding)) + 1, 
            animationActive = false
        };
    end;
    v28.scrollLeft = function()
        if not v29.animationActive then
            v28:setState(function(v40, v41)
                local v42 = v29.anchorIndex - v40.maxNumOfItemsVisible;
                if v28.listRef then
                    v28.listRef.current:scrollToIndex({
                        animated = true, 
                        index = v42 > 1 and v42 or 1, 
                        viewOffset = v41.itemSize.X + v41.itemPadding
                    });
                end;
                return (v22(v42, v40.maxNumOfItemsVisible, v40.numOfItems));
            end);
            return ;
        else
            return ;
        end;
    end;
    v28.scrollRight = function()
        if not v29.animationActive then
            v28:setState(function(v43, v44)
                local v45 = v29.anchorIndex + v43.maxNumOfItemsVisible;
                if v28.listRef then
                    v28.listRef.current:scrollToIndex({
                        animated = true, 
                        index = v45, 
                        viewOffset = v44.itemSize.X + v44.itemPadding
                    });
                end;
                return (v22(v45, v43.maxNumOfItemsVisible, v43.numOfItems));
            end);
            return ;
        else
            return ;
        end;
    end;
    v28.proxyKeyExtractor = function(v46, v47)
        local l_props_0 = v28.props;
        if not l_props_0.identifier then
            return nil;
        else
            return (l_props_0.identifier(v46, v47));
        end;
    end;
    v28.proxyRenderItem = function(v49)
        return v28.props.renderItem(v49.item);
    end;
    v28.getItemLayout = function(v50, v51)
        local l_props_1 = v28.props;
        local v53 = l_props_1.itemSize.X + (l_props_1.itemPadding or 0);
        return {
            length = if v51 == #v50 then l_props_1.itemSize.X else v53, 
            offset = v53 * (v51 - 1) + (l_props_1.carouselMargin or 0), 
            index = v51
        };
    end;
end;
v14.render = function(v54)
    local l_props_2 = v54.props;
    local l_state_0 = v54.state;
    local l_itemList_0 = l_props_2.itemList;
    local l_itemSize_0 = l_props_2.itemSize;
    local l_itemPadding_0 = l_props_2.itemPadding;
    local l_carouselMargin_0 = l_props_2.carouselMargin;
    local l_layoutOrder_0 = l_props_2.layoutOrder;
    local l_loadNext_0 = l_props_2.loadNext;
    local l_loadPrevious_0 = l_props_2.loadPrevious;
    local v64 = nil;
    if not (not l_state_0.hovering or not l_state_0.showLeftButton) then
        v64 = v4.createElement(v7, {
            icon = v12, 
            callback = v54.scrollLeft
        });
    end;
    local v65 = nil;
    if not (not l_state_0.hovering or not l_state_0.showRightButton) then
        v65 = v4.createElement(v7, {
            icon = v13, 
            callback = v54.scrollRight
        });
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_itemSize_0.Y), 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        [v4.Ref] = v54.frameRef, 
        [v4.Event.InputBegan] = v54.onMouseEnter, 
        [v4.Event.InputEnded] = v54.onMouseLeave, 
        [v4.Change.AbsoluteSize] = v54.onResize
    }, {
        LeftMargin = v4.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollLeftButton = v64
        }), 
        ScrollerCarousel = l_state_0.maxNumOfItemsVisible > 0 and v4.createElement(l_BidirectionalFlatList_0, {
            [v4.Ref] = v54.listRef, 
            data = l_itemList_0, 
            renderItem = v54.proxyRenderItem, 
            keyExtractor = v54.proxyKeyExtractor, 
            horizontal = true, 
            initialScrollIndex = 1, 
            initialNumToRender = 10, 
            windowSize = 5, 
            onScroll = v54.onScrollUpdate, 
            onStartReachedThreshold = 1, 
            onStartReached = if l_loadPrevious_0 then v10.is(l_loadPrevious_0) and l_loadPrevious_0 or v10.promisify(l_loadPrevious_0) else nil, 
            onEndReachedThreshold = 1, 
            onEndReached = if l_loadNext_0 then v10.is(l_loadNext_0) and l_loadNext_0 or v10.promisify(l_loadNext_0) else nil, 
            overrideAutomaticCanvasSize = true, 
            getItemLayout = v54.getItemLayout, 
            viewabilityConfigCallbackPairs = l_props_2.viewabilityConfigCallbackPairs, 
            ItemSeparatorComponent = if not l_itemPadding_0 then nil else function()
                return v4.createFragment({
                    ItemPadding = v4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, l_itemPadding_0)
                    })
                });
            end, 
            showDefaultLoadingIndicators = false, 
            ListHeaderComponent = if not l_carouselMargin_0 then nil else function()
                return v4.createFragment({
                    LeftCarouselMargin = v4.createElement("Frame", {
                        Position = UDim2.fromScale(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_carouselMargin_0, 1, 0)
                    })
                });
            end, 
            ListFooterComponent = if not l_carouselMargin_0 then nil else function()
                return v4.createFragment({
                    RightCarouselMargin = v4.createElement("Frame", {
                        Position = UDim2.fromScale(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_carouselMargin_0, 1, 0)
                    })
                });
            end, 
            contentContainerStyle = {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                ClipsDescendants = false
            }, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0
            }, 
            onContentSizeChange = l_props_2.onContentSizeChange
        }) or nil, 
        RightMargin = v4.createElement("Frame", {
            Position = UDim2.fromScale(1, 0), 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollRightButton = v65
        })
    });
end;
return v14;
