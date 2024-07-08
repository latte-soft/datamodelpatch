local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Utils.Constants);
local v2 = require(l_script_FirstAncestor_0.Utils.ThumbnailRequest);
return {
    USER_CAROUSEL = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, v1.RbxThumbnailSizes.Size100x100)
    }, 
    USER_CAROUSEL_HEAD_SHOT = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.HeadShot, v1.RbxThumbnailSizes.Size150x150)
    }, 
    USER_CAROUSEL_AVATAR_THUMBNAIL = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, v1.RbxThumbnailSizes.Size150x150)
    }, 
    HOME_HEADER_USER = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.HeadShot, v1.RbxThumbnailSizes.Size150x150)
    }, 
    FRIEND_CAROUSEL = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.HeadShot, v1.RbxThumbnailSizes.Size48x48)
    }, 
    CUSTOMIZE_BUTTON = {
        v2.fromData(v1.RbxAvatarThumbnailTypesFromEnum.AvatarThumbnail, v1.RbxThumbnailSizes.Size720x720)
    }
};
