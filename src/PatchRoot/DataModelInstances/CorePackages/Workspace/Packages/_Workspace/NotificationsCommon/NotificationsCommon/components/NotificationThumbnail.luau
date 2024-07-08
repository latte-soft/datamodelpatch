local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local v7 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v12 = l_Images_0["icons/graphic/logomark-gradient_xlarge"];
local v13 = require(l_context_0.useNotificationCardState);
local function v15(v14)
    if v14 == v7.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v14 == v7.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v14 == v7.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v14 == v7.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v14 == v7.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local function _(v16)
    return v16.idType == v7.SENDERThumbnailTypeEnum.User;
end;
return function()
    local v18 = v13("thumbnail");
    if not (v18 ~= nil) or #v18 == 0 then
        return nil;
    else
        local v19 = v18[1];
        if v19 == nil then
            return nil;
        else
            local v20 = l_useStyle_0();
            if v19.idType == v7.SENDERThumbnailTypeEnum.Icon then
                return l_React_0.createElement("Frame", {
                    BackgroundTransparency = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BackgroundColor3 = v20.Tokens.Global.Color.Black.Color3, 
                    BorderSizePixel = 0
                }, {
                    UICorner = l_React_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    Icon = l_React_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromScale(0.8, 0.8), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        LayoutOrder = 1, 
                        Image = v12, 
                        BackgroundTransparency = 1
                    })
                });
            else
                return l_React_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    BorderSizePixel = 0
                }, {
                    Thumbnail = l_React_0.createElement(l_LoadableImage_0, {
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = v20.Theme.BackgroundDefault.Color, 
                        Image = l_getRbxthumbWithTypeSizeAndOptions_0(v19.id, v15(v19.idType), 150), 
                        Size = UDim2.fromScale(1, 1), 
                        cornerRadius = if not (v19.idType == v7.SENDERThumbnailTypeEnum.User) then UDim.new(0, 8) else UDim.new(0.5, 0), 
                        showFailedStateWhenLoadingFailed = true, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 1
                    })
                });
            end;
        end;
    end;
end;
