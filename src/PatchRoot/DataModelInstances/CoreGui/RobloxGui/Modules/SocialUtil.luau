local v0 = {};
local l_CorePackages_0 = game:GetService("CorePackages");
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_Size100x100_0 = Enum.ThumbnailSize.Size100x100;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
v0.GetPlayerImage = function(v6, v7, v8, _)
    if not v7 then
        v7 = l_Size100x100_0;
    end;
    if not v8 then
        v8 = l_AvatarThumbnail_0;
    end;
    local v10 = 0;
    if not (v8 ~= Enum.ThumbnailType.HeadShot) or v8 == Enum.ThumbnailType.AvatarBust then
        return l_getRbxthumbWithTypeSizeAndOptions_0(v6, l_Constants_0.RbxthumbTypes.AvatarHeadShot, v7 == Enum.ThumbnailSize.Size48x48 and 48 or (v7 == Enum.ThumbnailSize.Size60x60 and 60 or 150));
    elseif v8 == Enum.ThumbnailType.AvatarThumbnail then
        if not (v7 ~= Enum.ThumbnailSize.Size48x48 and v7 ~= Enum.ThumbnailSize.Size60x60) or v7 == Enum.ThumbnailSize.Size100x100 then
            v10 = 100;
        elseif not (v7 ~= Enum.ThumbnailSize.Size150x150 and v7 ~= Enum.ThumbnailSize.Size180x180) or v7 == Enum.ThumbnailSize.Size352x352 then
            v10 = 352;
        elseif v7 == Enum.ThumbnailSize.Size420x420 then
            v10 = 720;
        end;
        return l_getRbxthumbWithTypeSizeAndOptions_0(v6, l_Constants_0.RbxthumbTypes.Avatar, v10);
    else
        return "ThumbnailErrorForSocialUtil.GetPlayerImage";
    end;
end;
return v0;
