local l_Array_0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array;
return function(_, v2, v3)
    v2 = v2 or {};
    v3 = v3 or {};
    if #v3 == 0 then
        return v2;
    elseif #v2 == 0 then
        return v3;
    else
        return l_Array_0.concat(table.clone(v2), v3);
    end;
end;
