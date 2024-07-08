local v0 = require(script.Parent.console);
local v1 = {};
setmetatable(v1, {
    __index = function(_, _)
        if _G.__DEV__ then
            v0.warn("Attempted to access uninitialized state. Use setState to initialize state");
        end;
        return nil;
    end, 
    __newindex = function(_, _)
        if _G.__DEV__ then
            v0.error("Attempted to directly mutate state. Use setState to assign new values to state.");
        end;
        return nil;
    end, 
    __tostring = function(_)
        return "<uninitialized component state>";
    end, 
    __metatable = "UninitializedState"
});
return v1;
