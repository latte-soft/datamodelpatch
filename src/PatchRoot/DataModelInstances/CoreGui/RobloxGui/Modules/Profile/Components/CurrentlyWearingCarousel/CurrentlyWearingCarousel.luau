local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_CarouselWidget_0 = v1.CarouselWidget;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_memoize_0 = v1.memoize;
local l_withLocalization_0 = v1.withLocalization;
local l_FormFactor_0 = v1.FormFactor;
local l_FitFrameVertical_0 = v1.RoactFitComponents.FitFrameVertical;
local v11 = require(l_Parent_0.Common.TextKeys);
local v12 = require(l_Parent_0.Common.Constants);
local v13 = require(l_Parent_0.Components.ItemCard);
local v14 = l_Roact_0.PureComponent:extend("CurrentlyWearingCarousel");
v14.validateProps = l_t_0.strictInterface({
    assetIds = l_t_0.table, 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    itemCardWidth = l_t_0.optional(l_t_0.number), 
    fractionalCardsPerRow = l_t_0.optional(l_t_0.number), 
    formFactor = l_t_0.string, 
    getItemClickHandler = l_t_0.callback
});
v14.defaultProps = {
    layoutOrder = 1
};
v14.init = function(v15)
    v15:setState({
        cardWindowStart = 1, 
        cardWindowIndex = 1, 
        cardsInWindow = 0
    });
    v15.scrollingFrameRefCallback = function(v16)
        v15.scrollingFrameRef = v16;
        v15:updateCardWindowBounds();
    end;
    v15.onChangeCanvasPosition = function()
        v15:updateCardWindowBounds();
    end;
end;
v14.updateCardWindowBounds = function(v17)
    local l_props_0 = v17.props;
    local l_state_0 = v17.state;
    if v17.scrollingFrameRef then
        local l_fractionalCardsPerRow_0 = l_props_0.fractionalCardsPerRow;
        local l_X_0 = v17.scrollingFrameRef.CanvasPosition.X;
        local v22 = math.max(1, (math.floor(l_X_0 / (l_props_0.itemCardWidth + v12.CardMargin))));
        local v23 = math.max(0, (math.floor(l_X_0 / (l_props_0.itemCardWidth + v12.CardMargin)))) + 1;
        local v24 = math.ceil(l_fractionalCardsPerRow_0) + 2;
        local v25 = true;
        if v22 == l_state_0.cardWindowStart then
            v25 = true;
            if v23 == l_state_0.cardWindowIndex then
                v25 = true;
                if v24 == l_state_0.cardsInWindow then
                    v25 = l_props_0.itemCardWidth ~= l_state_0.itemCardWidth;
                end;
            end;
        end;
        if v25 then
            v17:setState({
                cardWindowStart = v22, 
                cardWindowIndex = v23, 
                cardsInWindow = v24, 
                itemCardWidth = l_props_0.itemCardWidth
            });
        end;
        return ;
    else
        return ;
    end;
end;
local v28 = l_memoize_0(function(v26)
    return function(v27)
        return (v27 + v12.ItemTileTitleMaxLines * v26) + (v12.ItemTilePadding + v12.ItemTileInnerMargins);
    end;
end);
v14.renderWithProviders = function(v29, v30, v31)
    local l_props_1 = v29.props;
    local l_state_1 = v29.state;
    local l_cardWindowStart_0 = l_state_1.cardWindowStart;
    local l_cardsInWindow_0 = l_state_1.cardsInWindow;
    local l_cardWindowIndex_0 = l_state_1.cardWindowIndex;
    local v37 = v29.props.formFactor == l_FormFactor_0.COMPACT and 24 or 48;
    local l_Font_0 = v31.Font;
    local v39 = v28(l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize)(v29.props.itemCardWidth);
    local v40 = v29.props.assetIds or {};
    local v41 = math.min(#v40, (l_cardWindowStart_0 + l_cardsInWindow_0) - 1);
    local v42 = math.max(0, #v40 * (v12.CardMargin + v29.props.itemCardWidth));
    local v43 = {
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v12.CardMargin), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, (l_cardWindowStart_0 - 1) * (v12.CardMargin + v29.props.itemCardWidth))
        })
    };
    for v44 = l_cardWindowStart_0, v41 do
        local v45 = v40[v44];
        v43[v45] = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v29.props.itemCardWidth, v39), 
            LayoutOrder = v44
        }, {
            ItemCard = l_Roact_0.createElement(v13, {
                assetId = v45, 
                onActivated = v29.props.getItemClickHandler(v45)
            })
        });
    end;
    return l_Roact_0.createElement(l_FitFrameVertical_0, {
        width = UDim.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_1.layoutOrder
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v37)
        }), 
        CarouselWidget = l_Roact_0.createElement(l_CarouselWidget_0, {
            title = v30.headerText, 
            items = v43, 
            index = math.max(1, (math.min(l_cardWindowIndex_0, #v40))), 
            itemCount = #v40, 
            itemWidth = l_props_1.itemCardWidth, 
            itemPadding = v12.CardMargin, 
            carouselMargin = v37, 
            carouselHeight = v39, 
            canvasWidth = v42, 
            onChangeCanvasPosition = v29.onChangeCanvasPosition, 
            onRefCallback = v29.scrollingFrameRefCallback, 
            showSeeAll = false
        })
    });
end;
v14.render = function(v46)
    return l_withLocalization_0({
        headerText = v11.CurrentlyWearing
    })(function(v47)
        return l_withStyle_0(function(v48)
            return v46:renderWithProviders(v47, v48);
        end);
    end);
end;
v14.didUpdate = function(v49, v50)
    local l_props_2 = v49.props;
    if not (l_props_2.itemCardWidth == v50.itemCardWidth) or l_props_2.fractionalCardsPerRow ~= v50.fractionalCardsPerRow then
        v49:updateCardWindowBounds();
    end;
end;
return v14;
