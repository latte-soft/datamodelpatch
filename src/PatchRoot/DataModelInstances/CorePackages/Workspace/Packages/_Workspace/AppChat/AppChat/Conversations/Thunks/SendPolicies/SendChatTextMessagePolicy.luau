local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(script.Parent.SendChatMessagePolicy);
local v6 = require(l_Parent_0.HttpRequest);
local v10 = v6.config({
    requestFunction = function(v7, v8, v9)
        v3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return v6.requestFunctions.HttpRbxApi(v7, v8, v9);
    end
});
local l_DEPRECATED_ChatSendMessage_0 = require(l_Parent_0.Http).Requests.DEPRECATED_ChatSendMessage;
local v12 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v13 = setmetatable({}, v5);
v13.__index = v13;
v13.new = function(v14, v15, v16, v17)
    v3:info("New policy constructed for conversationId: {} messageText: {}", v15, v16);
    local v18 = v5:new(v15);
    setmetatable(v18, v14);
    v18.messageText = v16;
    v18.decorators = v17;
    return v18;
end;
v13.sendMessage = function(v19, _)
    v3:info("sendMessage - conversationId: {} messageText: {}", v19.conversationId, v19.messageText);
    if not v12() then
        return l_DEPRECATED_ChatSendMessage_0(v10, v19.conversationId, v19.messageText, v19.decorators);
    else
        return v2.http.SendChatTextMessage(v19.conversationId, v19.messageText);
    end;
end;
v13.sendingMessagePayload = function(v21)
    return {
        messageType = v4.MessageTypes.PlainText, 
        content = v21.messageText
    };
end;
return v13;
