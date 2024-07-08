local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local _ = v2.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v2.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v6 = v1.PureComponent:extend(script.Name);
v6.render = function(v7)
    return v1.createElement(l_ImageSetLabel_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Transparency = 1, 
        Image = v7.props.image, 
        LayoutOrder = v7.props.layoutOrder or nil, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = l_getIconSizeUDim2_0(v7.props.size)
    });
end;
return v6;
