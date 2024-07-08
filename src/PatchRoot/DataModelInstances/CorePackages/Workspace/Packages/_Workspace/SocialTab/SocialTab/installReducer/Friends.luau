local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_llama_0 = v0.llama;
local l_RoduxFriends_0 = v0.RoduxFriends;
local function v4(v3)
    return l_RoduxFriends_0.Actions.FriendshipCreated(v3.id, "localUserId");
end;
local v10 = {
    AddUser = function(v5)
        if not v5.user.isFriend then
            return {
                v5
            };
        else
            return {
                v4(v5.user)
            };
        end;
    end, 
    AddUsers = function(v6)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v6.users, function(v7, _)
            if not v7.isFriend then
                return nil;
            else
                return v4(v7);
            end;
        end));
    end, 
    SetFriendRequestsCount = function(v9)
        return {
            l_RoduxFriends_0.Actions.RequestReceivedCountUpdated(v9.count)
        };
    end
};
local v11 = l_RoduxFriends_0.installReducer();
return function(v12, v13)
    v12 = v12 or {
        countsByUserId = {}, 
        byUserId = {}, 
        requests = {
            receivedCount = 0
        }
    };
    local v14 = {
        v13
    };
    local v15 = v10[v13.type];
    if v15 then
        v14 = v15(v13);
    end;
    return l_llama_0.List.reduce(v14, v11, v12);
end;
