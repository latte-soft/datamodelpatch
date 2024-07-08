local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = v2.PureComponent:extend("FriendCountLabel");
v4.defaultProps = {
    currentSize = 0, 
    maxSize = 0, 
    LayoutOrder = nil
};
v4.render = function(v5)
    return v3.Style.withStyle(function(v6)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 60, 1, 0), 
            Position = UDim2.new(0, 0, 0, 10), 
            LayoutOrder = v5.props.LayoutOrder
        }, {
            layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            iconImage = v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = "rbxasset://textures/ui/LuaChatV2/ic-add-friends.png", 
                ImageColor3 = v6.Theme.IconEmphasis.Color, 
                ImageTransparency = v6.Theme.IconEmphasis.Transparency, 
                LayoutOrder = 1
            }), 
            friendCount = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = 16, 
                TextColor3 = v6.Theme.TextEmphasis.Color, 
                TextTransparency = v6.Theme.TextEmphasis.Transparency, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v5.props.currentSize .. "/" .. v5.props.maxSize, 
                Font = l_AppFonts_0.default:getDefault(), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v4;
