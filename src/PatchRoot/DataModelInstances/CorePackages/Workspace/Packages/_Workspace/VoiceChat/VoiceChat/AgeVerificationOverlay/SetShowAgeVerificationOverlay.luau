return require(script:FindFirstAncestor("VoiceChat").Parent.Rodux).makeActionCreator(script.Name, function(v0, v1, v2, v3, v4, v5, v6)
    return {
        universeId = v0, 
        isPlaceEnabledForVoice = v1, 
        isUniverseEnabledForVoice = v2, 
        isVoiceEnabled = v3, 
        isUniverseEnabledForAvatarVideo = v5, 
        showVoiceOptInOverlay = v4, 
        elegibleToSeeVoiceUpsell = v6
    };
end);
