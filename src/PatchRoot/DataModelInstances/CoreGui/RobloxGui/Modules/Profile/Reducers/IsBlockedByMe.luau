local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
local l_NetworkingBlocking_0 = v0.NetworkingBlocking;
return l_Rodux_0.createReducer({}, {
    [l_NetworkingBlocking_0.GetBlockedUsers.Succeeded.name] = function(_, v5)
        local v6 = not not v5.responseBody and v5.responseBody.blockedUsers or {};
        local v7 = {};
        for _, v9 in ipairs(v6) do
            v7[tostring(v9.userId)] = true;
        end;
        return v7;
    end, 
    [l_NetworkingBlocking_0.BlockUserById.Succeeded.name] = function(v10, v11)
        return l_Dash_0.join(v10, {
            [tostring(v11.namedIds.users)] = true
        });
    end, 
    [l_NetworkingBlocking_0.UnblockUserById.Succeeded.name] = function(v12, v13)
        return l_Dash_0.join(v12, {
            [tostring(v13.namedIds.users)] = false
        });
    end
});
