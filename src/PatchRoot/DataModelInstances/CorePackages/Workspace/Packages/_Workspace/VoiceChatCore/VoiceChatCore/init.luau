local v0 = require(script.CoreVoiceManager);
local v1 = require(script.Analytics);
local v2 = require(script.Constants);
local l_Requests_0 = script.Requests;
local l_Flags_0 = script.Flags;
return {
    ["jest.config"] = script["jest.config"], 
    CoreVoiceManager = v0, 
    Constants = v2, 
    Analytics = v1, 
    Flags = {
        GetFFlagAlwaysSetupVoiceListeners = l_Flags_0.GetFFlagAlwaysSetupVoiceListeners, 
        GetFFlagFixNewAudioAPIEcho = l_Flags_0.GetFFlagFixNewAudioAPIEcho, 
        GetFFlagHideUIWhenVoiceDefaultDisabled = l_Flags_0.GetFFlagHideUIWhenVoiceDefaultDisabled, 
        GetFFlagHideVoiceUIUntilInputExists = l_Flags_0.GetFFlagHideVoiceUIUntilInputExists, 
        GetFFlagOverwriteIsMutedLocally = l_Flags_0.GetFFlagOverwriteIsMutedLocally, 
        GetFFlagReceiveLikelySpeakingUsers = l_Flags_0.GetFFlagReceiveLikelySpeakingUsers, 
        GetFFlagSetActiveWhenConnecting = l_Flags_0.GetFFlagSetActiveWhenConnecting, 
        GetFFlagUpdateDeviceInputPlayerChanged = l_Flags_0.GetFFlagUpdateDeviceInputPlayerChanged, 
        GetFFlagUseAudioInstanceAdded = l_Flags_0.GetFFlagUseAudioInstanceAdded, 
        GetFFlagEnableVoiceSignal = l_Flags_0.GetFFlagEnableVoiceSignal
    }, 
    Requests = {
        GetShowAgeVerificationOverlay = l_Requests_0.GetShowAgeVerificationOverlay
    }
};
