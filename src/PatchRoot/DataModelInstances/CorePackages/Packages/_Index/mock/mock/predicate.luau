local v0 = require(script.Parent.symbols);
return function(v1)
    assert(type(v1) == "function", "Mock Error: Mock.predicate must be given a function");
    return (setmetatable({
        [v0.isPredicate] = true, 
        predicate = v1
    }, {
        __tostring = function()
            return "<Predicate>";
        end
    }));
end;
