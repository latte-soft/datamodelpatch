local v0 = {
    __mode = "k"
};
local function v8(v1, v2)
    local v3 = {};
    for _, v5 in ipairs(v2) do
        v3[v5] = v5;
    end;
    return (setmetatable(v3, {
        __index = function(_, v7)
            error(string.format("%s is not in %s", v7, v1), 2);
        end, 
        __newindex = function()
            error(string.format("Creating new members in %s is not allowed", v1), 2);
        end
    }));
end;
local v9 = nil;
v9 = {
    Kind = v8("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v9.__index = v9;
v9.new = function(v10, v11)
    v10 = v10 or {};
    return (setmetatable({
        error = tostring(v10.error) or "[This error has no error text.]", 
        trace = v10.trace, 
        context = v10.context, 
        kind = v10.kind, 
        parent = v11, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v9));
end;
v9.is = function(v12)
    if type(v12) == "table" then
        local v13 = getmetatable(v12);
        if type(v13) == "table" then
            local v14 = false;
            if rawget(v12, "error") ~= nil then
                v14 = type((rawget(v13, "extend"))) == "function";
            end;
            return v14;
        end;
    end;
    return false;
end;
v9.isKind = function(v15, v16)
    assert(v16 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v9.is(v15) and v15.kind == v16;
end;
v9.extend = function(v17, v18)
    v18 = v18 or {};
    v18.kind = v18.kind or v17.kind;
    return v9.new(v18, v17);
end;
v9.getErrorChain = function(v19)
    local v20 = {
        v19
    };
    while v20[#v20].parent do
        table.insert(v20, v20[#v20].parent);
    end;
    return v20;
end;
v9.__tostring = function(v21)
    local v22 = {
        string.format("-- Promise.Error(%s) --", v21.kind or "?")
    };
    for _, v24 in ipairs(v21:getErrorChain()) do
        table.insert(v22, table.concat({
            v24.trace or v24.error, 
            v24.context
        }, "\n"));
    end;
    return table.concat(v22, "\n");
end;
local function v25(...)
    return select("#", ...), {
        ...
    };
end;
local function v27(v26, ...)
    return v26, select("#", ...), {
        ...
    };
end;
local function _(v28)
    assert(v28 ~= nil);
    return function(v29)
        if type(v29) == "table" then
            return v29;
        else
            return v9.new({
                error = v29, 
                kind = v9.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v29), 2), 
                context = "Promise created at:\n\n" .. v28
            });
        end;
    end;
end;
local function v37(v31, v32, ...)
    local l_v27_0 = v27;
    local l_xpcall_0 = xpcall;
    local l_v32_0 = v32;
    assert(v31 ~= nil);
    return l_v27_0(l_xpcall_0(l_v32_0, function(v36)
        if type(v36) == "table" then
            return v36;
        else
            return v9.new({
                error = v36, 
                kind = v9.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v36), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end, ...));
end;
local function _(v38, v39, v40, v41)
    return function(...)
        local v42, v43, v44 = v37(v38, v39, ...);
        if not v42 then
            v41(v44[1]);
            return ;
        else
            v40(unpack(v44, 1, v43));
            return ;
        end;
    end;
end;
local function _(v46)
    return next(v46) == nil;
end;
local v48 = {
    Error = v9, 
    Status = v8("Promise.Status", {
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
v48.__index = v48.prototype;
v48._new = function(v49, v50, v51)
    if not (not (v51 ~= nil) or v48.is(v51)) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v52 = {
        _source = v49, 
        _status = v48.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v51, 
        _consumers = setmetatable({}, v0)
    };
    if v51 and v51._status == v48.Status.Started then
        v51._consumers[v52] = true;
    end;
    setmetatable(v52, v48);
    local function v53(...)
        v52:_resolve(...);
    end;
    local function v54(...)
        v52:_reject(...);
    end;
    local function v56(v55)
        if v55 then
            if v52._status == v48.Status.Cancelled then
                v55();
            else
                v52._cancellationHook = v55;
            end;
        end;
        return v52._status == v48.Status.Cancelled;
    end;
    coroutine.wrap(function()
        local v57, _, v59 = v37(v52._source, v50, v53, v54, v56);
        if not v57 then
            v54(v59[1]);
        end;
    end)();
    return v52;
end;
v48.new = function(v60)
    return v48._new(debug.traceback(nil, 2), v60);
end;
v48.__tostring = function(v61)
    return string.format("Promise(%s)", v61._status);
end;
v48.defer = function(v62)
    local v63 = debug.traceback(nil, 2);
    local _ = nil;
    return (v48._new(v63, function(v65, v66, v67)
        local v68 = nil;
        v68 = v48._timeEvent:Connect(function()
            v68:Disconnect();
            local v69, _, v71 = v37(v63, v62, v65, v66, v67);
            if not v69 then
                v66(v71[1]);
            end;
        end);
    end));
end;
v48.async = v48.defer;
v48.resolve = function(...)
    local v72, v73 = v25(...);
    return v48._new(debug.traceback(nil, 2), function(v74)
        v74(unpack(v73, 1, v72));
    end);
end;
v48.reject = function(...)
    local v75, v76 = v25(...);
    return v48._new(debug.traceback(nil, 2), function(_, v78)
        v78(unpack(v76, 1, v75));
    end);
end;
v48._try = function(v79, v80, ...)
    local v81, v82 = v25(...);
    return v48._new(v79, function(v83)
        v83(v80(unpack(v82, 1, v81)));
    end);
end;
v48.try = function(...)
    return v48._try(debug.traceback(nil, 2), ...);
end;
v48._all = function(v84, v85, v86)
    if type(v85) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v87, v88 in pairs(v85) do
        if not v48.is(v88) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v87))), 3);
        end;
    end;
    if not (#v85 ~= 0) or v86 == 0 then
        return v48.resolve({});
    else
        return v48._new(v84, function(v89, v90, v91)
            local v92 = {};
            local v93 = {};
            local v94 = 0;
            local v95 = 0;
            local v96 = false;
            local function v99()
                for _, v98 in ipairs(v93) do
                    v98:cancel();
                end;
            end;
            local function v103(v100, ...)
                if not v96 then
                    v94 = v94 + 1;
                    if v86 == nil then
                        v92[v100] = ...;
                    else
                        v92[v94] = ...;
                    end;
                    if (v86 or #v85) <= v94 then
                        v96 = true;
                        v89(v92);
                        for _, v102 in ipairs(v93) do
                            v102:cancel();
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end;
            v91(v99);
            for v104, v105 in ipairs(v85) do
                v93[v104] = v105:andThen(function(...)
                    v103(v104, ...);
                end, function(...)
                    v95 = v95 + 1;
                    if not (v86 ~= nil) or #v85 - v95 < v86 then
                        for _, v107 in ipairs(v93) do
                            v107:cancel();
                        end;
                        v96 = true;
                        v90(...);
                    end;
                end);
            end;
            if v96 then
                for _, v109 in ipairs(v93) do
                    v109:cancel();
                end;
            end;
        end);
    end;
end;
v48.all = function(...)
    local v110 = {
        ...
    };
    if not (not (type(v110[1]) == "table") or v48.is(v110[1])) then
        v110 = v110[1];
    end;
    return v48._all(debug.traceback(nil, 2), v110);
end;
v48.fold = function(v111, v112, v113)
    assert(type(v111) == "table", "Bad argument #1 to Promise.fold: must be a table");
    assert(type(v112) == "function", "Bad argument #2 to Promise.fold: must be a function");
    local v114 = v48.resolve(v113);
    return v48.each(v111, function(v115, v116)
        v114 = v114:andThen(function(v117)
            return v112(v117, v115, v116);
        end);
    end):andThenReturn(v114);
end;
v48.some = function(v118, v119)
    assert(type(v119) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v48._all(debug.traceback(nil, 2), v118, v119);
end;
v48.any = function(v120)
    return v48._all(debug.traceback(nil, 2), v120, 1):andThen(function(v121)
        return v121[1];
    end);
end;
v48.allSettled = function(v122)
    if type(v122) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v123, v124 in pairs(v122) do
        if not v48.is(v124) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v123))), 2);
        end;
    end;
    if #v122 == 0 then
        return v48.resolve({});
    else
        return v48._new(debug.traceback(nil, 2), function(v125, _, v127)
            local v128 = {};
            local v129 = {};
            local v130 = 0;
            local function v132(v131, ...)
                v130 = v130 + 1;
                v128[v131] = ...;
                if #v122 <= v130 then
                    v125(v128);
                end;
            end;
            v127(function()
                for _, v134 in ipairs(v129) do
                    v134:cancel();
                end;
            end);
            for v135, v136 in ipairs(v122) do
                v129[v135] = v136:finally(function(...)
                    v132(v135, ...);
                end);
            end;
        end);
    end;
end;
v48.race = function(v137)
    assert(type(v137) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v138, v139 in pairs(v137) do
        assert(v48.is(v139), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v138))));
    end;
    return v48._new(debug.traceback(nil, 2), function(v140, v141, v142)
        local v143 = {};
        local v144 = false;
        local _ = function()
            for _, v146 in ipairs(v143) do
                v146:cancel();
            end;
        end;
        local _ = function(v148)
            return function(...)
                for _, v150 in ipairs(v143) do
                    v150:cancel();
                end;
                v144 = true;
                return v148(...);
            end;
        end;
        if not v142(function(...)
            for _, v153 in ipairs(v143) do
                v153:cancel();
            end;
            v144 = true;
            return v141(...);
        end) then
            for v154, v155 in ipairs(v137) do
                v143[v154] = v155:andThen(function(...)
                    for _, v157 in ipairs(v143) do
                        v157:cancel();
                    end;
                    v144 = true;
                    return v140(...);
                end, function(...)
                    for _, v159 in ipairs(v143) do
                        v159:cancel();
                    end;
                    v144 = true;
                    return v141(...);
                end);
            end;
            if v144 then
                for _, v161 in ipairs(v143) do
                    v161:cancel();
                end;
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v48.each = function(v162, v163)
    assert(type(v162) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    assert(type(v163) == "function", string.format("Please pass a handler function to %s", "Promise.each"));
    return v48._new(debug.traceback(nil, 2), function(v164, v165, v166)
        local v167 = {};
        local v168 = {};
        local v169 = false;
        local _ = function()
            for _, v171 in ipairs(v168) do
                v171:cancel();
            end;
        end;
        v166(function()
            v169 = true;
            for _, v174 in ipairs(v168) do
                v174:cancel();
            end;
        end);
        local v175 = {};
        for v176, v177 in ipairs(v162) do
            if not v48.is(v177) then
                v175[v176] = v177;
            elseif v177:getStatus() == v48.Status.Cancelled then
                for _, v179 in ipairs(v168) do
                    v179:cancel();
                end;
                return v165(v9.new({
                    error = "Promise is cancelled", 
                    kind = v9.Kind.AlreadyCancelled, 
                    context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v176, v177._source)
                }));
            elseif v177:getStatus() == v48.Status.Rejected then
                for _, v181 in ipairs(v168) do
                    v181:cancel();
                end;
                return v165(select(2, v177:await()));
            else
                local v182 = v177:andThen(function(...)
                    return ...;
                end);
                table.insert(v168, v182);
                v175[v176] = v182;
            end;
        end;
        for v183, v184 in ipairs(v175) do
            if v48.is(v184) then
                local v185 = nil;
                local v186, v187 = v184:await();
                v185 = v186;
                v184 = v187;
                if not v185 then
                    for _, v189 in ipairs(v168) do
                        v189:cancel();
                    end;
                    return v165(v184);
                end;
            end;
            if not v169 then
                local v190 = v48.resolve(v163(v184, v183));
                table.insert(v168, v190);
                local v191, v192 = v190:await();
                if v191 then
                    v167[v183] = v192;
                else
                    for _, v194 in ipairs(v168) do
                        v194:cancel();
                    end;
                    return v165(v192);
                end;
            else
                return ;
            end;
        end;
        v164(v167);
    end);
end;
v48.is = function(v195)
    if type(v195) ~= "table" then
        return false;
    else
        local v196 = getmetatable(v195);
        if v196 == v48 then
            return true;
        elseif v196 == nil then
            return type(v195.andThen) == "function";
        elseif (type(v196) == "table" and type((rawget(v196, "__index"))) == "table") and type((rawget(rawget(v196, "__index"), "andThen"))) == "function" then
            return true;
        else
            return false;
        end;
    end;
end;
v48.promisify = function(v197)
    return function(...)
        return v48._try(debug.traceback(nil, 2), v197, ...);
    end;
end;
local v198 = nil;
local v199 = nil;
do
    local l_v198_0, l_v199_0 = v198, v199;
    v48.delay = function(v202)
        assert(type(v202) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if not (v202 >= 0.016666666666666666) or v202 == math.huge then
            v202 = 0.016666666666666666;
        end;
        return v48._new(debug.traceback(nil, 2), function(v203, _, v205)
            local v206 = v48._getTime();
            local v207 = v206 + v202;
            local v208 = {
                resolve = v203, 
                startTime = v206, 
                endTime = v207
            };
            if l_v199_0 == nil then
                l_v198_0 = v208;
                l_v199_0 = v48._timeEvent:Connect(function()
                    local v209 = v48._getTime();
                    while l_v198_0 ~= nil and l_v198_0.endTime < v209 do
                        local l_l_v198_0_0 = l_v198_0;
                        l_v198_0 = l_l_v198_0_0.next;
                        if l_v198_0 == nil then
                            l_v199_0:Disconnect();
                            l_v199_0 = nil;
                        else
                            l_v198_0.previous = nil;
                        end;
                        l_l_v198_0_0.resolve(v48._getTime() - l_l_v198_0_0.startTime);
                    end;
                end);
            elseif l_v198_0.endTime < v207 then
                local l_l_v198_0_1 = l_v198_0;
                local l_next_0 = l_l_v198_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v207 do
                    l_l_v198_0_1 = l_next_0;
                    l_next_0 = l_l_v198_0_1.next;
                end;
                l_l_v198_0_1.next = v208;
                v208.previous = l_l_v198_0_1;
                if l_next_0 ~= nil then
                    v208.next = l_next_0;
                    l_next_0.previous = v208;
                end;
            else
                v208.next = l_v198_0;
                l_v198_0.previous = v208;
                l_v198_0 = v208;
            end;
            v205(function()
                local l_next_1 = v208.next;
                if l_v198_0 == v208 then
                    if l_next_1 == nil then
                        l_v199_0:Disconnect();
                        l_v199_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v198_0 = l_next_1;
                    return ;
                else
                    local l_previous_0 = v208.previous;
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
v48.prototype.timeout = function(v215, v216, v217)
    local v218 = debug.traceback(nil, 2);
    return v48.race({
        v48.delay(v216):andThen(function()
            return v48.reject(v217 == nil and v9.new({
                kind = v9.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v216, v218)
            }) or v217);
        end), 
        v215
    });
end;
v48.prototype.getStatus = function(v219)
    return v219._status;
end;
v48.prototype._andThen = function(v220, v221, v222, v223)
    v220._unhandledRejection = false;
    return v48._new(v221, function(v224, v225)
        local l_v224_0 = v224;
        if v222 then
            local l_v221_0 = v221;
            local l_v222_0 = v222;
            local l_l_v221_0_0 = l_v221_0 --[[ copy: 3 -> 6 ]];
            local l_l_v222_0_0 = l_v222_0 --[[ copy: 4 -> 7 ]];
            l_v224_0 = function(...)
                local v231, v232, v233 = v37(l_l_v221_0_0, l_l_v222_0_0, ...);
                if not v231 then
                    v225(v233[1]);
                    return ;
                else
                    v224(unpack(v233, 1, v232));
                    return ;
                end;
            end;
        end;
        local l_v225_0 = v225;
        if v223 then
            local l_v221_1 = v221;
            local l_v223_0 = v223;
            l_v225_0 = function(...)
                local v237, v238, v239 = v37(l_v221_1, l_v223_0, ...);
                if not v237 then
                    v225(v239[1]);
                    return ;
                else
                    v224(unpack(v239, 1, v238));
                    return ;
                end;
            end;
        end;
        if v220._status == v48.Status.Started then
            table.insert(v220._queuedResolve, l_v224_0);
            table.insert(v220._queuedReject, l_v225_0);
            return ;
        elseif v220._status == v48.Status.Resolved then
            l_v224_0(unpack(v220._values, 1, v220._valuesLength));
            return ;
        elseif v220._status == v48.Status.Rejected then
            l_v225_0(unpack(v220._values, 1, v220._valuesLength));
            return ;
        else
            if v220._status == v48.Status.Cancelled then
                v225(v9.new({
                    error = "Promise is cancelled", 
                    kind = v9.Kind.AlreadyCancelled, 
                    context = "Promise created at\n\n" .. v221
                }));
            end;
            return ;
        end;
    end, v220);
end;
v48.prototype.andThen = function(v240, v241, v242)
    local v243 = true;
    if v241 ~= nil then
        v243 = true;
        if type(v241) ~= "function" then
            v243 = v241.__call ~= nil;
        end;
    end;
    assert(v243, string.format("Please pass a handler function to %sandThen"));
    v243 = true;
    if v242 ~= nil then
        v243 = true;
        if type(v242) ~= "function" then
            v243 = v242.__call ~= nil;
        end;
    end;
    assert(v243, string.format("Please pass a handler function to %sandThen"));
    return v240:_andThen(debug.traceback(nil, 2), v241, v242);
end;
v48.prototype.catch = function(v244, v245)
    local v246 = true;
    if v245 ~= nil then
        v246 = true;
        if type(v245) ~= "function" then
            v246 = v245.__call ~= nil;
        end;
    end;
    assert(v246, string.format("Please pass a handler function to %scatch"));
    return v244:_andThen(debug.traceback(nil, 2), nil, v245);
end;
v48.prototype.tap = function(v247, v248)
    assert(type(v248) == "function", string.format("Please pass a handler function to %stap"));
    return v247:_andThen(debug.traceback(nil, 2), function(...)
        local v249 = v248(...);
        if not v48.is(v249) then
            return ...;
        else
            local v250, v251 = v25(...);
            return v249:andThen(function()
                return unpack(v251, 1, v250);
            end);
        end;
    end);
end;
v48.prototype.andThenCall = function(v252, v253, ...)
    assert(type(v253) == "function", string.format("Please pass a handler function to %sandThenCall"));
    local v254, v255 = v25(...);
    return v252:_andThen(debug.traceback(nil, 2), function()
        return v253(unpack(v255, 1, v254));
    end);
end;
v48.prototype.andThenReturn = function(v256, ...)
    local v257, v258 = v25(...);
    return v256:_andThen(debug.traceback(nil, 2), function()
        return unpack(v258, 1, v257);
    end);
end;
v48.prototype.cancel = function(v259)
    if v259._status ~= v48.Status.Started then
        return ;
    else
        v259._status = v48.Status.Cancelled;
        if v259._cancellationHook then
            v259._cancellationHook();
        end;
        if v259._parent then
            v259._parent:_consumerCancelled(v259);
        end;
        for v260 in pairs(v259._consumers) do
            v260:cancel();
        end;
        v259:_finalize();
        return ;
    end;
end;
v48.prototype._consumerCancelled = function(v261, v262)
    if v261._status ~= v48.Status.Started then
        return ;
    else
        v261._consumers[v262] = nil;
        if next(v261._consumers) == nil then
            v261:cancel();
        end;
        return ;
    end;
end;
v48.prototype._finally = function(v263, v264, v265, v266)
    if not v266 then
        v263._unhandledRejection = false;
    end;
    return v48._new(v264, function(v267, v268)
        local l_v267_0 = v267;
        if v265 then
            local l_v264_0 = v264;
            local l_v265_0 = v265;
            local l_l_v264_0_0 = l_v264_0 --[[ copy: 3 -> 5 ]];
            l_v267_0 = function(...)
                local v273, v274, v275 = v37(l_l_v264_0_0, l_v265_0, ...);
                if not v273 then
                    v268(v275[1]);
                    return ;
                else
                    v267(unpack(v275, 1, v274));
                    return ;
                end;
            end;
        end;
        if v266 then
            local l_l_v267_0_0 = l_v267_0;
            l_v267_0 = function(...)
                if v263._status == v48.Status.Rejected then
                    return v267(v263);
                else
                    return l_l_v267_0_0(...);
                end;
            end;
        end;
        if v263._status == v48.Status.Started then
            table.insert(v263._queuedFinally, l_v267_0);
            return ;
        else
            l_v267_0(v263._status);
            return ;
        end;
    end, v263);
end;
v48.prototype.finally = function(v277, v278)
    local v279 = true;
    if v278 ~= nil then
        v279 = true;
        if type(v278) ~= "function" then
            v279 = v278.__call ~= nill;
        end;
    end;
    assert(v279, string.format("Please pass a handler function to %sfinally"));
    return v277:_finally(debug.traceback(nil, 2), v278);
end;
v48.prototype.finallyCall = function(v280, v281, ...)
    assert(type(v281) == "function", string.format("Please pass a handler function to %sfinallyCall"));
    local v282, v283 = v25(...);
    return v280:_finally(debug.traceback(nil, 2), function()
        return v281(unpack(v283, 1, v282));
    end);
end;
v48.prototype.finallyReturn = function(v284, ...)
    local v285, v286 = v25(...);
    return v284:_finally(debug.traceback(nil, 2), function()
        return unpack(v286, 1, v285);
    end);
end;
v48.prototype.done = function(v287, v288)
    local v289 = true;
    if v288 ~= nil then
        v289 = true;
        if type(v288) ~= "function" then
            v289 = v288.__call ~= nill;
        end;
    end;
    assert(v289, string.format("Please pass a handler function to %sdone"));
    return v287:_finally(debug.traceback(nil, 2), v288, true);
end;
v48.prototype.doneCall = function(v290, v291, ...)
    assert(type(v291) == "function", string.format("Please pass a handler function to %sdoneCall"));
    local v292, v293 = v25(...);
    return v290:_finally(debug.traceback(nil, 2), function()
        return v291(unpack(v293, 1, v292));
    end, true);
end;
v48.prototype.doneReturn = function(v294, ...)
    local v295, v296 = v25(...);
    return v294:_finally(debug.traceback(nil, 2), function()
        return unpack(v296, 1, v295);
    end, true);
end;
v48.prototype.awaitStatus = function(v297)
    v297._unhandledRejection = false;
    if v297._status == v48.Status.Started then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v297:finally(function()
            l_BindableEvent_0:Fire();
        end);
        l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
    end;
    if v297._status == v48.Status.Resolved then
        return v297._status, unpack(v297._values, 1, v297._valuesLength);
    elseif v297._status == v48.Status.Rejected then
        return v297._status, unpack(v297._values, 1, v297._valuesLength);
    else
        return v297._status;
    end;
end;
v198 = function(v299, ...)
    return v299 == v48.Status.Resolved, ...;
end;
v48.prototype.await = function(v300)
    return v198(v300:awaitStatus());
end;
v199 = function(v301, ...)
    if v301 ~= v48.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v48.prototype.expect = function(v302)
    return v199(v302:awaitStatus());
end;
v48.prototype.awaitValue = v48.prototype.expect;
v48.prototype._unwrap = function(v303)
    if v303._status == v48.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v303._status == v48.Status.Resolved, unpack(v303._values, 1, v303._valuesLength);
end;
v48.prototype._resolve = function(v304, ...)
    if v304._status ~= v48.Status.Started then
        if v48.is((...)) then
            (...):_consumerCancelled(v304);
        end;
        return ;
    elseif not v48.is((...)) then
        v304._status = v48.Status.Resolved;
        local v305, v306 = v25(...);
        v304._valuesLength = v305;
        v304._values = v306;
        for _, v308 in ipairs(v304._queuedResolve) do
            coroutine.wrap(v308)(...);
        end;
        v304:_finalize();
        return ;
    else
        if select("#", ...) > 1 then
            warn((string.format("When returning a Promise from andThen, extra arguments are " .. "discarded\n\n%s", v304._source)));
        end;
        local v309 = ...;
        local v311 = v309:andThen(function(...)
            v304:_resolve(...);
        end, function(...)
            local v310 = v309._values[1];
            if v309._error then
                v310 = v9.new({
                    error = v309._error, 
                    kind = v9.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if not v9.isKind(v310, v9.Kind.ExecutionError) then
                v304:_reject(...);
                return ;
            else
                return v304:_reject(v310:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v304._source)
                }));
            end;
        end);
        if v311._status == v48.Status.Cancelled then
            v304:cancel();
            return ;
        else
            if v311._status == v48.Status.Started then
                v304._parent = v311;
                v311._consumers[v304] = true;
            end;
            return ;
        end;
    end;
end;
v48.prototype._reject = function(v312, ...)
    if v312._status ~= v48.Status.Started then
        return ;
    else
        v312._status = v48.Status.Rejected;
        local v313, v314 = v25(...);
        v312._valuesLength = v313;
        v312._values = v314;
        if next(v312._queuedReject) == nil then
            v313 = tostring((...));
            coroutine.wrap(function()
                v48._timeEvent:Wait();
                if v312._unhandledRejection then
                    local v315 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v313, v312._source);
                    for _, v317 in ipairs(v48._unhandledRejectionCallbacks) do
                        task.spawn(v317, v312, unpack(v312._values, 1, v312._valuesLength));
                    end;
                    if not v48.TEST then
                        warn(v315);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end)();
        else
            for _, v319 in ipairs(v312._queuedReject) do
                coroutine.wrap(v319)(...);
            end;
        end;
        v312:_finalize();
        return ;
    end;
end;
v48.prototype._finalize = function(v320)
    for _, v322 in ipairs(v320._queuedFinally) do
        coroutine.wrap(v322)(v320._status);
    end;
    v320._queuedFinally = nil;
    v320._queuedReject = nil;
    v320._queuedResolve = nil;
    if not v48.TEST then
        v320._parent = nil;
        v320._consumers = nil;
    end;
end;
v48.prototype.now = function(v323, v324)
    local v325 = debug.traceback(nil, 2);
    if v323._status == v48.Status.Resolved then
        return v323:_andThen(v325, function(...)
            return ...;
        end);
    else
        return v48.reject(v324 == nil and v9.new({
            kind = v9.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v325
        }) or v324);
    end;
end;
v48.retry = function(v326, v327, ...)
    assert(type(v326) == "function", "Parameter #1 to Promise.retry must be a function");
    assert(type(v327) == "number", "Parameter #2 to Promise.retry must be a number");
    local v328 = {
        ...
    };
    local v329 = select("#", ...);
    return v48.resolve(v326(...)):catch(function(...)
        if v327 > 0 then
            return v48.retry(v326, v327 - 1, unpack(v328, 1, v329));
        else
            return v48.reject(...);
        end;
    end);
end;
v48.fromEvent = function(v330, v331)
    v331 = v331 or function()
        return true;
    end;
    return v48._new(debug.traceback(nil, 2), function(v332, _, v334)
        local v335 = nil;
        local v336 = false;
        local function v337()
            v335:Disconnect();
            v335 = nil;
        end;
        v335 = v330:Connect(function(...)
            local v338 = v331(...);
            if v338 == true then
                v332(...);
                if not v335 then
                    v336 = true;
                    return ;
                else
                    v335:Disconnect();
                    v335 = nil;
                    return ;
                end;
            else
                if type(v338) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return ;
            end;
        end);
        if not v336 or not v335 then
            v334(v337);
            return ;
        else
            return v337();
        end;
    end);
end;
v48.onUnhandledRejection = function(v339)
    table.insert(v48._unhandledRejectionCallbacks, v339);
    return function()
        local v340 = table.find(v48._unhandledRejectionCallbacks, v339);
        if v340 then
            table.remove(v48._unhandledRejectionCallbacks, v340);
        end;
    end;
end;
return v48;
