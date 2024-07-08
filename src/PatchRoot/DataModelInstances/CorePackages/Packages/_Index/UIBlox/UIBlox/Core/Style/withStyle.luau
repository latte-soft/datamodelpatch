local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Parent.Roact);
local v2 = require(l_Parent_0.StyleConsumer);
return function(v3)
    assert(type(v3) == "function", "Expect renderCallback to be a function.");
    return v1.createElement(v2, {
        render = function(v4)
            return v3(v4.style);
        end
    });
end;
