return function(v0, v1)
    if type(v0) ~= "string" then
        return "";
    elseif type(v1) ~= "table" then
        return v0;
    else
        local l_v0_0 = v0;
        for v3, v4 in pairs(v1) do
            if type(v3) == "string" and type(v4) == "string" then
                l_v0_0 = string.gsub(l_v0_0, v3, v4);
            end;
        end;
        return l_v0_0;
    end;
end;
