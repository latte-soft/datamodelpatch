local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_Images_0 = v2.App.ImageSet.Images;
local l_Colors_0 = v2.App.Style.Colors;
local l_LoadableImage_0 = v2.App.Loading.LoadableImage;
local l_Object_0 = v3.Object;
local v10 = {
    cornerRadius = UDim.new(0.5, 0), 
    isSelected = false, 
    size = UDim2.fromOffset(42, 42), 
    thumbnailSize = 50, 
    thumbnailType = "AvatarBust"
};
return function(v11)
    local v12 = l_Object_0.assign({}, v10, v11);
    local v13 = l_useStyle_0().Theme[not v12.isSelected and "IconDefault" or "IconEmphasis"];
    local function v14()
        return v1.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v13.Color, 
            BackgroundTransparency = v13.Transparency, 
            Image = l_Images_0["icons/common/user"], 
            ImageColor3 = l_Colors_0.Flint, 
            ImageTransparency = 0.5, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1)
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = v12.cornerRadius
            })
        });
    end;
    return v1.createElement("Frame", {
        AnchorPoint = v12.anchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        Position = v12.position, 
        Size = v12.size, 
        Visible = v12.isVisible, 
        ZIndex = v12.zIndex
    }, {
        Thumbnail = v1.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v13.Color, 
            BackgroundTransparency = v13.Transparency, 
            cornerRadius = v12.cornerRadius, 
            Image = string.format("rbxthumb://type=%s&id=%d&w=%d&h=%d", v12.thumbnailType, v12.userId, v12.thumbnailSize, v12.thumbnailSize), 
            Position = UDim2.fromScale(0.5, 0.5), 
            renderOnLoading = v14, 
            renderOnFailed = v14, 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;
