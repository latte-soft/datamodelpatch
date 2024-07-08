local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local l_withStyle_0 = v2.Style.withStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v7 = v1.PureComponent:extend("ItemTileIcon");
v7.defaultProps = {
    hasRoundedCorners = false
};
v7.render = function(v8)
    local l_Image_0 = v8.props.Image;
    local l_hasRoundedCorners_0 = v8.props.hasRoundedCorners;
    return l_withStyle_0(function(v11)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            LoadableImage = v1.createElement(l_LoadableImage_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = l_Image_0, 
                useShimmerAnimationWhileLoading = true
            }), 
            RoundedCornersOverlay = l_hasRoundedCorners_0 and v1.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["component_assets/circle_17_mask"], 
                ImageColor3 = v11.Theme.BackgroundDefault.Color, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 2
            })
        });
    end);
end;
return v7;
