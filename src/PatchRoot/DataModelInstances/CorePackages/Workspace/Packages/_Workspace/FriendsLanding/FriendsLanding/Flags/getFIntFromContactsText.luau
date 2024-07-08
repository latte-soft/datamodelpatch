game:DefineFastInt("FromContactsText", 0);
game:DefineFastFlag("FromContactsTextEnabledForAll", false);
local l_rolloutByApplicationId_0 = require(script:FindFirstAncestor("FriendsLanding").Parent.AppCommonLib).rolloutByApplicationId;
local function v1()
    return game:GetFastInt("FromContactsText");
end;
local function _()
    return game:GetFastFlag("FromContactsTextEnabledForAll");
end;
local v3 = l_rolloutByApplicationId_0(v1);
return function()
    return game:GetFastFlag("FromContactsTextEnabledForAll") or v3();
end;
