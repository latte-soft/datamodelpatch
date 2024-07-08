local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v4)
    return {
        robloxLogoTextImageUrl = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png", 
        robloxLogoTextImageSize = UDim2.new(0, 476, 0, 88), 
        robloxLogoTextImagePosition = UDim2.new(0.5, 0, 0.33, 0), 
        buttonContainerPosition = UDim2.new(0.5, 0, 0.66, 0), 
        containerWidth = 846, 
        containerHeight = 300, 
        dividerWidth = 640, 
        dividerHeight = 60, 
        dividerPadding = 3, 
        buttonPadding = v4.Global.Space_75
    };
end;
