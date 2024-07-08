local l_CorePackages_0 = game:GetService("CorePackages");
local l_rolloutByApplicationId_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).rolloutByApplicationId;
local l_isCharacterNameHandlerEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled;
game:DefineFastInt("LeaderboardUserProfileApiRollout", 0);
game:DefineFastFlag("LeaderboardUserProfileApiEnabledForAll", false);
local function v3()
    return game:GetFastInt("LeaderboardUserProfileApiRollout");
end;
local function _()
    return game:GetFastFlag("LeaderboardUserProfileApiEnabledForAll");
end;
local v5 = nil;
return function()
    if l_isCharacterNameHandlerEnabled_0() then
        if not v5 then
            v5 = l_rolloutByApplicationId_0(v3);
        end;
        return game:GetFastFlag("LeaderboardUserProfileApiEnabledForAll") or v5();
    else
        return false;
    end;
end;
