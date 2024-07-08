return function(v0, v1, v2)
    local v3, v4 = utf8.len(v0);
    assert(v3 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v0, (tostring(v4))));
    local v5 = tonumber(v1);
    assert(typeof(v5) == "number", "startIndexStr should be a number");
    if v5 + v3 < 0 then
        v5 = 1;
    end;
    if v3 < v5 then
        return "";
    else
        local v6 = v3 + 1;
        if v2 ~= nil then
            v6 = tonumber(v2) or (0/0);
        end;
        assert(typeof(v6) == "number", "lastIndexStr should convert to number");
        if v3 < v6 then
            v6 = v3 + 1;
        end;
        return (string.sub(v0, utf8.offset(v0, v5), utf8.offset(v0, v6) - 1));
    end;
end;
