return function(v0)
    return (v0:gsub("+", " "):gsub("%%(%x%x)", function(v1)
        return (string.char((tonumber(v1, 16))));
    end));
end;
