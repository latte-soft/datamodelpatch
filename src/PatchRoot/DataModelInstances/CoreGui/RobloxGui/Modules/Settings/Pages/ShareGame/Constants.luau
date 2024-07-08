local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local l_ThumbnailRequest_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.ThumbnailRequest;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v4 = {
    PHONE_PORTRAIT = "PHONE_PORTRAIT", 
    PHONE_LANDSCAPE = "PHONE_LANDSCAPE", 
    TABLET_PORTRAIT = "TABLET_PORTRAIT", 
    TABLET_LANDSCAPE = "TABLET_LANDSCAPE", 
    DESKTOP = "DESKTOP"
};
local v5 = {
    WHITE = Color3.fromRGB(255, 255, 255), 
    GRAY1 = Color3.fromRGB(25, 25, 25), 
    GRAY2 = Color3.fromRGB(117, 117, 117), 
    GRAY3 = Color3.fromRGB(184, 184, 184), 
    GRAY4 = Color3.fromRGB(227, 227, 227), 
    GRAY5 = Color3.fromRGB(242, 242, 242), 
    GRAY6 = Color3.fromRGB(245, 245, 245), 
    RED = Color3.fromRGB(254, 68, 72)
};
local v6 = {
    Color = v5, 
    PresenceColors = {
        [l_UserModel_0.PresenceType.ONLINE] = Color3.fromRGB(0, 162, 255), 
        [l_UserModel_0.PresenceType.IN_GAME] = Color3.fromRGB(2, 183, 87), 
        [l_UserModel_0.PresenceType.IN_STUDIO] = Color3.fromRGB(246, 136, 2), 
        [l_UserModel_0.PresenceType.OFFLINE] = v5.GRAY3
    }, 
    PresenceTextKey = {
        [l_UserModel_0.PresenceType.ONLINE] = "InGame.Presence.Label.Online", 
        [l_UserModel_0.PresenceType.IN_GAME] = "InGame.Presence.Label.InGame", 
        [l_UserModel_0.PresenceType.IN_STUDIO] = "InGame.Presence.Label.InStudio", 
        [l_UserModel_0.PresenceType.OFFLINE] = "InGame.Presence.Label.Offline"
    }, 
    InviteStatus = {
        Success = "Success", 
        Moderated = "Moderated", 
        Failed = "Failed", 
        Pending = "Pending"
    }, 
    DeviceOrientation = {
        PORTRAIT = "PORTRAIT", 
        LANDSCAPE = "LANDSCAPE", 
        INVALID = "INVALID"
    }, 
    PageRoute = {
        NONE = "NONE", 
        SETTINGS_HUB = "SETTINGS_HUB", 
        SHARE_GAME = "SHARE_GAME"
    }, 
    SHARE_GAME_Z_INDEX = 2, 
    DeviceLayout = v4, 
    LayoutSpecific = {
        [v4.PHONE_LANDSCAPE] = {
            HEADER_HEIGHT = 40, 
            PAGE_TITLE_TEXT_SIZE = 23, 
            SEARCH_BOX_MARGIN = 12, 
            PAGE_SIDE_MARGINS = 7, 
            BACK_BUTTON_HEIGHT = 44, 
            BACK_BUTTON_WIDTH = 44, 
            BACK_BUTTON_MODAL_WIDTH = 44, 
            EXTEND_BOTTOM_SIZE = 0, 
            TOAST_HEIGHT = 40
        }, 
        [v4.PHONE_PORTRAIT] = {
            HEADER_HEIGHT = 40, 
            PAGE_TITLE_TEXT_SIZE = 23, 
            SEARCH_BOX_MARGIN = 15, 
            PAGE_SIDE_MARGINS = 5, 
            BACK_BUTTON_HEIGHT = 44, 
            BACK_BUTTON_WIDTH = 44, 
            BACK_BUTTON_MODAL_WIDTH = 44, 
            EXTEND_BOTTOM_SIZE = 0, 
            TOAST_HEIGHT = 40
        }, 
        [v4.TABLET_PORTRAIT] = {
            HEADER_HEIGHT = 40, 
            PAGE_TITLE_TEXT_SIZE = 23, 
            SEARCH_BOX_MARGIN = 15, 
            PAGE_SIDE_MARGINS = 15, 
            BACK_BUTTON_HEIGHT = 44, 
            BACK_BUTTON_WIDTH = 44, 
            BACK_BUTTON_MODAL_WIDTH = 44, 
            EXTEND_BOTTOM_SIZE = 0, 
            TOAST_HEIGHT = 80
        }, 
        [v4.TABLET_LANDSCAPE] = {
            HEADER_HEIGHT = 60, 
            PAGE_TITLE_TEXT_SIZE = 23, 
            SEARCH_BOX_MARGIN = 15, 
            PAGE_SIDE_MARGINS = 5, 
            BACK_BUTTON_HEIGHT = 44, 
            BACK_BUTTON_WIDTH = 44, 
            BACK_BUTTON_MODAL_WIDTH = 44, 
            EXTEND_BOTTOM_SIZE = 68, 
            TOAST_HEIGHT = 80
        }, 
        [v4.DESKTOP] = {
            HEADER_HEIGHT = 60, 
            PAGE_TITLE_TEXT_SIZE = 29, 
            SEARCH_BOX_MARGIN = 0, 
            PAGE_SIDE_MARGINS = 0, 
            BACK_BUTTON_HEIGHT = 44, 
            BACK_BUTTON_WIDTH = 154, 
            BACK_BUTTON_MODAL_WIDTH = 44, 
            EXTEND_BOTTOM_SIZE = 68, 
            TOAST_HEIGHT = 80
        }
    }, 
    Triggers = {
        DeveloperMultiple = "DeveloperMultiple", 
        DeveloperSingle = "DeveloperSingle", 
        GameMenu = "GameMenu"
    }, 
    InviteAvatarThumbnailType = l_Constants_0.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
    InviteAvatarThumbnailSize = l_Constants_0.RbxThumbnailSizes.Size150x150, 
    InviteAvatarRbxthumbType = l_Constants_0.RbxthumbTypes.AvatarHeadShot
};
v6.ThumbnailRequest = {
    InviteToGame = {
        l_ThumbnailRequest_0.fromData(v6.InviteAvatarThumbnailType, v6.InviteAvatarThumbnailSize)
    }
};
return v6;
