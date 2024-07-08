local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAvatarHeadshotLocalIconBackgroundFix);
local v12 = v2.PureComponent:extend("AvatarHeadshotLocalIcon");
v12.defaultProps = {
    Size = 36, 
    LayoutOrder = 1
};
v12.validateProps = v3.strictInterface({
    Size = v3.optional(v3.number), 
    ZIndex = v3.number, 
    LayoutOrder = v3.optional(v3.integer), 
    localUserId = v3.string
});
v12.init = function(v13)
    v13.getLoadingImage = function()
        return v2.createElement(l_ShimmerPanel_0, {
            cornerRadius = UDim.new(0.5, 0), 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
end;
v12.render = function(v14)
    return l_withStyle_0(function(v15)
        return v14:renderWithProviders(v15);
    end);
end;
v12.makeLoadableImage = function(v16)
    if not (v16.props.localUserId ~= nil) or v16.props.localUserId == "" then
        return nil;
    else
        return v2.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=%d&h=%d&filters=circular", v16.props.localUserId, 48, 48), 
            useShimmerAnimationWhileLoading = true, 
            cornerRadius = UDim.new(0.5, 0), 
            shouldHandleReloads = true
        });
    end;
end;
v12.renderWithProviders = function(v17, v18)
    local l_Theme_0 = v18.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v17.props.Size, v17.props.Size), 
        ZIndex = v17.props.ZIndex, 
        LayoutOrder = v17.props.LayoutOrder
    }, {
        Background = v2.createElement("Frame", {
            ZIndex = v17.props.ZIndex, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = if not v11 then nil else l_Theme_0.PlaceHolder.Transparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            LoadableImage = v17:makeLoadableImage()
        })
    });
end;
return v5.connect(function(v20)
    return {
        localUserId = v20.LocalUserId
    };
end)(v12);
