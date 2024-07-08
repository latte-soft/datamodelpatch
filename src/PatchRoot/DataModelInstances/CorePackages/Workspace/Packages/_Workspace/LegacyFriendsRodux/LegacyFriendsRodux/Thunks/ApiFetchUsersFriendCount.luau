local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UsersGetFriendCount_0 = require(l_script_FirstAncestor_0.Requests).UsersGetFriendCount;
local l_SetFriendCount_0 = require(l_script_FirstAncestor_0.Actions).SetFriendCount;
local l_isNewFriendsEndpointsEnabled_0 = require(l_Parent_0.SharedFlags).isNewFriendsEndpointsEnabled;
return function(v5)
    return function(v6)
        return l_UsersGetFriendCount_0(v5):andThen(function(v7)
            local l_responseBody_0 = v7.responseBody;
            if not l_isNewFriendsEndpointsEnabled_0() then
                if not (not l_responseBody_0.success or not l_responseBody_0.count) then
                    v6:dispatch(l_SetFriendCount_0(l_responseBody_0.count));
                end;
            elseif l_responseBody_0.count then
                v6:dispatch(l_SetFriendCount_0(l_responseBody_0.count));
            end;
            return l_responseBody_0.count;
        end);
    end;
end;
