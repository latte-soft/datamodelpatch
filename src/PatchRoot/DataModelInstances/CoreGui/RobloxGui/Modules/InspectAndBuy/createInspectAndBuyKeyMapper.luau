return function(v0)
    return function(v1, ...)
        local v2 = "inspectAndBuy." .. v1 .. "." .. v0;
        for v3 = 1, select("#", ...) do
            v2 = v2 .. "." .. tostring(select(v3, ...));
        end;
        return v2;
    end;
end;
