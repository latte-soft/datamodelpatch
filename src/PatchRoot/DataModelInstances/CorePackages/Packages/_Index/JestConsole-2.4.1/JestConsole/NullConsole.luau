local v0 = {};
local l_default_0 = require(script.Parent.CustomConsole).default;
local v2 = setmetatable({}, {
    __index = l_default_0
});
v2.__index = v2;
v2.new = function(...)
    return (setmetatable(l_default_0.new(...), v2));
end;
v2.assert = function(_)
end;
v2.debug = function(_)
end;
v2.dir = function(_)
end;
v2.error = function(_)
end;
v2.info = function(_)
end;
v2.log = function(_)
end;
v2.time = function(_)
end;
v2.timeEnd = function(_)
end;
v2.timeLog = function(_)
end;
v2.trace = function(_)
end;
v2.warn = function(_)
end;
v2.group = function(_)
end;
v2.groupCollapsed = function(_)
end;
v2.groupEnd = function(_)
end;
v0.default = v2;
return v0;
