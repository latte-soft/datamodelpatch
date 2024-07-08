local v0 = require(script.Parent.isAppChatChannelsAPIEnabled);
game:DefineFastFlag("AppChatFriendsSourceEnabled", false);
return function()
    return v0() and game:GetFastFlag("AppChatFriendsSourceEnabled");
end;
