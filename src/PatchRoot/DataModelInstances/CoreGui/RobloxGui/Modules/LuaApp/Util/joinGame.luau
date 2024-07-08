local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol.default;
local l_GameParams_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameParams;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_UseExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).Flags.UseExperienceService;
local v5 = {};
local function _(v6, v7, v8)
    if not l_UseExperienceService_0() then
        l_default_0:launchGame(v6, v7, v8);
        return ;
    else
        l_ExperienceService_0:LaunchExperience(v6, v7, v8);
        return ;
    end;
end;
v5.ByUser = function(_, v11, v12, v13)
    local v14 = nil;
    v14 = l_GameParams_0.fromUserId(v11.id);
    assert(v14.userId ~= nil, "Joining a game by user should always be done by user id");
    local l_v14_0 = v14;
    if not l_UseExperienceService_0() then
        l_default_0:launchGame(l_v14_0, v12, v13);
        return ;
    else
        l_ExperienceService_0:LaunchExperience(l_v14_0, v12, v13);
        return ;
    end;
end;
v5.ByUserAndPlaceId = function(_, v17, v18, v19, v20)
    local v21 = nil;
    v21 = l_GameParams_0.fromUserId(v17.id, v18);
    assert(v21.userId ~= nil, "Joining a game by user and placeId should always contain a user id param");
    assert(v21.placeId ~= nil, "Joining a game by user and placeId should always contain a place id param");
    local l_v21_0 = v21;
    if not l_UseExperienceService_0() then
        l_default_0:launchGame(l_v21_0, v19, v20);
        return ;
    else
        l_ExperienceService_0:LaunchExperience(l_v21_0, v19, v20);
        return ;
    end;
end;
v5.ByGame = function(_, v24, v25, v26)
    local v27 = l_GameParams_0.fromPlaceId(v24);
    if not l_UseExperienceService_0() then
        l_default_0:launchGame(v27, v25, v26);
        return ;
    else
        l_ExperienceService_0:LaunchExperience(v27, v25, v26);
        return ;
    end;
end;
return v5;
