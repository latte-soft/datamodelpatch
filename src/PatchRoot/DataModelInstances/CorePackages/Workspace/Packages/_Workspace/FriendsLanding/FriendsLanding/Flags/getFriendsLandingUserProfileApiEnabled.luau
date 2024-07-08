local l_rolloutByApplicationId_0 = require(script:FindFirstAncestor("FriendsLanding").Parent.AppCommonLib).rolloutByApplicationId;
game:DefineFastInt("FriendsLandingUserProfileApiRollout", 0);
game:DefineFastFlag("FriendsLandingUserProfileApiEnabledForAll", false);
local function v1()
    return game:GetFastInt("FriendsLandingUserProfileApiRollout");
end;
local function _()
    return game:GetFastFlag("FriendsLandingUserProfileApiEnabledForAll");
end;
local function _()
    return l_rolloutByApplicationId_0(v1)();
end;
return function()
    return l_rolloutByApplicationId_0(v1)() or game:GetFastFlag("FriendsLandingUserProfileApiEnabledForAll");
end;
