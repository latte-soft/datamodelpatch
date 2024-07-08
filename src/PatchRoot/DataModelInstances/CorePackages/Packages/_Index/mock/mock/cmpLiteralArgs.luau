local v0 = require(script.Parent.fmtArgs);
return function(v1, v2)
    if v1.n ~= v2.n then
        return false, "number of literals in " .. v0(v1) .. " does not match number of args in " .. v0(v2);
    else
        for v3 = 1, v1.n do
            if v1[v3] ~= v2[v3] then
                return false, "expected " .. v0(v1) .. ", got " .. v0(v2);
            end;
        end;
        return true;
    end;
end;
