local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_ShimmerPanel_0 = v2.App.Loading.ShimmerPanel;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local v5 = UDim.new(0, 4);
local v6 = v1.PureComponent:extend("GameBanner");
v6.defaultProps = {
    creator = "By (placeholder)", 
    name = "Placeholder Game", 
    thumbnail = "rbxasset://textures/grid2.png", 
    isLoading = false, 
    shouldShowCreatorName = true
};
v6.render = function(v7)
    return v2.Style.withStyle(function(v8)
        return v1.createElement("Frame", {
            BackgroundColor3 = v8.Theme.BackgroundContrast.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 72)
        }, {
            layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            PlaceThumbnailFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 72, 0, 72), 
                LayoutOrder = 0
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                placeThumbnail = not v7.props.isLoading and v1.createElement(l_LoadableImage_0, {
                    Image = v7.props.thumbnail, 
                    Size = UDim2.new(0, 48, 0, 48), 
                    BackgroundTransparency = 1
                }) or v1.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0, 48, 0, 48), 
                    cornerRadius = v5
                })
            }), 
            ContentFrame = v1.createElement("Frame", {
                Size = UDim2.new(1, -84, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 3)
                }), 
                padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 17)
                }), 
                PlaceTitle = not v7.props.isLoading and v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 20), 
                    TextSize = 20, 
                    TextColor3 = v8.Theme.TextEmphasis.Color, 
                    Font = v8.Font.Header2.Font, 
                    Text = v7.props.name, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 0
                }) or v1.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(1, 0, 0, 20), 
                    cornerRadius = v5
                }), 
                BuilderLabel = not v7.props.isLoading and v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 17), 
                    TextSize = 17, 
                    TextColor3 = v8.Theme.TextDefault.Color, 
                    Font = v8.Font.Body.Font, 
                    Text = v7.props.creator, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Visible = v7.props.shouldShowCreatorName, 
                    LayoutOrder = 1
                }) or v1.createElement(l_ShimmerPanel_0, {
                    Size = UDim2.new(0.6, 0, 0, 17), 
                    cornerRadius = v5
                })
            })
        });
    end);
end;
return v6;
