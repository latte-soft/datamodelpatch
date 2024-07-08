return function(v0, v1)
    assert(type(v0) == "string", "A name must be provided to create an Action");
    assert(type(v1) == "function", "A function must be provided to create an Action");
    return (setmetatable({
        name = v0
    }, {
        __call = function(_, ...)
            local v3 = v1(...);
            assert(type(v3) == "table", "An action must return a table");
            v3.type = v0;
            return v3;
        end
    }));
end;
