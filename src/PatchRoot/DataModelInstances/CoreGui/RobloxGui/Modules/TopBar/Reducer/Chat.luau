local v0 = require(game:GetService("CorePackages").Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
return (v0.createReducer({
    canChat = false, 
    visible = true, 
    lastReadMessages = 0, 
    unreadMessages = 0
}, {
    [require(l_Actions_0.UpdateUnreadMessagesBadge).name] = function(v2, v3)
        if not v2.visible then
            return {
                canChat = v2.canChat, 
                visible = false, 
                lastReadMessages = 0, 
                unreadMessages = v3.messages
            };
        else
            return {
                canChat = v2.canChat, 
                visible = true, 
                lastReadMessages = 0, 
                unreadMessages = 0
            };
        end;
    end, 
    [require(l_Actions_0.UpdateChatMessages).name] = function(v4, v5)
        if not v4.visible then
            return {
                canChat = v4.canChat, 
                visible = false, 
                lastReadMessages = v4.lastReadMessages, 
                unreadMessages = v5.messages - v4.lastReadMessages
            };
        else
            return {
                canChat = v4.canChat, 
                visible = true, 
                lastReadMessages = v5.messages, 
                unreadMessages = 0
            };
        end;
    end, 
    [require(l_Actions_0.UpdateChatVisible).name] = function(v6, v7)
        if not v7.visible then
            return {
                canChat = v6.canChat, 
                visible = false, 
                lastReadMessages = v6.lastReadMessages, 
                unreadMessages = v6.unreadMessages
            };
        else
            return {
                canChat = v6.canChat, 
                visible = true, 
                lastReadMessages = v6.lastReadMessages + v6.unreadMessages, 
                unreadMessages = 0
            };
        end;
    end, 
    [require(l_Actions_0.SetCanChat).name] = function(v8, v9)
        return {
            canChat = v9.canChat, 
            visible = v8.visible, 
            lastReadMessages = v8.lastReadMessages, 
            unreadMessages = v8.unreadMessages
        };
    end
}));
