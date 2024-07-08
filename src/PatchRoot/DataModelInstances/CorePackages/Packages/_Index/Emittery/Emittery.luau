local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_Symbol_0 = v1.Symbol;
local l_WeakMap_0 = v1.WeakMap;
local l_console_0 = v1.console;
local v11 = require(l_Parent_0.Promise);
local l_HttpService_0 = game:GetService("HttpService");
local v13 = nil;
local l_None_0 = l_Object_0.None;
local v15 = {};
local v16 = l_WeakMap_0.new();
local v17 = l_WeakMap_0.new();
local v18 = l_WeakMap_0.new();
local v19 = l_Symbol_0("anyProducer");
local v20 = v11.resolve();
local v21 = l_Symbol_0("listenerAdded");
local v22 = l_Symbol_0("listenerRemoved");
local v23 = l_Symbol_0("metaEventsAllowed");
local v24 = false;
local function _(v25)
    local v26 = false;
    if typeof(v25) == "userdata" then
        v26 = tostring(v25):match("Symbol%(.*%)") ~= nil;
    end;
    return v26;
end;
local function _(v28)
    local v29 = true;
    if typeof(v28) ~= "function" then
        v29 = false;
        if typeof(v28) == "table" then
            v29 = false;
            if typeof((getmetatable(v28))) == "table" then
                v29 = typeof(getmetatable(v28).__call) == "function";
            end;
        end;
    end;
    return v29;
end;
local function v34(v31, v32)
    if typeof(v31) ~= "string" then
        local v33 = false;
        if typeof(v31) == "userdata" then
            v33 = tostring(v31):match("Symbol%(.*%)") ~= nil;
        end;
        if not v33 and typeof(v31) ~= "number" then
            error(l_Error_0.new("`eventName` must be a string, symbol, or number"));
        end;
    end;
    if v13(v31) and v32 ~= v23 then
        error(l_Error_0.new("`eventName` cannot be meta event `listenerAdded` or `listenerRemoved`"));
    end;
end;
local function _(v35)
    local v36 = true;
    if typeof(v35) ~= "function" then
        v36 = false;
        if typeof(v35) == "table" then
            v36 = false;
            if typeof((getmetatable(v35))) == "table" then
                v36 = typeof(getmetatable(v35).__call) == "function";
            end;
        end;
    end;
    if not v36 then
        error(l_Error_0.new("listener must be a function"));
    end;
end;
local function _(v38, v39)
    local v40 = v17:get(v38);
    if not v40:has(v39) then
        v40:set(v39, l_Set_0.new());
    end;
    return v40:get(v39);
end;
local function v47(v42, v43)
    local v44;
    if typeof(v43) ~= "string" then
        local v45 = false;
        if typeof(v43) == "userdata" then
            v45 = tostring(v43):match("Symbol%(.*%)") ~= nil;
        end;
        if not (v45 or typeof(v43) == "number") then
            v44 = v19;
            goto label0 --[[  true, true  ]];
        end;
    end;
    v44 = v43;
    ::label0::;
    local v46 = v18:get(v42);
    if not v46:has(v44) then
        v46:set(v44, l_Set_0.new());
    end;
    return v46:get(v44);
end;
local function v57(v48, v49, v50)
    local v51 = v18:get(v48);
    if v51:has(v49) then
        for _, v53 in v51:get(v49):ipairs() do
            v53:enqueue(v50);
        end;
    end;
    if v51:has(v19) then
        local v54 = v11.all({
            v11.resolve(v49), 
            v11.resolve(v50)
        });
        for _, v56 in v51:get(v19):ipairs() do
            v56:enqueue(v54);
        end;
    end;
