local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(l_Parent_0.App.Loading.ShimmerPanel);
local v7 = require(l_Parent_0.Core.Text.ImageTextLabel.ImageTextLabel);
local v8 = require(l_Parent_0.Core.Text.EmojiTextLabel.EmojiTextLabel);
local v9 = require(l_Parent_0.Core.Emoji.Enum.Emoji);
local v10 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v11 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v12 = v2.PureComponent:extend("ItemTileName");
v12.validateProps = v3.strictInterface({
    LayoutOrder = v3.optional(v3.integer), 
    maxHeight = v3.intersection(v3.number, v3.numberMin(0)), 
    maxWidth = v3.intersection(v3.number, v3.numberMin(0)), 
    name = v3.optional(v3.string), 
    titleIcon = v3.optional(v3.table), 
    nameTextColor = v3.optional(v3.Color3), 
    hasVerifiedBadge = v3.optional(v3.boolean), 
    useMaxHeight = v3.optional(v3.boolean), 
    fluidSizing = v3.optional(v3.boolean), 
    titleFontStyle = v3.optional(v3.union(v10, v11))
});
v12.render = function(v13)
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_maxHeight_0 = v13.props.maxHeight;
    local l_maxWidth_0 = v13.props.maxWidth;
    local l_name_0 = v13.props.name;
    local l_titleIcon_0 = v13.props.titleIcon;
    local l_useMaxHeight_0 = v13.props.useMaxHeight;
    local l_fluidSizing_0 = v13.props.fluidSizing;
    local l_hasVerifiedBadge_0 = v13.props.hasVerifiedBadge;
    return v4(function(v22)
        local l_Theme_0 = v22.Theme;
        local l_Font_0 = v22.Font;
        local v25 = v13.props.titleFontStyle or l_Font_0.Header2;
        local v26 = if not v25.RelativeSize then v25.FontSize else l_Font_0.BaseSize * v25.RelativeSize;
        if l_name_0 ~= nil then
            local v27 = Vector2.new(l_maxWidth_0, l_maxHeight_0);
            if not l_hasVerifiedBadge_0 then
                local v28 = not not l_titleIcon_0 and l_titleIcon_0.ImageRectSize / v5.ImagesResolutionScale or Vector2.new(0, 0);
                return v2.createElement(v7, {
                    imageProps = not not l_titleIcon_0 and {
                        BackgroundTransparency = 1, 
                        Image = l_titleIcon_0, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, v28.X, 0, v28.Y), 
                        AnchorPoint = Vector2.new(0, 0), 
                        Position = UDim2.new(0, 0, 0, 0)
                    } or nil, 
                    genericTextLabelProps = {
                        fluidSizing = l_fluidSizing_0, 
                        fontStyle = v25, 
                        colorStyle = if not v13.props.nameTextColor then l_Theme_0.TextEmphasis else {
                            Color = v13.props.nameTextColor, 
                            Transparency = 0
                        }, 
                        Text = l_name_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, 
                    frameProps = {
                        BackgroundTransparency = 1, 
                        LayoutOrder = l_LayoutOrder_0
                    }, 
                    maxSize = v27, 
                    padding = 4, 
                    useMaxHeight = l_useMaxHeight_0
                });
            else
                return v2.createElement(v8, {
                    maxSize = v27, 
                    fluidSizing = l_fluidSizing_0, 
                    emoji = v9.Verified, 
                    fontStyle = v25, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    Text = l_name_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    LayoutOrder = l_LayoutOrder_0
                });
            end;
        else
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0, 
                Size = UDim2.new(0, l_maxWidth_0, 0, l_maxHeight_0)
            }, {
                FirstLine = v2.createElement(v6, {
                    Size = UDim2.new(1, 0, 0, v26)
                }), 
                SecondLine = v2.createElement(v6, {
                    Position = UDim2.new(0, 0, 0, v26 + 4), 
                    Size = UDim2.new(0.4, 0, 0, v26)
                })
            });
        end;
    end);
end;
return v12;
