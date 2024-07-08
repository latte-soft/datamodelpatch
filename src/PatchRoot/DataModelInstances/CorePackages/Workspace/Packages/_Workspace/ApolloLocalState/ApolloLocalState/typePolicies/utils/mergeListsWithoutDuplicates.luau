local v0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.Cryo);
return function(v1, v2, v3)
    if not v2 or #v2 == 0 then
        return v1;
    elseif not v1 or #v1 == 0 then
        return v2;
    else
        local v5 = v0.List.toSet(v0.List.map(v1, function(v4)
            if not v3 then
                return v4;
            else
                return v4[v3];
            end;
        end));
        return v0.List.join(table.clone(v1), (v0.List.filter(v2, function(v6)
            return not v5[if not v3 then v6 else v6[v3]];
        end)));
    end;
end;
