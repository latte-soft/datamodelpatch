local _ = require(script.Parent.Parent.types);
return function(v1, v2, v3)
    if _G.__DEV__ then
        if typeof(v1) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(v1))));
        end;
        if typeof(v2) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v4 = #v1;
    local v5 = 1;
    while true do
        if v5 <= v4 then
            local v6 = v1[v5];
            local _ = nil;
            if not (v6 ~= nil) or if v3 ~= nil then v2(v3, v6, v5, v1) else v2(v6, v5, v1) then
                v5 = v5 + 1;
            else
                return false;
            end;
        else
            return true;
        end;
    end;
end;
