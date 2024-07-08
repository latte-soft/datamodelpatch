local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostAcceptFriendRequest);
local v4 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v8, v9)
    v7.isType(v9, "string", "Thunks.AcceptFriendRequest.userId");
    return l_PerformFetch_0.Single("luaapp.friends.acceptfriendrequest." .. v9, function(v10)
        return v3(v8, v9):andThen(function(_)
            v10:dispatch(v4(v9, Enum.FriendStatus.Friend));
        end, function(v12)
            v10:dispatch(v5(v12));
            return v2.reject(v12);
        end);
    end);
end;
