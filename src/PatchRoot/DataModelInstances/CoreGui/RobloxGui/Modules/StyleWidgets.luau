local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Utility);
local v1 = {
    TabSelectionHeight = 6
};
v1.MakeTabSelectionWidget = function(v2)
    return (v0:Create("ImageLabel")({
        Name = "TabSelection", 
        Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(3, 1, 4, 5), 
        Visible = false, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v1.TabSelectionHeight), 
        Position = UDim2.new(0, 0, 1, -v1.TabSelectionHeight), 
        Parent = v2
    }));
end;
return v1;
