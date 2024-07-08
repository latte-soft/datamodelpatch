local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
local v1 = l_Roact_0.PureComponent:extend("MaskedIcon");
v1.defaultProps = {
    icon = "rbxasset://textures/ui/LuaChat/icons/share-game-thumbnail.png"
};
v1.render = function(v2)
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        button = l_Roact_0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v2.props.icon, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            mask = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaChat/graphic/gr-mask-game-icon-48x48.png", 
                Size = UDim2.new(1, 0, 1, 0)
            })
        })
    });
end;
return v1;
