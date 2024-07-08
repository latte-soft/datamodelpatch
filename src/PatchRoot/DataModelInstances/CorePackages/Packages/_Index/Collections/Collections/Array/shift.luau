local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
return function(v5)
    if not (not l___DEV___0 or v3(v5)) then
        error(string.format("Array.shift called on non-array %s", (typeof(v5))));
    end;
    if #v5 > 0 then
        return table.remove(v5, 1);
    else
        return nil;
    end;
end;
