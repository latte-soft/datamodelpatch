local l_rolloutByApplicationId_0 = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).rolloutByApplicationId;
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0);
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false);
local function v1()
    return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout");
end;
local function _()
    return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll");
end;
local v3 = l_rolloutByApplicationId_0(v1);
return function()
    return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or v3();
end;
