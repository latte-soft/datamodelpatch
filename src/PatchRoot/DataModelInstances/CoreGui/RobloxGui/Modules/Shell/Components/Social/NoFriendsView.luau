local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
return function(v3)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        NoFriendsIcon = v1.createElement("ImageLabel", {
            Size = UDim2.new(0, 296, 0, 259), 
            Position = UDim2.new(0.5, -148, 0, 100), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/FriendsIcon@1080.png"
        }), 
        NoFriendsText = v1.createElement("TextLabel", {
            Size = UDim2.new(0, 440, 0, 72), 
            Position = UDim2.new(0.5, -220, 0, 392), 
            BackgroundTransparency = 1, 
            Font = v2.RegularFont, 
            FontSize = v2.ButtonSize, 
            TextColor3 = v2.WhiteTextColor, 
            Text = v3.text, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true
        })
    });
end;
