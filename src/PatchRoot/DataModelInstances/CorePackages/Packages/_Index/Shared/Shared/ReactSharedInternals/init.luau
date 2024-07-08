local l_console_0 = require(script.Parent.Parent.LuauPolyfill).console;
local function _(v1)
    return function()
        l_console_0.error(v1 .. " is only available in tests, not in production");
    end;
end;
return {
    ReactCurrentDispatcher = require(script.ReactCurrentDispatcher), 
    ReactCurrentBatchConfig = require(script.ReactCurrentBatchConfig), 
    ReactCurrentOwner = require(script.ReactCurrentOwner), 
    IsSomeRendererActing = require(script.IsSomeRendererActing), 
    ReactDebugCurrentFrame = if not _G.__DEV__ then {
        setExtraStackFrame = function(_)
        end
    } else require(script.ReactDebugCurrentFrame)
};
