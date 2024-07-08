local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local v3 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v4 = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted");
return {
    _initialized = false, 
    placeId = 0, 
    universeId = 0, 
    placeVoiceEnabled = false, 
    universeVoiceEnabled = false, 
    clientSessionId = "", 
    UIType = {
        EXPERIENCE_JOIN = 0, 
        PROMPT_IMPRESSION = 1, 
        PROMPT_INTERACTION = 2
    }, 
    _init = function(v5, v6, v7)
        v5._initialized = true;
        v5.placeId = game.PlaceId;
        v5.universeId = game.GameId;
        v5.placeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v6, Enum.AvatarChatServiceFeature.PlaceAudio);
        v5.universeVoiceEnabled = l_AvatarChatService_0:IsEnabled(v6, Enum.AvatarChatServiceFeature.UniverseAudio);
        v5:logExperienceJoin({
            didAuthorize = v7
        });
    end, 
    _getEventPayload = function(v8, v9, v10)
        return {
            uiType = v9, 
            uiContext = v10.uiContext, 
            didAuthorize = v10.didAuthorize, 
            placeId = v8.placeId, 
            universeId = v8.universeId, 
            placeVoiceEnabled = v8.placeVoiceEnabled, 
            universeVoiceEnabled = v8.universeVoiceEnabled, 
            clientSessionId = v8.clientSessionId
        };
    end, 
    _isReady = function(v11)
        return v3() and v11._initialized;
    end, 
    init = function(v12, v13)
        if not l_AvatarChatService_0.ClientFeaturesInitialized then
            local v14 = nil;
            v14 = l_AvatarChatService_0:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
                v12:_init(l_AvatarChatService_0.ClientFeatures, v13);
                v14:Disconnect();
            end);
            return ;
        else
            v12:_init(l_AvatarChatService_0.ClientFeatures, v13);
            return ;
        end;
    end, 
    logExperienceJoin = function(v15, v16)
        if v15:_isReady() then
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v15:_getEventPayload(v15.UIType.EXPERIENCE_JOIN, v16));
            return ;
        else
            return ;
        end;
    end, 
    logPromptImpression = function(v17, v18)
        if v17:_isReady() then
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v17:_getEventPayload(v17.UIType.PROMPT_IMPRESSION, v18));
            return ;
        else
            return ;
        end;
    end, 
    logPromptInteraction = function(v19, v20)
        if v19:_isReady() then
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voice", v4, v19:_getEventPayload(v19.UIType.PROMPT_INTERACTION, v20));
            return ;
        else
            return ;
        end;
    end, 
    setClientSessionId = function(v21, v22)
        if not v21:_isReady() or v21.clientSessionId == v22 then
            return ;
        else
            v21.clientSessionId = v22;
            return ;
        end;
    end
};
