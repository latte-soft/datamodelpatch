local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v4 = l_CoreGui_0:WaitForChild("RobloxGui", math.huge);
local v5 = require(v4.Modules.Flags.GetFFlagConsolidateBubbleChat);
if not game:IsLoaded() then
    local _ = game.Loaded:Wait();
end;
if not v5() and l_TextChatService_0.ChatVersion ~= Enum.ChatVersion.TextChatService then
    return ;
else
    local v7 = require(v4.Modules.RobloxTranslator);
    local v8 = require(v4.Modules.ApolloClient);
    local v9 = require(l_CorePackages_0.ExperienceChat);
    local v10 = game:DefineFastFlag("FFlagEnableSetCoreGuiEnabledExpChat", false);
    local v11 = game:DefineFastFlag("ExperienceChatSiblingZIndexBehavior", false);
    local v12 = require(v4.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
    local v13 = require(v4.Modules.Flags.getFFlagAddApolloClientToExperienceChat);
    local v14 = require(v4.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
    local v15 = require(v4.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
    local v16 = require(v4.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences);
    local v17 = require(v4.Modules.Flags.getFFlagRenderVoiceBubbleAfterAsyncInit);
    local v18 = require(v4.Modules.Chrome.Enabled)();
    local v19 = require(v4.Modules.VoiceChat.Components.getIconVoiceIndicator);
    local v20 = require(v4.Modules.VoiceChat.Components.onClickedVoiceIndicator);
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if v12 then
        v21 = require(v4.Modules.VoiceChat.Components.onClickedCameraIndicator);
        v22 = require(v4.Modules.VoiceChat.Components.getPermissions);
        v23 = require(v4.Modules.VoiceChat.Components.selfViewListenerChanged);
        if v14() then
            v24 = require(v4.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast);
            if v16() then
                v24 = require(v4.Modules.VoiceChat.Helpers.displayCameraDeniedToast);
            end;
            v25 = require(v4.Modules.Settings.isCamEnabledForUserAndPlace);
        end;
        if v15() then
            v26 = require(v4.Modules.Settings.isCameraOnlyUser);
        end;
        if v17() then
            v27 = require(v4.Modules.VoiceChat.Components.isVoiceServiceInitialized);
        end;
    end;
    if v18 then
        v22 = require(v4.Modules.VoiceChat.Components.getPermissions);
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "ExperienceChat";
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.DisplayOrder = -1;
    if v11 then
        l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    end;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local function v31(v29)
        local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v29, true);
        while not l_l_TextChatService_0_FirstChild_0 do
            wait();
            l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild(v29, true);
        end;
        return l_l_TextChatService_0_FirstChild_0;
    end;
    if v10 then
        l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v32, v33)
            if not (v32 ~= Enum.CoreGuiType.All) or v32 == Enum.CoreGuiType.Chat then
                v9.Events.SetCoreGuiEnabledChanged(v33);
            end;
        end);
    end;
    local v34 = nil;
    local v35 = nil;
    if not v5() then
        v34 = l_TextChatService_0.CreateDefaultTextChannels;
    else
        local v36 = false;
        if l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService then
            v36 = l_TextChatService_0.CreateDefaultTextChannels;
        end;
        v34 = v36;
        v35 = require(v4.Modules.InGameChat.BubbleChat.Types).IChatSettings;
    end;
    v9.mountClientApp({
        apolloClient = if not v13() then nil else v8, 
        getIconVoiceIndicator = v19 or nil, 
        onClickedVoiceIndicator = v20 or nil, 
        onClickedCameraIndicator = v21 or nil, 
        displayCameraDeniedToast = v24 or nil, 
        isCamEnabledForUserAndPlace = v25 or nil, 
        isCameraOnlyUser = v26 or nil, 
        getPermissions = v22 or nil, 
        selfViewListenerChanged = v23 or nil, 
        defaultTargetTextChannel = if not v34 then nil else v31("RBXGeneral"), 
        defaultSystemTextChannel = if not v34 then nil else v31("RBXSystem"), 
        validateLegacyBubbleChatSettings = v35 or nil, 
        isVoiceServiceInitialized = v27 or nil, 
        translator = v7, 
        parent = l_ScreenGui_0
    });
    return ;
end;
