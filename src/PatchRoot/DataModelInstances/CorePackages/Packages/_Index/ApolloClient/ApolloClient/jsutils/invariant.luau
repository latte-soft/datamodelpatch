local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_console_0 = v0.console;
local l_Error_0 = v0.Error;
local v5 = setmetatable({}, {
    __index = l_Error_0
});
v5.__index = v5;
v5.new = function(v6)
    local l_v6_0 = v6;
    if v6 == nil then
        l_v6_0 = "Invariant Violation";
    end;
    local _ = nil;
    local v9 = l_Error_0.new(if typeof(l_v6_0) == "number" then ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", (tostring(l_v6_0))) else l_v6_0);
    v9.framesToPop = 1;
    v9.name = "Invariant Violation";
    return (setmetatable(v9, v5));
end;
local function _(v10, v11)
    if not l_Boolean_0.toJSBoolean(v10) then
        error(v5.new(v11));
    end;
end;
local v13 = {
    "debug", 
    "log", 
    "warn", 
    "error", 
    "silent"
};
local v14 = l_Array_0.indexOf(v13, "log");
local function _(v15)
    return function(...)
        if v14 <= l_Array_0.indexOf(v13, v15) then
            return (not not l_Boolean_0.toJSBoolean(l_console_0[v15]) and l_console_0[v15] or l_console_0.log)(...);
        else
            return ;
        end;
    end;
end;
local v17 = {};
local v18 = {};
local v19 = "debug";
local l_v19_0 = v19 --[[ copy: 16 -> 17 ]];
v18.debug = function(...)
    if v14 <= l_Array_0.indexOf(v13, l_v19_0) then
        return (not not l_Boolean_0.toJSBoolean(l_console_0[l_v19_0]) and l_console_0[l_v19_0] or l_console_0.log)(...);
    else
        return ;
    end;
end;
v19 = "log";
local l_v19_1 = v19 --[[ copy: 16 -> 18 ]];
v18.log = function(...)
    if v14 <= l_Array_0.indexOf(v13, l_v19_1) then
        return (not not l_Boolean_0.toJSBoolean(l_console_0[l_v19_1]) and l_console_0[l_v19_1] or l_console_0.log)(...);
    else
        return ;
    end;
end;
v19 = "warn";
local l_v19_2 = v19 --[[ copy: 16 -> 19 ]];
v18.warn = function(...)
    if v14 <= l_Array_0.indexOf(v13, l_v19_2) then
        return (not not l_Boolean_0.toJSBoolean(l_console_0[l_v19_2]) and l_console_0[l_v19_2] or l_console_0.log)(...);
    else
        return ;
    end;
end;
v19 = "error";
v18.error = function(...)
    if v14 <= l_Array_0.indexOf(v13, v19) then
        return (not not l_Boolean_0.toJSBoolean(l_console_0[v19]) and l_console_0[v19] or l_console_0.log)(...);
    else
        return ;
    end;
end;
v17.invariant = setmetatable(v18, {
    __call = function(_, v24, v25)
        if not l_Boolean_0.toJSBoolean(v24) then
            error(v5.new(v25));
        end;
    end
});
v17.InvariantError = v5;
v17.setVerbosity = function(v26)
    local v27 = v13[v14];
    v14 = math.max(1, l_Array_0.indexOf(v13, v26));
    return v27;
end;
return v17;