end;
local function v76(v58, v59)
    if not l_Array_0.isArray(v59) then
        v59 = if v59 ~= nil then {
            v59
        } else {
            l_None_0
        };
    end;
    local v60 = false;
    local function v61()
    end;
    local v62 = {};
    local v66 = {
        enqueue = function(_, v64)
            table.insert(v62, v64);
            v61();
        end, 
        finish = function(_)
            v60 = true;
            v61();
        end
    };
    for _, v68 in v59, nil, nil do
        v47(v58, v68):add(v66);
    end;
    return {
        next = function(v69)
            return v11.resolve():andThen(function()
                if v62 == nil then
                    return {
                        done = true
                    };
                elseif #v62 == 0 then
                    if not v60 then
                        v11.new(function(v70)
                            v61 = v70;
                        end):expect();
                        return v69:next();
                    else
                        v62 = nil;
                        return v69:next();
                    end;
                else
                    return {
                        done = false, 
                        value = v11.resolve((table.remove(v62, 1))):expect()
                    };
                end;
            end);
        end, 
        ["return"] = function(_, ...)
            local v72 = ...;
            local v73 = {
                ...
            };
            return v11.resolve():andThen(function()
                v62 = nil;
                for _, v75 in v59, nil, nil do
                    v47(v58, v75):delete(v66);
                end;
                v61();
                if #v73 > 0 then
                    return {
                        done = true, 
                        value = v72:expect()
                    };
                else
                    return {
                        done = true
                    };
                end;
            end);
        end
    };
end;
v13 = function(v77)
    local v78 = true;
    if v77 ~= v21 then
        v78 = v77 == v22;
    end;
    return v78;
end;
local v79 = {};
v79.__index = v79;
v79.new = function(v80)
    local v81 = setmetatable({}, v79);
    local v82 = if v80 ~= nil then v80 else {};
    v16:set(v81, l_Set_0.new());
    v17:set(v81, l_Map_0.new());
    v18:set(v81, l_Map_0.new());
    v81.debug = not not l_Boolean_0.toJSBoolean(v82.debug) and v82.debug or {};
    if v81.debug.enabled == nil then
        v81.debug.enabled = false;
    end;
    if not l_Boolean_0.toJSBoolean(v81.debug.logger) then
        v81.debug.logger = function(_, v84, v85, v86, v87)
            xpcall(function()
                v87 = l_HttpService_0:JSONEncode(v87);
            end, function()
                v87 = ("Object with the following keys failed to stringify: %s"):format(l_Array_0.join(l_Object_0.keys(v87), ","));
            end);
            local l_v86_0 = v86;
            local v89 = false;
            if typeof(l_v86_0) == "userdata" then
                v89 = tostring(l_v86_0):match("Symbol%(.*%)") ~= nil;
            end;
            if v89 or typeof(v86) == "number" then
                v86 = tostring(v86);
            end;
            v89 = DateTime.now():ToUniversalTime();
            l_console_0.log(("[%s][emittery:%s][%s] Event Name: %s\n\tdata: %s"):format(("%d:%d:%d.%d"):format(v89.Hour, v89.Minute, v89.Second, v89.Millisecond), tostring(v84), tostring(v85), tostring(v86), (tostring(v87))));
        end;
    end;
    return v81;
end;
v79.getIsDebugEnabled = function()
    return v24;
end;
v79.setIsDebugEnabled = function(v90)
    v24 = v90;
end;
v79.logIfDebugEnabled = function(v91, v92, v93, v94)
    if not (not v79.getIsDebugEnabled() and not v91.debug.enabled) then
        v91.debug:logger(v92, v91.debug.name, v93, v94);
    end;
end;
v79.on = function(v95, v96, v97)
    local v98 = true;
    if typeof(v97) ~= "function" then
        v98 = false;
        if typeof(v97) == "table" then
            v98 = false;
            if typeof((getmetatable(v97))) == "table" then
                v98 = typeof(getmetatable(v97).__call) == "function";
            end;
        end;
    end;
    if not v98 then
        error(l_Error_0.new("listener must be a function"));
    end;
    if not l_Array_0.isArray(v96) then
        v96 = {
            v96
        };
    end;
    for _, v100 in v96, nil, nil do
        v34(v100, v23);
        local v101 = v17:get(v95);
        if not v101:has(v100) then
            v101:set(v100, l_Set_0.new());
        end;
        v101:get(v100):add(v97);
        v95:logIfDebugEnabled("subscribe", v100, nil);
        if not v13(v100) then
            v95:emit(v21, {
                eventName = v100, 
                listener = v97
            }, v23);
        end;
    end;
    return function()
        return v95:off(v96, v97);
    end;
