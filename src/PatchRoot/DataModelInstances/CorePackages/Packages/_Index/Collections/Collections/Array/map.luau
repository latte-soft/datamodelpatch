local l___DEV___0 = _G.__DEV__;
local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v2, v3, v4)
    if l___DEV___0 then
        if typeof(v2) ~= "table" then
            error(string.format("Array.map called on %s", (typeof(v2))));
        end;
        if typeof(v3) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v5 = #v2;
    local v6 = {};
    local v7 = 1;
    while v7 <= v5 do
        local v8 = v2[v7];
        if v8 ~= nil then
            local _ = nil;
            v6[v7] = if v4 ~= nil then v3(v4, v8, v7, v2) else v3(v8, v7, v2);
        end;
        v7 = v7 + 1;
    end;
    return v6;
end;
