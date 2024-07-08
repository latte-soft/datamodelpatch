return function(v0)
    local v1 = false;
    if typeof(v0) == "number" then
        v1 = false;
        if v0 == v0 then
            v1 = false;
            if v0 ~= math.huge then
                v1 = v0 ~= -math.huge;
            end;
        end;
    end;
    return v1;
end;
