return function(v0, v1)
    if not (v0 ~= nil) or v1 == nil then
        return false;
    else
        local v2 = false;
        if v0.UserInputType == Enum.UserInputType.Touch then
            v2 = v1 ~= v0;
        end;
        return v2;
    end;
end;