end;
v79.off = function(v102, v103, v104)
    local v105 = true;
    if typeof(v104) ~= "function" then
        v105 = false;
        if typeof(v104) == "table" then
            v105 = false;
            if typeof((getmetatable(v104))) == "table" then
                v105 = typeof(getmetatable(v104).__call) == "function";
            end;
        end;
    end;
    if not v105 then
        error(l_Error_0.new("listener must be a function"));
    end;
    if not l_Array_0.isArray(v103) then
        v103 = {
            v103
        };
    end;
    for _, v107 in v103, nil, nil do
        v34(v107, v23);
        local v108 = v17:get(v102);
        if not v108:has(v107) then
            v108:set(v107, l_Set_0.new());
        end;
        v108:get(v107):delete(v104);
        v102:logIfDebugEnabled("unsubscribe", v107, nil);
        if not v13(v107) then
            v102:emit(v22, {
                eventName = v107, 
                listener = v104
            }, v23);
        end;
    end;
end;
v79.once = function(v109, v110)
    return v11.new(function(v111)
        local v112 = nil;
        v112 = v109:on(v110, function(v113)
            v112();
            v111(v113);
        end);
    end);
end;
v79.events = function(v114, v115)
    if not l_Array_0.isArray(v115) then
        v115 = {
            v115
        };
    end;
    for _, v117 in v115, nil, nil do
        v34(v117, v23);
    end;
    return (v76(v114, v115));
end;
v79.emit = function(v118, v119, v120, v121)
    return v11.resolve():andThen(function()
        v34(v119, v121);
        v118:logIfDebugEnabled("emit", v119, v120);
        v57(v118, v119, v120);
        local l_v118_0 = v118;
        local l_v119_0 = v119;
        local v124 = v17:get(l_v118_0);
        if not v124:has(l_v119_0) then
            v124:set(l_v119_0, l_Set_0.new());
        end;
        local v125 = v124:get(l_v119_0);
        l_v118_0 = v16:get(v118);
        l_v119_0 = l_Array_0.concat({}, l_Array_0.from(v125));
        v124 = if not l_Boolean_0.toJSBoolean(v13(v119)) then l_Array_0.concat({}, l_Array_0.from(l_v118_0)) else {};
        v20:andThen(function(...)
            return v11.delay(0):andThenReturn(...);
        end):expect();
        v11.all(l_Array_0.concat({}, l_Array_0.map(l_v119_0, function(v126)
            return v11.resolve():andThen(function()
                if not v125:has(v126) then
                    return ;
                else
                    return v126(v120);
                end;
            end);
        end), l_Array_0.map(v124, function(v127)
            return v11.resolve():andThen(function()
                if not l_v118_0:has(v127) then
                    return ;
                else
                    return v127(v119, v120);
                end;
            end);
        end))):expect();
    end);
end;
v79.emitSerial = function(v128, v129, v130, v131)
    return v11.resolve():andThen(function()
        v34(v129, v131);
        v128:logIfDebugEnabled("emitSerial", v129, v130);
        local l_v128_0 = v128;
        local l_v129_0 = v129;
        local v134 = v17:get(l_v128_0);
        if not v134:has(l_v129_0) then
            v134:set(l_v129_0, l_Set_0.new());
        end;
        local v135 = v134:get(l_v129_0);
        l_v128_0 = v16:get(v128);
        l_v129_0 = l_Array_0.concat({}, l_Array_0.from(v135));
        v134 = l_Array_0.concat({}, l_Array_0.from(l_v128_0));
        v20:andThen(function(...)
            return v11.delay(0):andThenReturn(...);
        end):expect();
        for _, v137 in l_v129_0, nil, nil do
            if v135:has(v137) then
                v11.resolve(v137(v130)):expect();
            end;
        end;
        for _, v139 in v134, nil, nil do
            if l_v128_0:has(v139) then
                v11.resolve(v139(v129, v130)):expect();
            end;
        end;
    end);
