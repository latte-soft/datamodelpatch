local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v3 = require(l_Parent_0.dependencies);
local l_React_0 = v3.React;
local l_LoadableImage_0 = v3.UIBlox.App.Loading.LoadableImage;
local v6 = require(l_Parent_0.type);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v3.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v3.UserLibConstants;
local l_GetFFlagFixToastStyleIssues_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixToastStyleIssues;
local v10 = require(l_context_0.useNotificationCardState);
local function v12(v11)
    if v11 == v6.SENDERThumbnailTypeEnum.Game then
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    elseif v11 == v6.SENDERThumbnailTypeEnum.User then
        return l_UserLibConstants_0.RbxthumbTypes.AvatarHeadShot;
    elseif v11 == v6.SENDERThumbnailTypeEnum.Group then
        return l_UserLibConstants_0.RbxthumbTypes.GroupIcon;
    elseif v11 == v6.SENDERThumbnailTypeEnum.Asset then
        return l_UserLibConstants_0.RbxthumbTypes.Asset;
    elseif v11 == v6.SENDERThumbnailTypeEnum.Bundle then
        return l_UserLibConstants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_UserLibConstants_0.RbxthumbTypes.GameIcon;
    end;
end;
local function _(v13)
    return v13.idType == v6.SENDERThumbnailTypeEnum.User;
end;
return function()
    local v15 = v10("thumbnail");
    if not (v15 ~= nil) or #v15 == 0 then
        return nil;
    else
        local v16 = v15[1];
        if v16 == nil then
            return nil;
        else
            return l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                BorderSizePixel = 0
            }, {
                Thumbnail = l_React_0.createElement(l_LoadableImage_0, {
                    BackgroundTransparency = 1, 
                    Image = l_getRbxthumbWithTypeSizeAndOptions_0(v16.id, v12(v16.idType), 150), 
                    Size = UDim2.fromScale(1, 1), 
                    cornerRadius = if not (v16.idType == v6.SENDERThumbnailTypeEnum.User) then UDim.new(0, 8) else if not l_GetFFlagFixToastStyleIssues_0() then nil else UDim.new(0.5, 0), 
                    showFailedStateWhenLoadingFailed = true, 
                    useShimmerAnimationWhileLoading = true, 
                    ZIndex = 1
                })
            });
        end;
    end;
end;
