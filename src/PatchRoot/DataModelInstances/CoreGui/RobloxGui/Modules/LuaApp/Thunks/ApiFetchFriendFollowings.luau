local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Result);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.FriendsPostFollowingExists);
local v6 = require(l_Modules_0.LuaApp.Actions.AddFriendFollowing);
return function(v7, v8)
    return l_PerformFetch_0.Single("luaapp.friends.followings", function(v9)
        return v5(v7, v8):andThen(function(v10)
            if (not v10 or not v10.responseBody) or not v10.responseBody.followings then
                return v2.reject();
            else
                local l_followings_0 = v10.responseBody.followings;
                if type(l_followings_0) ~= "table" then
                    return v4.error("ApiFetchFriendFollowings expects entries to be a table");
                else
                    for v12 = 1, #l_followings_0 do
                        local v13 = l_followings_0[v12];
                        if type(v13.userId) ~= "number" then
                            return v4.error("ApiFetchFriendFollowings expects entry.userId to be a number");
                        elseif type(v13.isFollowing) ~= "boolean" then
                            return v4.error("ApiFetchFriendFollowings expects entry.isFollowing to be a boolean");
                        else
                            v9:dispatch(v6(tostring(v13.userId), v13.isFollowing));
                        end;
                    end;
                    return v2.resolve(v10);
                end;
            end;
        end, function(v14)
            return v2.reject(v14);
        end);
    end);
end;
