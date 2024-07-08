local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_LoadingBar_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).LoadingBar;
local v3 = Color3.fromRGB(41, 41, 41);
return function()
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 160, 0, 160), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v3, 
        BackgroundTransparency = 0.1
    }, {
        v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        v1.createElement(l_LoadingBar_0)
    });
end;
