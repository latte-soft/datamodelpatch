local v0 = nil;
pcall(function()
    v0 = game:GetService("PlatformService");
end);
local v1 = nil;
pcall(function()
    v1 = game:GetService("ThirdPartyUserService");
end);
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_PlatformInterface_0 = require(l_Shell_0:FindFirstChild("PlatformInterface"));
local l_Alerts_0 = require(l_Shell_0:FindFirstChild("Alerts"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local v13 = {
    AppShell = 0, 
    Game = 1
};
local v14 = {
    HasAchievementAsync = nil
};
local l_AppShell_0 = v13.AppShell;
local v16 = nil;
v14.AchivementId = {
    Scout = "2", 
    Explorer = "3", 
    Trailblazer = "4", 
    Pollster = "5", 
    Marathon = "6", 
    OneNameManyFaces = "7", 
    ThreeDayRoll = "8", 
    TenDayRoll = "9", 
    TwentyDayRoll = "10", 
    StrengthInNumbers = "11", 
    FoursCompany = "12"
};
local v17 = {
    ["2"] = "AwardYouDidIt", 
    ["3"] = "AwardSampler", 
    ["4"] = "AwardWorldTraveler", 
    ["5"] = "AwardPollster", 
    ["6"] = "AwardDeepDiver", 
    ["7"] = "AwardOneNameManyFaces", 
    ["8"] = "Award3DayRoll", 
    ["9"] = "Award10DayRoll", 
    ["10"] = "Award20DayRoll", 
    ["11"] = "AwardStrengthInNumbers", 
    ["12"] = "AwardFoursCompany"
};
local v18 = {};
local function _()
    return 15;
end;
local function v28(v20, v21)
    local v22 = {};
    if not (not v20 or not v21) then
        local v23 = {};
        for _, v25 in pairs(v21) do
            if v25.robloxuid then
                v23[v25.robloxuid] = true;
            end;
        end;
        for _, v27 in pairs(v20) do
            if v23[v27.robloxuid] then
                table.insert(v22, v27);
            end;
        end;
    end;
    return v22;
end;
local v29 = {};
local v30 = true;
local _ = function()
    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.PlayedGamesChanged);
    spawn(function()
        if l_AppState_0.store:getState().RobloxUser.rbxuid then
            local v31 = nil;
            if v30 then
                v30 = false;
                local l_l_SortsData_0_UserRecent_0 = l_SortsData_0:GetUserRecent();
                local v33 = l_l_SortsData_0_UserRecent_0 and l_l_SortsData_0_UserRecent_0:GetSortAsync(0, 15);
                if v33 ~= nil then
                    for _, v35 in pairs(v33) do
                        if v35.placeId ~= nil then
                            v29[v35.placeId] = true;
                        end;
                    end;
                end;
            end;
            v31 = 0;
            for _, _ in pairs(v29) do
                v31 = v31 + 1;
            end;
            l_Utility_0.DebugLog("You have played:", v31, "games");
            if v31 >= 1 then
                v14:SendAchievementEventAsync("AwardYouDidIt");
            end;
            local v38 = v14:HasAchievementAsync(v14.AchivementId.Explorer);
            if v31 >= 5 then
                v14:SendAchievementEventAsync("AwardSampler");
                if v38 then
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
                else
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, true);
                end;
            elseif v38 then
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
            end;
            if v31 >= 15 then
                v14:SendAchievementEventAsync("AwardWorldTraveler");
            end;
        end;
    end);
end;
local function v45()
    spawn(function()
        l_Utility_0.DebugLog("OnJoinGame: Fours Company check");
        if v0 then
            local v40 = 0;
            while l_AppShell_0 == v13.Game do
                local v41 = tick();
                if v41 - v40 > 30 then
                    local v42 = require(l_Shell_0:FindFirstChild("FriendsData")).GetOnlineFriendsAsync();
                    local l_v0_InGamePlayers_0 = v0:GetInGamePlayers();
                    if not (not l_v0_InGamePlayers_0 or not v42) and #v28(v42, l_v0_InGamePlayers_0) >= 3 then
                        v14:SendAchievementEventAsync("AwardFoursCompany");
                        return ;
                    else
                        v40 = v41;
                    end;
                end;
                wait(1);
            end;
        end;
    end);
    spawn(function()
        local v44 = tick();
        while true do
            if tick() - v44 < 3600 then
                if l_AppShell_0 ~= v13.Game then
                    return ;
                else
                    wait(1);
                end;
            else
                if l_AppShell_0 == v13.Game then
                    v14:SendAchievementEventAsync("AwardDeepDiver");
                end;
                return ;
            end;
        end;
    end);
