local l_Players_0 = game:GetService("Players");
local l_GetFStringInGameMenuChromeForcedUserIds_0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFStringInGameMenuChromeForcedUserIds;
game:DefineFastFlag("ChromeObservableStateCheck", false);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v3 = tick() + 5;
    while not l_LocalPlayer_0 and tick() < v3 do
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        task.wait();
    end;
    for v4 in l_GetFStringInGameMenuChromeForcedUserIds_0():gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v4) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return game:GetFastFlag("ChromeObservableStateCheck");
end;
