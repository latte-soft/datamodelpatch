local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_ImageSetLabel_0 = require(l_CorePackages_0.UIBlox).Core.ImageSet.ImageSetLabel;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v4)
    return v1.createElement(l_ImageSetLabel_0, {
        Size = UDim2.new(0, 40, 0, 40), 
        LayoutOrder = 1, 
        Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v4.userId), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Fit
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 20)
        })
    });
end;
