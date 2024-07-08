local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetFriendRequestsCount);
local v3 = require(l_Modules_0.LuaApp.Actions.SetFriendRequestsCount);
return function(v4)
    return l_PerformFetch_0.Single("luaapp.friendsapi.friend-requests-count", function(v5)
        return v2(v4):andThen(function(v6)
            v5:dispatch(v3(v6.responseBody.count));
            return v6;
        end);
    end);
end;
