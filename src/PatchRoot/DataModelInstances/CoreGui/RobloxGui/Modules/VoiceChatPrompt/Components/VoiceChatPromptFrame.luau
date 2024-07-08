local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v8 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v8.App.Button.Button;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_Toast_0 = v8.App.Dialog.Toast;
local l_Images_0 = v8.App.ImageSet.Images;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_validateStyle_0 = v8.Style.Validator.validateStyle;
local v15 = require(script.Parent.Parent.PromptType);
local v16 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy);
local v17 = require(script.Parent.VoiceChatConsentModal);
local v18 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v22 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoicePromptReasonText);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceNudge);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceBanShowToastOnSubsequentJoins);
local v26 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableVoiceChatStorybookFix);
local v27 = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false);
local v28 = require(l_RobloxGui_0.Modules.Flags.GetFFlagUpdateNudgeV3VoiceBanUI);
local v29 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableInExpVoiceUpsell);
local v30 = nil;
v30 = if not v26() then require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator")) else require(l_RobloxGui_0.Modules.RobloxTranslator);
local _ = v3.PureComponent:extend("VoiceChatPromptFrame");
local v32 = {
    [v15.None] = "", 
    [v15.NotAudible] = v30:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"), 
    [v15.Permission] = v30:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v15.Retry] = v30:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"), 
    [v15.Place] = "Exceeds Max Players", 
    [v15.User] = "Not Eligible for Voice", 
    [v15.VoiceChatSuspendedTemporaryAvatarChat] = v30:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"), 
    [v15.VoiceChatSuspendedTemporary] = v30:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v15.VoiceChatSuspendedTemporaryB] = v30:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v15.VoiceChatSuspendedPermanent] = v30:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"), 
    [v15.VoiceLoading] = v30:FormatByKey("Feature.SettingsHub.Prompt.Connecting"), 
    [v15.VoiceToxicityModal] = v30:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v15.VoiceToxicityToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"), 
    [v15.VoiceToxicityFeedbackToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"), 
    [v15.VoiceChatSuspendedTemporaryToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"), 
    [v15.VoiceConsentDeclinedToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"), 
    [v15.VoiceConsentAcceptedToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"), 
    [v15.VoiceConsentModalV1] = v30:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"), 
    [v15.VoiceConsentModalV2] = v30:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"), 
    [v15.VoiceConsentModalV3] = v30:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat")
};
local v34 = {
    [v15.None] = "", 
    [v15.NotAudible] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"), 
    [v15.Permission] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"), 
    [v15.Retry] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"), 
    [v15.Place] = "Spatial voice is only available for places with Max Players of 30 or less.", 
    [v15.User] = "This account is not eligible to use Spatial Voice.", 
    [v15.VoiceChatSuspendedTemporary] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"), 
    [v15.VoiceChatSuspendedTemporaryAvatarChat] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"), 
    [v15.VoiceChatSuspendedTemporaryB] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"), 
    [v15.VoiceChatSuspendedPermanent] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"), 
    [v15.VoiceLoading] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"), 
    [v15.VoiceToxicityModal] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"), 
    [v15.VoiceToxicityToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"), 
    [v15.VoiceToxicityFeedbackToast] = if not v28() then v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThankYouForFeedback") else v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow"), 
    [v15.VoiceChatSuspendedTemporaryToast] = function(v33)
        return v30:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", {
            dateTime = v33
        });
    end, 
    [v15.VoiceConsentDeclinedToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"), 
    [v15.VoiceConsentAcceptedToast] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"), 
    [v15.VoiceConsentModalV1] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"), 
    [v15.VoiceConsentModalV2] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"), 
    [v15.VoiceConsentModalV3] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2")
};
if l_RunService_0:IsStudio() then
    v32[v15.Place] = v30:FormatByKey("Feature.SettingsHub.Prompt.Place");
    v32[v15.User] = v30:FormatByKey("Feature.SettingsHub.Prompt.User");
    v34[v15.Place] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place");
    v34[v15.User] = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User");
end;
local _ = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect");
local v36 = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations");
local v37 = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil");
local v38 = v30:FormatByKey("Feature.SettingsHub.Prompt.Understand");
local v39 = v30:FormatByKey("Feature.SettingsHub.Prompt.GotIt");
local v40 = v30:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge");
local v41 = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2");
local function _(v42)
    local v43 = true;
    if v42 ~= v15.VoiceChatSuspendedPermanent then
        v43 = true;
        if v42 ~= v15.VoiceChatSuspendedTemporary then
            v43 = true;
            if v42 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                v43 = v42 == v15.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v43;
end;
local function _(v45)
    return v45 == v15.VoiceToxicityModal;
end;
local function _(v47)
    local v48 = true;
    if v47 ~= v15.VoiceConsentModalV1 then
        v48 = true;
        if v47 ~= v15.VoiceConsentModalV2 then
            v48 = v47 == v15.VoiceConsentModalV3;
        end;
    end;
    return v48;
end;
local function _(v50)
    local v51 = true;
    if v50 ~= v15.VoiceChatSuspendedPermanent then
        v51 = true;
        if v50 ~= v15.VoiceChatSuspendedTemporary then
            v51 = true;
            if v50 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                v51 = v50 == v15.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v51 then
        v51 = v50 == v15.VoiceToxicityModal;
        if not v51 then
            v51 = true;
            if v50 ~= v15.VoiceConsentModalV1 then
                v51 = true;
                if v50 ~= v15.VoiceConsentModalV2 then
                    v51 = v50 == v15.VoiceConsentModalV3;
                end;
            end;
        end;
    end;
    return v51;
end;
local function _(v53)
    local v54 = true;
    if v53 ~= v15.VoiceConsentDeclinedToast then
        v54 = v53 == v15.VoiceConsentAcceptedToast;
    end;
    return v54;
end;
local function _(v56)
    local v57 = true;
    if v56 ~= v15.VoiceChatSuspendedTemporary then
        v57 = true;
        if v56 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
            v57 = true;
            if v56 ~= v15.VoiceChatSuspendedTemporaryToast then
                v57 = v56 == v15.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    return v57;
end;
local function _(v59)
    local v60 = true;
    if v59 ~= v15.VoiceChatSuspendedTemporaryB then
        v60 = v59 == v15.VoiceToxicityModal;
    end;
    return v60;
end;
local v62 = v3.PureComponent:extend("VoiceChatPromptFrame");
v62.validateProps = v4.strictInterface({
    promptSignal = v4.optional(v4.RBXScriptSignal), 
    errorText = v4.optional(v4.string), 
    bannedUntil = v4.optional(v4.string), 
    onContinueFunc = v4.optional(v4.callback), 
    onPrimaryActivated = v4.optional(v4.callback), 
    onSecondaryActivated = v4.optional(v4.callback), 
    onReadyForSignal = v4.optional(v4.callback), 
    Analytics = v4.optional(v4.table), 
    VoiceChatServiceManager = v4.optional(v4.table), 
    showNewContent = v4.optional(v4.boolean), 
    showCheckbox = v4.optional(v4.boolean), 
    policyMapper = v4.optional(v4.callback), 
    appStyle = l_validateStyle_0
});
v62.init = function(v63)
    v63.promptStyle = {
        Theme = v63.props.appStyle.Theme, 
        Font = v63.props.appStyle.Font
    };
    v63.state = {
        screenSize = Vector2.new(0, 0), 
        promptType = v15.None, 
        toastContent = nil, 
        banEnd = "", 
        showPrompt = true
    };
    if v63.props.showNewContent then
        local v64 = v30:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended");
        local v65 = v30:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2");
        v32[v15.VoiceChatSuspendedTemporary] = v64;
        v32[v15.VoiceChatSuspendedPermanent] = v64;
        v34[v15.VoiceChatSuspendedTemporary] = v65;
    end;
    v63.onScreenSizeChanged = function(v66)
        if v63.state.screenSize ~= v66.AbsoluteSize then
            v63:setState({
                screenSize = v66.AbsoluteSize
            });
        end;
    end;
    v63.promptSignalCallback = function(v67)
        local v68 = true;
        if v67 ~= v15.VoiceChatSuspendedPermanent then
            v68 = true;
            if v67 ~= v15.VoiceChatSuspendedTemporary then
                v68 = true;
                if v67 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                    v68 = v67 == v15.VoiceChatSuspendedTemporaryB;
                end;
            end;
        end;
        if v68 then
            if v63.props.Analytics then
                v63.props.Analytics:reportBanMessageEvent("Shown");
            end;
            if v63.props.VoiceChatServiceManager then
                v63.props.VoiceChatServiceManager:reportBanMessage("Shown");
            end;
        end;
        if v67 and v67 ~= v15.None then
            v68 = v32[v67];
            local v69 = v34[v67];
            if v25() then
                if typeof(v68) == "function" then
                    v68 = v68(v63.props.bannedUntil);
                end;
                if typeof(v69) == "function" then
                    v69 = v69(v63.props.bannedUntil);
                end;
            end;
            local v70;
            if v29() then
                local v71 = true;
                if v67 ~= v15.VoiceConsentDeclinedToast then
                    v71 = v67 == v15.VoiceConsentAcceptedToast;
                end;
                if v71 then
                    v70 = l_Images_0["icons/controls/publicAudioJoin"];
                    goto label0 --[[  true, true  ]];
                end;
            end;
            v70 = l_Images_0["icons/status/alert"];
            ::label0::;
            v63:setState({
                showPrompt = true, 
                promptType = v67, 
                toastContent = {
                    iconImage = v70, 
                    toastTitle = v68, 
                    toastSubtitle = v69, 
                    onActivated = function()
                        if v63.props.onPrimaryActivated then
                            v63.props.onPrimaryActivated();
                        end;
                    end, 
                    onDismissed = function()
                    end
                }
            });
            local v72 = true;
            if v67 ~= v15.VoiceChatSuspendedTemporary then
                v72 = true;
                if v67 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                    v72 = true;
                    if v67 ~= v15.VoiceChatSuspendedTemporaryToast then
                        v72 = v67 == v15.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if v72 then
                v63:setState({
                    banEnd = if not not v28() and v67 == v15.VoiceChatSuspendedTemporaryB then v30:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", {
                        banDurationInMinutes = v63.props.bannedUntil
                    }) else " " .. v63.props.bannedUntil .. "."
                });
                return ;
            end;
        else
            v63:setState({
                promptType = v15.None, 
                toastContent = v3.None
            });
        end;
    end;
    v63.closeVoiceBanPrompt = function()
        v63:setState({
            showPrompt = false
        });
        if v63.props.onContinueFunc then
            v63.props.onContinueFunc();
        end;
        l_ContextActionService_0:UnbindCoreAction("CloseVoiceBanPrompt");
        local v73 = v28() and v63.state.promptType == v15.VoiceChatSuspendedTemporaryB;
        if not v27 then
            if not v73 then
                if v63.props.Analytics then
                    v63.props.Analytics:reportBanMessageEvent("Acknowledged");
                end;
                if v63.props.VoiceChatServiceManager then
                    v63.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
                end;
            end;
        else
            local l_promptType_0 = v63.state.promptType;
            local v75 = true;
            if l_promptType_0 ~= v15.VoiceChatSuspendedPermanent then
                v75 = true;
                if l_promptType_0 ~= v15.VoiceChatSuspendedTemporary then
                    v75 = true;
                    if l_promptType_0 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                        v75 = l_promptType_0 == v15.VoiceChatSuspendedTemporaryB;
                    end;
                end;
            end;
            if not (not v75 or v73) then
                if v63.props.Analytics then
                    v63.props.Analytics:reportBanMessageEvent("Acknowledged");
                end;
                if v63.props.VoiceChatServiceManager then
                    v63.props.VoiceChatServiceManager:reportBanMessage("Acknowledged");
                    return ;
                end;
            end;
        end;
    end;
    v63.checkInputStateForClosePrompt = function(_, v77, _)
        if v77 == Enum.UserInputState.Begin then
            v63.closeVoiceBanPrompt();
        end;
    end;
    v63.handlePrimayActivated = function()
        v63.closeVoiceBanPrompt();
        if v63.props.onPrimaryActivated then
            v63.props.onPrimaryActivated();
        end;
    end;
    v63.handleSecondaryActivated = function()
        v63.closeVoiceBanPrompt();
        if v63.props.onSecondaryActivated then
            v63.props.onSecondaryActivated();
        end;
    end;
