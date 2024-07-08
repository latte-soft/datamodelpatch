local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.Components.RenderStep);
local v3 = v1.PureComponent:extend("Spinner");
v3.init = function(v4)
    v4.state = {
        rotation = 0
    };
    v4.speed = 360;
    v4.update = function(v5)
        v4:setState({
            rotation = v4.state.rotation + v5 * v4.speed
        });
    end;
end;
v3.render = function(v6)
    local l_props_0 = v6.props;
    local l_rotation_0 = v6.state.rotation;
    v6.speed = l_props_0.speed or 360;
    return v1.createElement("ImageLabel", {
        Rotation = l_rotation_0, 
        BackgroundTransparency = 1, 
        Size = l_props_0.Size or UDim2.new(0, 100, 0, 100), 
        AnchorPoint = l_props_0.AnchorPoint or Vector2.new(0.5, 0.5), 
        Position = l_props_0.Position or UDim2.new(0.5, 0, 0.5, 0), 
        Image = "rbxasset://textures/ui/Shell/Icons/LoadingSpinner@1080.png", 
        ZIndex = l_props_0.ZIndex or 10, 
        ImageTransparency = l_props_0.ImageTransparency or 0
    }, {
        Render = v1.createElement(v2, {
            name = tick(), 
            priority = Enum.RenderPriority.Input.Value, 
            callback = v6.update
        })
    });
end;
return v3;
