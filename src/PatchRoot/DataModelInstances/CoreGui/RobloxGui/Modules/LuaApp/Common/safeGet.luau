local function v0(v1, v2, ...)
    if v2 then
        if type(v1) ~= "table" then
            return nil;
        else
            return v0(v1[v2], ...);
        end;
    else
        return v1;
    end;
end;
return v0;
