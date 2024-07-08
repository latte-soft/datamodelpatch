local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = Rect.new(8, 8, 9, 9);
local v8 = v4.Component:extend("LoadingBarWithTheme");
v8.init = function(v9)
    v9.barRef = v4.createRef();
end;
v8.render = function(v10)
    local l_ZIndex_0 = v10.props.ZIndex;
    return l_withStyle_0(function(v12)
        return v4.createElement(v6, {
            Image = "LuaApp/buttons/buttonFill", 
            ImageColor3 = v12.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = v12.Theme.SystemPrimaryDefault.Transparency, 
            ScaleType = "Slice", 
            SliceCenter = v7, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = l_ZIndex_0, 
            [v4.Ref] = v10.barRef
        });
    end);
end;
v8.didMount = function(v13)
    v13.connection = l_RunService_0.RenderStepped:Connect(function()
        local l_DistributedGameTime_0 = l_Workspace_0.DistributedGameTime;
        local l_current_0 = v13.barRef.current;
        local v16 = 7.5 * (1 - math.cos((2 * l_DistributedGameTime_0) * 5.026548245743669));
        l_current_0.Size = UDim2.new(0, 4 + v16, 0, 4);
        l_current_0.Position = UDim2.new(0.5, (40 * math.cos(l_DistributedGameTime_0 * 5.026548245743669) - v16 / 2) - 2, 0.5, 0);
    end);
end;
v8.willUnmount = function(v17)
    v17.connection:Disconnect();
end;
return v8;
