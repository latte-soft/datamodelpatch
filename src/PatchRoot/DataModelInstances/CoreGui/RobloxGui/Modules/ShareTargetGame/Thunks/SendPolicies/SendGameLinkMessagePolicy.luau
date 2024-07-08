local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new("SendGameLinkMessagePolicy");
local l_MessageModel_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Models.MessageModel;
local l_DEPRECATED_ChatSendGameLinkMessage_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests.DEPRECATED_ChatSendGameLinkMessage;
local l_SendChatMessagePolicy_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.SendPolicies.SendChatMessagePolicy;
local v5 = require(l_CorePackages_0.Packages.HttpRequest);
local v9 = v5.config({
    requestFunction = function(v6, v7, v8)
        v1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v7, v6));
        return v5.requestFunctions.HttpRbxApi(v6, v7, v8);
    end
});
local v10 = setmetatable({}, l_SendChatMessagePolicy_0);
v10.__index = v10;
v10.new = function(v11, v12, v13, v14, v15, v16, v17)
    local v18 = l_SendChatMessagePolicy_0:new(v12);
    setmetatable(v18, v11);
    v18.universeId = v13;
    v18.decorators = v14;
    v18.isExperienceInvite = v15;
    v18.userId = v16;
    v18.placeId = v17;
    return v18;
end;
v10.sendMessage = function(v19, _)
    return l_DEPRECATED_ChatSendGameLinkMessage_0(v9, v19.conversationId, v19.universeId, v19.decorators, v19.isExperienceInvite or false, v19.userId or 0, v19.placeId or 0);
end;
v10.sendingMessagePayload = function(v21)
    return {
        messageType = l_MessageModel_0.MessageTypes.Link, 
        link = {
            type = l_MessageModel_0.LinkTypes.Game, 
            game = {
                universeId = v21.universeId
            }
        }
    };
end;
return v10;
