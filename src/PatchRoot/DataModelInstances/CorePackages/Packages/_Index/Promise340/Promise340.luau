local v0 = {
    __mode = "k"
};
local function _(v1)
    if type(v1) == "function" then
        return true;
    else
        if type(v1) == "table" then
            local v2 = getmetatable(v1);
            if v2 and type((rawget(v2, "__call"))) == "function" then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v11(v4, v5)
    local v6 = {};
    for _, v8 in ipairs(v5) do
        v6[v8] = v8;
    end;
    return (setmetatable(v6, {
        __index = function(_, v10)
            error(string.format("%s is not in %s", v10, v4), 2);
        end, 
        __newindex = function()
            error(string.format("Creating new members in %s is not allowed", v4), 2);
        end
    }));
end;
local v12 = nil;
v12 = {
    Kind = v11("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v12.__index = v12;
v12.new = function(v13, v14)
    v13 = v13 or {};
    return (setmetatable({
        error = tostring(v13.error) or "[This error has no error text.]", 
        trace = v13.trace, 
        context = v13.context, 
        kind = v13.kind, 
        parent = v14, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v12));
end;
v12.is = function(v15)
    if type(v15) == "table" then
        local v16 = getmetatable(v15);
        if type(v16) == "table" then
            local v17 = false;
            if rawget(v15, "error") ~= nil then
                v17 = type((rawget(v16, "extend"))) == "function";
            end;
            return v17;
        end;
    end;
    return false;
end;
v12.isKind = function(v18, v19)
    assert(v19 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v12.is(v18) and v18.kind == v19;
end;
v12.extend = function(v20, v21)
    v21 = v21 or {};
    v21.kind = v21.kind or v20.kind;
    return v12.new(v21, v20);
end;
v12.getErrorChain = function(v22)
    local v23 = {
        v22
    };
    while v23[#v23].parent do
        table.insert(v23, v23[#v23].parent);
    end;
    return v23;
end;
v12.__tostring = function(v24)
    local v25 = {
        string.format("-- Promise.Error(%s) --", v24.kind or "?")
    };
    for _, v27 in ipairs(v24:getErrorChain()) do
        table.insert(v25, table.concat({
            v27.trace or v27.error, 
            v27.context
        }, "\n"));
    end;
    return table.concat(v25, "\n");
end;
local function v28(...)
    return select("#", ...), {
        ...
    };
end;
local function v30(v29, ...)
    return v29, select("#", ...), {
        ...
    };
end;
local function _(v31)
    assert(v31 ~= nil, "traceback is nil");
    return function(v32)
        if type(v32) == "table" then
            return v32;
        else
            return v12.new({
                error = v32, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v32), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end;
end;
local function v40(v34, v35, ...)
    local l_v30_0 = v30;
    local l_xpcall_0 = xpcall;
    local l_v35_0 = v35;
    assert(v34 ~= nil, "traceback is nil");
    return l_v30_0(l_xpcall_0(l_v35_0, function(v39)
        if type(v39) == "table" then
            return v39;
        else
            return v12.new({
                error = v39, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v39), 2), 
                context = "Promise created at:\n\n" .. v34
            });
        end;
    end, ...));
end;
local function _(v41, v42, v43, v44)
    return function(...)
        local v45, v46, v47 = v40(v41, v42, ...);
        if not v45 then
            v44(v47[1]);
            return ;
        else
            v43(unpack(v47, 1, v46));
            return ;
        end;
    end;
end;
local function _(v49)
    return next(v49) == nil;
end;
local v51 = {
    Error = v12, 
    Status = v11("Promise.Status", {
        "Started", 
        "Resolved", 
        "Rejected", 
        "Cancelled"
    }), 
    _getTime = os.clock, 
    _timeEvent = game:GetService("RunService").Heartbeat, 
    _unhandledRejectionCallbacks = {}, 
    prototype = {}
};
v51.__index = v51.prototype;
v51._new = function(v52, v53, v54)
    if not (not (v54 ~= nil) or v51.is(v54)) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v55 = {
        _thread = nil, 
        _source = v52, 
        _status = v51.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v54, 
        _consumers = setmetatable({}, v0)
    };
    if v54 and v54._status == v51.Status.Started then
        v54._consumers[v55] = true;
    end;
    setmetatable(v55, v51);
    local function v56(...)
        v55:_resolve(...);
    end;
    local function v57(...)
        v55:_reject(...);
    end;
    local function v59(v58)
        if v58 then
            if v55._status == v51.Status.Cancelled then
                v58();
            else
                v55._cancellationHook = v58;
            end;
        end;
        return v55._status == v51.Status.Cancelled;
    end;
    v55._thread = coroutine.create(function()
        local v60, _, v62 = v40(v55._source, v53, v56, v57, v59);
        if not v60 then
            v57(v62[1]);
        end;
    end);
    task.spawn(v55._thread);
    return v55;
end;
v51.new = function(v63)
    return v51._new(debug.traceback(nil, 2), v63);
end;
v51.__tostring = function(v64)
    return string.format("Promise(%s)", v64._status);
end;
v51.defer = function(v65)
    local v66 = debug.traceback(nil, 2);
    local _ = nil;
    return (v51._new(v66, function(v68, v69, v70)
        local v71 = nil;
        v71 = v51._timeEvent:Connect(function()
            v71:Disconnect();
            local v72, _, v74 = v40(v66, v65, v68, v69, v70);
            if not v72 then
                v69(v74[1]);
            end;
        end);
    end));
end;
v51.async = v51.defer;
v51.resolve = function(...)
    local v75, v76 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(v77)
        v77(unpack(v76, 1, v75));
    end);
end;
v51.reject = function(...)
    local v78, v79 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(_, v81)
        v81(unpack(v79, 1, v78));
    end);
end;
v51._try = function(v82, v83, ...)
    local v84, v85 = v28(...);
    return v51._new(v82, function(v86)
        v86(v83(unpack(v85, 1, v84)));
    end);
end;
v51.try = function(v87, ...)
    return v51._try(debug.traceback(nil, 2), v87, ...);
end;
v51._all = function(v88, v89, v90)
    if type(v89) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v91, v92 in pairs(v89) do
        if not v51.is(v92) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v91))), 3);
        end;
    end;
    if not (#v89 ~= 0) or v90 == 0 then
        return v51.resolve({});
    else
        return v51._new(v88, function(v93, v94, v95)
            local v96 = {};
            local v97 = {};
            local v98 = 0;
            local v99 = 0;
            local v100 = false;
            local function v103()
                for _, v102 in ipairs(v97) do
                    v102:cancel();
                end;
            end;
            local function v107(v104, ...)
                if not v100 then
                    v98 = v98 + 1;
                    if v90 == nil then
                        v96[v104] = ...;
                    else
                        v96[v98] = ...;
                    end;
                    if (v90 or #v89) <= v98 then
                        v100 = true;
                        v93(v96);
                        for _, v106 in ipairs(v97) do
                            v106:cancel();
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end;
            v95(v103);
            for v108, v109 in ipairs(v89) do
                v97[v108] = v109:andThen(function(...)
                    v107(v108, ...);
                end, function(...)
                    v99 = v99 + 1;
                    if not (v90 ~= nil) or #v89 - v99 < v90 then
                        for _, v111 in ipairs(v97) do
                            v111:cancel();
                        end;
                        v100 = true;
                        v94(...);
                    end;
                end);
            end;
            if v100 then
                for _, v113 in ipairs(v97) do
                    v113:cancel();
                end;
            end;
        end);
    end;
end;
v51.all = function(...)
    local v114 = {
        ...
    };
    if not (not (type(v114[1]) == "table") or v51.is(v114[1])) then
        v114 = v114[1];
    end;
    return v51._all(debug.traceback(nil, 2), v114);
end;
v51.fold = function(v115, v116, v117)
    assert(type(v115) == "table", "Bad argument #1 to Promise.fold: must be a table");
    local v118;
    if type(v116) == "function" then
        v118 = true;
    else
        if type(v116) == "table" then
            local v119 = getmetatable(v116);
            if v119 and type((rawget(v119, "__call"))) == "function" then
                v118 = true;
                goto label0 --[[  true, true  ]];
            end;
        end;
        v118 = false;
    end;
    ::label0::;
    assert(v118, "Bad argument #2 to Promise.fold: must be a function");
    local v120 = v51.resolve(v117);
    return v51.each(v115, function(v121, v122)
        v120 = v120:andThen(function(v123)
            return v116(v123, v121, v122);
        end);
    end):andThen(function()
        return v120;
    end);
end;
v51.some = function(v124, v125)
    assert(type(v125) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v51._all(debug.traceback(nil, 2), v124, v125);
end;
v51.any = function(v126)
    return v51._all(debug.traceback(nil, 2), v126, 1):andThen(function(v127)
        return v127[1];
    end);
end;
v51.allSettled = function(v128)
    if type(v128) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v129, v130 in pairs(v128) do
        if not v51.is(v130) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v129))), 2);
        end;
    end;
    if #v128 == 0 then
        return v51.resolve({});
    else
        return v51._new(debug.traceback(nil, 2), function(v131, _, v133)
            local v134 = {};
            local v135 = {};
            local v136 = 0;
            local function v138(v137, ...)
                v136 = v136 + 1;
                v134[v137] = ...;
                if #v128 <= v136 then
                    v131(v134);
                end;
            end;
            v133(function()
                for _, v140 in ipairs(v135) do
                    v140:cancel();
                end;
            end);
            for v141, v142 in ipairs(v128) do
                v135[v141] = v142:finally(function(...)
                    v138(v141, ...);
                end);
            end;
        end);
    end;
