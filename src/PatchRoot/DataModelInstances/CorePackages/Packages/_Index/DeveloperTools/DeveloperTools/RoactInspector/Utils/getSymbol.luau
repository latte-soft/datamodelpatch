local v0 = {};
return function(v1, v2)
    if v0[v2] and v1[v0[v2]] ~= nil then
        return v1[v0[v2]];
    else
        for v3, v4 in pairs(v1) do
            if tostring(v3) == "Symbol(" .. v2 .. ")" then
                v0[v2] = v3;
                return v4;
            end;
        end;
        return nil;
    end;
end;
