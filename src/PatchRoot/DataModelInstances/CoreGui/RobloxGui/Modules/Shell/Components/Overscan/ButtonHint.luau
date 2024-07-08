local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
return function(v3)
    return v1.createElement("ImageLabel", {
        Size = UDim2.new(0, 65, 0, 65), 
        Position = v3.Position, 
        BackgroundTransparency = 1, 
        Image = v3.Image
    }, {
        Text = v1.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 1, 0), 
            Position = UDim2.new(1, 5, 0, -3), 
            BackgroundTransparency = 1, 
            Font = v2.RegularFont, 
            FontSize = v2.ButtonSize, 
            TextColor3 = v2.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = v3.Text
        })
    });
end;