end;
v51.race = function(v143)
    assert(type(v143) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v144, v145 in pairs(v143) do
        assert(v51.is(v145), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v144))));
    end;
    return v51._new(debug.traceback(nil, 2), function(v146, v147, v148)
        local v149 = {};
        local v150 = false;
        local _ = function()
            for _, v152 in ipairs(v149) do
                v152:cancel();
            end;
        end;
        local _ = function(v154)
            return function(...)
                for _, v156 in ipairs(v149) do
                    v156:cancel();
                end;
                v150 = true;
                return v154(...);
            end;
        end;
        if not v148(function(...)
            for _, v159 in ipairs(v149) do
                v159:cancel();
            end;
            v150 = true;
            return v147(...);
        end) then
            for v160, v161 in ipairs(v143) do
                v149[v160] = v161:andThen(function(...)
                    for _, v163 in ipairs(v149) do
                        v163:cancel();
                    end;
                    v150 = true;
                    return v146(...);
                end, function(...)
                    for _, v165 in ipairs(v149) do
                        v165:cancel();
                    end;
                    v150 = true;
                    return v147(...);
                end);
            end;
            if v150 then
                for _, v167 in ipairs(v149) do
                    v167:cancel();
                end;
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v51.each = function(v168, v169)
    assert(type(v168) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    local v170;
    if type(v169) == "function" then
        v170 = true;
    else
        if type(v169) == "table" then
            local v171 = getmetatable(v169);
            if v171 and type((rawget(v171, "__call"))) == "function" then
                v170 = true;
                goto label1 --[[  true, true  ]];
            end;
        end;
        v170 = false;
    end;
    ::label1::;
    assert(v170, string.format("Please pass a handler function to %s", "Promise.each"));
    return v51._new(debug.traceback(nil, 2), function(v172, v173, v174)
        local v175 = {};
        local v176 = {};
        local v177 = false;
        local _ = function()
            for _, v179 in ipairs(v176) do
                v179:cancel();
            end;
        end;
        v174(function()
            v177 = true;
            for _, v182 in ipairs(v176) do
                v182:cancel();
            end;
        end);
        local v183 = {};
        for v184, v185 in ipairs(v168) do
            if not v51.is(v185) then
                v183[v184] = v185;
            elseif v185:getStatus() == v51.Status.Cancelled then
                for _, v187 in ipairs(v176) do
                    v187:cancel();
                end;
                return v173(v12.new({
                    error = "Promise is cancelled", 
                    kind = v12.Kind.AlreadyCancelled, 
                    context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v184, v185._source)
                }));
            elseif v185:getStatus() == v51.Status.Rejected then
                for _, v189 in ipairs(v176) do
                    v189:cancel();
                end;
                return v173(select(2, v185:await()));
            else
                local v190 = v185:andThen(function(...)
                    return ...;
                end);
                table.insert(v176, v190);
                v183[v184] = v190;
            end;
        end;
        for v191, v192 in ipairs(v183) do
            if v51.is(v192) then
                local v193 = nil;
                local v194, v195 = v192:await();
                v193 = v194;
                v192 = v195;
                if not v193 then
                    for _, v197 in ipairs(v176) do
                        v197:cancel();
                    end;
                    return v173(v192);
                end;
            end;
            if not v177 then
                local v198 = v51.resolve(v169(v192, v191));
                table.insert(v176, v198);
                local v199, v200 = v198:await();
                if v199 then
                    v175[v191] = v200;
                else
                    for _, v202 in ipairs(v176) do
                        v202:cancel();
                    end;
                    return v173(v200);
                end;
            else
                return ;
            end;
        end;
        v172(v175);
    end);
end;
v51.is = function(v203)
    if type(v203) ~= "table" then
        return false;
    else
        local v204 = getmetatable(v203);
        if v204 == v51 then
            return true;
        elseif v204 == nil then
            local l_andThen_0 = v203.andThen;
            if type(l_andThen_0) == "function" then
                return true;
            else
                if type(l_andThen_0) == "table" then
                    local v206 = getmetatable(l_andThen_0);
                    if v206 and type((rawget(v206, "__call"))) == "function" then
                        return true;
                    end;
                end;
                return false;
            end;
        else
            if type(v204) == "table" and type((rawget(v204, "__index"))) == "table" then
                local v207 = rawget(rawget(v204, "__index"), "andThen");
                local v208;
                if type(v207) == "function" then
                    v208 = true;
                else
                    if type(v207) == "table" then
                        local v209 = getmetatable(v207);
                        if v209 and type((rawget(v209, "__call"))) == "function" then
                            v208 = true;
                            goto label2 --[[  true, true  ]];
                        end;
                    end;
                    v208 = false;
                end;
                ::label2::;
                if v208 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v51.promisify = function(v210)
    return function(...)
        return v51._try(debug.traceback(nil, 2), v210, ...);
    end;
end;
local v211 = nil;
local v212 = nil;
do
    local l_v211_0, l_v212_0 = v211, v212;
    v51.delay = function(v215)
        assert(type(v215) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if not (v215 >= 0.016666666666666666) or v215 == math.huge then
            v215 = 0.016666666666666666;
        end;
        return v51._new(debug.traceback(nil, 2), function(v216, _, v218)
            local v219 = v51._getTime();
            local v220 = v219 + v215;
            local v221 = {
                resolve = v216, 
                startTime = v219, 
                endTime = v220
            };
            if l_v212_0 == nil then
                l_v211_0 = v221;
                l_v212_0 = v51._timeEvent:Connect(function()
                    local v222 = v51._getTime();
                    while l_v211_0 ~= nil and l_v211_0.endTime < v222 do
                        local l_l_v211_0_0 = l_v211_0;
                        l_v211_0 = l_l_v211_0_0.next;
                        if l_v211_0 == nil then
                            l_v212_0:Disconnect();
                            l_v212_0 = nil;
                        else
                            l_v211_0.previous = nil;
                        end;
                        l_l_v211_0_0.resolve(v51._getTime() - l_l_v211_0_0.startTime);
                    end;
                end);
            elseif l_v211_0.endTime < v220 then
                local l_l_v211_0_1 = l_v211_0;
                local l_next_0 = l_l_v211_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v220 do
                    l_l_v211_0_1 = l_next_0;
                    l_next_0 = l_l_v211_0_1.next;
                end;
                l_l_v211_0_1.next = v221;
                v221.previous = l_l_v211_0_1;
                if l_next_0 ~= nil then
                    v221.next = l_next_0;
                    l_next_0.previous = v221;
                end;
            else
                v221.next = l_v211_0;
                l_v211_0.previous = v221;
                l_v211_0 = v221;
            end;
            v218(function()
                local l_next_1 = v221.next;
                if l_v211_0 == v221 then
                    if l_next_1 == nil then
                        l_v212_0:Disconnect();
                        l_v212_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v211_0 = l_next_1;
                    return ;
                else
                    local l_previous_0 = v221.previous;
                    l_previous_0.next = l_next_1;
                    if l_next_1 ~= nil then
                        l_next_1.previous = l_previous_0;
                    end;
                    return ;
                end;
            end);
        end);
    end;
end;
v51.prototype.timeout = function(v228, v229, v230)
    local v231 = debug.traceback(nil, 2);
    return v51.race({
        v51.delay(v229):andThen(function()
            return v51.reject(v230 == nil and v12.new({
                kind = v12.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v229, v231)
            }) or v230);
        end), 
        v228
    });
end;
v51.prototype.getStatus = function(v232)
    return v232._status;
end;
v51.prototype._andThen = function(v233, v234, v235, v236)
    v233._unhandledRejection = false;
    return v51._new(v234, function(v237, v238)
        local l_v237_0 = v237;
        if v235 then
            local l_v234_0 = v234;
            local l_v235_0 = v235;
            local l_l_v234_0_0 = l_v234_0 --[[ copy: 3 -> 6 ]];
            local l_l_v235_0_0 = l_v235_0 --[[ copy: 4 -> 7 ]];
            l_v237_0 = function(...)
                local v244, v245, v246 = v40(l_l_v234_0_0, l_l_v235_0_0, ...);
                if not v244 then
                    v238(v246[1]);
                    return ;
                else
                    v237(unpack(v246, 1, v245));
                    return ;
                end;
            end;
        end;
        local l_v238_0 = v238;
        if v236 then
            local l_v234_1 = v234;
            local l_v236_0 = v236;
            l_v238_0 = function(...)
                local v250, v251, v252 = v40(l_v234_1, l_v236_0, ...);
                if not v250 then
                    v238(v252[1]);
                    return ;
                else
                    v237(unpack(v252, 1, v251));
                    return ;
                end;
            end;
        end;
        if v233._status == v51.Status.Started then
            table.insert(v233._queuedResolve, l_v237_0);
            table.insert(v233._queuedReject, l_v238_0);
            return ;
        elseif v233._status == v51.Status.Resolved then
            l_v237_0(unpack(v233._values, 1, v233._valuesLength));
            return ;
        elseif v233._status == v51.Status.Rejected then
            l_v238_0(unpack(v233._values, 1, v233._valuesLength));
            return ;
        else
            if v233._status == v51.Status.Cancelled then
                v238(v12.new({
                    error = "Promise is cancelled", 
                    kind = v12.Kind.AlreadyCancelled, 
                    context = "Promise created at\n\n" .. v234
                }));
            end;
            return ;
        end;
    end, v233);
end;
v51.prototype.andThen = function(v253, v254, v255)
    local v256 = true;
    if v254 ~= nil then
        if type(v254) == "function" then
            v256 = true;
        else
            if type(v254) == "table" then
                local v257 = getmetatable(v254);
                if v257 and type((rawget(v257, "__call"))) == "function" then
                    v256 = true;
                    goto label3 --[[  true, true  ]];
                end;
            end;
            v256 = false;
        end;
    end;
    ::label3::;
    assert(v256, string.format("Please pass a handler function to %sandThen"));
    v256 = true;
    if v255 ~= nil then
        if type(v255) == "function" then
            v256 = true;
        else
            if type(v255) == "table" then
                local v258 = getmetatable(v255);
                if v258 and type((rawget(v258, "__call"))) == "function" then
                    v256 = true;
                    goto label4 --[[  true, true  ]];
                end;
            end;
            v256 = false;
        end;
    end;
    ::label4::;
    assert(v256, string.format("Please pass a handler function to %sandThen"));
    return v253:_andThen(debug.traceback(nil, 2), v254, v255);
end;
v51.prototype.catch = function(v259, v260)
    local v261 = true;
    if v260 ~= nil then
        if type(v260) == "function" then
            v261 = true;
        else
            if type(v260) == "table" then
                local v262 = getmetatable(v260);
                if v262 and type((rawget(v262, "__call"))) == "function" then
                    v261 = true;
                    goto label5 --[[  true, true  ]];
                end;
            end;
            v261 = false;
        end;
    end;
    ::label5::;
    assert(v261, string.format("Please pass a handler function to %scatch"));
    return v259:_andThen(debug.traceback(nil, 2), nil, v260);
end;
v51.prototype.tap = function(v263, v264)
    local v265;
    if type(v264) == "function" then
        v265 = true;
    else
        if type(v264) == "table" then
            local v266 = getmetatable(v264);
            if v266 and type((rawget(v266, "__call"))) == "function" then
                v265 = true;
                goto label6 --[[  true, true  ]];
            end;
        end;
        v265 = false;
    end;
    ::label6::;
    assert(v265, string.format("Please pass a handler function to %stap"));
    return v263:_andThen(debug.traceback(nil, 2), function(...)
        local v267 = v264(...);
        if not v51.is(v267) then
            return ...;
        else
            local v268, v269 = v28(...);
            return v267:andThen(function()
                return unpack(v269, 1, v268);
            end);
        end;
    end);
end;
v51.prototype.andThenCall = function(v270, v271, ...)
    local v272;
    if type(v271) == "function" then
        v272 = true;
    else
        if type(v271) == "table" then
            local v273 = getmetatable(v271);
            if v273 and type((rawget(v273, "__call"))) == "function" then
                v272 = true;
                goto label7 --[[  true, true  ]];
            end;
        end;
        v272 = false;
    end;
    ::label7::;
    assert(v272, string.format("Please pass a handler function to %sandThenCall"));
    local v274;
    v274, v272 = v28(...);
    return v270:_andThen(debug.traceback(nil, 2), function()
        return v271(unpack(v272, 1, v274));
    end);
end;
v51.prototype.andThenReturn = function(v275, ...)
    local v276, v277 = v28(...);
    return v275:_andThen(debug.traceback(nil, 2), function()
        return unpack(v277, 1, v276);
    end);
end;
v51.prototype.cancel = function(v278)
    if v278._status ~= v51.Status.Started then
        return ;
    else
        v278._status = v51.Status.Cancelled;
        if v278._cancellationHook then
            v278._cancellationHook();
        end;
        coroutine.close(v278._thread);
        if v278._parent then
            v278._parent:_consumerCancelled(v278);
        end;
        for v279 in pairs(v278._consumers) do
            v279:cancel();
        end;
        v278:_finalize();
        return ;
    end;
end;
v51.prototype._consumerCancelled = function(v280, v281)
    if v280._status ~= v51.Status.Started then
        return ;
    else
        v280._consumers[v281] = nil;
        if next(v280._consumers) == nil then
            v280:cancel();
        end;
        return ;
    end;
end;
v51.prototype._finally = function(v282, v283, v284, v285)
    if not v285 then
        v282._unhandledRejection = false;
    end;
    return v51._new(v283, function(v286, v287)
        local l_v286_0 = v286;
        if v284 then
            local l_v283_0 = v283;
            local l_v284_0 = v284;
            local l_l_v283_0_0 = l_v283_0 --[[ copy: 3 -> 5 ]];
            l_v286_0 = function(...)
                local v292, v293, v294 = v40(l_l_v283_0_0, l_v284_0, ...);
                if not v292 then
                    v287(v294[1]);
                    return ;
                else
                    v286(unpack(v294, 1, v293));
                    return ;
                end;
            end;
        end;
        if v285 then
            local l_l_v286_0_0 = l_v286_0;
            l_v286_0 = function(...)
                if v282._status == v51.Status.Rejected then
                    return v286(v282);
                else
                    return l_l_v286_0_0(...);
                end;
            end;
        end;
        if v282._status == v51.Status.Started then
            table.insert(v282._queuedFinally, l_v286_0);
            return ;
        else
            l_v286_0(v282._status);
            return ;
        end;
    end, v282);
end;
v51.prototype.finally = function(v296, v297)
    local v298 = true;
    if v297 ~= nil then
        if type(v297) == "function" then
            v298 = true;
        else
            if type(v297) == "table" then
                local v299 = getmetatable(v297);
                if v299 and type((rawget(v299, "__call"))) == "function" then
                    v298 = true;
                    goto label8 --[[  true, true  ]];
                end;
            end;
            v298 = false;
        end;
    end;
    ::label8::;
    assert(v298, string.format("Please pass a handler function to %sfinally"));
    return v296:_finally(debug.traceback(nil, 2), v297);
end;
v51.prototype.finallyCall = function(v300, v301, ...)
    local v302;
    if type(v301) == "function" then
        v302 = true;
    else
        if type(v301) == "table" then
            local v303 = getmetatable(v301);
            if v303 and type((rawget(v303, "__call"))) == "function" then
                v302 = true;
                goto label9 --[[  true, true  ]];
            end;
        end;
        v302 = false;
    end;
    ::label9::;
    assert(v302, string.format("Please pass a handler function to %sfinallyCall"));
    local v304;
    v304, v302 = v28(...);
    return v300:_finally(debug.traceback(nil, 2), function()
        return v301(unpack(v302, 1, v304));
    end);
end;
v51.prototype.finallyReturn = function(v305, ...)
    local v306, v307 = v28(...);
    return v305:_finally(debug.traceback(nil, 2), function()
        return unpack(v307, 1, v306);
    end);
end;
v51.prototype.done = function(v308, v309)
    local v310 = true;
    if v309 ~= nil then
        if type(v309) == "function" then
            v310 = true;
        else
            if type(v309) == "table" then
                local v311 = getmetatable(v309);
                if v311 and type((rawget(v311, "__call"))) == "function" then
                    v310 = true;
                    goto label10 --[[  true, true  ]];
                end;
            end;
            v310 = false;
        end;
    end;
    ::label10::;
    assert(v310, string.format("Please pass a handler function to %sdone"));
    return v308:_finally(debug.traceback(nil, 2), v309, true);
end;
v51.prototype.doneCall = function(v312, v313, ...)
    local v314;
    if type(v313) == "function" then
        v314 = true;
    else
        if type(v313) == "table" then
            local v315 = getmetatable(v313);
            if v315 and type((rawget(v315, "__call"))) == "function" then
                v314 = true;
                goto label11 --[[  true, true  ]];
            end;
        end;
        v314 = false;
    end;
    ::label11::;
    assert(v314, string.format("Please pass a handler function to %sdoneCall"));
    local v316;
    v316, v314 = v28(...);
    return v312:_finally(debug.traceback(nil, 2), function()
        return v313(unpack(v314, 1, v316));
    end, true);
end;
v51.prototype.doneReturn = function(v317, ...)
    local v318, v319 = v28(...);
    return v317:_finally(debug.traceback(nil, 2), function()
        return unpack(v319, 1, v318);
    end, true);
end;
v51.prototype.awaitStatus = function(v320)
    v320._unhandledRejection = false;
    if v320._status == v51.Status.Started then
        local v321 = coroutine.running();
        v320:finally(function()
            task.spawn(v321);
        end);
        coroutine.yield();
    end;
    if v320._status == v51.Status.Resolved then
        return v320._status, unpack(v320._values, 1, v320._valuesLength);
    elseif v320._status == v51.Status.Rejected then
        return v320._status, unpack(v320._values, 1, v320._valuesLength);
    else
        return v320._status;
    end;
end;
v211 = function(v322, ...)
    return v322 == v51.Status.Resolved, ...;
end;
v51.prototype.await = function(v323)
    return v211(v323:awaitStatus());
end;
v212 = function(v324, ...)
    if v324 ~= v51.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v51.prototype.expect = function(v325)
    return v212(v325:awaitStatus());
end;
v51.prototype.awaitValue = v51.prototype.expect;
v51.prototype._unwrap = function(v326)
    if v326._status == v51.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v326._status == v51.Status.Resolved, unpack(v326._values, 1, v326._valuesLength);
end;
v51.prototype._resolve = function(v327, ...)
    if v327._status ~= v51.Status.Started then
        if v51.is((...)) then
            (...):_consumerCancelled(v327);
        end;
        return ;
    elseif not v51.is((...)) then
        v327._status = v51.Status.Resolved;
        local v328, v329 = v28(...);
        v327._valuesLength = v328;
        v327._values = v329;
        for _, v331 in ipairs(v327._queuedResolve) do
            coroutine.wrap(v331)(...);
        end;
        v327:_finalize();
        return ;
    else
        if select("#", ...) > 1 then
            warn((string.format("When returning a Promise from andThen, extra arguments are " .. "discarded\n\n%s", v327._source)));
        end;
        local v332 = ...;
        local v334 = v332:andThen(function(...)
            v327:_resolve(...);
        end, function(...)
            local v333 = v332._values[1];
            if v332._error then
                v333 = v12.new({
                    error = v332._error, 
                    kind = v12.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if not v12.isKind(v333, v12.Kind.ExecutionError) then
                v327:_reject(...);
                return ;
            else
                return v327:_reject(v333:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v327._source)
                }));
            end;
        end);
        if v334._status == v51.Status.Cancelled then
            v327:cancel();
            return ;
        else
            if v334._status == v51.Status.Started then
                v327._parent = v334;
                v334._consumers[v327] = true;
            end;
            return ;
        end;
    end;
