return function(v0)
    local v1 = type(v0);
    local v2 = true;
    if v1 ~= "function" then
        v2 = false;
        if v1 == "table" then
            v2 = type(v0.render) == "function";
        end;
    end;
    return v2;
end;
