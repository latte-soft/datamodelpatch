local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.GetFStringInGameMenuChromeForcedUserIds);
local v2 = require(script.Parent.GetFIntInGameMenuChromeAllowlistTimeout);
local v3 = require(script.Parent.GetFFlagSupportCompactUtility)();
game:DefineFastFlag("EnableScreenshotUtility6", false);
return function()
    if v3 then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v5 = tick() + v2();
        while not l_LocalPlayer_0 and tick() < v5 do
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            task.wait();
        end;
        for v6 in v1():gmatch("%d+") do
            if l_LocalPlayer_0 and tonumber(v6) == l_LocalPlayer_0.UserId then
                return true;
            end;
        end;
        return game:GetFastFlag("EnableScreenshotUtility6");
    else
        return false;
    end;
end;
