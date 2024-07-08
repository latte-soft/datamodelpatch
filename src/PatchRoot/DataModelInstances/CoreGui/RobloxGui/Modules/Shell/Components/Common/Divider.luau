local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
return function(v3)
    local v4 = v3.Color or v2.PageDivideColor;
    local l_DividerLength_0 = v3.DividerLength;
    local v6 = v3.DividerWidth or UDim.new(0, 2);
    local l_Position_0 = v3.Position;
    local _ = nil;
    return v1.createElement("Frame", {
        BackgroundColor3 = v4, 
        BorderSizePixel = 0, 
        Size = if v3.FillDirection == Enum.FillDirection.Horizontal then UDim2.new(l_DividerLength_0.Scale, l_DividerLength_0.Offset, v6.Scale, v6.Offset) else UDim2.new(v6.Scale, v6.Offset, l_DividerLength_0.Scale, l_DividerLength_0.Offset), 
        Position = l_Position_0
    });
end;
