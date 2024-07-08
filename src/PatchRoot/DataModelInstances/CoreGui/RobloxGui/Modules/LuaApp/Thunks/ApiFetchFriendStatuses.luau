local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Result);
local l_DEPRECATED_FriendsGetFriendStatuses_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests.DEPRECATED_FriendsGetFriendStatuses;
local v7 = require(l_Modules_0.LuaApp.Actions.AddFriendStatus);
local function _(v8)
    if v8 == "NotFriends" then
        return Enum.FriendStatus.NotFriend;
    elseif v8 == "Friends" then
        return Enum.FriendStatus.Friend;
    elseif v8 == "RequestSent" then
        return Enum.FriendStatus.FriendRequestSent;
    elseif v8 == "RequestReceived" then
        return Enum.FriendStatus.FriendRequestReceived;
    else
        return Enum.FriendStatus.Unknown;
    end;
end;
return function(v10, v11)
    local v12 = v2.Dictionary.join({}, v11);
    table.sort(v12);
    return l_PerformFetch_0.Single("luaapp.friends.statuses." .. table.concat(v12), function(v13)
        return l_DEPRECATED_FriendsGetFriendStatuses_0(v10, v11):andThen(function(v14)
            if (not v14 or not v14.responseBody) or not v14.responseBody.data then
                return v3.reject();
            else
                local l_data_0 = v14.responseBody.data;
                if type(l_data_0) ~= "table" then
                    return v5.error("ApiFetchFriendStatuses expects entries to be a table");
                else
                    for v16 = 1, #l_data_0 do
                        local v17 = l_data_0[v16];
                        if type(v17.id) ~= "number" then
                            return v5.error("ApiFetchFriendStatuses expects entry.id to be a number");
                        elseif type(v17.status) ~= "string" then
                            return v5.error("ApiFetchFriendStatuses expects entry.status to be a string");
                        else
                            local l_v13_0 = v13;
                            local l_v7_0 = v7;
                            local v20 = tostring(v17.id);
                            local l_status_0 = v17.status;
                            l_v13_0:dispatch(l_v7_0(v20, if l_status_0 == "NotFriends" then Enum.FriendStatus.NotFriend else if l_status_0 == "Friends" then Enum.FriendStatus.Friend else if l_status_0 == "RequestSent" then Enum.FriendStatus.FriendRequestSent else if l_status_0 == "RequestReceived" then Enum.FriendStatus.FriendRequestReceived else Enum.FriendStatus.Unknown));
                        end;
                    end;
                    return v3.resolve(v14);
                end;
            end;
        end, function(v22)
            return v3.reject(v22);
        end);
    end);
end;
