local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(script.Parent.Parent.ExperienceMenuABTestManager);
local v3 = require(script.Parent.GetFStringInGameMenuModernizationBigTextForcedUserIds);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v5 in v3():gmatch("%d+") do
        if tonumber(v5) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    if not v1() or not v2.default:shouldShowBiggerText() then
        return false;
    else
        return true;
    end;
end;
