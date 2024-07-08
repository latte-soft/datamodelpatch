local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_default_0 = require(l_Parent_0.Console).default;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_inspect_0 = v4.util.inspect;
local v7 = require(l_Parent_0.helpers);
local l_format_0 = v7.format;
local l_formatWithOptions_0 = v7.formatWithOptions;
local _ = require(l_Parent_1.RobloxShared);
local v11 = require(l_Parent_1.ChalkLua);
local v12 = require(l_Parent_1.JestUtil);
local l_clearLine_0 = v12.clearLine;
local l_formatTime_0 = v12.formatTime;
local _ = require(l_Parent_0.types);
local v16 = setmetatable({}, {
    __index = l_default_0
});
v16.__index = v16;
v16.new = function(v17, v18, v19)
    local v20 = setmetatable(l_default_0.new(v17, v18), v16);
    local v23 = if v19 ~= nil then v19 else function(_, v22)
        return v22;
    end;
    v20._counters = {};
    v20._timers = {};
    v20._groupDepth = 0;
    v20.Console = l_default_0;
    v20._stdout = v17;
    v20._stderr = v18;
    v20._formatBuffer = v23;
    return v20;
end;
v16._log = function(v24, v25, v26)
    l_clearLine_0(v24._stdout);
    l_default_0.log(v24, v24._formatBuffer(v25, ("  "):rep(v24._groupDepth) .. v26));
end;
v16._logError = function(v27, v28, v29)
    l_clearLine_0(v27._stderr);
    l_default_0.error(v27, v27._formatBuffer(v28, ("  "):rep(v27._groupDepth) .. v29));
end;
v16.assert = function(v30, v31, v32)
    xpcall(function()
        assert(v31);
    end, function(v33)
        local v34 = "";
        if v32 ~= nil then
            v34 = " " .. tostring(v32);
        end;
        v30:_logError("assert", tostring(v33) .. v34);
    end);
end;
v16.count = function(v35, v36)
    local v37 = if v36 ~= nil then v36 else "default";
    if v35._counters[v37] == nil then
        v35._counters[v37] = 0;
    end;
    local l__counters_0 = v35._counters;
    l__counters_0[v37] = l__counters_0[v37] + 1;
    v35:_log("count", l_format_0("%s: %s", v37, v35._counters[v37]));
end;
v16.countReset = function(v39, v40)
    v39._counters[if v40 ~= nil then v40 else "default"] = 0;
end;
v16.debug = function(v41, v42, ...)
    v41:_log("debug", l_format_0(v42, ...));
end;
v16.dir = function(v43, v44, v45)
    local v46 = v45 or {};
    v43:_log("dir", l_formatWithOptions_0(v46, (l_inspect_0(v44, v46))));
end;
v16.dirxml = function(v47, v48, ...)
    v47:_log("dirxml", l_format_0(v48, ...));
end;
v16.error = function(v49, v50, ...)
    v49:_logError("error", l_format_0(v50, ...));
end;
v16.group = function(v51, v52, ...)
    local v53 = {
        ...
    };
    v51._groupDepth = v51._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v52) or #v53 > 0 then
        v51:_log("group", v11.bold(l_format_0(v52, ...)));
    end;
end;
v16.groupCollapsed = function(v54, v55, ...)
    local v56 = {
        ...
    };
    v54._groupDepth = v54._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v55) or #v56 > 0 then
        v54:_log("groupCollapsed", v11.bold(l_format_0(v55, ...)));
    end;
end;
v16.groupEnd = function(v57)
    if v57._groupDepth > 0 then
        v57._groupDepth = v57._groupDepth - 1;
    end;
end;
v16.info = function(v58, v59, ...)
    v58:_log("info", l_format_0(v59, ...));
end;
v16.log = function(v60, v61, ...)
    v60:_log("log", l_format_0(v61, ...));
end;
v16.time = function(v62, v63)
    local v64 = if v63 ~= nil then v63 else "default";
    if v62._timers[v64] ~= nil then
        return ;
    else
        v62._timers[v64] = DateTime.now();
        return ;
    end;
end;
v16.timeEnd = function(v65, v66)
    local v67 = if v66 ~= nil then v66 else "default";
    local v68 = v65._timers[v67];
    if l_Boolean_0.toJSBoolean(v68) then
        v65:_log("time", l_format_0("%s: %s", v67, l_formatTime_0(DateTime.now().UnixTimestampMillis - v68.UnixTimestampMillis)));
        v65._timers[v67] = nil;
    end;
end;
v16.timeLog = function(v69, v70, ...)
    local v71 = if v70 ~= nil then v70 else "default";
    local v72 = v69._timers[v71];
    if l_Boolean_0.toJSBoolean(v72) then
        v69:_log("time", l_format_0("%s: %s", v71, l_formatTime_0(DateTime.now().UnixTimestampMillis - v72.UnixTimestampMillis), ...));
    end;
end;
v16.warn = function(v73, v74, ...)
    v73:_logError("warn", l_format_0(v74, ...));
end;
v16.getBuffer = function(_)
    return nil;
end;
v0.default = v16;
return v0;
