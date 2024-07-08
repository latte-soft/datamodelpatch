local v0 = require(script.Parent.fmtArgs);
return function(v1, v2)
    if v1.n ~= v2.n then
        return false, "number of args in " .. v0(v2) .. " does not match number of predicates";
    else
        for v3 = 1, v2.n do
            if not v1[v3](v2[v3]) then
                return false, v0(v2) .. " does not match predicates at position " .. v3;
            end;
        end;
        return true;
    end;
end;
