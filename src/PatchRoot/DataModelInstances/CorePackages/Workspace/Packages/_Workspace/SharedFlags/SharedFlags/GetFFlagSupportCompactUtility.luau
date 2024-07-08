local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.GetFStringInGameMenuChromeForcedUserIds);
local v2 = require(script.Parent.GetFIntInGameMenuChromeAllowlistTimeout);
game:DefineFastFlag("SupportCompactUtility2", false);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v4 = tick() + v2();
    while not l_LocalPlayer_0 and tick() < v4 do
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        task.wait();
    end;
    for v5 in v1():gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v5) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return game:GetFastFlag("SupportCompactUtility2");
end;
