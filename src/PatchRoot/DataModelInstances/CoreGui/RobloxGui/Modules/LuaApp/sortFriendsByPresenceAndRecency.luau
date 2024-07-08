local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Models.User);
local l_useLastOnlineForSort_0 = require(l_Modules_0.LuaApp.sortFriendsUtilities).useLastOnlineForSort;
local l_getFriendWeight_0 = require(l_Modules_0.LuaApp.sortFriendsUtilities).getFriendWeight;
return function(v4, v5)
    local v6 = l_getFriendWeight_0(v4);
    local v7 = l_getFriendWeight_0(v5);
    if v6 == v7 then
        if not (v4.presence ~= v1.PresenceType.OFFLINE) or not l_useLastOnlineForSort_0(v4.lastOnline, v5.lastOnline) then
            return v4.name:lower() < v5.name:lower();
        else
            return v5.lastOnline < v4.lastOnline;
        end;
    else
        return v7 < v6;
    end;
end;
