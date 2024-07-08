local v0 = require(script:FindFirstAncestor("AppChat").Users.populateUserWithState);
local v1 = require(script.Parent.Parent.Logger);
return function(v2, v3, v4)
    local l_Users_0 = v2.Users;
    local v6 = {};
    for v7, v8 in pairs(v3) do
        local v9 = l_Users_0[v8];
        local v10 = if not v4 then nil else v4[v7];
        if not v9 then
            v1:warning("user is required in selectChatUserEntryModelList");
        else
            v6[v9.id] = v0(v2, v9, v10);
        end;
    end;
    return v6;
end;
