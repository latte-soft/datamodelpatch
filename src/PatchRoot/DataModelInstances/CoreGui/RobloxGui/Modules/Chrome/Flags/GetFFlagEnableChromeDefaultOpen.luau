local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(script.Parent.Parent.Parent.ExperienceMenuABTestManager);
game:DefineFastFlag("EnableChromeDefaultOpen", false);
game:DefineFastString("EnableChromeDefaultOpenForcedUserIds", "");
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v4 in game:GetFastString("EnableChromeDefaultOpenForcedUserIds"):gmatch("%d+") do
        if tonumber(v4) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    if not v1() or not v2.default:shouldDefaultOpen() then
        return game:GetFastFlag("EnableChromeDefaultOpen");
    else
        return true;
    end;
end;