end;
v79.onAny = function(v140, v141)
    local v142 = true;
    if typeof(v141) ~= "function" then
        v142 = false;
        if typeof(v141) == "table" then
            v142 = false;
            if typeof((getmetatable(v141))) == "table" then
                v142 = typeof(getmetatable(v141).__call) == "function";
            end;
        end;
    end;
    if not v142 then
        error(l_Error_0.new("listener must be a function"));
    end;
    v140:logIfDebugEnabled("subscribeAny", nil, nil);
    v16:get(v140):add(v141);
    v140:emit(v21, {
        listener = v141
    }, v23);
    return function()
        v140:offAny(v141);
    end;
end;
v79.anyEvent = function(v143)
    return (v76(v143));
end;
v79.offAny = function(v144, v145)
    local v146 = true;
    if typeof(v145) ~= "function" then
        v146 = false;
        if typeof(v145) == "table" then
            v146 = false;
            if typeof((getmetatable(v145))) == "table" then
                v146 = typeof(getmetatable(v145).__call) == "function";
            end;
        end;
    end;
    if not v146 then
        error(l_Error_0.new("listener must be a function"));
    end;
    v144:logIfDebugEnabled("unsubscribeAny", nil, nil);
    v144:emit(v22, {
        listener = v145
    }, v23);
    v16:get(v144):delete(v145);
end;
v79.clearListeners = function(v147, v148)
    if not l_Array_0.isArray(v148) then
        v148 = if v148 ~= nil then {
            v148
        } else {
            l_None_0
        };
    end;
    for _, v150 in v148, nil, nil do
        v147:logIfDebugEnabled("clear", v150, nil);
        if typeof(v150) ~= "string" then
            local v151 = false;
            if typeof(v150) == "userdata" then
                v151 = tostring(v150):match("Symbol%(.*%)") ~= nil;
            end;
            if not (v151 or typeof(v150) == "number") then
                v16:get(v147):clear();
                for _, v153 in v17:get(v147):values() do
                    v153:clear();
                end;
                for _, v155 in v18:get(v147):values() do
                    for _, v157 in v155:ipairs() do
                        v157:finish();
                    end;
                    v155:clear();
                end;
                continue;
            end;
        end;
        local v158 = v17:get(v147);
        if not v158:has(v150) then
            v158:set(v150, l_Set_0.new());
        end;
        v158:get(v150):clear();
        local v159 = v47(v147, v150);
        for _, v161 in v159:ipairs() do
            v161:finish();
        end;
        v159:clear();
    end;
end;
v79.listenerCount = function(v162, v163)
    if not l_Array_0.isArray(v163) then
        v163 = if v163 ~= nil then {
            v163
        } else {
            l_None_0
        };
    end;
    local v164 = 0;
    for _, v166 in v163, nil, nil do
        if typeof(v166) == "string" then
            local l_size_0 = v16:get(v162).size;
            local v168 = v17:get(v162);
            if not v168:has(v166) then
                v168:set(v166, l_Set_0.new());
            end;
            v164 = v164 + (((l_size_0 + v168:get(v166).size) + v47(v162, v166).size) + v47(v162).size);
        else
            if v166 ~= nil and v166 ~= l_None_0 then
                v34(v166, v23);
            end;
            v164 = v164 + v16:get(v162).size;
            for _, v170 in v17:get(v162):values() do
                v164 = v164 + v170.size;
            end;
            for _, v172 in v18:get(v162):values() do
                v164 = v164 + v172.size;
            end;
        end;
    end;
    return v164;
end;
v79.listenerAdded = v21;
v79.listenerRemoved = v22;
v15.default = v79;
return v15;
