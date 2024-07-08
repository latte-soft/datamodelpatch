local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Http.Blocking);
return v2.createReducer({}, {
    [v4.GetBlockedUsers.Succeeded.name] = function(_, v6)
        local v7 = not not v6.responseBody and v6.responseBody.blockedUsers or {};
        local v8 = {};
        for _, v10 in ipairs(v7) do
            v8[tostring(v10.userId)] = true;
        end;
        return v8;
    end, 
    [v4.BlockUserById.Succeeded.name] = function(v11, v12)
        return v3.join(v11, {
            [tostring(v12.namedIds.users)] = true
        });
    end, 
    [v4.UnblockUserById.Succeeded.name] = function(v13, v14)
        return v3.join(v13, {
            [tostring(v14.namedIds.users)] = false
        });
    end
});
