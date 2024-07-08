local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = require(game:GetService("CorePackages").Promise);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
return function()
    return l_default_0:asyncInit();
end;
