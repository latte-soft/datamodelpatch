local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(l_Parent_0.App.Loading.ShimmerPanel);
local v7 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v8 = v2.PureComponent:extend("ItemTileFooter");
v8.validateProps = v3.strictInterface({
    priceText = v3.optional(v3.string), 
    isOwned = v3.optional(v3.boolean)
});
v8.render = function(v9)
    local l_priceText_0 = v9.props.priceText;
    local l_isOwned_0 = v9.props.isOwned;
    local v12 = v5["icons/common/robux_small"];
    if l_isOwned_0 then
        v12 = v5["icons/status/item/owned"];
    end;
    return v4(function(v13)
        local l_Font_0 = v13.Font.SubHeader1.Font;
        local v15 = v13.Font.BaseSize * v13.Font.SubHeader1.RelativeSize;
        local l_Theme_0 = v13.Theme;
        local v17 = v12.ImageRectSize / v5.ImagesResolutionScale;
        local v18 = l_priceText_0 and (l_priceText_0 and tonumber(l_priceText_0:sub(1, 1)) or l_isOwned_0);
        local v19 = 0;
        if v18 then
            v19 = v17.X + 4;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Shimmer = not l_priceText_0 and v2.createElement(v6, {
                Size = UDim2.new(0.8, 0, 0, v15)
            }), 
            icon = v18 and v2.createElement(v7.Label, {
                BackgroundTransparency = 1, 
                Image = v12, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                Size = UDim2.new(0, v17.X, 0, v17.Y)
            }), 
            TextLabel = l_priceText_0 and v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(1, -v19, 1, 0), 
                Font = l_Font_0, 
                TextColor3 = l_Theme_0.SecondaryContent.Color, 
                TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
                TextSize = v15, 
                Text = l_priceText_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end);
end;
return v8;
