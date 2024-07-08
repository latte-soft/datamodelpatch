local l_Color_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Color;
local v1 = {
    Obsidian = l_Color_0.Color3FromHex(1447705), 
    Carbon = l_Color_0.Color3FromHex(1645341), 
    Slate = l_Color_0.Color3FromHex(2303271), 
    Flint = l_Color_0.Color3FromHex(3750717), 
    Graphite = l_Color_0.Color3FromHex(6645352), 
    Pumice = l_Color_0.Color3FromHex(12435134), 
    Black = Color3.fromRGB(0, 0, 0), 
    White = Color3.fromRGB(255, 255, 255), 
    Gray1 = l_Color_0.Color3FromHex(1644825), 
    Gray2 = l_Color_0.Color3FromHex(7697781), 
    Gray3 = l_Color_0.Color3FromHex(12105912), 
    Gray4 = l_Color_0.Color3FromHex(14935011), 
    Gray5 = l_Color_0.Color3FromHex(15921906), 
    Gray6 = l_Color_0.Color3FromHex(16119285), 
    Alabaster = l_Color_0.Color3FromHex(15725301), 
    Smoke = l_Color_0.Color3FromHex(8092797), 
    Ash = l_Color_0.Color3FromHex(14935528), 
    BluePrimary = l_Color_0.Color3FromHex(41727), 
    BlueHover = l_Color_0.Color3FromHex(3323391), 
    BluePressed = l_Color_0.Color3FromHex(29885), 
    BlueDisabled = l_Color_0.Color3FromHex(10083071), 
    Green = l_Color_0.Color3FromHex(45167), 
    Red = l_Color_0.Color3FromHex(16206674), 
    Green2 = Color3.fromRGB(2, 183, 87), 
    Orange = Color3.fromRGB(246, 136, 2), 
    BrownWarning = Color3.fromRGB(162, 89, 1), 
    ChatTopBarBluePressed = l_Color_0.Color3FromHex(29886), 
    ChatTopBarWhite = l_Color_0.Color3FromHex(16777214), 
    ChatTopBarSlate = l_Color_0.Color3FromHex(2303272)
};
setmetatable(v1, {
    __newindex = function(_, _, _)
    end, 
    __index = function(_, v6)
        error("Colors table has no value: " .. tostring(v6));
    end
});
return v1;
