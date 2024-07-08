local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v5 = require(l_Parent_0.UIBloxConfig);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_0.Core.Text.GetTextSize);
local v8 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_0.App.Button.Button);
local v10 = require(l_Parent_0.App.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.Core.Layout.Responsive.ResponsiveRow);
local v12 = require(l_Parent_0.Core.Layout.Grid.withGridConfig_DEPRECATED);
local v13 = Vector2.new(math.huge, math.huge);
local v14 = v2.PureComponent:extend("ResponsiveCarousel");
v14.validateProps = v3.strictInterface({
    headerText = v3.union(v3.string, v3.callback), 
    headerHeight = v3.optional(v3.number), 
    headerPadding = v3.optional(v3.number), 
    buttonText = v3.optional(v3.string), 
    onButtonClick = v3.optional(v3.callback), 
    layoutOrder = v3.optional(v3.number), 
    kind = v3.optional(v3.string), 
    scrollable = v3.optional(v3.boolean), 
    clipsDescendants = v3.optional(v3.boolean), 
    selectable = v3.optional(v3.boolean), 
    relativeHeight = v3.optional(v3.UDim), 
    data = v3.optional(v3.any), 
    getItem = v3.optional(v3.callback), 
    getItemCount = v3.optional(v3.callback), 
    renderItem = v3.optional(v3.callback), 
    keyExtractor = v3.optional(v3.callback), 
    getCellColspan = v3.optional(v3.callback), 
    getCellOrder = v3.optional(v3.callback), 
    onSeeAll = v3.optional(v3.callback), 
    itemSize = v3.optional(v3.Vector2), 
    itemList = v3.optional(v3.array(v3.any)), 
    identifier = v3.optional(v3.callback), 
    itemPadding = v3.optional(v3.number), 
    carouselMargin = v3.optional(v3.number), 
    innerPadding = v3.optional(v3.number), 
    loadNext = v3.optional(v3.callback), 
    scrollingFrameRef = v3.optional(v3.table), 
    carouselRef = v3.optional(v3.table)
});
v14.defaultProps = {
    kind = "default", 
    headerHeight = 28, 
    headerPadding = 12
};
v14.init = function(v15)
    v15.itemListCount = function(v16, v17)
        if not v15.props.scrollable then
            return (math.min(#v16, v17.columns));
        else
            return #v16;
        end;
    end;
end;
v14.getButtonSize = function(v18, v19)
    local l_CaptionHeader_0 = v19.Font.CaptionHeader;
    return UDim2.fromOffset(v7(v18.props.buttonText, l_CaptionHeader_0.RelativeSize * v19.Font.BaseSize, l_CaptionHeader_0.Font, v13).X + 16, v18.props.headerHeight);
end;
v14.renderHeader = function(v21, v22)
    return v6(function(v23)
        local v24 = v21.props.onButtonClick or v21.props.onSeeAll;
        local v25 = not not v24 and (v21.props.buttonText and true or false);
        local v26 = if not v25 then UDim2.new() else v21:getButtonSize(v23);
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v21.props.headerHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.layoutOrder
        }, {
            ResponsiveCarouselHeaderPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v22.margin), 
                PaddingRight = UDim.new(0, v22.margin)
            }), 
            ResponsiveCarouselHeaderMaxWidth = if v22.width > 0 then v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v22.width, v21.props.headerHeight)
            }) else nil, 
            ResponsiveCarouselTitle = v2.createElement(v8, {
                Size = UDim2.new(1, -v26.X.Offset - v21.props.headerPadding, 1, 0), 
                Text = v21.props.headerText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = v23.Font.Header1, 
                colorStyle = v23.Theme.TextEmphasis, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ResponsiveCarouselSeeAll = if not v25 then nil else v2.createElement(v9, {
                buttonType = v10.Secondary, 
                position = UDim2.new(1, -v26.X.Offset, 0, 0), 
                size = v26, 
                text = v21.props.buttonText, 
                fontStyle = v23.Font.CaptionHeader, 
                onActivated = v24
            })
        });
    end);
end;
local function _(v27, v28, v29, v30)
    return UDim.new(v30.Scale / v27, ((v28 - 2 * v29) / v27 - v28) * v30.Scale + v30.Offset);
end;
v14.render = function(v32)
    return v12({
        columns = 1, 
        gutter = 0, 
        margin = 0, 
        width = -1, 
        relativeHeight = false
    }, v32.props.kind)(function(v33)
        local v34 = (v32.props.relativeHeight or v32.props.itemSize and UDim.new(0, v32.props.itemSize.Y)) or v33.relativeHeight and v33.relativeHeight;
        local v35;
        if not v34 then
            v35 = UDim.new(0, 0);
        else
            local l_columns_0 = v33.columns;
            local l_gutter_0 = v33.gutter;
            local l_margin_0 = v33.margin;
            local v39 = v34 + UDim.new(0, v32.props.headerHeight + v32.props.headerPadding);
            v35 = UDim.new(v39.Scale / l_columns_0, ((l_gutter_0 - 2 * l_margin_0) / l_columns_0 - l_gutter_0) * v39.Scale + v39.Offset);
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(UDim.new(1, 0), v35), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            AutomaticSize = if not v34 then Enum.AutomaticSize.Y else Enum.AutomaticSize.None, 
            BackgroundTransparency = 1, 
            LayoutOrder = v32.props.layoutOrder, 
            [v2.Ref] = v32.props.carouselRef
        }, {
            v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v32.props.headerPadding)
            }); 
            ResponsiveCarouselHeader = if type(v32.props.headerText) == "function" then v32.props.headerText(v33) else v32:renderHeader({
                layoutOrder = 1, 
                margin = v33.margin, 
                width = v33.width
            }), 
            ResponsiveCarouselRow = v2.createElement(v11, {
                layoutOrder = 2, 
                zIndex = 2, 
                kind = v32.props.kind, 
                scrollable = v32.props.scrollable, 
                clipsDescendants = v32.props.clipsDescendants, 
                selectable = v32.props.selectable, 
                relativeHeight = v34, 
                data = if v32.props.data ~= nil then v32.props.data else v32.props.itemList, 
                getItem = v32.props.getItem, 
                getItemCount = v32.props.getItemCount or if v32.props.data == nil and v32.props.itemList then v32.itemListCount else nil, 
                renderItem = v32.props.renderItem, 
                keyExtractor = v32.props.keyExtractor or v32.props.identifier, 
                getCellColspan = v32.props.getCellColspan, 
                getCellOrder = v32.props.getCellOrder, 
                scrollingFrameRef = if not v5.responsiveBaseRowScrollingFrameRef then nil else v32.props.scrollingFrameRef
            })
        });
    end);
end;
local v42 = v2.forwardRef(function(v40, v41)
    return v2.createElement(v14, l_Object_0.assign({}, v40, {
        carouselRef = v41
    }));
end);
v42.validateProps = v14.validateProps;
return v42;
