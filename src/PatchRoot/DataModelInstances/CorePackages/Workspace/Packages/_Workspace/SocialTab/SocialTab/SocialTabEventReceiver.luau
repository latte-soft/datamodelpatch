local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoduxFriends_0 = v1.RoduxFriends;
local v5 = require(l_Parent_0.Requests.GetUnreadConversationCount);
local v6 = require(l_Parent_0.Logger);
local v7 = l_Roact_0.Component:extend("SocialTabEventReceiver");
v7.init = function(v8)
    local l_robloxEventReceiver_0 = v8.props.robloxEventReceiver;
    v8.lastSeqNumByNamespace = {};
    v8.lastConnectionState = Enum.ConnectionState.Connected;
    local function _(v10, v11)
        v8.lastSeqNumByNamespace[v10] = v11;
    end;
    v8.getUnreadConversationCount = function()
        return v8.props.getUnreadConversationCount():catch(function(v13)
            v6:warning("{} has issues fetching UnreadConversationCount: {}", script.Name, v13);
        end);
    end;
    local function _(v14)
        return v8.props.getActiveConversationId() == tostring(v14.ConversationId);
    end;
    local v20 = {
        ConversationRemoved = function(v16)
            return not (v8.props.getActiveConversationId() == tostring(v16.ConversationId));
        end, 
        RemovedFromConversation = function(v17)
            return not (v8.props.getActiveConversationId() == tostring(v17.ConversationId));
        end, 
        NewMessage = function(v18)
            return not (v8.props.getActiveConversationId() == tostring(v18.ConversationId));
        end, 
        MessageMarkedAsRead = function(v19)
            return not (v8.props.getActiveConversationId() == tostring(v19.ConversationId));
        end
    };
    local function _(v21, v22)
        local v23 = v20[v22];
        if not v23 then
            return false;
        else
            return v23(v21);
        end;
    end;
    v8.tokens = {
        l_robloxEventReceiver_0:observeEvent("ChatNotifications", function(v25, v26)
            v26 = v25.Type or v26;
            v8.lastSeqNumByNamespace.ChatNotifications = v25.SequenceNumber;
            local v27 = v20[v26];
            if not not v27 and v27(v25) then
                v8.getUnreadConversationCount();
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v28)
            if not (not (v28.Type == "FriendshipDestroyed") or not v28.EventArgs) then
                local v29 = tostring(v28.EventArgs.UserId1);
                local v30 = tostring(v28.EventArgs.UserId2);
                if v29 == v8.props.localUserId then
                    v29 = "localUserId";
                end;
                if v30 == v8.props.localUserId then
                    v30 = "localUserId";
                end;
                v8.props.friendshipDestroyed(v29, v30);
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("signalR", function(v31, _, v33)
            local l_lastConnectionState_0 = v8.lastConnectionState;
            v8.lastConnectionState = v31;
            if not (not (v31 == Enum.ConnectionState.Connected) or not v33) then
                if not (v8.lastSeqNumByNamespace.ChatNotifications == v33.ChatNotifications) or l_lastConnectionState_0 ~= v31 then
                    v8.getUnreadConversationCount();
                end;
                v8.lastSeqNumByNamespace = v33;
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("AppShellNotifications", function(_, v36)
            if not (v36 ~= "StartConversationWithUserId") or v36 == "StartConversationWithId" then
                v8.props.goToChat();
            end;
        end), 
        l_robloxEventReceiver_0:observeEvent("AppInput", function(_, v38)
            if v38 == "Focused" then
                v8.props.showTabBar();
            end;
        end)
    };
end;
v7.render = function(_)
    return nil;
end;
v7.willUnmount = function(v40)
    for _, v42 in pairs(v40.tokens) do
        v42:disconnect();
    end;
end;
return l_RoactRodux_0.connect(function(v43)
    return {
        localUserId = v43.LocalUserId
    };
end, function(v44)
    return {
        friendshipDestroyed = function(v45, v46)
            return v44(l_RoduxFriends_0.Actions.FriendshipDestroyed(v45, v46));
        end, 
        getUnreadConversationCount = function()
            return v44(v5.API());
        end
    };
end)(v7);