end;
v51.prototype._reject = function(v335, ...)
    if v335._status ~= v51.Status.Started then
        return ;
    else
        v335._status = v51.Status.Rejected;
        local v336, v337 = v28(...);
        v335._valuesLength = v336;
        v335._values = v337;
        if next(v335._queuedReject) == nil then
            v336 = tostring((...));
            coroutine.wrap(function()
                v51._timeEvent:Wait();
                if v335._unhandledRejection then
                    local v338 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v336, v335._source);
                    for _, v340 in ipairs(v51._unhandledRejectionCallbacks) do
                        task.spawn(v340, v335, unpack(v335._values, 1, v335._valuesLength));
                    end;
                    if not v51.TEST then
                        warn(v338);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end)();
        else
            for _, v342 in ipairs(v335._queuedReject) do
                coroutine.wrap(v342)(...);
            end;
        end;
        v335:_finalize();
        return ;
    end;
end;
v51.prototype._finalize = function(v343)
    for _, v345 in ipairs(v343._queuedFinally) do
        coroutine.wrap(v345)(v343._status);
    end;
    v343._queuedFinally = nil;
    v343._queuedReject = nil;
    v343._queuedResolve = nil;
    if not v51.TEST then
        v343._parent = nil;
        v343._consumers = nil;
    end;
    task.defer(coroutine.close, v343._thread);
