local l_Parent_0 = script.Parent;
local l_console_0 = require(l_Parent_0.Parent.LuauPolyfill).console;
local v2 = require(l_Parent_0.consoleWithStackDev);
if not _G.__DEV__ then
    return l_console_0;
else
    return (setmetatable({
        warn = v2.warn, 
        error = v2.error
    }, {
        __index = l_console_0
    }));
end;
