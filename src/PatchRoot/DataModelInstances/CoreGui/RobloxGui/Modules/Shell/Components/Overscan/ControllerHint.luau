local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
local v3 = require(l_Modules_0.Shell.LocalizedStrings);
return function(_)
    return v1.createElement("ImageLabel", {
        Size = UDim2.new(0, 599, 0, 404), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Controller@1080.png"
    }, {
        Line = v1.createElement("Frame", {
            Size = UDim2.new(0, 240, 0, 1), 
            Position = UDim2.new(0, 437, 0, 220), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BorderSizePixel = 0
        }, {
            InputHint = v1.createElement("TextLabel", {
                Size = UDim2.new(0, 0, 0, 0), 
                Position = UDim2.new(1, 3, 0, -1), 
                BackgroundTransparency = 1, 
                Font = v2.RegularFont, 
                FontSize = v2.ButtonSize, 
                TextColor3 = v2.WhiteTextColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v3:LocalizedString("ResizeScreenInputHint")
            })
        })
    });
end;
