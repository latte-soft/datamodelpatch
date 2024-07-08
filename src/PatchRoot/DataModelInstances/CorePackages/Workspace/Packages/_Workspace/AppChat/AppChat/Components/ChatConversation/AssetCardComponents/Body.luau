local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = v1.PureComponent:extend("AssetCard_Co\207\128tent");
v3.defaultProps = {
    cardIcon = nil, 
    cardBodyText = nil, 
    bodyActivated = nil, 
    contentLoadedCallback = nil
};
v3.init = function(v4)
    v4.iconRef = v1.createRef();
end;
v3.render = function(v5)
    return v2.Style.withStyle(function(v6)
        return v1.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 64), 
            BackgroundTransparency = 1, 
            [v1.Event.Activated] = v5.props.bodyActivated
        }, {
            layout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v1.createElement(v2.App.Loading.LoadableImage, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 64, 0, 64), 
                LayoutOrder = 1, 
                Image = v5.props.cardIcon, 
                useShimmerAnimationWhileLoading = true, 
                cornerRadius = UDim.new(0, 4)
            }), 
            Details = not v5.props.isLoading and v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -76, 0, 64), 
                Text = v5.props.cardBodyText, 
                TextColor3 = if not v5.props.shouldUseUnfilteredUI then v6.Theme.TextEmphasis.Color else Color3.new(1, 1, 1), 
                Font = v6.Font.Body.Font, 
                TextSize = 17, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                LayoutOrder = 2
            }, v5.props[v1.Children]) or v1.createElement(v2.App.Loading.ShimmerPanel, {
                Size = UDim2.new(1, -76, 0, 64), 
                cornerRadius = UDim.new(0, 4), 
                LayoutOrder = 2
            })
        });
    end);
end;
return v3;
