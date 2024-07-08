local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_Container_0 = require(l_Parent_0.Components.ProfileUserDetails).Container;
local l_UserLib_0 = v1.UserLib;
local l_Constants_0 = l_UserLib_0.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = l_UserLib_0.Utils.getRbxthumbWithTypeSizeAndOptions;
local v13 = l_Roact_0.PureComponent:extend("AvatarImage");
v13.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.number), 
    profileUserId = l_t_0.string, 
    width = l_t_0.number, 
    padding = l_t_0.optional(l_t_0.number), 
    navigation = l_t_0.optional(l_t_0.table), 
    ZIndex = l_t_0.optional(l_t_0.number)
});
v13.defaultProps = {
    padding = 24
};
v13.renderWithProviders = function(v14, v15)
    local l_props_0 = v14.props;
    local l_profileUserId_0 = l_props_0.profileUserId;
    return l_Roact_0.createElement("Frame", {
        Size = v14:getImageSize(l_props_0.width), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.layoutOrder, 
        ZIndex = l_props_0.ZIndex
    }, {
        Background = l_Roact_0.createElement(l_ImageSetLabel_0, {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = l_Images_0[v15.Theme.PlayerBackgroundDefault.Image], 
            ZIndex = 1
        }), 
        AvatarThumbnail = l_Roact_0.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -96, 1, -96), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = l_getRbxthumbWithTypeSizeAndOptions_0(l_profileUserId_0, l_Constants_0.RbxthumbTypes.Avatar, 720), 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        }), 
        TopGradient = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 70), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        UserDetails = l_Roact_0.createElement(l_Container_0, {
            layoutOrder = 1, 
            zIndex = 4, 
            profileUserId = l_profileUserId_0, 
            padding = l_props_0.padding, 
            navigation = l_props_0.navigation
        })
    });
end;
v13.getImageSize = function(_, v19)
    return UDim2.fromOffset(v19, v19);
end;
v13.render = function(v20)
    return l_withStyle_0(function(v21)
        return v20:renderWithProviders(v21);
    end);
end;
return v13;
