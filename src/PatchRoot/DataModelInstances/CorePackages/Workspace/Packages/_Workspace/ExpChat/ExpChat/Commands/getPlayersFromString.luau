local l_Dictionary_0 = require(script:FindFirstAncestor("ExpChat").Parent.llama).Dictionary;
return function(v1, v2)
    if v2 then
        assert(v2, "will exist");
        v2 = string.lower(v2);
        if v2 and string.sub(v2, 1, 1) == "@" then
            local v3 = v1.byUsername[string.sub(v2, 2)];
            if v3 then
                return {
                    l_Dictionary_0.join(v1.byUserId[v3], {
                        nameToDisplay = "@" .. v1.byUserId[v3].username
                    })
                };
            end;
        end;
        return l_Dictionary_0.map(v1.byDisplayName[v2] or {}, function(v4)
            return l_Dictionary_0.join(v1.byUserId[v4], {
                nameToDisplay = v1.byUserId[v4].displayName
            });
        end);
    else
        return {};
    end;
end;
