local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.IXPVoiceAbuseReportReportAbuseMenu);
game:DefineFastFlag("EnableNewVoiceReportFlows", false);
game:DefineFastString("NewInGameMenuForcedUserIds", "");
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v3 in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v3) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return game:GetFastFlag("EnableNewVoiceReportFlows") and v1.enabled;
end;
