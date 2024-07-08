local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v1 = require(script.Parent.Utility);
local v2 = UDim2.new(0.03333333333333333, 0, 0.02962962962962963, 0);
local v3 = UDim2.new(0.020089285714285716, 0, 0.007407407407407408, 0);
local v4 = {
    Root = v1.Create("Frame")({
        Name = "AppContainerRoot", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        ClipsDescendants = true, 
        Parent = l_RobloxGui_0
    })
};
v4.AspectRatioProtector = v1.Create("Frame")({
    Name = "AspectRatioProtector", 
    Size = UDim2.new(1, 0, 1, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    BackgroundTransparency = 1, 
    Parent = v4.Root
});
v4.ActionSafeContainer = v1.Create("Frame")({
    Name = "ActionSafeContainer", 
    Size = UDim2.new(1, 0, 1, 0) - (v2 + v2), 
    Position = UDim2.new(0, 0, 0, 0) + v2, 
    BackgroundTransparency = 1, 
    Parent = v4.AspectRatioProtector
});
v4.TitleSafeContainer = v1.Create("Frame")({
    Name = "TitleSafeContainer", 
    Size = UDim2.new(1, 0, 1, 0) - (v3 + v3), 
    Position = UDim2.new(0, 0, 0, 0) + v3, 
    BackgroundTransparency = 1, 
    Parent = v4.ActionSafeContainer
});
local function v6()
    local v5 = v1.CalculateFit(v4.Root, Vector2.new(16, 9));
    if v5 ~= v4.AspectRatioProtector.Size then
        v4.AspectRatioProtector.Size = v5;
        v4.AspectRatioProtector.AnchorPoint = Vector2.new(0.5, 0.5);
        v4.AspectRatioProtector.Position = UDim2.new(0.5, 0, 0.5, 0);
    end;
end;
v4.Root:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
    v6();
end);
v6();
return v4;
