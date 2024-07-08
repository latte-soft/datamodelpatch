local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_llama_0 = v0.llama;
local l_RoduxUsers_0 = v0.RoduxUsers;
local function _(v3)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v3.id, 
        username = v3.name, 
        displayName = v3.displayName, 
        hasVerifiedBadge = v3.hasVerifiedBadge
    });
end;
return function(v5, v6)
    return l_llama_0.Dictionary.values((l_llama_0.List.reduce(v5.responseBody, function(v7, v8)
        return l_llama_0.List.reduce(v8.participants, function(v9, v10)
            local v11 = tostring(v10.targetId);
            if v9[v11] or v6.byUserId[v11] then
                return v9;
            else
                local v12 = l_llama_0.Dictionary.join(v10, {
                    id = v11
                });
                return l_llama_0.Dictionary.join(v9, {
                    [v11] = l_RoduxUsers_0.Actions.UserUpdated({
                        id = v12.id, 
                        username = v12.name, 
                        displayName = v12.displayName, 
                        hasVerifiedBadge = v12.hasVerifiedBadge
                    })
                });
            end;
        end, v7);
    end, {})));
end;
