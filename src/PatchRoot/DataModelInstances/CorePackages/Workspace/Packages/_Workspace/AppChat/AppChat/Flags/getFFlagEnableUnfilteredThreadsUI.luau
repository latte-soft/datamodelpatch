local v0 = require(script.Parent.isAppChatChannelsAPIEnabled);
game:DefineFastFlag("EnableUnfilteredThreadsUI", false);
return function()
    return game:GetFastFlag("EnableUnfilteredThreadsUI") and v0();
end;
