local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.SetShowAgeVerificationOverlay);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == v1.name then
        v3 = v2.Dictionary.join(v3, v4.universeId ~= nil and {
            [v4.universeId] = {
                universeId = v4.universeId, 
                isPlaceEnabledForVoice = v4.isPlaceEnabledForVoice, 
                showVoiceOptInOverlay = v4.showVoiceOptInOverlay, 
                isUniverseEnabledForVoice = v4.isUniverseEnabledForVoice, 
                isVoiceEnabled = v4.isVoiceEnabled, 
                isUniverseEnabledForAvatarVideo = v4.isUniverseEnabledForAvatarVideo, 
                elegibleToSeeVoiceUpsell = v4.elegibleToSeeVoiceUpsell
            }
        } or {});
    end;
    return v3;
end;
