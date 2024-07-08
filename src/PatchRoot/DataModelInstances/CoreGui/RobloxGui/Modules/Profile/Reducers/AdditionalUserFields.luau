local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
local l_NetworkingUsers_0 = v0.NetworkingUsers;
return l_Rodux_0.createReducer({}, {
    [l_NetworkingUsers_0.GetUserV2FromUserId.Succeeded.name] = function(v4, v5)
        local l_responseBody_0 = v5.responseBody;
        return l_Dash_0.join(v4, {
            [tostring(v5.namedIds.users)] = {
                isDeleted = l_responseBody_0.isBanned, 
                description = l_responseBody_0.description, 
                hasVerifiedBadge = l_responseBody_0.hasVerifiedBadge
            }
        });
    end, 
    [l_NetworkingUsers_0.SetDescription.Succeeded.name] = function(v7, v8)
        local l_responseBody_1 = v8.responseBody;
        local v10 = tostring(v8.additionalData.LocalUserId);
        return l_Dash_0.join(v7, {
            [v10] = {
                isDeleted = v7[v10].isBanned, 
                description = l_responseBody_1.description, 
                hasVerifiedBadge = v7[v10].hasVerifiedBadge
            }
        });
    end
});
