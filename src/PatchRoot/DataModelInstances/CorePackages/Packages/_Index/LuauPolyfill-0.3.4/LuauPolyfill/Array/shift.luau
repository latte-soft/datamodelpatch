local v0 = require(script.Parent.isArray);
return function(v1)
    if not (not _G.__DEV__ or v0(v1)) then
        error(string.format("Array.shift called on non-array %s", (typeof(v1))));
    end;
    if #v1 > 0 then
        return table.remove(v1, 1);
    else
        return nil;
    end;
end;
