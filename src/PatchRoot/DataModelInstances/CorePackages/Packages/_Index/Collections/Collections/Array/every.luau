local l___DEV___0 = _G.__DEV__;
local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v2, v3, v4)
    if l___DEV___0 then
        if typeof(v2) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(v2))));
        end;
        if typeof(v3) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v5 = #v2;
    local v6 = 1;
    while true do
        if v6 <= v5 then
            local v7 = v2[v6];
            local _ = nil;
            if not (v7 ~= nil) or if v4 ~= nil then v3(v4, v7, v6, v2) else v3(v7, v6, v2) then
                v6 = v6 + 1;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
end;
