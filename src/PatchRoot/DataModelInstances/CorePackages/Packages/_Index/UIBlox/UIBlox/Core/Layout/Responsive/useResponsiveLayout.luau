local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Parent.Parent.React);
local v2 = require(l_Parent_0.ResponsiveLayoutContext);
local v3 = require(l_Parent_0.ResponsiveLayoutConfigReader);
return function(v4, v5)
    local v6 = v1.useContext(v2);
    return v3.getValue({
        config = v6.config, 
        breakpoint = v6.breakpoint, 
        kind = v5 or v6.kind
    }, v4);
end;
