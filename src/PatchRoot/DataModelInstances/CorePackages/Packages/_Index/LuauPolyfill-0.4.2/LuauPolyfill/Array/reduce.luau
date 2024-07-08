local _ = require(script.Parent.Parent.types);
return function(v1, v2, v3)
    if _G.__DEV__ then
        if typeof(v1) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(v1))));
        end;
        if typeof(v2) ~= "function" then
            error("callback is not a function");
        end;
    end;
    local v4 = #v1;
    local v5 = nil;
    local v6 = 1;
    if v3 ~= nil then
        v5 = v3;
    else
        v6 = 2;
        if v4 == 0 then
            error("reduce of empty array with no initial value");
        end;
        v5 = v1[1];
    end;
    for v7 = v6, v4 do
        v5 = v2(v5, v1[v7], v7, v1);
    end;
    return v5;
end;
