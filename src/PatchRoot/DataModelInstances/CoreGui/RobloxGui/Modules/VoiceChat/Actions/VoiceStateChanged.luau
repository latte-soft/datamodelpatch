local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_makeActionCreator_0 = require(l_CorePackages_0.Rodux).makeActionCreator;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Helpers.maybeAssert);
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v4 = require(l_RobloxGui_0.Modules.VoiceChat.Helpers.maybeAssert);
end;
return l_makeActionCreator_0(script.Name, function(v5, v6)
    v4(tonumber(v5) ~= nil);
    v4(v3.string(v6));
    return {
        userId = tostring(v5), 
        newState = v6
    };
end);
