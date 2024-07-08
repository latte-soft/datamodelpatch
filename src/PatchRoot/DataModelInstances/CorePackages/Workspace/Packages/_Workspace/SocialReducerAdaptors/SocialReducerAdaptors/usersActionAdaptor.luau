local l_llama_0 = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama;
return function(v1)
    local function v3(v2)
        return v1.Actions.UserUpdated({
            id = v2.id, 
            username = v2.name, 
            displayName = v2.displayName, 
            hasVerifiedBadge = v2.hasVerifiedBadge, 
            created = v2.created
        });
    end;
    return {
        AddUser = function(v4)
            return {
                v3(v4.user)
            };
        end, 
        AddUsers = function(v5)
            return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v5.users, v3));
        end
    };
end;
