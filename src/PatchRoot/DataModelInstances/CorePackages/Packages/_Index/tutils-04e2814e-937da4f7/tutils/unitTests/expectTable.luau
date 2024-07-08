local v0 = require(script.Parent.Parent.shallowEqual);
local v1 = require(script.Parent.Parent.toString);
return function(v2)
    return {
        toEqual = function(v3)
            assert(v0(v2, v3), string.format("expected: %s\ninstead got: %s", v1(v3), v1(v2)));
        end
    };
end;
