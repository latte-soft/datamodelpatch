local l_Array_0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.LuauPolyfill).Array;
return function(v1, v2)
    v1 = v1 or {};
    v2 = v2 or {};
    if #v2 == 0 then
        return v1;
    elseif #v1 == 0 then
        return v2;
    else
        return l_Array_0.concat(table.clone(v1), v2);
    end;
end;
