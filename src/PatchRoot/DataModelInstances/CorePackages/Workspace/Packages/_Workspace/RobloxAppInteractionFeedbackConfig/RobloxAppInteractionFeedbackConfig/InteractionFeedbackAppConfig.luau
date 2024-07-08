local l_Parent_0 = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent;
local _ = require(l_Parent_0.InteractionFeedback);
local l_Sounds_0 = require(l_Parent_0.SoundManager).Sounds;
local v3 = {
    duration = math.clamp(game:DefineFastInt("HapticClickEffectDuration", 5), 0, 100) / 100, 
    intensity = math.clamp(game:DefineFastInt("HapticClickEffectIntensity", 50), 0, 100) / 100
};
return {
    Default = {
        Press = {
            Sound = l_Sounds_0.AppSelect.Name, 
            Haptic = v3
        }, 
        Hover = {
            Sound = l_Sounds_0.AppHover1.Name, 
            Haptic = v3
        }
    }, 
    PlayExperienceButton = {
        Press = {
            Sound = l_Sounds_0.NotificationHigh.Name, 
            Haptic = v3
        }
    }, 
    MakePurchase = {
        Press = {
            Sound = l_Sounds_0.Purchase.Name, 
            Haptic = v3
        }
    }
};
