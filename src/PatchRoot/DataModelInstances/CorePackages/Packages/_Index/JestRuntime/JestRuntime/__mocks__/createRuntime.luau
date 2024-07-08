local v0 = require(script.Parent.Parent.Parent.Promise);
local v1 = require(script.Parent.Parent);
return function(_)
    return v0.resolve():andThen(function()
        local v3 = v1.new();
        v3.__mockRootPath = script.Parent.Parent.__tests__.test_root;
        return v3;
    end);
end;
