local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = v1.PureComponent:extend("Checkbox");
v3.defaultProps = {
    activated = false
};
v3.render = function(v4)
    return v2.Style.withStyle(function(v5)
        local v6 = nil;
        local v7 = nil;
        local v8 = nil;
        if not v4.props.activated then
            v6 = "rbxasset://textures/ui/LuaChatV2/actions_checkbox.png";
            v7 = v5.Theme.IconEmphasis.Color;
            v8 = v5.Theme.IconEmphasis.Transparency;
        else
            v6 = "rbxasset://textures/ui/LuaChat/graphic/ic-checkbox-on.png";
            v7 = Color3.fromRGB(255, 255, 255);
            v8 = 0;
        end;
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 64, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            image = v1.createElement("ImageLabel", {
                Size = UDim2.new(0, 20, 0, 20), 
                BackgroundTransparency = 1, 
                Image = v6, 
                ImageColor3 = v7, 
                ImageTransparency = v8
            })
        });
    end);
end;
return v3;
