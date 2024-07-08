local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Immutable_0 = require(l_Parent_1.AppCommonLib).Immutable;
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
local v5 = require(l_Actions_0.ReceivedUserInviteStatus);
local v6 = require(l_Actions_0.ResetUserInviteStatus);
return function(v7, v8)
    v7 = v7 or {};
    if v8.type == v5.name then
        return (l_Immutable_0.Set(v7, v8.userId, v8.inviteStatus));
    else
        if l_GetFFlagEnableUniversalAppGameInviteUnification_0() and v8.type == v6.name then
            v7 = {};
        end;
        return v7;
    end;
end;
