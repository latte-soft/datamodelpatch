return function(v0, ...)
    local v1 = {
        ...
    };
    assert(type(v0) == "string", "Bad argument #1 to makeActionCreator, expected string");
    for v2 = 1, select("#", ...) do
        assert(typeof(select(v2, ...)) == "string", "Bad argument to makeActionCreator, all arguments must be of type string");
    end;
    return (setmetatable({
        name = v0
    }, {
        __call = function(_, ...)
            local v4 = {
                type = v0
            };
            assert(select("#", ...) == #v1, "Incorrect number of arguments provided to action creator " .. v0);
            for v5, v6 in ipairs(v1) do
                v4[v6] = select(v5, ...);
            end;
            return v4;
        end
    }));
end;
