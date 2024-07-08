local v0 = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue);
return function(v1, v2)
    local v3 = v0(v1, string.format("ChatAppReducer.Conversations.%s", v2 or ""));
    if not (not v3 or not v3.usersTyping) and v1.Users then
        local l_usersTyping_0 = v3.usersTyping;
        local l_Users_0 = v1.Users;
        local v6 = {};
        for v7, v8 in pairs(l_usersTyping_0) do
            if not (not (v7 ~= v1.LocalUserId) or not v8) then
                table.insert(v6, l_Users_0[v7]);
            end;
        end;
        return v6;
    else
        return {};
    end;
end;
