local l_rolloutByApplicationId_0 = require(script:FindFirstAncestor("SocialTab").Parent.AppCommonLib).rolloutByApplicationId;
game:DefineFastInt("SocialTabUserProfileApiRollout", 0);
game:DefineFastFlag("SocialTabUserProfileApiEnabledForAll", false);
local function v1()
    return game:GetFastInt("SocialTabUserProfileApiRollout");
end;
local function _()
    return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll");
end;
local v3 = l_rolloutByApplicationId_0(v1);
return function()
    return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll") or v3();
end;