end;
local function v47()
    l_Utility_0.DebugLog("PartyTitlePresenceChanged: AwardStrengthInNumbers check");
    local l_l_PlatformInterface_0_PartyMembersAsync_0 = l_PlatformInterface_0:GetPartyMembersAsync();
    if not (not l_l_PlatformInterface_0_PartyMembersAsync_0 or not l_PlatformInterface_0:IsInAParty(l_l_PlatformInterface_0_PartyMembersAsync_0)) then
        v14:SendAchievementEventAsync("AwardStrengthInNumbers");
        if v16 then
            v16:disconnect();
            v16 = nil;
        end;
    end;
end;
v14.SendAchievementEventAsync = function(_, v49)
    v18[v49] = true;
    l_Utility_0.DebugLog("Achievement Manager - Awarding achievement:", v49);
    local v50 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
            v50 = v0:BeginAwardAchievement(v49);
        end;
    end);
    if not l_status_0 then
        l_Utility_0.DebugLog("Achievement Manager - Unable to award achievement:", v49, "for reason:", l_result_0);
    end;
    l_Utility_0.DebugLog("Achievement Manager - Achievement:", v49, "event status:", v50);
end;
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.GameJoin, "AchievementManager", function(v53, v54)
    if v53 and v54 ~= nil then
        v29[v54] = true;
    end;
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.UnlockedUGC, "ShowUnlockedUGCOverlay", function(v55)
    if v55 == true then
        l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Alerts_0.UnlockedUGC), false);
    end;
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "AchievementManager", function()
    spawn(function()
        local l_rbxuid_0 = l_AppState_0.store:getState().RobloxUser.rbxuid;
        local function _()
            local l_rbxuid_1 = l_AppState_0.store:getState().RobloxUser.rbxuid;
            local v58 = false;
            if l_rbxuid_1 ~= nil then
                v58 = l_rbxuid_0 == l_rbxuid_1;
            end;
            return v58;
        end;
        if l_rbxuid_0 ~= nil then
            local v60 = l_Http_0.GetConsecutiveDaysLoggedInAsync();
            local v61 = v60 and v60.count;
            if v61 then
                if v61 >= 3 then
                    local l_rbxuid_2 = l_AppState_0.store:getState().RobloxUser.rbxuid;
                    local v63 = false;
                    if l_rbxuid_2 ~= nil then
                        v63 = l_rbxuid_0 == l_rbxuid_2;
                    end;
                    if v63 then
                        v14:SendAchievementEventAsync("Award3DayRoll");
                    end;
                end;
                if v61 >= 10 then
                    local l_rbxuid_3 = l_AppState_0.store:getState().RobloxUser.rbxuid;
                    local v65 = false;
                    if l_rbxuid_3 ~= nil then
                        v65 = l_rbxuid_0 == l_rbxuid_3;
                    end;
                    if v65 then
                        v14:SendAchievementEventAsync("Award10DayRoll");
                    end;
                end;
                if v61 >= 20 then
                    local l_rbxuid_4 = l_AppState_0.store:getState().RobloxUser.rbxuid;
                    local v67 = false;
                    if l_rbxuid_4 ~= nil then
                        v67 = l_rbxuid_0 == l_rbxuid_4;
                    end;
                    if v67 then
                        v14:SendAchievementEventAsync("Award20DayRoll");
                    end;
                end;
            end;
            if not (not v0 or v14:HasAchievementAsync(v14.AchivementId.StrengthInNumbers)) then
                v16 = v0.PartyTitlePresenceChanged:connect(v47);
                l_Utility_0.DebugLog("PartyTitlePresenceChanged: AwardStrengthInNumbers check");
                local l_l_PlatformInterface_0_PartyMembersAsync_1 = l_PlatformInterface_0:GetPartyMembersAsync();
                if not (not l_l_PlatformInterface_0_PartyMembersAsync_1 or not l_PlatformInterface_0:IsInAParty(l_l_PlatformInterface_0_PartyMembersAsync_1)) then
                    v14:SendAchievementEventAsync("AwardStrengthInNumbers");
                    if v16 then
                        v16:disconnect();
                        v16 = nil;
                    end;
                end;
            end;
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.PlayedGamesChanged);
            spawn(function()
                if l_AppState_0.store:getState().RobloxUser.rbxuid then
                    local v69 = nil;
                    if v30 then
                        v30 = false;
                        local l_l_SortsData_0_UserRecent_1 = l_SortsData_0:GetUserRecent();
                        local v71 = l_l_SortsData_0_UserRecent_1 and l_l_SortsData_0_UserRecent_1:GetSortAsync(0, 15);
                        if v71 ~= nil then
                            for _, v73 in pairs(v71) do
                                if v73.placeId ~= nil then
                                    v29[v73.placeId] = true;
                                end;
                            end;
                        end;
                    end;
                    v69 = 0;
                    for _, _ in pairs(v29) do
                        v69 = v69 + 1;
                    end;
                    l_Utility_0.DebugLog("You have played:", v69, "games");
                    if v69 >= 1 then
                        v14:SendAchievementEventAsync("AwardYouDidIt");
                    end;
                    local v76 = v14:HasAchievementAsync(v14.AchivementId.Explorer);
                    if v69 >= 5 then
                        v14:SendAchievementEventAsync("AwardSampler");
                        if v76 then
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
                        else
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, true);
                        end;
                    elseif v76 then
                        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
                    end;
                    if v69 >= 15 then
                        v14:SendAchievementEventAsync("AwardWorldTraveler");
                    end;
                end;
            end);
        end;
    end);
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.DonnedDifferentPackage, "AchievementManager", function(_)
    v14:SendAchievementEventAsync("AwardOneNameManyFaces");
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarEquipSuccess, "AchievementManager", function(_)
    v14:SendAchievementEventAsync("AwardOneNameManyFaces");
