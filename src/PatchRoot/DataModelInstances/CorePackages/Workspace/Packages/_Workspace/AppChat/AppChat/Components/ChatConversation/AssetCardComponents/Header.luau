local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = v1.PureComponent:extend("AssetCard_Header");
v3.defaultProps = {
    cardTitle = nil
};
v3.render = function(v4)
    return v2.Style.withStyle(function(v5)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            padding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2)
            }), 
            title = v1.createElement("Frame", {
                Size = UDim2.new(1, -6, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                label = not v4.props.isLoading and v1.createElement("TextLabel", {
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1, 
                    TextSize = 23, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v4.props.cardTitle, 
                    TextColor3 = if not v4.props.shouldUseUnfilteredUI then v5.Theme.TextEmphasis.Color else Color3.new(1, 1, 1), 
                    Font = v5.Font.CaptionHeader.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) or v1.createElement(v2.App.Loading.ShimmerPanel, {
                    Size = UDim2.fromScale(0.5, 1), 
                    cornerRadius = UDim.new(0, 4)
                })
            })
        });
    end);
end;
return v3;
