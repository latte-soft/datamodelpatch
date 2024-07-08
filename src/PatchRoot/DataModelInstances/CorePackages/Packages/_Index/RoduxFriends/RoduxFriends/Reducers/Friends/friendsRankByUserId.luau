local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v5 = {};
return function(v6)
    return v2.createReducer(v5, {
        [v6.friendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(v7, v8)
            if v8.queryArgs and v8.queryArgs.userSort then
                return v3.Dictionary.join(v7, {
                    [tostring(v8.namedIds.users)] = v3.Dictionary.map(v8.responseBody.data or {}, function(v9, v10)
                        return v10, (tostring(v9.id));
                    end)
                });
            else
                return v7;
            end;
        end
    });
end;
