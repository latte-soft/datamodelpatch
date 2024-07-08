local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v5 = require(script.Parent.IDVWithQRCodeUpsell);
local v6 = require(l_script_FirstAncestor_0.Common.IDVApiProvider);
local v7 = require(l_script_FirstAncestor_0.Flags.GetFStringBiometricPrivacyPolicyLink);
local v8 = require(l_script_FirstAncestor_0.Flags.GetFIntIDVPollDelay);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFIntIDVMaxRetries);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v11 = require(l_script_FirstAncestor_0.Common.Enums);
local l_IDVStep_0 = v11.IDVStep;
local l_IDVSessionStatusEnum_0 = v11.IDVSessionStatusEnum;
local l_ActionStatusEnum_0 = v11.ActionStatusEnum;
local v15 = require(script.Parent.IDVErrorScreen);
local v16 = require(l_script_FirstAncestor_0.Common.LocalizationStrings);
local l_idvErrorScreenStrings_0 = v16.idvErrorScreenStrings;
local l_idvWithQRCodeUpsellStrings_0 = v16.idvWithQRCodeUpsellStrings;
local v19 = require(script.Parent.IDVDirectLinkUpsell);
local v20 = require(l_Parent_0.RobloxAppHooks);
local l_useDeviceType_0 = v20.useDeviceType;
local l_useRoactService_0 = v20.useRoactService;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v25 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableDirectLinkForTablets);
local v26 = v8();
local v27 = v9();
local function _(v28)
    local v29 = true;
    if v28 ~= l_IDVSessionStatusEnum_0.Failure then
        v29 = true;
        if v28 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
            v29 = true;
            if v28 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
                v29 = v28 == l_IDVSessionStatusEnum_0.Expired;
            end;
        end;
    end;
    return v29;
end;
local function _(v31, v32)
    if not (v31 ~= l_IDVSessionStatusEnum_0.Failure) or v31 == l_IDVSessionStatusEnum_0.RequiresManualReview then
        return v32.declined;
    elseif v31 == l_IDVSessionStatusEnum_0.RequiresRetry then
        return v32.retry;
    elseif v31 == l_IDVSessionStatusEnum_0.Expired then
        return v32.timeout;
    else
        return v32.retry;
    end;
end;
return function(v34)
    local l_featureName_0 = v34.featureName;
    local l_onSuccess_0 = v34.onSuccess;
    local l_onFailure_0 = v34.onFailure;
    local l_onCancelled_0 = v34.onCancelled;
    local v39 = if not v34.idvApiProvider then v6 else v34.idvApiProvider;
    local v40 = v34.deviceType or l_useDeviceType_0();
    local v41 = l_useNavigation_0();
    local v42 = l_useLocalization_0(l_idvErrorScreenStrings_0);
    local v43 = l_useLocalization_0(l_idvWithQRCodeUpsellStrings_0);
    local v44, v45 = v2.useState(nil);
    local v46, v47 = v2.useState(true);
    local v48, v49 = v2.useState(l_ActionStatusEnum_0.Unknown);
    local v50, v51 = v2.useState(false);
    local v52, v53 = v2.useState(v42.retry);
    local v54, v55 = v2.useState(0);
    local v56;
    if v25() then
        v56 = true;
        if not (v40 ~= l_DeviceType_0.Tablet) then
            goto label0;
        end;
    end;
    v56 = v40 == l_DeviceType_0.Phone;
    ::label0::;
    local v57 = l_useRoactService_0(l_AppLinking_0);
    local v59 = v34.openIdvLink or function(v58)
        v57:openURL(v58);
    end;
    local function v60()
        v41.navigate(v4.GenericWebPage, {
            detail = v7(), 
            extraProps = {
                title = v43.privacyPageHeader, 
                transitionAnimation = "SlideInFromBottom"
            }
        });
    end;
    local function v62(v61)
        if v61 == l_IDVSessionStatusEnum_0.Stored then
            v55(l_IDVStep_0.UpdatedRobloxProfile);
            return ;
        elseif v61 == l_IDVSessionStatusEnum_0.Success then
            v55(l_IDVStep_0.Verified);
            return ;
        elseif v61 == l_IDVSessionStatusEnum_0.Submitted then
            v55(l_IDVStep_0.GotResults);
            return ;
        else
            if v61 == l_IDVSessionStatusEnum_0.Started then
                v55(l_IDVStep_0.ConnectedMobile);
            end;
            return ;
        end;
    end;
    local function v63(v64, v65)
        if v65 == 0 then
            v51(true);
            v53(v42.timeout);
            return ;
        else
            v39.getVerifiedStatus(v64):andThen(function(v66)
                local l_isVerified_0 = v66.isVerified;
                local l_sessionStatus_0 = v66.sessionStatus;
                v62(l_sessionStatus_0);
                if l_isVerified_0 and l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Stored then
                    v49(l_ActionStatusEnum_0.Success);
                    return ;
                else
                    local v69 = true;
                    if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.Failure then
                        v69 = true;
                        if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
                            v69 = true;
                            if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
                                v69 = l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Expired;
                            end;
                        end;
                    end;
                    if not v69 then
                        spawn(function()
                            wait(v26);
                            if v46 then
                                v63(v64, v65 - 1);
                            end;
                        end);
                        return ;
                    else
                        v49(l_ActionStatusEnum_0.Failure);
                        v69 = v53;
                        local l_v42_0 = v42;
                        v69(if not (l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.Failure) or l_sessionStatus_0 == l_IDVSessionStatusEnum_0.RequiresManualReview then l_v42_0.declined else if l_sessionStatus_0 == l_IDVSessionStatusEnum_0.RequiresRetry then l_v42_0.retry else if l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Expired then l_v42_0.timeout else l_v42_0.retry);
                        return ;
                    end;
                end;
            end):catch(function(_)
                v51(true);
                v53(v42.retry);
            end);
            return ;
        end;
    end;
    v2.useEffect(function()
        v47(true);
        v39.startVerification():andThen(function(v72)
            v63(v72.sessionIdentifier, v27);
            v45(v72.verificationLink);
        end):catch(function(_)
            v51(true);
            v53(v42.retry);
        end);
        return function()
            v47(false);
        end;
    end, {});
    v2.useEffect(function()
        if v48 == l_ActionStatusEnum_0.Success then
            l_onSuccess_0();
            return ;
        elseif v48 == l_ActionStatusEnum_0.Cancelled then
            l_onCancelled_0();
            return ;
        else
            if v48 == l_ActionStatusEnum_0.Failure then
                v51(true);
            end;
            return ;
        end;
    end, {
        v48
    });
    if not v50 then
        if not v56 then
            return v2.createElement(v5, {
                qrCodeLink = v44, 
                featureName = l_featureName_0, 
                openPrivacyPolicyLink = v60, 
                latestStepCompleted = v54, 
                onClose = function()
                    v49(l_ActionStatusEnum_0.Cancelled);
                end
            });
        else
            return v2.createElement(v19, {
                featureName = l_featureName_0, 
                idvLink = v44, 
                openIdvLink = v59, 
                onClose = function()
                    v49(l_ActionStatusEnum_0.Cancelled);
                end, 
                openPrivacyPolicyLink = v60, 
                latestStepCompleted = v54
            });
        end;
    else
        return v2.createElement(v15, {
            errorTitle = v42.title, 
            errorDescription = v52, 
            buttonText = v42.close, 
            onClose = function()
                l_onFailure_0();
            end
        });
    end;
end;
