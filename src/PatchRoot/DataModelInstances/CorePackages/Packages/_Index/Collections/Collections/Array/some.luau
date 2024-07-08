local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v1, v2, v3)
    if typeof(v1) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(v1))));
    end;
    if typeof(v2) ~= "function" then
        error("callback is not a function");
    end;
    for v4, v5 in v1, nil, nil do
        if v3 ~= nil then
            if not (not (v5 ~= nil) or not v2(v3, v5, v4, v1)) then
                return true;
            end;
        elseif not (not (v5 ~= nil) or not v2(v5, v4, v1)) then
            return true;
        end;
    end;
    return false;
end;
