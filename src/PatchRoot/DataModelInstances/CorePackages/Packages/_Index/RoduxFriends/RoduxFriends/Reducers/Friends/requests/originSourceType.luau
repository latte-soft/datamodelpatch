local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.Parent.Parent.Parent.getDeepValue);
local v3 = require(l_Parent_0.llama);
local v4 = {};
return function(v5)
    return v1.createReducer(v4, {
        [v5.friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, v7)
            return (v3.Dictionary.map(v7.responseBody.data, function(v8)
                return v2(v8, "friendRequest.originSourceType"), (tostring(v8.id));
            end));
        end
    });
end;
