local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Parent.Parent.React);
local v2 = require(l_Parent_0.ResponsiveLayoutContext);
local v3 = require(l_Parent_0.ResponsiveLayoutConfigReader);
return function(v4)
    local v5 = v4.width or 1;
    local v6 = v4.config or {};
    local v7, v8 = v1.useState(function()
        return v3.findBreakpoint(v6, v5);
    end);
    v1.useLayoutEffect(function()
        v8(v3.findBreakpoint(v6, v5));
    end, {
        v6
    });
    v1.useLayoutEffect(function()
        if not (v5 >= v7.min) or v7.max < v5 then
            v8(v3.findBreakpoint(v6, v5));
        end;
    end, {
        v5, 
        v7.min, 
        v7.max
    });
    return v1.createElement(v2.Provider, {
        value = {
            config = v6, 
            breakpoint = v7.name
        }
    }, v4.children);
end;
