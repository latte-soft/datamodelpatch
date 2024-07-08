local l_console_0 = require(script.Parent.Parent.Shared).console;
local v1 = {};
return function(v2, v3)
    if not v1[v2] then
        l_console_0.warn("The legacy Roact API '%s' is deprecated, and will be removed " .. "in a future release.\n\n%s", v2, v3);
    end;
    v1[v2] = true;
end;
