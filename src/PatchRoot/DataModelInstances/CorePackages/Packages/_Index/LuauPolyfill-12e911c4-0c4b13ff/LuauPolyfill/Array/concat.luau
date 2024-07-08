local v0 = require(script.Parent.isArray);
local v1 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(v2, ...)
    local v3 = {};
    local v4 = 0;
    if not v0(v2) then
        v4 = v4 + 1;
        v3[v4] = v2;
    else
        for _, v6 in ipairs(v2) do
            v4 = v4 + 1;
            v3[v4] = v6;
        end;
    end;
    for v7 = 1, select("#", ...) do
        local v8 = select(v7, ...);
        local v9 = typeof(v8);
        if not (v8 == nil) then
            if v9 == "table" then
                if not (not _G.__DEV__ or v0(v8)) then
                    error(v1);
                end;
                for v10 = 1, #v8 do
                    v4 = v4 + 1;
                    v3[v4] = v8[v10];
                end;
            else
                v4 = v4 + 1;
                v3[v4] = v8;
            end;
        end;
    end;
    return v3;
end;
