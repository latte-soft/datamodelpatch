local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostRequestFriendship);
local v4 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v8, v9, v10)
    v7.isType(v9, "string", "Thunks.RequestFriendship.userId");
    return l_PerformFetch_0.Single("luaapp.friends.requestfriendship." .. v9, function(v11)
        return (v3(v8, v9, v10 or "PlayerSearch"):andThen(function(v12)
            if not (not v12 or not v12.responseBody) and v12.responseBody.success == true then
                v11:dispatch(v4(v9, Enum.FriendStatus.FriendRequestSent));
            end;
            return v12;
        end, function(v13)
            v11:dispatch(v5(v13));
            return v2.reject(v13);
        end));
    end);
end;
