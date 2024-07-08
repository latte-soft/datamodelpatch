local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_NotificationService_0 = game:GetService("NotificationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = v3.PureComponent:extend("DraggableTile");
v11.validateProps = v4.strictInterface({
    thumbnail = v4.string, 
    ZIndex = v4.number, 
    isSelectedByTap = v4.boolean, 
    imageTransparency = v4.number, 
    AnchorPoint = v4.Vector2, 
    Position = v4.UDim2, 
    Size = v4.UDim2, 
    assetTypeId = v4.string
});
v11.defaultProps = {
    isSelectedByTap = false, 
    ZIndex = 1, 
    imageTransparency = 0, 
    AnchorPoint = Vector2.new(0, 0), 
    Position = UDim2.fromScale(0, 0), 
    Size = UDim2.fromScale(1, 1)
};
local v12 = UDim.new(0, 10);
v11.init = function(v13)
    v13:setState({
        style = string.lower(l_NotificationService_0.SelectedTheme)
    });
    v13.updateTheme = function()
        v13:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end;
end;
v11.render = function(v14)
    return l_withStyle_0(function(v15)
        local l_Theme_0 = v15.Theme;
        local v17 = nil;
        if v10.GradientBackgroundAssetTypeIds[v14.props.assetTypeId] or v14.props.assetTypeId == v10.AssetTypeIdStrings.HairAccessory then
            v17 = v14.state.style == "dark" and "rbxasset://textures/ui/AvatarExperience/glowLight.png" or "rbxasset://textures/ui/AvatarExperience/glowDark.png";
        end;
        return v3.createElement("Frame", {
            Size = v14.props.Size, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            ZIndex = v14.props.ZIndex, 
            AnchorPoint = v14.props.AnchorPoint, 
            Position = v14.props.Position
        }, {
            BackgroundImage = v3.createElement(l_ImageSetLabel_0, {
                Image = v17, 
                ImageTransparency = v14.props.imageTransparency, 
                BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 0
            }, {
                Image = v3.createElement(l_LoadableImage_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v14.props.thumbnail, 
                    ImageTransparency = v14.props.imageTransparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = 0, 
                    cornerRadius = v12, 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = v12
                })
            }), 
            ThemeConnection = v3.createElement(l_ExternalEventConnection_0, {
                event = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"), 
                callback = v14.updateTheme
            }), 
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v12
            })
        });
    end);
end;
return v11;
