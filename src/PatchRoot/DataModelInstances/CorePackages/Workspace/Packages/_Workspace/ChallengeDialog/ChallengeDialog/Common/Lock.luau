local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v2.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v7 = l_Images_0["icons/graphic/lock_xxlarge"];
local v8 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
return function(v9)
    return v1.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v7, 
        LayoutOrder = v9.layoutOrder or nil, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = v8
    });
end;
