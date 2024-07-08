local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v8 = l_Images_0["icons/imageUnavailable"];
local v9 = l_Images_0["component_assets/circle_17"];
local v10 = Rect.new(8, 8, 9, 9);
local v11 = v1.PureComponent:extend("MenuHeader");
v11.validateProps = v2.strictInterface({
    gameName = v2.string, 
    layoutOrder = v2.integer, 
    height = v2.numberPositive
});
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        local l_Theme_0 = v13.Theme;
        local l_Font_0 = v13.Font;
        local _ = nil;
        return v1.createElement("Frame", {
            LayoutOrder = v12.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v12.props.height)
        }, {
            ContentsFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 20)
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20)
                }), 
                GameIcon = if game.GameId == 0 then v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v9, 
                    SliceCenter = v10, 
                    ScaleType = Enum.ScaleType.Slice, 
                    Size = UDim2.fromOffset(80, 80), 
                    ImageColor3 = v13.Theme.PlaceHolder.Color, 
                    ImageTransparency = v13.Theme.PlaceHolder.Transparency
                }, {
                    PlaceholderIcon = v1.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(44, 44), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Image = v8, 
                        ImageColor3 = v13.Theme.UIDefault.Color, 
                        ImageTransparency = v13.Theme.UIDefault.Transparency, 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                }) else v1.createElement("ImageLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(80, 80), 
                    Image = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(game.GameId, 128, 128)
                }), 
                TextFrame = v1.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -100, 1, 0)
                }, {
                    TextLabel = v1.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, -45), 
                        Position = UDim2.fromOffset(0, 25), 
                        Font = l_Font_0.Header1.Font, 
                        Text = v12.props.gameName, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true
                    })
                })
            }), 
            Divider = v1.createElement("Frame", {
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BackgroundColor3 = l_Theme_0.Divider.Color
            })
        });
    end);
end;
return v4.UNSTABLE_connect2(function(v17)
    return {
        gameName = v17.gameInfo.name
    };
end, nil)(v11);
