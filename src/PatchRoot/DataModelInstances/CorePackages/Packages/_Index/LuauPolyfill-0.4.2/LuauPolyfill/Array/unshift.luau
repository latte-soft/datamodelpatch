local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local _ = require(l_Parent_0.Parent.types);
return function(v3, ...)
    if not (not _G.__DEV__ or v1(v3)) then
        error(string.format("Array.unshift called on non-array %s", (typeof(v3))));
    end;
    local v4 = select("#", ...);
    if v4 > 0 then
        for v5 = v4, 1, -1 do
            table.insert(v3, 1, (select(v5, ...)));
        end;
    end;
    return #v3;
end;
