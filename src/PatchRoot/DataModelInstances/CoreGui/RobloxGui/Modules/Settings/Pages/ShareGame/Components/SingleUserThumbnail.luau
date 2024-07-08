local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_COLORS_0 = require(l_Modules_0.Common.Constants).COLORS;
local v4 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_InviteAvatarThumbnailSize_0 = v4.InviteAvatarThumbnailSize;
return function(v8)
    local l_user_0 = v8.user;
    local v10 = nil;
    if l_user_0 then
        v10 = l_getRbxthumbWithTypeSizeAndOptions_0(l_user_0.id, v4.InviteAvatarRbxthumbType, l_Constants_0.RbxThumbnailSizeToNumberSize[l_InviteAvatarThumbnailSize_0]);
    end;
    if not v10 then
        v10 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
    end;
    return v1.createElement("ImageLabel", {
        Size = v8.size, 
        Position = v8.position, 
        AnchorPoint = v8.anchorPoint, 
        Image = v10, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_COLORS_0.FLINT, 
        BackgroundTransparency = v8.backgroundTransparency
    }, {
        Corner = if not v8.square then v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }) else nil
    });
end;
