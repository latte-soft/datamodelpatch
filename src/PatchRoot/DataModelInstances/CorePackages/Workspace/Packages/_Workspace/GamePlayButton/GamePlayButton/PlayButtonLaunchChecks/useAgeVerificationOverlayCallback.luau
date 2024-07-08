local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_IXPService_0 = game:GetService("IXPService");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local v10 = require(l_Parent_0.VoiceChat);
local l_OpenCentralOverlayForVerifiedEnableVoice_0 = v10.AgeVerificationOverlay.OpenCentralOverlayForVerifiedEnableVoice;
local l_ApiPostRecordUserSeenModal_0 = v10.AgeVerificationOverlay.ApiPostRecordUserSeenModal;
local l_SetShowAgeVerificationOverlay_0 = v10.AgeVerificationOverlay.SetShowAgeVerificationOverlay;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetFStringVoiceUpsellLayer_0 = v10.Flags.GetFStringVoiceUpsellLayer;
local l_GetFFlagLogExposureForExperienceUpsell_0 = v10.Flags.GetFFlagLogExposureForExperienceUpsell;
return function(v17, v18, v19)
    local v20 = l_useRoactService_0(l_RoactNetworking_0);
    local v21 = l_useDispatch_0();
    local v23 = l_useAppPolicy_0(function(v22)
        return {
            RequireExplicitVoiceConsent = v22.RequireExplicitVoiceConsent(), 
            showVoiceOptInOverlayEnabled = v22.getShowVoiceUpsellV2()
        };
    end);
    local v25 = l_useSelector_0(function(v24)
        if v24.ShowAgeVerificationOverlay[v17] ~= nil then
            return v24.ShowAgeVerificationOverlay[v17];
        else
            return {};
        end;
    end);
    local l_isPlaceEnabledForVoice_0 = v25.isPlaceEnabledForVoice;
    local l_isUniverseEnabledForVoice_0 = v25.isUniverseEnabledForVoice;
    local l_showVoiceOptInOverlay_0 = v25.showVoiceOptInOverlay;
    local l_elegibleToSeeVoiceUpsell_0 = v25.elegibleToSeeVoiceUpsell;
    return (v4.useCallback(function(v30)
        if not ((not l_GetFFlagLogExposureForExperienceUpsell_0() or not l_isUniverseEnabledForVoice_0) or not l_elegibleToSeeVoiceUpsell_0) then
            local v31 = l_GetFStringVoiceUpsellLayer_0();
            if v31 ~= "" then
                l_IXPService_0:LogUserLayerExposure(v31);
            end;
        end;
        if not l_showVoiceOptInOverlay_0 or not v23.showVoiceOptInOverlayEnabled then
            v19(v30);
            return ;
        else
            v21(l_OpenCentralOverlayForVerifiedEnableVoice_0({
                launchGame = function()
                    v18(v30);
                end, 
                RequireExplicitVoiceConsent = v23.RequireExplicitVoiceConsent, 
                postUserSeenModal = function()
                    return v21(l_ApiPostRecordUserSeenModal_0.Fetch(v20));
                end, 
                setShowVoiceOptIn = function(v32)
                    v21(l_SetShowAgeVerificationOverlay_0(v17, l_isPlaceEnabledForVoice_0, l_isUniverseEnabledForVoice_0, v32.voiceEnabled, v32.showVoiceOptInOverlay));
                end
            }));
            return ;
        end;
    end, {
        v20, 
        v17, 
        l_isPlaceEnabledForVoice_0, 
        l_isUniverseEnabledForVoice_0, 
        l_showVoiceOptInOverlay_0, 
        v23.showVoiceOptInOverlayEnabled, 
        v23.RequireExplicitVoiceConsent, 
        v25.isVoiceEnabled, 
        v18, 
        v19, 
        l_elegibleToSeeVoiceUpsell_0
    }));
end;
