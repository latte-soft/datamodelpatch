return function(v0, v1, v2)
    if typeof(v0) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    for v3, v4 in ipairs(v0) do
        if v2 ~= nil then
            if not (not (v4 ~= nil) or not v1(v2, v4, v3, v0)) then
                return true;
            end;
        elseif not (not (v4 ~= nil) or not v1(v4, v3, v0)) then
            return true;
        end;
    end;
    return false;
end;
