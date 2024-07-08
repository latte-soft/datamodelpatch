local _ = require(script.Parent.SoundEffects);
local _ = require(script.Parent.SoundGroups);
return {
    CallAccept = {
        Name = "CallAccept", 
        SoundId = "rbxassetid://14891715516"
    }, 
    CallDecline = {
        Name = "CallDecline", 
        SoundId = "rbxassetid://14891713083"
    }, 
    HangUp = {
        Name = "HangUp", 
        SoundId = "rbxassetid://14891706508"
    }, 
    Hover = {
        Name = "Hover", 
        SoundId = "rbxassetid://14891703967"
    }, 
    Ringtone = {
        Name = "Ringtone", 
        SoundId = "rbxassetid://14891720242"
    }, 
    Select = {
        Name = "Select", 
        SoundId = "rbxassetid://14891717694"
    }, 
    Swipe = {
        Name = "Swipe", 
        SoundId = "rbxassetid://14951578106"
    }, 
    VRAppLobbySound = {
        Name = "VRAppLobbySound", 
        SoundId = "rbxassetid://15227666815", 
        DefaultPlaybackProperties = {
            FadeOutTime = 3
        }
    }, 
    AppSelect = {
        Name = "AppSelect", 
        SoundId = "rbxassetid://17208396156", 
        DefaultPlaybackProperties = {
            Volume = math.clamp(game:DefineFastInt("AppSelectVolumePercentage", 12), 0, 100) / 100
        }
    }, 
    AppHover1 = {
        Name = "AppHover1", 
        SoundId = "rbxassetid://17208348006", 
        DefaultPlaybackProperties = {
            Volume = math.clamp(game:DefineFastInt("AppHover1VolumePercentage", 7), 0, 100) / 100
        }
    }, 
    NotificationHigh = {
        Name = "NotificationHigh", 
        SoundId = "rbxassetid://17208361335", 
        DefaultPlaybackProperties = {
            Volume = math.clamp(game:DefineFastInt("AppNotificationHighVolumePercentage", 15), 0, 100) / 100
        }
    }, 
    Purchase = {
        Name = "Purchase", 
        SoundId = "rbxassetid://17208380755", 
        DefaultPlaybackProperties = {
            Volume = math.clamp(game:DefineFastInt("PurchaseVolumePercentage", 15), 0, 100) / 100
        }
    }
};
