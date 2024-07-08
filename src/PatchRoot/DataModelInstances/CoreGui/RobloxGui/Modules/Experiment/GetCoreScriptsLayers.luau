local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.IsExperienceMenuABTestEnabled);
local l_FFlagEnableBulkManagementExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBulkManagementExperiment;
local l_FFlagEnableCapturesDesktopExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableCapturesDesktopExperiment;
local l_FStringCapturesIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringCapturesIXPLayer;
local l_FStringCapturesTabIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringCapturesTabIXPLayer;
local l_FStringSocialCaptureIXPLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringSocialCaptureIXPLayer;
local v7 = require(script.Parent.Parent.Flags.GetFFlagShareInviteLinkContextMenuABTestEnabled);
local v8 = require(script.Parent.Parent.Flags.GetFFlagEnableNewInviteMenuIXP);
local l_GetFStringLargerRobuxUpsellIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer;
local v10 = require(script.Parent.Parent.Flags.GetFStringLuaAppExperienceMenuLayer);
local v11 = require(script.Parent.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer);
local v12 = require(script.Parent.Parent.Settings.Flags.GetFFlagInGameMenuV1FadeBackgroundAnimation);
local v13 = require(script.Parent.Parent.Flags.GetFFlagEnableTeleportBackButton);
local v14 = require(script.Parent.Parent.Flags.GetFStringTeleportBackButtonIXPCustomLayerName);
local v15 = require(script.Parent.Parent.Settings.Flags.GetFFlagReportAnythingAnnotationIXP);
local v16 = require(script.Parent.Parent.Settings.Flags.GetFStringReportAnythingAnnotationIXPLayerName);
local v17 = require(script.Parent.Parent.Flags.GetFStringChatTranslationLayerName);
local v18 = require(script.Parent.Parent.Flags.GetFFlagChatTranslationSettingEnabled);
local v19 = require(script.Parent.Parent.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v20 = require(script.Parent.Parent.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local v21 = require(script.Parent.Parent.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local l_getFStringDesktopToastNotificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer;
local v23 = require(script.Parent.Parent.Settings.Flags.GetFFlagMuteTogglesEnableIXP);
local v24 = require(script.Parent.Parent.Settings.Flags.GetFStringMuteTogglesIXPLayerName);
local l_GetFStringGameInviteMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer;
local v26 = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled);
local v27 = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName);
local v28 = require(script.Parent.Parent.Flags.GetFFlagAddVoiceExposureLayer);
local v29 = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName);
local v30 = require(script.Parent.Parent.Flags.GetFFlagAddPhoneVerificationLayers);
local l_GetFStringAndroidPhoneVerificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer;
local l_GetFStringIOSPhoneVerificationLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer;
return function()
    local v33 = {
        "AbuseReports", 
        l_getFStringDesktopToastNotificationLayer_0()
    };
    if not (not (v1() or v7()) and not v8()) then
        table.insert(v33, v10());
        table.insert(v33, v11());
    end;
    if l_GetFStringLargerRobuxUpsellIxpLayer_0() then
        table.insert(v33, l_GetFStringLargerRobuxUpsellIxpLayer_0());
    end;
    if v13() then
        table.insert(v33, v14());
    end;
    if v12() then
        table.insert(v33, "Engine.Interactivity.UICreation.NotchScreenSupport");
    end;
    if v15() then
        table.insert(v33, v16());
    end;
    if v18() and #v17() > 0 then
        table.insert(v33, v17());
    end;
    if v19() then
        table.insert(v33, v20());
    end;
    if v21() then
        table.insert(v33, l_GetFStringGameInviteMenuLayer_0());
    end;
    if v23() then
        table.insert(v33, v24());
    end;
    if v26() then
        table.insert(v33, v27());
    end;
    if l_FFlagEnableCapturesDesktopExperiment_0 then
        table.insert(v33, l_FStringCapturesIXPLayer_0);
    end;
    if l_FFlagEnableBulkManagementExperiment_0 then
        table.insert(v33, l_FStringCapturesTabIXPLayer_0);
    end;
    if not (not game:GetEngineFeature("SocialCaptureLayerRegistered") or not l_FStringSocialCaptureIXPLayer_0) then
        table.insert(v33, l_FStringSocialCaptureIXPLayer_0);
    end;
    if v28() then
        table.insert(v33, v29());
    end;
    if not (not v30() or not l_GetFStringAndroidPhoneVerificationLayer_0()) then
        table.insert(v33, l_GetFStringAndroidPhoneVerificationLayer_0());
    end;
    if not (not v30() or not l_GetFStringIOSPhoneVerificationLayer_0()) then
        table.insert(v33, l_GetFStringIOSPhoneVerificationLayer_0());
    end;
    return v33;
end;
