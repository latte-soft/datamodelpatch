return function(v0)
    local v1 = {};
    if not ((not (v0 ~= nil and v0.errors ~= nil) or not v0.errors[1]) or not v0.errors[1].fieldData) then
        local v2 = 0;
        for v3 in string.gmatch(v0.errors[1].fieldData, "([^,]+)") do
            v1[v2] = v3;
            v2 = v2 + 1;
        end;
    end;
    if #v1 >= 1 then
        return v1[0], v1[1];
    elseif #v1 == 0 and v1[0] ~= nil then
        return "", v1[0];
    else
        return "", "";
    end;
end;
