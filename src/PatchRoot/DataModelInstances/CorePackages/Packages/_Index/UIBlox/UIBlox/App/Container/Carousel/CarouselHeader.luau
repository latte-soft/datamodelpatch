local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.Text.GetTextSize);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_0.ImageSet.Images);
local l_Core_0 = l_Parent_1.Core;
local v11 = require(l_Core_0.Control.Interactable);
local v12 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Core_0.ImageSet.ImageSetComponent);
local v14 = v9["icons/navigation/pushRight_small"];
local v15 = v3.PureComponent:extend("CarouselHeader");
v15.validateProps = v4.strictInterface({
    headerText = v4.optional(v4.string), 
    onSeeAll = v4.optional(v4.callback), 
    carouselMargin = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number)
});
v15.defaultProps = {
    headerText = "", 
    carouselMargin = 0
};
v15.render = function(v16)
    local l_headerText_0 = v16.props.headerText;
    local l_onSeeAll_0 = v16.props.onSeeAll;
    local l_layoutOrder_0 = v16.props.layoutOrder;
    local l_carouselMargin_0 = v16.props.carouselMargin;
    return v5(function(v21)
        local l_Header1_0 = v21.Font.Header1;
        local v23 = v6(l_headerText_0, l_Header1_0.RelativeSize * v21.Font.BaseSize, l_Header1_0.Font, Vector2.new(10000, 10000));
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, {
            CarouselHeaderButton = v3.createElement(v11, {
                Position = UDim2.fromOffset(l_carouselMargin_0, 0), 
                Size = UDim2.fromOffset((v23.X + 4) + v8(v7.Small), v23.Y), 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                [v3.Event.Activated] = l_onSeeAll_0, 
                onStateChanged = function()
                end
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                HeaderText = v3.createElement(v12, {
                    Text = l_headerText_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 1, 
                    fontStyle = l_Header1_0, 
                    colorStyle = v21.Theme.TextEmphasis
                }), 
                SeeAllArrow = not not l_onSeeAll_0 and v3.createElement(v13.Label, {
                    Size = UDim2.fromOffset(v8(v7.Small), v8(v7.Small)), 
                    BackgroundTransparency = 1, 
                    Image = v14, 
                    ImageColor3 = v21.Theme.TextEmphasis.Color, 
                    ImageTransparency = v21.Theme.TextEmphasis.Transparency, 
                    LayoutOrder = 2
                }) or nil
            })
        });
    end);
end;
return v15;
