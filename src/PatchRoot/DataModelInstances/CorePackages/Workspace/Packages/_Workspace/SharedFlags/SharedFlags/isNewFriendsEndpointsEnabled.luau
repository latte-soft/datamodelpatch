local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_Players_0 = game:GetService("Players");
local l_ThrottleUserId_0 = require(l_Parent_0.AppCommonLib).ThrottleUserId;
return function()
    return l_ThrottleUserId_0(game:DefineFastInt("LuaChatUseNewFriendsEndpointsV2", 0), l_Players_0.LocalPlayer.UserId);
end;
