return function(v0)
    if typeof(v0) == "function" then
        return true;
    else
        if typeof(v0) == "table" then
            local v1 = getmetatable(v0);
            if not v1 or not rawget(v1, "__call") then
                if v0._isMockFunction then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    end;
end;
