local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script:FindFirstAncestor("AppBlox").Parent.Roact);
local v3 = Rect.new(1, 0, 2, 3);
local v4 = v2.Component:extend("LoadingBar");
v4.init = function(v5)
    v5.barRef = v2.createRef();
end;
v4.render = function(v6)
    return v2.createElement("ImageLabel", {
        Image = "rbxasset://textures/ui/LuaApp/9-slice/gr-loading-indicator.png", 
        ScaleType = "Slice", 
        SliceCenter = v3, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v6.props.ZIndex, 
        [v2.Ref] = v6.barRef
    });
end;
v4.didMount = function(v7)
    v7.connection = l_RunService_0.RenderStepped:Connect(function()
        local l_DistributedGameTime_0 = l_Workspace_0.DistributedGameTime;
        local l_current_0 = v7.barRef.current;
        local v10 = 7.5 * (1 - math.cos((2 * l_DistributedGameTime_0) * 5.026548245743669));
        l_current_0.Size = UDim2.new(0, 4 + v10, 0, 4);
        l_current_0.Position = UDim2.new(0.5, (40 * math.cos(l_DistributedGameTime_0 * 5.026548245743669) - v10 / 2) - 2, 0.5, 0);
    end);
end;
v4.willUnmount = function(v11)
    v11.connection:Disconnect();
end;
return v4;
