local v0 = require(script.Parent.isAppChatChannelsAPIEnabled);
game:DefineFastFlag("EnableChatSystemMessages", false);
return function()
    return game:GetFastFlag("EnableChatSystemMessages") and v0();
end;
