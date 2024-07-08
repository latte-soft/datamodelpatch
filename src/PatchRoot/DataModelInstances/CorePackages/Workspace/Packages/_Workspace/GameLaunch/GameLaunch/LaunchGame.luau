local l_Parent_0 = script:FindFirstAncestor("GameLaunch").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.ExperienceService);
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_UseExperienceService_0 = require(l_Parent_0.ExperienceService).Flags.UseExperienceService;
local l_GetFFlagMoveLuaExpLaunchBegin_0 = require(l_Parent_0.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin;
return function(v7, v8, v9, v10, v11, v12)
    if not l_GetFFlagMoveLuaExpLaunchBegin_0() then
        l_default_0:logEvent("experience_launch_begin");
    end;
    local v13 = {
        placeId = tonumber(v7), 
        referralPage = v8
    };
    if v9 then
        v13 = v2.Dictionary.join(v13, v9);
    end;
    if not l_UseExperienceService_0() then
        v10:launchGame(v13, v11, v12);
        return ;
    else
        l_ExperienceService_0:LaunchExperience(v13, v11, v12);
        return ;
    end;
end;
