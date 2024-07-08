local l_inspect_0 = require(script.Parent.Parent.Collections).inspect;
return function()
    local v1 = {};
    local v2 = 0;
    local function _()
        return string.rep("  ", v2);
    end;
    v1.log = function(v4, ...)
        local _ = nil;
        print(string.rep("  ", v2) .. if typeof(v4) == "string" then string.format(v4, ...) else l_inspect_0(v4));
    end;
    v1.debug = function(v6, ...)
        local _ = nil;
        print(string.rep("  ", v2) .. if typeof(v6) == "string" then string.format(v6, ...) else l_inspect_0(v6));
    end;
    v1.info = function(v8, ...)
        local _ = nil;
        print(string.rep("  ", v2) .. if typeof(v8) == "string" then string.format(v8, ...) else l_inspect_0(v8));
    end;
    v1.warn = function(v10, ...)
        local _ = nil;
        warn(string.rep("  ", v2) .. if typeof(v10) == "string" then string.format(v10, ...) else l_inspect_0(v10));
    end;
    v1.error = function(v12, ...)
        local _ = nil;
        warn(string.rep("  ", v2) .. if typeof(v12) == "string" then string.format(v12, ...) else l_inspect_0(v12));
    end;
    v1.group = function(v14, ...)
        local _ = nil;
        print(string.rep("  ", v2) .. if typeof(v14) == "string" then string.format(v14, ...) else l_inspect_0(v14));
        v2 = v2 + 1;
    end;
    v1.groupCollapsed = function(v16, ...)
        local _ = nil;
        print(string.rep("  ", v2) .. if typeof(v16) == "string" then string.format(v16, ...) else l_inspect_0(v16));
        v2 = v2 + 1;
    end;
    v1.groupEnd = function()
        if v2 > 0 then
            v2 = v2 - 1;
        end;
    end;
    return v1;
end;
