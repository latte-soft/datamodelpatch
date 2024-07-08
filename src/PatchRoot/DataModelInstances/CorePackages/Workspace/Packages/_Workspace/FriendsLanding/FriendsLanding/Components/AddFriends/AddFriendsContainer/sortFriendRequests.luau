local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
return function(v3)
    assert(l_t_0.table(v3));
    return l_llama_0.List.sort(v3, function(v4, v5)
        local v6 = not not v4.sentAt and v4.sentAt.UnixTimestampMillis or 0;
        local v7 = not not v5.sentAt and v5.sentAt.UnixTimestampMillis or 0;
        if v6 ~= v7 then
            return v7 < v6;
        elseif not v4.displayName or v5.displayName then
            if v4.displayName or not v5.displayName then
                if not (not v4.displayName or not v5.displayName) and string.lower(v4.displayName) ~= string.lower(v5.displayName) then
                    return string.lower(v4.displayName) < string.lower(v5.displayName);
                elseif not v4.username or not v5.username then
                    if not v4.username or v5.username then
                        return false;
                    else
                        return true;
                    end;
                else
                    return string.lower(v4.username) < string.lower(v5.username);
                end;
            else
                return false;
            end;
        else
            return true;
        end;
    end);
end;
