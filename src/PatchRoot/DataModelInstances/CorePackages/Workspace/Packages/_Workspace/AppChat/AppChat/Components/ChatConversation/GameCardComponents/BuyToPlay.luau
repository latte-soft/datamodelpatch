local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(script.Parent.PlayButton);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.AssetCardComponents.FitFrameVertical);
local v7 = v2.PureComponent:extend("BuyToPlay");
v7.defaultProps = {
    text = "Buy to play", 
    gamePrice = 100
};
v7.render = function(v8)
    return v3.Style.withStyle(function(v9)
        return v2.createElement(v6, {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, 6)
        }, {
            gamePriceFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 16), 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 4)
                }), 
                robuxIcon = v2.createElement("ImageLabel", {
                    Size = UDim2.new(0, 16, 1, 0), 
                    Image = v4.SmallRobuxIcon, 
                    ImageColor3 = v9.Theme.ContextualPrimaryDefault.Color, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }), 
                priceLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, -16, 1, 0), 
                    Text = v8.props.gamePrice, 
                    TextColor3 = v9.Theme.ContextualPrimaryDefault.Color, 
                    TextSize = 16, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = Enum.Font.Gotham, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                })
            }), 
            playButton = v2.createElement(v5, {
                placeId = v8.placeId, 
                text = v8.props.text, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v7;
