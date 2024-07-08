return function(v0)
    assert(type(v0) == "string", "Symbols must be created using a string name");
    local v1 = newproxy(true);
    getmetatable(v1).__tostring = function()
        return v0;
    end;
    return v1;
end;
