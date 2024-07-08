local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v2 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({
    isActiveChatUser = false
}, {
    [v1.Conversations.Thunks.FetchChatSettings.Succeeded.name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            chatEnabled = v4.responseBody.chatEnabled
        });
    end
});
