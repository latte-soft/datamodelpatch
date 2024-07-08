local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
return {
    CreateShadow = function(v1)
        return l_Utility_0.Create("ImageLabel")({
            Name = "Shadow", 
            Image = "rbxasset://textures/ui/Shell/Buttons/Generic9ScaleShadow.png", 
            Size = UDim2.new(1, 3, 1, 3), 
            Position = UDim2.new(0, 0, 0, 0), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(10, 10, 28, 28), 
            BackgroundTransparency = 1, 
            ZIndex = v1 or 1
        });
    end
};
