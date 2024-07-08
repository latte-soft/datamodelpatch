local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v2.Style.withStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v7 = l_Images_0["component_assets/circle_9"];
local v8 = v1.PureComponent:extend("NewItemNotification");
v8.validateProps = v3.strictInterface({
    isSelected = v3.optional(v3.boolean)
});
v8.defaultProps = {
    isSelected = false
};
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        local l_Theme_0 = v10.Theme;
        return v1.createElement(l_ImageSetLabel_0, {
            Image = v7, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -3, 0, 6), 
            Size = UDim2.fromOffset(6, 6), 
            ImageColor3 = not not v9.props.isSelected and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color, 
            ImageTransparency = not not v9.props.isSelected and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency, 
            BackgroundTransparency = 1
        });
    end);
end;
return v8;
