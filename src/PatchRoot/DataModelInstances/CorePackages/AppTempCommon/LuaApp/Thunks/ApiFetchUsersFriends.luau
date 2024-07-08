local l_CorePackages_0 = game:GetService("CorePackages");
local l_Requests_0 = require(l_CorePackages_0.Workspace.Packages.Http).Requests;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_ApiFetchUsersPresences_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.ApiFetchUsersPresences;
local l_DEPRECATED_UsersGetFriends_0 = l_Requests_0.DEPRECATED_UsersGetFriends;
local l_FetchUserFriendsStarted_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsStarted;
local l_FetchUserFriendsFailed_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsFailed;
local l_FetchUserFriendsCompleted_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Actions.FetchUserFriendsCompleted;
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
return function(v10, v11, _, v13)
    return function(v14)
        v14:dispatch(l_FetchUserFriendsStarted_0(v11));
        local v15 = {};
        return l_DEPRECATED_UsersGetFriends_0(v10, v11, v13):andThen(function(v16)
            local l_responseBody_0 = v16.responseBody;
            local v18 = {};
            for v19, v20 in pairs(l_responseBody_0.data) do
                local v21 = tostring(v20.id);
                v20.isFriend = true;
                v20.friendRank = v19;
                local v22 = l_UserModel_0.fromDataTable(v20);
                table.insert(v15, v21);
                v18[v22.id] = v22;
            end;
            v14:dispatch(l_UpdateUsers_0(v18));
            return v15;
        end):andThen(function(v23)
            return v14:dispatch(l_ApiFetchUsersPresences_0(v10, v23));
        end):andThen(function(_)
            v14:dispatch(l_FetchUserFriendsCompleted_0(v11));
            return v2.resolve(v15);
        end, function(v25)
            v14:dispatch(l_FetchUserFriendsFailed_0(v11, v25));
            return v2.reject(v25);
        end);
    end;
end;
