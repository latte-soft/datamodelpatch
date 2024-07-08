return function(v0)
    local v1 = true;
    if type(v0) ~= "function" then
        if not (not (type(v0) == "table") or not getmetatable(v0)) then
            v1 = true;
            if not (getmetatable(v0).__call == nil) then
                goto label0;
            end;
        end;
        v1 = false;
    end;
    ::label0::;
    return v1;
end;
