return function(v0)
    local v1 = false;
    if type(v0) == "number" then
        v1 = false;
        if v0 ~= math.huge then
            v1 = v0 == math.floor(v0);
        end;
    end;
    return v1;
end;
