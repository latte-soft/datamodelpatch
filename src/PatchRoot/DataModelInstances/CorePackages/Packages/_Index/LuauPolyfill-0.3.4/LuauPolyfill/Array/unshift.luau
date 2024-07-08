local v0 = require(script.Parent.isArray);
return function(v1, ...)
    if not (not _G.__DEV__ or v0(v1)) then
        error(string.format("Array.unshift called on non-array %s", (typeof(v1))));
    end;
    local v2 = select("#", ...);
    if v2 > 0 then
        for v3 = v2, 1, -1 do
            table.insert(v1, 1, (select(v3, ...)));
        end;
    end;
    return #v1;
end;
