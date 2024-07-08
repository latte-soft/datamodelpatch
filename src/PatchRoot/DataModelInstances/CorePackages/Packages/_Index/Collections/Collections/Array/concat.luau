local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
local v5 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(v6, ...)
    local v7 = nil;
    local v8 = 0;
    if not v3(v6) then
        v8 = v8 + 1;
        v7 = {
            [v8] = v6
        };
    else
        v7 = table.clone(v6);
        v8 = #v6;
    end;
    for v9 = 1, select("#", ...) do
        local v10 = select(v9, ...);
        local v11 = typeof(v10);
        if not (v10 == nil) then
            if v11 == "table" then
                if not (not l___DEV___0 or v3(v10)) then
                    error(v5);
                end;
                for v12 = 1, #v10 do
                    v8 = v8 + 1;
                    v7[v8] = v10[v12];
                end;
            else
                v8 = v8 + 1;
                v7[v8] = v10;
            end;
        end;
    end;
    return v7;
end;
