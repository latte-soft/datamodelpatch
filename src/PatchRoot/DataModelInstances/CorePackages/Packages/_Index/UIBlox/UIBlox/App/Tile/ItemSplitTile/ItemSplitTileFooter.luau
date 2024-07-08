local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v10 = require(l_Parent_0.ImageSet.getIconSizeUDim2);
local v11 = v3.PureComponent:extend("ItemSplitTileFooter");
v11.validateProps = v4.strictInterface({
    priceText = v4.optional(v4.string), 
    isOwned = v4.optional(v4.boolean), 
    layoutOrder = v4.optional(v4.number)
});
v11.render = function(v12)
    local l_priceText_0 = v12.props.priceText;
    local l_isOwned_0 = v12.props.isOwned;
    local v15 = if not l_isOwned_0 then v6["icons/common/robux_small"] else v6["icons/status/item/owned"];
    return v5(function(v16)
        local l_Font_0 = v16.Font.Body.Font;
        local v18 = v16.Font.BaseSize * v16.Font.Body.RelativeSize;
        local l_Theme_0 = v16.Theme;
        local v20 = l_priceText_0 and ((not not l_priceText_0 and tonumber(l_priceText_0:sub(1, 1)) or l_priceText_0 == "--") or l_isOwned_0);
        local v21 = v10(v9.Small);
        local v22 = not v20 and 0 or v21.Width.Offset + 4;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v18), 
            BackgroundTransparency = 1, 
            LayoutOrder = v12.props.layoutOrder
        }, {
            Shimmer = if l_priceText_0 then nil else v3.createElement(v7, {
                Size = UDim2.new(0.8, 0, 0, v18)
            }), 
            Icon = v20 and v3.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                Image = v15, 
                ImageColor3 = l_Theme_0.TextMuted.Color, 
                ImageTransparency = l_Theme_0.TextMuted.Transparency, 
                Size = v21, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            TextLabel = l_priceText_0 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, v22, 0, 0), 
                Size = UDim2.new(1, -v22, 1, 0), 
                Font = l_Font_0, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextSize = v18, 
                Text = l_priceText_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v11;
