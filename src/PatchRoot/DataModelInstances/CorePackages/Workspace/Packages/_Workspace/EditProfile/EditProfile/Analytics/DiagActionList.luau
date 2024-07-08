local v0 = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics);
local v1 = require(script.Parent.Enums.EventNames);
return {
    [v1.EditProfileOpened] = {
        name = game:DefineFastString("EditProfileOpened", "EditProfileOpened")
    }, 
    [v1.DisplayNameSaved] = {
        name = game:DefineFastString("DisplayNameSaved", "DisplayNameSaved")
    }, 
    [v1.DisplayNameModalOpened] = {
        name = game:DefineFastString("DisplayNameModalOpened", "DisplayNameModalOpened")
    }, 
    [v1.DisplayNameModalLoaded] = {
        name = game:DefineFastString("DisplayNameModalLoaded", "DisplayNameModalLoaded")
    }, 
    [v1.EditUsernameOpened] = {
        name = game:DefineFastString("EditUsernameOpened", "EditUsernameOpened")
    }, 
    [v1.UsernameSaved] = {
        name = game:DefineFastString("UsernameSaved", "UsernameSaved")
    }, 
    [v1.FilteredDisplayName] = {
        name = game:DefineFastString("FilteredDisplayName", "FilteredDisplayName")
    }, 
    [v1.DisplayNameTooShort] = {
        name = game:DefineFastString("DisplayNameTooShort", "DisplayNameTooShort")
    }, 
    [v1.DescriptionPINBlocked] = {
        name = game:DefineFastString("DescriptionPINBlocked", "DescriptionPINBlocked")
    }, 
    [v1.OpenAvatarMarketplace] = {
        name = "OpenAvatarMarketplace", 
        platformSpecificity = v0.Analytics.Enums.PlatformSpecificity.BucketsOnly
    }
};
