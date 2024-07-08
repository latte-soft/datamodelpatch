local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(script.Parent.Parent.ExperienceMenuABTestManager);
local v3 = require(script.Parent.GetFStringInGameMenuModernizationBigTextForcedUserIds);
local v4 = require(script.Parent.GetFStringInGameMenuModernizationStickyBarForcedUserIds);
game:DefineFastFlag("EnableInGameMenuModernization", false);
game:DefineFastString("InGameMenuModernizationForcedUserIds", "");
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v6 in game:GetFastString("InGameMenuModernizationForcedUserIds"):gmatch("%d+") do
        if tonumber(v6) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    for v7 in v3():gmatch("%d+") do
        if tonumber(v7) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    for v8 in v4():gmatch("%d+") do
        if tonumber(v8) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    if not v1() or not v2.default:isMenuModernizationEnabled() then
        return game:GetFastFlag("EnableInGameMenuModernization");
    else
        return true;
    end;
end;
