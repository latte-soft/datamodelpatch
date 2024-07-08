local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local v2 = {};
local v3 = false;
v2.GetPartyMembersAsync = function(_)
    while v3 do
        wait();
    end;
    v3 = true;
    local v5 = nil;
    local l_status_0, l_result_0 = pcall(function()
        v5 = v1:GetPlatformPartyMembers();
    end);
    if not l_status_0 then
        l_Utility_0.DebugLog("HeroStatsManager - Error getting party members:", l_result_0);
    end;
    v3 = false;
    return v5;
end;
v2.IsInAParty = function(_, v9)
    return v9 and #v9 > 1;
end;
return v2;