end;
v62.render = function(v79)
    local v80 = not not v22() and v79.props.errorText or nil;
    local v81 = v79.state.promptType == v15.VoiceToxicityModal;
    local v82 = v79.state.promptType == v15.VoiceToxicityToast;
    local v83 = v28() and v79.state.promptType == v15.VoiceChatSuspendedTemporaryB;
    local v84 = v29();
    if v84 then
        local l_promptType_1 = v79.state.promptType;
        v84 = true;
        if l_promptType_1 ~= v15.VoiceConsentModalV1 then
            v84 = true;
            if l_promptType_1 ~= v15.VoiceConsentModalV2 then
                v84 = l_promptType_1 == v15.VoiceConsentModalV3;
            end;
        end;
    end;
    local v86 = if not v23() then Enum.AutomaticSize.None else Enum.AutomaticSize.Y;
    local _ = nil;
    local l_promptType_2 = v79.state.promptType;
    local v89 = true;
    if l_promptType_2 ~= v15.VoiceChatSuspendedPermanent then
        v89 = true;
        if l_promptType_2 ~= v15.VoiceChatSuspendedTemporary then
            v89 = true;
            if l_promptType_2 ~= v15.VoiceChatSuspendedTemporaryAvatarChat then
                v89 = l_promptType_2 == v15.VoiceChatSuspendedTemporaryB;
            end;
        end;
    end;
    if not v89 then
        v89 = l_promptType_2 == v15.VoiceToxicityModal;
        if not v89 then
            v89 = true;
            if l_promptType_2 ~= v15.VoiceConsentModalV1 then
                v89 = true;
                if l_promptType_2 ~= v15.VoiceConsentModalV2 then
                    v89 = l_promptType_2 == v15.VoiceConsentModalV3;
                end;
            end;
        end;
    end;
    if not v89 then
        v89 = v3.createElement;
        l_promptType_2 = "Frame";
        local v90 = {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v3.Change.AbsoluteSize] = v79.onScreenSizeChanged
        };
        local v91 = {};
        local v92 = false;
        if v79.state.promptType ~= v15.None then
            v92 = v3.createElement(l_Toast_0, {
                duration = not v82 and 3 or v24(), 
                toastContent = v79.state.toastContent
            });
        end;
        v91.Toast = v92;
        v91.EventConnection = v79.props.promptSignal and v3.createElement(l_ExternalEventConnection_0, {
            event = v79.props.promptSignal, 
            callback = v79.promptSignalCallback
        });
        return (v89(l_promptType_2, v90, v91));
    else
        v89 = v79.state.toastContent.toastTitle;
        local v93 = 20 + l_TextService_0:GetTextSize(v89, v79.promptStyle.Font.Header1.RelativeSize * v79.promptStyle.Font.BaseSize, v79.promptStyle.Font.Header1.Font, Vector2.new(325, math.huge)).Y;
        local v94 = v80 or if v79.state.banEnd ~= "" then "<b>" .. if not v83 then v37 .. v79.state.banEnd else v79.state.banEnd .. "</b><br />" .. v79.state.toastContent.toastSubtitle else v79.state.toastContent.toastSubtitle .. v79.state.banEnd;
        local l_Font_0 = v79.promptStyle.Font.Body.Font;
        local v96 = v79.promptStyle.Font.Body.RelativeSize * v79.promptStyle.Font.BaseSize;
        local v97 = 20 + l_TextService_0:GetTextSize(v94, v96, l_Font_0, Vector2.new(325, math.huge)).Y;
        if v83 then
            v97 = v97 + 20;
        end;
        local v98 = if not v83 then v36 else v41;
        local v99 = 20 + l_TextService_0:GetTextSize(v98, v96, l_Font_0, Vector2.new(325, math.huge)).Y;
        local v100;
        if not v28() then
            v100 = v81;
        else
            local l_promptType_3 = v79.state.promptType;
            v100 = true;
            if l_promptType_3 ~= v15.VoiceChatSuspendedTemporaryB then
                v100 = l_promptType_3 == v15.VoiceToxicityModal;
            end;
        end;
        return (v3.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuInformationalDialog = if not v84 then v3.createElement("ScreenGui", {
                DisplayOrder = 8, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = true, 
                Enabled = v79.state.showPrompt, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = v3.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v79.promptStyle.Theme.Overlay.Color, 
                    BackgroundTransparency = v79.promptStyle.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = ""
                }), 
                DialogMainFrame = v3.createElement(v8.Core.ImageSet.ImageSetLabel, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v18.Images.RoundedRect.Image, 
                    ImageColor3 = v79.promptStyle.Theme.BackgroundUIDefault.Color, 
                    ImageTransparency = v79.promptStyle.Theme.BackgroundUIDefault.Transparency, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ScaleType = v18.Images.RoundedRect.ScaleType, 
                    Size = UDim2.new(0, 365, 0, ((((((55 + v93) + 1) + v97) + 14) + v99) + 36) + 40), 
                    AutomaticSize = v86, 
                    SliceCenter = v18.Images.RoundedRect.SliceCenter
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 20), 
                        PaddingBottom = UDim.new(0, 20), 
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20)
                    }), 
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Icon = v3.createElement(v8.Core.ImageSet.ImageSetLabel, {
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = v79.state.toastContent.iconImage, 
                        Size = UDim2.new(0, 55, 0, 55), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }), 
                    TitleTextContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, v93), 
                        AutomaticSize = v86
                    }, {
                        TitleText = v3.createElement(v8.App.Text.StyledTextLabel, {
                            fontStyle = v79.promptStyle.Font.Header1, 
                            colorStyle = v79.promptStyle.Theme.SystemPrimaryDefault, 
                            textXAlignment = Enum.TextXAlignment.Center, 
                            size = UDim2.new(1, 0, 1, 0), 
                            text = v89
                        })
                    }), 
                    Divider = v3.createElement("Frame", {
                        BackgroundColor3 = v79.promptStyle.Theme.Divider.Color, 
                        BackgroundTransparency = v79.promptStyle.Theme.Divider.Transparency, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0.8, 0, 0, 1)
                    }), 
                    DividerSpaceContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, 0, 0, 7)
                    }), 
                    BodyTextContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        Size = UDim2.new(1, 0, 0, v97)
                    }, {
                        BodyText = v3.createElement(v8.App.Text.StyledTextLabel, {
                            fontStyle = v79.promptStyle.Font.Body, 
                            colorStyle = v79.promptStyle.Theme.TextDefault, 
                            textXAlignment = Enum.TextXAlignment.Center, 
                            size = UDim2.new(1, 0, 1, 0), 
                            text = v94
                        })
                    }), 
                    TextSpaceContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, 0, 0, 7)
                    }), 
                    SubBodyTextContainer = not v81 and v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 7, 
                        Size = UDim2.new(1, 0, 0, v99), 
                        AutomaticSize = v86
                    }, {
                        BodyText = v3.createElement(v8.App.Text.StyledTextLabel, {
                            fontStyle = v79.promptStyle.Font.Body, 
                            colorStyle = v79.promptStyle.Theme.TextDefault, 
                            textXAlignment = Enum.TextXAlignment.Center, 
                            size = UDim2.new(1, 0, 1, 0), 
                            text = v98
                        })
                    }), 
                    SpaceContainer2 = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 8, 
                        Size = UDim2.new(1, 0, 0, 10)
                    }), 
                    ButtonContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 9, 
                        Size = UDim2.new(1, 0, 0, 36), 
                        AutomaticSize = v86
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = if not v23() then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 20), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        ConfirmButton = v3.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            layoutOrder = 1, 
                            size = if not v23() then UDim2.new(1, -5, 1, 0) else UDim2.new(1, -5, 0, 48), 
                            text = if not v81 then v38 else v39, 
                            onActivated = if not v23() then v79.closeVoiceBanPrompt else v79.handlePrimayActivated
                        }), 
                        SecondaryButton = v100 and v3.createElement(v8.App.Button.LinkButton, {
                            layoutOrder = 1, 
                            size = UDim2.new(1, -5, 0, 36), 
                            text = v40, 
                            colorStyleDefault = "TextMuted", 
                            colorStyleHover = "TextMuted", 
                            onActivated = v79.handleSecondaryActivated
                        })
                    })
                })
            }) else v3.createElement(v17, {
                titleText = v32[v79.state.promptType], 
                bodyText = v34[v79.state.promptType], 
                handlePrimaryActivated = v79.handlePrimayActivated, 
                handleSecondaryActivated = v79.handleSecondaryActivated, 
                Analytics = v79.props.Analytics, 
                showCheckbox = v79.props.showCheckbox, 
                promptStyle = v79.promptStyle, 
                showPrompt = v79.state.showPrompt
            })
        }));
    end;
end;
v62.didMount = function(v102)
    if v102.props.onReadyForSignal then
        v102.props.onReadyForSignal();
    end;
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v102.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA);
    l_ContextActionService_0:BindCoreAction("CloseVoiceBanPrompt", v102.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB);
end;
v62 = v16.connect(function(v103, _)
    return {
        showNewContent = v103.getGameInfoShowChatFeatures(), 
        showCheckbox = not v29() and true or v103.getDisplayCheckboxInVoiceConsent()
    };
end)(v62);
local function v106(v105)
    return v3.createElement(v62, v5.Dictionary.join(v105, {
        appStyle = l_useStyle_0()
    }));
end;
return function(v107)
    return v6({
        v3.createElement(v106, v107)
    });
end;
