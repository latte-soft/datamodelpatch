local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics);
return {
    get = function(v1)
        local v2 = v0.get(v1);
        return {
            joinWithoutVoiceChat = function(v3)
                v2.EventStream:sendEventDeferred("voiceChat", "joinWithoutVoiceChat", {
                    dontShowAgain = v3
                });
            end, 
            closeEnableVoiceChatModal = function()
                v2.EventStream:sendEventDeferred("voiceChat", "closeEnableVoiceChatModal");
            end, 
            enableVoiceChatUpsell = function()
                v2.EventStream:sendEventDeferred("voiceChat", "enableVoiceChatUpsell");
            end, 
            showEnableVoiceChatModal = function()
                v2.EventStream:sendEventDeferred("voiceChat", "showEnableVoiceChatModal");
            end, 
            learnMoreAboutVoiceRecordingUpsell = function()
                v2.EventStream:sendEventDeferred("voiceChat", "learnMoreAboutVoiceRecordingUpsell");
            end
        };
    end
};
