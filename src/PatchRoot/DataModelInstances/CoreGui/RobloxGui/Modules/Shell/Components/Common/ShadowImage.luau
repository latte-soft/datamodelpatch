local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
return function(v3)
    return v1.createElement("ImageLabel", {
        Name = "Shadow", 
        Image = v2.Images.Shadow, 
        Size = UDim2.new(1, 3, 1, 3), 
        Position = UDim2.new(0, 0, 0, 0), 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 28, 28), 
        BackgroundTransparency = 1, 
        ZIndex = v3.ZIndex or 1
    });
end;
