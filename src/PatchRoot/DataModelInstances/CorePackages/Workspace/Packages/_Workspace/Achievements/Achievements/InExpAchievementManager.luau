local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signal);
local l_PlatformServiceOrStub_0 = require(l_Parent_0.TenFootUiShell).PlatformServiceOrStub;
local v4 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_Parent_0.HttpRequest);
local v7 = require(l_script_FirstAncestor_0.Requests.GetUserRecentExperiences);
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.Dash);
local v10 = require(l_script_FirstAncestor_0.AchievementDataRefresher.TimeRefresher);
local v11 = require(l_script_FirstAncestor_0.AchievementDataRefresher.FriendCountRefresher);
local v15 = v6.config({
    requestFunction = function(v12, v13, v14)
        return v6.requestFunctions.HttpRbxApi(v12, v13, v14);
    end
});
local v16 = nil;
pcall(function()
    v16 = game:GetService("PlatformFriendsService");
end);
local v17 = nil;
pcall(function()
    v17 = game:GetService("PlatformCloudStorageService");
end);
local v18 = game:DefineFastFlag("StrengthInNumbersPlatformFriendsServiceCheck", false);
local v19 = {};
local _ = function(v20)
    for _, v22 in pairs(v20) do
        if v22.universeId == game.GameId then
            return true;
        end;
    end;
    return false;
end;
v19.startUp = function(v24)
    local v25, v26 = v2.createReadableSignal(0);
    local v27, v28 = v2.createReadableSignal(0);
    local v29, v30 = v2.createReadableSignal(0);
    local v31, v32 = v2.createReadableSignal(0);
    v10:init(v26, 3600);
    v11:init(v32, game:GetService("Players"));
    v24.awardDeepDiver = v4.newWithRefresher(v4.NAMES.AWARD_DEEP_DIVER, v25, v10);
    v24.awardFoursCompany = v4.newWithRefresher(v4.NAMES.AWARD_FOURS_COMPANY, v31, v11);
    v24.awardYouDidIt = v4.new(v4.NAMES.AWARD_YOU_DID_IT, v27);
    v24.awardSampler = v4.new(v4.NAMES.AWARD_SAMPLER, v27);
    v24.awardWorldTraveler = v4.new(v4.NAMES.AWARD_WORLD_TRAVELER, v27);
    v24.awardStrengthInNumbers = v4.new(v4.NAMES.AWARD_STRENGTH_IN_NUMBERS, v29);
    if not v18 then
        local l_l_PlatformServiceOrStub_0_PlatformPartyMembers_0 = l_PlatformServiceOrStub_0:GetPlatformPartyMembers();
        v30(not l_l_PlatformServiceOrStub_0_PlatformPartyMembers_0 and 0 or #l_l_PlatformServiceOrStub_0_PlatformPartyMembers_0);
    else
        v24:_checkStrengthInNumbers(v30);
    end;
    v24:_checkJoinExperienceAchievements(v28);
end;
v19._checkJoinExperienceAchievements = function(v34, v35)
    v8.all(v34.awardYouDidIt:hasAchieved(), v34.awardSampler:hasAchieved(), v34.awardWorldTraveler:hasAchieved()):andThen(function(v36)
        if v9.some(v36, function(v37, _)
            return v37 == false;
        end) then
            if not v34.platformCloudStorageService or not v34.platformCloudStorageService:IsUserDataAvailable() then
                v7(v34.requestImpl, 15):andThen(function(v39)
                    if v39.responseBody == nil then
                        v5:warning("Response has no body.");
                        return ;
                    else
                        local l_games_0 = v39.responseBody.games;
                        if l_games_0 == nil then
                            v5:warning("Response has no experiences.");
                            return ;
                        else
                            local v41 = #l_games_0;
                            local v42;
                            for _, v44 in pairs(l_games_0) do
                                if v44.universeId == game.GameId then
                                    v42 = true;
                                    goto label0 --[[  true, false  ]];
                                end;
                            end;
                            v42 = false;
                            ::label0::;
                            if not v42 then
                                v41 = v41 + 1;
                            end;
                            v35(v41);
                            return ;
                        end;
                    end;
                end);
                return ;
            else
                local v45 = v34.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {};
                if not (not (#v45 < 15) or v9.includes(v45, game.GameId)) then
                    table.insert(v45, game.GameId);
                    v34.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", {
                        data = v45
                    });
                end;
                v35(#v45);
                return ;
            end;
        else
            return ;
        end;
    end):catch(function(v46)
        v5:warning(v46);
    end);
end;
v19._checkStrengthInNumbers = function(v47, v48)
    v47.awardStrengthInNumbers:hasAchieved():andThen(function(v49)
        if not v49 then
            local l_l_PlatformServiceOrStub_0_PlatformPartyMembers_1 = l_PlatformServiceOrStub_0:GetPlatformPartyMembers();
            if l_l_PlatformServiceOrStub_0_PlatformPartyMembers_1 then
                v48(#l_l_PlatformServiceOrStub_0_PlatformPartyMembers_1);
            end;
            if not ((not game:GetEngineFeature("PlatformFriendsService") or not v47.platformFriendsService) or not game:GetEngineFeature("PlatformFriendsServiceGetPartyMembers")) then
                local l_PartyMembers_0 = v47.platformFriendsService:GetPartyMembers();
                if l_PartyMembers_0 then
                    v48(#l_PartyMembers_0);
                end;
            end;
        end;
    end):catch(function(v52)
        v5:warning(v52);
    end);
end;
v19.new = function(v53, v54, v55)
    return (setmetatable({
        requestImpl = v53 or v15, 
        platformFriendsService = v54 or v16, 
        platformCloudStorageService = v55 or v17
    }, {
        __index = v19
    }));
end;
return v19;