end;
v51.prototype.now = function(v346, v347)
    local v348 = debug.traceback(nil, 2);
    if v346._status == v51.Status.Resolved then
        return v346:_andThen(v348, function(...)
            return ...;
        end);
    else
        return v51.reject(v347 == nil and v12.new({
            kind = v12.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v348
        }) or v347);
    end;
end;
v51.retry = function(v349, v350, ...)
    local v351;
    if type(v349) == "function" then
        v351 = true;
    else
        if type(v349) == "table" then
            local v352 = getmetatable(v349);
            if v352 and type((rawget(v352, "__call"))) == "function" then
                v351 = true;
                goto label12 --[[  true, true  ]];
            end;
        end;
        v351 = false;
    end;
    ::label12::;
    assert(v351, "Parameter #1 to Promise.retry must be a function");
    assert(type(v350) == "number", "Parameter #2 to Promise.retry must be a number");
    local v353 = {
        ...
    };
    v351 = select("#", ...);
    return v51.resolve(v349(...)):catch(function(...)
        if v350 > 0 then
            return v51.retry(v349, v350 - 1, unpack(v353, 1, v351));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.retryWithDelay = function(v354, v355, v356, ...)
    local v357;
    if type(v354) == "function" then
        v357 = true;
    else
        if type(v354) == "table" then
            local v358 = getmetatable(v354);
            if v358 and type((rawget(v358, "__call"))) == "function" then
                v357 = true;
                goto label13 --[[  true, true  ]];
            end;
        end;
        v357 = false;
    end;
    ::label13::;
    assert(v357, "Parameter #1 to Promise.retry must be a function");
    assert(type(v355) == "number", "Parameter #2 (times) to Promise.retry must be a number");
    assert(type(v356) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
    local v359 = {
        ...
    };
    v357 = select("#", ...);
    return v51.resolve(v354(...)):catch(function(...)
        if v355 > 0 then
            v51.delay(v356):await();
            return v51.retryWithDelay(v354, v355 - 1, v356, unpack(v359, 1, v357));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.fromEvent = function(v360, v361)
    v361 = v361 or function()
        return true;
    end;
    return v51._new(debug.traceback(nil, 2), function(v362, _, v364)
        local v365 = nil;
        local v366 = false;
        local function v367()
            v365:Disconnect();
            v365 = nil;
        end;
        v365 = v360:Connect(function(...)
            local v368 = v361(...);
            if v368 == true then
                v362(...);
                if not v365 then
                    v366 = true;
                    return ;
                else
                    v365:Disconnect();
                    v365 = nil;
                    return ;
                end;
            else
                if type(v368) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return ;
            end;
        end);
        if not v366 or not v365 then
            v364(v367);
            return ;
        else
            return v367();
        end;
    end);
end;
v51.onUnhandledRejection = function(v369)
    table.insert(v51._unhandledRejectionCallbacks, v369);
    return function()
        local v370 = table.find(v51._unhandledRejectionCallbacks, v369);
        if v370 then
            table.remove(v51._unhandledRejectionCallbacks, v370);
        end;
    end;
end;
return v51;
