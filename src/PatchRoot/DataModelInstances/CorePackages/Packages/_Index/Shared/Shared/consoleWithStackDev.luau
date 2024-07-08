local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_console_0 = v0.console;
local l_Array_0 = v0.Array;
local v3 = require(script.Parent.ReactSharedInternals);
local v4 = nil;
local v7 = {
    warn = function(v5, ...)
        if _G.__DEV__ then
            v4("warn", v5, {
                ...
            });
        end;
    end, 
    error = function(v6, ...)
        if _G.__DEV__ then
            v4("error", v6, {
                ...
            });
        end;
    end
};
v4 = function(v8, v9, v10)
    if _G.__DEV__ then
        local v11 = v3.ReactDebugCurrentFrame.getStackAddendum();
        if v11 ~= "" then
            v9 = v9 .. "%s";
            v10 = l_Array_0.slice(v10, 1);
            table.insert(v10, v11);
        end;
        local v12 = l_Array_0.map(v10, tostring);
        table.insert(v12, 1, "Warning: " .. v9);
        l_console_0[v8](unpack(v12));
    end;
end;
return v7;
