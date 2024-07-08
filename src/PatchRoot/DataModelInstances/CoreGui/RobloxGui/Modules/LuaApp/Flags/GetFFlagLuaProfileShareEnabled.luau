game:DefineFastFlag("LuaProfileShareEnabledV1", false);
game:DefineFastInt("LuaProfileShareRolloutPercentage", 0);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_ThrottleUserId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).ThrottleUserId;
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then
        return game:GetFastFlag("LuaProfileShareEnabledV1") or l_ThrottleUserId_0(game:GetFastInt("LuaProfileShareRolloutPercentage"), l_LocalPlayer_0.UserId);
    else
        return false;
    end;
end;
