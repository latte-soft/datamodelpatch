local v0 = require(script:FindFirstAncestor("HttpRequest").Parent.Promise);
local v1 = require(script.Parent.HttpRequest);
return function(v2)
    assert(type(v2.requestFunction) == "function", "Expected requestFunction to be a function");
    return function(v3, v4, v5)
        assert(type(v3) == "string", "Expected url to be a string");
        assert(type(v4) == "string", "Expected requestMethod to be a string");
        assert(not v5 or type(v5) == "table", "Expected options to be a table");
        local v6 = v1.new(v2, v3, string.upper(v4), v5);
        return v0.new(function(v7, v8)
            coroutine.wrap(function()
                v6:start(v7, v8);
            end)();
        end), function()
            v6:cancel();
        end;
    end;
end;
