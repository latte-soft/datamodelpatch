local l_Packages_0 = game:GetService("CorePackages").Packages;
local v1 = require(l_Packages_0.React);
local v2 = require(l_Packages_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v5 = require(script.Parent.Parent.Hooks.useCameraOn);
local v6 = UDim2.fromScale(1, 1);
return function(v7)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Icon = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = not not v5() and l_Images_0["icons/controls/video"] or l_Images_0["icons/controls/videoOff"], 
            Size = v7.iconSize or v6, 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageTransparency = v7.transparency or 0
        })
    });
end;
