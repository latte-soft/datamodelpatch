local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Constants;
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
return function(v7, v8, v9)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        if v7 == tostring(l_LocalPlayer_0.UserId) then
            if v8 == l_Constants_0.VOICE_STATE.ERROR then
                l_default_0:RejoinPreviousChannel();
                return ;
            elseif v8 == l_Constants_0.VOICE_STATE.CONNECTING then
                l_default_0:ShowVoiceChatLoadingMessage();
                return ;
            else
                v6:setLastCtx("bubbleChatToggle");
                l_default_0:ToggleMic(v9);
                return ;
            end;
        else
            l_default_0:ToggleMutePlayer(tonumber(v7), v9);
        end;
    end;
end;
