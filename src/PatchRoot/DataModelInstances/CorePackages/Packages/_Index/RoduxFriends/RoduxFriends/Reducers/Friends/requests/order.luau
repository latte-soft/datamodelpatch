local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux);
local v1 = {};
return function(v2)
    return v0.createReducer(v1, {
        [v2.friendsNetworking.GetFriendRequests.Succeeded.name] = function(v3, v4)
            local v5 = v3 or {};
            local v6 = v5.count or 0;
            local v7 = v5.requestsById or {};
            local l_data_0 = v4.responseBody.data;
            local l_nextPageCursor_0 = v4.responseBody.nextPageCursor;
            if l_nextPageCursor_0 == v5.lastCursor and l_nextPageCursor_0 ~= nil then
                return v5;
            else
                local _ = v6;
                for v11, v12 in ipairs(l_data_0) do
                    local v13 = v6 + v11;
                    if not v7[tostring(v12.id)] then
                        v7[tostring(v12.id)] = v13;
                    end;
                end;
                return {
                    count = v6 + #l_data_0, 
                    lastCursor = l_nextPageCursor_0, 
                    requestsById = v7
                };
            end;
        end
    });
end;
