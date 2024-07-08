local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_GetFStringInGameMenuChromeForcedUserIds_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringInGameMenuChromeForcedUserIds;
local l_GetFIntInGameMenuChromeAllowlistTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntInGameMenuChromeAllowlistTimeout;
game:DefineFastFlag("UnibarRespawn", false);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v5 = tick() + l_GetFIntInGameMenuChromeAllowlistTimeout_0();
    while not l_LocalPlayer_0 and tick() < v5 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v6 in l_GetFStringInGameMenuChromeForcedUserIds_0():gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v6) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return game:GetFastFlag("UnibarRespawn");
end;
