local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.UpdateChatVisible);
local v7 = require(l_Parent_0.Actions.UpdateChatMessages);
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.ChatSelector);
local l_GameSettings_0 = UserSettings().GameSettings;
local v10 = v2.PureComponent:extend("ChatConnector");
v10.validateProps = v4.strictInterface({
    isSmallTouchScreen = v4.boolean, 
    updateChatVisible = v4.callback, 
    updateChatMessages = v4.callback
});
v10.didMount = function(v11)
    local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
    if v11.props.isSmallTouchScreen then
        l_ChatVisible_0 = false;
    end;
    v8:SetVisible(l_ChatVisible_0);
    v11.props.updateChatMessages(v8:GetMessageCount());
    v11.props.updateChatVisible(v8:GetVisibility());
    v11.chatVisibleConnection = v8.VisibilityStateChanged:connect(function(v13)
        v11.props.updateChatVisible(v13);
    end);
    v11.chatMessagesConnection = v8.MessagesChanged:connect(function(v14)
        v11.props.updateChatMessages(v14);
    end);
end;
v10.render = function(_)
    return nil;
end;
v10.willUnmount = function(v16)
    v16.chatVisibleConnection:disconnect();
    v16.chatMessagesConnection:disconnect();
end;
return v3.UNSTABLE_connect2(function(v17)
    return {
        isSmallTouchScreen = v17.displayOptions.isSmallTouchDevice
    };
end, function(v18)
    return {
        updateChatVisible = function(v19)
            return v18(v6(v19));
        end, 
        updateChatMessages = function(v20)
            return v18(v7(v20));
        end
    };
end)(v10);