end);
l_EventHub_0:addEventListener(l_EventHub_0.Notifications.VotedOnPlace, "AchievementManager", function()
    spawn(function()
        local l_l_UserData_0_VoteCount_0 = l_UserData_0:GetVoteCount();
        l_Utility_0.DebugLog("Vote Check: with vote count", l_l_UserData_0_VoteCount_0);
        if l_l_UserData_0_VoteCount_0 >= 5 then
            v14:SendAchievementEventAsync("AwardPollster");
        end;
    end);
end);
if v0 then
    v0.ViewChanged:connect(function(v80)
        l_Utility_0.DebugLog("ViewChanged:", v80);
        l_AppShell_0 = v80;
        if v80 == v13.AppShell then
            l_Utility_0.DebugLog("New view is appshell");
            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.PlayedGamesChanged);
            spawn(function()
                if l_AppState_0.store:getState().RobloxUser.rbxuid then
                    local v81 = nil;
                    if v30 then
                        v30 = false;
                        local l_l_SortsData_0_UserRecent_2 = l_SortsData_0:GetUserRecent();
                        local v83 = l_l_SortsData_0_UserRecent_2 and l_l_SortsData_0_UserRecent_2:GetSortAsync(0, 15);
                        if v83 ~= nil then
                            for _, v85 in pairs(v83) do
                                if v85.placeId ~= nil then
                                    v29[v85.placeId] = true;
                                end;
                            end;
                        end;
                    end;
                    v81 = 0;
                    for _, _ in pairs(v29) do
                        v81 = v81 + 1;
                    end;
                    l_Utility_0.DebugLog("You have played:", v81, "games");
                    if v81 >= 1 then
                        v14:SendAchievementEventAsync("AwardYouDidIt");
                    end;
                    local v88 = v14:HasAchievementAsync(v14.AchivementId.Explorer);
                    if v81 >= 5 then
                        v14:SendAchievementEventAsync("AwardSampler");
                        if v88 then
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
                        else
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, true);
                        end;
                    elseif v88 then
                        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.UnlockedUGC, false);
                    end;
                    if v81 >= 15 then
                        v14:SendAchievementEventAsync("AwardWorldTraveler");
                    end;
                end;
            end);
            return ;
        else
            if v80 == v13.Game then
                l_Utility_0.DebugLog("New view is game");
                v45();
            end;
            return ;
        end;
    end);
end;
local v89 = 0;
if v1 then
    v1.ActiveUserSignedOut:connect(function()
        v89 = v89 + 1;
        v18 = {};
    end);
end;
v14.HasAchievementAsync = function(_, v91)
    local l_v89_0 = v89;
    if UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
        v18[v17[v91]] = true;
        return true;
    elseif v18[v17[v91]] == true then
        return true;
    else
        local l_status_1, l_result_1 = pcall(function()
            return v0:BeginHasAchievement(v91);
        end);
        if l_status_1 then
            if l_v89_0 == v89 and l_result_1 == true then
                v18[v17[v91]] = l_result_1;
            end;
            return l_result_1 or v18[v17[v91]];
        else
            return false;
        end;
    end;
end;
v14.AllGamesUnlocked = function(_)
    return v18[v17[v14.AchivementId.Explorer]];
end;
return v14;
