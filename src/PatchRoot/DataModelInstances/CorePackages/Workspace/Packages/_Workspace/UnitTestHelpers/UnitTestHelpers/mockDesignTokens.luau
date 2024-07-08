local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Style);
return function(v3, v4)
    return v1.createElement(v2.DesignTokenProvider, {
        tokenMappers = v4 or {}
    }, {
        Element = v3
    });
end;
