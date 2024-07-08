local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_Parent_0.LuauPolyfill);
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_PostUserOptIn_0 = require(l_Parent_0.VoiceChat).PostUserOptIn;
local v8 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellOverlay);
local v9 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v10 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v15 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v16 = require(l_Parent_0.UIBlox);
local l_Images_0 = v16.App.ImageSet.Images;
local l_ImageSetLabel_0 = v16.Core.ImageSet.ImageSetLabel;
local v19 = require(l_CorePackages_0.Logging);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagFixUpsellVerificationToNavigateToOverlays);
local l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0 = require(l_Parent_0.SharedFlags).GetFFlagAbstractPhoneUpsellFromCentralOverlay;
local v22 = {
    onSuccess = function()
    end, 
    closeUpsell = function()
    end, 
    addPhoneTitleKey = "Feature.VerificationUpsell.Action.AddPhoneVoice", 
    addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBodyVoice"
};
return function(v23)
    local v24 = v15(v22, v23);
    local v25 = l_useDispatch_0();
    local v26 = not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() and function()
        return v25(l_CloseCentralOverlay_0());
    end or nil;
    local v27 = l_useRoactService_0(l_RoactNetworking_0);
    local v28, v29 = v3.useState(false);
    local v30, v31 = v3.useState(false);
    local v33 = l_useAppPolicy_0(function(v32)
        return v32.RequireExplicitVoiceConsent();
    end);
    local v34 = v3.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(40, 40), 
        Image = l_Images_0["icons/status/success_large"], 
        BackgroundTransparency = 1
    });
    local function v36()
        l_PostUserOptIn_0(v27, true, false):andThen(function(v35)
            if not v35 then
                v31(true);
                task.delay(5, function()
                    if not v20 then
                        v24.onSuccess();
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v26 then
                                v26();
                            end;
                            return ;
                        else
                            v24.closeUpsell();
                            return ;
                        end;
                    else
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v26 then
                                v26();
                            end;
                        else
                            v24.closeUpsell();
                        end;
                        v24.onSuccess();
                        return ;
                    end;
                end);
                v19.warn("Error getting UserOptIn. " .. tostring(v35));
                return ;
            else
                v29(true);
                task.delay(3, function()
                    if not v20 then
                        v24.onSuccess();
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v26 then
                                v26();
                            end;
                            return ;
                        else
                            v24.closeUpsell();
                            return ;
                        end;
                    else
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v26 then
                                v26();
                            end;
                        else
                            v24.closeUpsell();
                        end;
                        v24.onSuccess();
                        return ;
                    end;
                end);
                return ;
            end;
        end):catch(function()
            v31(true);
            task.delay(5, function()
                if not v20 then
                    v24.onSuccess();
                    if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                        if v26 then
                            v26();
                        end;
                        return ;
                    else
                        v24.closeUpsell();
                        return ;
                    end;
                else
                    if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                        if v26 then
                            v26();
                        end;
                    else
                        v24.closeUpsell();
                    end;
                    v24.onSuccess();
                    return ;
                end;
            end);
            v19.warn("Exception posting PostUserOptIn");
        end);
    end;
    local v37 = l_useLocalization_0({
        verifySuccessKey = "Feature.VerificationUpsell.Heading.VoiceChatEnabledMobile", 
        voiceErrorKey = "Feature.VerificationUpsell.Heading.VoiceChatError"
    });
    return v3.createElement(v3.Fragment, nil, {
        PhoneVerificationUpsellOverlay = v3.createElement(v8, v10.Dictionary.join(v24, {
            onSuccess = v36, 
            addPhoneTitleKey = v24.addPhoneTitleKey, 
            addPhoneDescriptionKey = v24.addPhoneDescriptionKey, 
            addPhoneButtonKey = "Feature.VerificationUpsell.Action.EnableVoice", 
            addPhoneLegalTextKey = not v33 and "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer" or "Feature.VerificationUpsell.Description.VoiceLegalConsent", 
            alwaysShowAddPhoneLegalText = true, 
            requireAddPhoneLegalTextCheckbox = v33
        })), 
        SuccessOverlay = v28 and v3.createElement(v9, {
            image = v34, 
            text = v37.verifySuccessKey
        }), 
        ErrorOverlay = v30 and v3.createElement(v9, {
            image = v34, 
            text = v37.voiceErrorKey
        })
    });
end;
