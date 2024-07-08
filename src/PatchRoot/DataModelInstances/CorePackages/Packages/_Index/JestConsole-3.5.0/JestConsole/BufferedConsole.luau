local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_String_0 = v3.String;
local l_Error_0 = v3.Error;
local l_inspect_0 = v3.util.inspect;
local l_default_0 = require(l_Parent_0.Console).default;
local v10 = require(l_Parent_0.helpers);
local l_format_0 = v10.format;
local l_formatWithOptions_0 = v10.formatWithOptions;
local v13 = require(l_Parent_1.ChalkLua);
local v14 = require(l_Parent_1.JestUtil);
local l_ErrorWithStack_0 = v14.ErrorWithStack;
local l_formatTime_0 = v14.formatTime;
local _ = require(l_Parent_0.types);
local _ = require(l_Parent_1.RobloxShared);
local v19 = nil;
local v20 = setmetatable({}, {
    __index = l_default_0
});
v20.__index = v20;
v20.new = function()
    local v23 = setmetatable(l_default_0.new({
        write = function(v21, v22)
            v20.write(v21._buffer, "log", v22, nil);
            return true;
        end
    }), v20);
    v23._buffer = {};
    v23._counters = {};
    v23._timers = {};
    v23._groupDepth = 0;
    v23.Console = l_default_0;
    return v23;
end;
v20.write = function(v24, v25, v26, v27)
    local v28 = if v27 ~= nil then v27 else 2;
    local l_stack_0 = l_ErrorWithStack_0.new(nil, v20.write).stack;
    v19(l_stack_0, "always have a stack trace");
    table.insert(v24, {
        message = v26, 
        origin = l_Array_0.join(l_Array_0.filter(l_Array_0.slice(l_String_0.split(l_stack_0, "\n"), v28), l_Boolean_0.toJSBoolean), "\n"), 
        type = v25
    });
    return v24;
end;
v20._log = function(v30, v31, v32)
    v20.write(v30._buffer, v31, ("  "):rep(v30._groupDepth) .. v32, 3);
end;
v20.assert = function(v33, v34, v35)
    xpcall(function()
        assert(v34);
    end, function(v36)
        local v37 = "";
        if v35 ~= nil then
            v37 = " " .. tostring(v35);
        end;
        v33:_log("assert", tostring(v36) .. v37);
    end);
end;
v20.count = function(v38, v39)
    local v40 = if v39 ~= nil then v39 else "default";
    if v38._counters[v40] == nil then
        v38._counters[v40] = 0;
    end;
    local l__counters_0 = v38._counters;
    l__counters_0[v40] = l__counters_0[v40] + 1;
    v38:_log("count", l_format_0("%s: %s", v40, v38._counters[v40]));
end;
v20.countReset = function(v42, v43)
    v42._counters[if v43 ~= nil then v43 else "default"] = 0;
end;
v20.debug = function(v44, v45, ...)
    v44:_log("debug", l_format_0(v45, ...));
end;
v20.dir = function(v46, v47, v48)
    local v49 = v48 or {};
    v46:_log("dir", l_formatWithOptions_0(v49, (l_inspect_0(v47, v49))));
end;
v20.dirxml = function(v50, v51, ...)
    v50:_log("dirxml", l_format_0(v51, ...));
end;
v20.error = function(v52, v53, ...)
    v52:_log("error", l_format_0(v53, ...));
end;
v20.group = function(v54, v55, ...)
    local v56 = {
        ...
    };
    v54._groupDepth = v54._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v55) or #v56 > 0 then
        v54:_log("group", v13.bold(l_format_0(v55, ...)));
    end;
end;
v20.groupCollapsed = function(v57, v58, ...)
    local v59 = {
        ...
    };
    v57._groupDepth = v57._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v58) or #v59 > 0 then
        v57:_log("groupCollapsed", v13.bold(l_format_0(v58, ...)));
    end;
end;
v20.groupEnd = function(v60)
    if v60._groupDepth > 0 then
        v60._groupDepth = v60._groupDepth - 1;
    end;
end;
v20.info = function(v61, v62, ...)
    v61:_log("info", l_format_0(v62, ...));
end;
v20.log = function(v63, v64, ...)
    v63:_log("log", l_format_0(v64, ...));
end;
v20.time = function(v65, v66)
    local v67 = if v66 ~= nil then v66 else "default";
    if not l_Boolean_0.toJSBoolean(v65._timers[v67]) then
        v65._timers[v67] = DateTime.now();
        return ;
    else
        return ;
    end;
end;
v20.timeEnd = function(v68, v69)
    local v70 = if v69 ~= nil then v69 else "default";
    local v71 = v68._timers[v70];
    if l_Boolean_0.toJSBoolean(v71) then
        v68:_log("time", l_format_0("%s: %s", v70, l_formatTime_0(DateTime.now().UnixTimestampMillis - v71.UnixTimestampMillis)));
        v68._timers[v70] = nil;
    end;
end;
v20.timeLog = function(v72, v73, ...)
    local v74 = if v73 ~= nil then v73 else "default";
    local v75 = v72._timers[v74];
    if l_Boolean_0.toJSBoolean(v75) then
        v72:_log("time", l_format_0("%s: %s", v74, l_formatTime_0(DateTime.now().UnixTimestampMillis - v75.UnixTimestampMillis), ...));
    end;
end;
v20.warn = function(v76, v77, ...)
    v76:_log("warn", l_format_0(v77, ...));
end;
v20.getBuffer = function(v78)
    if #v78._buffer > 0 then
        return v78._buffer;
    else
        return nil;
    end;
end;
v19 = function(v79, v80)
    if not l_Boolean_0.toJSBoolean(v79) then
        error(l_Error_0.new(v80));
    end;
end;
v0.default = v20;
return v0;
