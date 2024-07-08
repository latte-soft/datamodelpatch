local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local _ = require(l_Parent_0.Parent.types);
local v3 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(v4, ...)
    local v5 = nil;
    local v6 = 0;
    if not v1(v4) then
        v6 = v6 + 1;
        v5 = {
            [v6] = v4
        };
    else
        v5 = table.clone(v4);
        v6 = #v4;
    end;
    for v7 = 1, select("#", ...) do
        local v8 = select(v7, ...);
        local v9 = typeof(v8);
        if not (v8 == nil) then
            if v9 == "table" then
                if not (not _G.__DEV__ or v1(v8)) then
                    error(v3);
                end;
                for v10 = 1, #v8 do
                    v6 = v6 + 1;
                    v5[v6] = v8[v10];
                end;
            else
                v6 = v6 + 1;
                v5[v6] = v8;
            end;
        end;
    end;
    return v5;
end;
