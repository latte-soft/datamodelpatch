local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Requests_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests;
local l_DEPRECATED_ChatSendMessage_0 = l_Requests_0.DEPRECATED_ChatSendMessage;
local l_DEPRECATED_ChatStartOneToOneConversation_0 = l_Requests_0.DEPRECATED_ChatStartOneToOneConversation;
local v5 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_DEPRECATED_ChatSendGameLinkMessage_0 = l_Requests_0.DEPRECATED_ChatSendGameLinkMessage;
return function(v7, v8, v9)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v11 = nil;
    v11 = v5:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", {
        PLACENAME = v9.name
    });
    return function(_)
        return l_DEPRECATED_ChatStartOneToOneConversation_0(v7, v8, l_UserId_0):andThen(function(v13)
            local l_conversation_0 = v13.responseBody.conversation;
            return l_DEPRECATED_ChatSendMessage_0(v7, l_conversation_0.id, v11, nil, true, v8):andThen(function()
                return l_DEPRECATED_ChatSendGameLinkMessage_0(v7, l_conversation_0.id, v9.universeId, nil, true, v8, v9.universeRootPlaceId):andThen(function(v15)
                    return {
                        resultType = v15.responseBody.resultType, 
                        conversationId = l_conversation_0.id, 
                        placeId = v9.universeRootPlaceId
                    };
                end);
            end);
        end);
    end;
end;
