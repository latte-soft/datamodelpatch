local v0 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_PlatformInterface_0 = require(l_Shell_0:FindFirstChild("PlatformInterface"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local v7 = {
    AppShell = 0, 
    Game = 1
};
local v14 = {
    SendHeroStatsEventAsync = function(_, v9, v10)
        l_Utility_0.DebugLog("HeroStatsManager - event name:", v9, "event value:", v10);
        local v11 = nil;
        local l_status_0, l_result_0 = pcall(function()
            if v0 and not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
                v11 = v0:BeginHeroStat(v9, v10);
            end;
        end);
        if not l_status_0 then
            l_Utility_0.DebugLog("HeroStatsManager - event name:", v9, "value", v10, "for reason:", l_result_0);
        end;
        l_Utility_0.DebugLog("HeroStatsManager - event name:", v9, "event status:", v11);
    end
};
local function v19()
    local l_rbxuid_0 = l_AppState_0.store:getState().RobloxUser.rbxuid;
    local v16 = l_rbxuid_0 and l_Http_0.GetUserOwnedPackagesAsync(l_rbxuid_0);
    local v17 = (v16 and v16.IsValid) and v16.Data;
    local v18 = v17 and v17.Items;
    if v18 then
        v14:SendHeroStatsEventAsync("AvatarsEquipped", #v18);
    end;
end;
local v20 = false;
local function v21()
    if not v20 then
        v20 = true;
        v14:SendHeroStatsEventAsync("GamesCount");
        v20 = false;
        return ;
    else
        return ;
    end;
end;
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.DonnedDifferentPackage, "HeroStatsManager", function(_)
    spawn(v19);
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarEquipSuccess, "HeroStatsManager", function(_)
    spawn(v19);
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "HeroStatsManager", function()
    spawn(v19);
end);
if v0 then
    v0.ViewChanged:connect(function(v24)
        if v24 == v7.Game then
            spawn(v21);
        end;
    end);
end;
spawn(function()
    if not (UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows) then
        local v25 = nil;
        while true do
            local v26 = l_PlatformInterface_0:IsInAParty((l_PlatformInterface_0:GetPartyMembersAsync()));
            local v27 = tick();
            if not v26 then
                v25 = nil;
            elseif not v25 then
                v25 = v27;
            elseif v27 - v25 > 60 then
                v14:SendHeroStatsEventAsync("PartyCount");
                v25 = v25 + 60;
            end;
            wait(60);
        end;
    end;
end);
return v14;
