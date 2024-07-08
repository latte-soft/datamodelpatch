local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = v1.PureComponent:extend("EmptyConversationPage");
v3.defaultProps = {
    topBarHeight = 0
};
v3.render = function(v4)
    return l_withStyle_0(function(v5)
        return v1.createElement("Frame", {
            BackgroundColor3 = v5.Theme.BackgroundDefault.Color, 
            Size = UDim2.new(1, 0, 1, 0), 
            Transparency = v5.Theme.BackgroundDefault.Transparency
        }, {
            EmptyChatFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -v4.props.topBarHeight)
            }, {
                ChatIcon = v1.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Image = "rbxasset://textures/ui/LuaChat/icons/ic-chat-large.png", 
                    Size = UDim2.new(0, 150, 0, 150)
                })
            })
        });
    end);
end;
return v3;
