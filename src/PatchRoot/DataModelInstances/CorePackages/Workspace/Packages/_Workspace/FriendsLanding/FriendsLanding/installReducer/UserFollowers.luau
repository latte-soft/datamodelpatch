local v0 = require(script:FindFirstAncestor("FriendsLanding").dependencies);
return v0.Rodux.createReducer({}, {
    [v0.FriendsNetworking.GetUserFollowers.Succeeded.name] = function(_, v2)
        local v3 = {};
        for _, v5 in ipairs(v2.responseBody.data) do
            v3[tostring(v5.id)] = true;
        end;
        return v3;
    end
});
