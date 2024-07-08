local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local _ = require(l_Parent_0.Parent.types);
return function(v3)
    if not (not _G.__DEV__ or v1(v3)) then
        error(string.format("Array.shift called on non-array %s", (typeof(v3))));
    end;
    if #v3 > 0 then
        return table.remove(v3, 1);
    else
        return nil;
    end;
end;
