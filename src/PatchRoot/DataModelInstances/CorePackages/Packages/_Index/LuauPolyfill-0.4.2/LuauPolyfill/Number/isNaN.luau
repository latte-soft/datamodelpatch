return function(v0)
    local v1 = false;
    if type(v0) == "number" then
        v1 = v0 ~= v0;
    end;
    return v1;
end;
