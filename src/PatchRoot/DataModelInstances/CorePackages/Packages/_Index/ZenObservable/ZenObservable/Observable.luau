local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Promise);
local l_instanceof_0 = v1.instanceof;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_setTimeout_0 = v1.setTimeout;
local l_Array_0 = v1.Array;
local l_Symbol_0 = v1.Symbol;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function _(v13)
    if typeof(v13) == "function" then
        return true;
    else
        if typeof(v13) == "table" then
            local v14 = getmetatable(v13);
            if not v14 or not rawget(v14, "__call") then
                if v13._isMockFunction then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    end;
end;
local function _()
    local v16 = false;
    if typeof(l_Symbol_0) == "table" then
        v16 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    return v16;
end;
local function _(v18)
    local v19 = false;
    if typeof(l_Symbol_0) == "table" then
        v19 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v19 then
        v19 = l_Boolean_0.toJSBoolean(l_Symbol_0[v18]);
    end;
    return v19;
end;
local function _(v21)
    local v22 = false;
    if typeof(l_Symbol_0) == "table" then
        v22 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v22 then
        v22 = l_Boolean_0.toJSBoolean(l_Symbol_0[v21]);
    end;
    if not v22 then
        return "@@" .. v21;
    else
        return l_Symbol_0[v21];
    end;
end;
local v24 = false;
if typeof(l_Symbol_0) == "table" then
    v24 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v24 then
    v24 = false;
    if typeof(l_Symbol_0) == "table" then
        v24 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v24 then
        v24 = l_Boolean_0.toJSBoolean(l_Symbol_0.observable);
    end;
    if not v24 then
        l_Symbol_0.observable = l_Symbol_0("observable");
    end;
end;
local v25 = false;
if typeof(l_Symbol_0) == "table" then
    v25 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v25 then
    v25 = l_Boolean_0.toJSBoolean(l_Symbol_0.iterator);
end;
v24 = if not v25 then "@@" .. "iterator" else l_Symbol_0.iterator;
local v26 = false;
if typeof(l_Symbol_0) == "table" then
    v26 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v26 then
    v26 = l_Boolean_0.toJSBoolean(l_Symbol_0.observable);
end;
v25 = if not v26 then "@@" .. "observable" else l_Symbol_0.observable;
local v27 = false;
if typeof(l_Symbol_0) == "table" then
    v27 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v27 then
    v27 = l_Boolean_0.toJSBoolean(l_Symbol_0.species);
end;
v26 = if not v27 then "@@" .. "species" else l_Symbol_0.species;
v27 = function(v28, v29)
    local v30 = v28[v29];
    if v30 == nil then
        return nil;
    else
        local v31;
        if typeof(v30) == "function" then
            v31 = true;
        else
            if typeof(v30) == "table" then
                local v32 = getmetatable(v30);
                if not v32 or not rawget(v32, "__call") then
                    if v30._isMockFunction then
                        v31 = true;
                        goto label0 --[[  true, true  ]];
                    end;
                else
                    v31 = true;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            v31 = false;
        end;
        ::label0::;
        if not v31 then
            error(l_Error_0.new(tostring(v30) .. " is not a function"));
        end;
        return v30;
    end;
end;
local function _(v33)
    local v34 = v33[v26];
    if v34 ~= nil then
        return v34;
    else
        return v9;
    end;
end;
local function _(v36)
    return l_instanceof_0(v36, v9);
end;
local v38 = nil;
v38 = setmetatable({}, {
    __call = function(_, v40)
        if not v38.log then
            l_setTimeout_0(function()
                error(v40);
            end, 0);
            return ;
        else
            v38:log(v40);
            return ;
        end;
    end
});
local function _(v41)
    v2.delay(0):doneCall(function()
        xpcall(v41, function(v42)
            v38(v42);
        end);
    end);
end;
local function v55(v44)
    local l__cleanup_0 = v44._cleanup;
    if l__cleanup_0 == nil then
        return ;
    else
        v44._cleanup = nil;
        if l__cleanup_0 then
            local v46 = true;
            local v47 = nil;
            local v48;
            if typeof(l__cleanup_0) == "function" then
                v48 = true;
            else
                if typeof(l__cleanup_0) == "table" then
                    local v49 = getmetatable(l__cleanup_0);
                    if not v49 or not rawget(v49, "__call") then
                        if l__cleanup_0._isMockFunction then
                            v48 = true;
                            goto label1 --[[  true, true  ]];
                        end;
                    else
                        v48 = true;
                        goto label1 --[[  true, true  ]];
                    end;
                end;
                v48 = false;
            end;
            ::label1::;
            if not v48 then
                local l_unsubscribe_0 = l__cleanup_0.unsubscribe;
                if l_unsubscribe_0 == nil then
                    v48 = nil;
                else
                    local v51;
                    if typeof(l_unsubscribe_0) == "function" then
                        v51 = true;
                    else
                        if typeof(l_unsubscribe_0) == "table" then
                            local v52 = getmetatable(l_unsubscribe_0);
                            if not v52 or not rawget(v52, "__call") then
                                if l_unsubscribe_0._isMockFunction then
                                    v51 = true;
                                    goto label2 --[[  true, true  ]];
                                end;
                            else
                                v51 = true;
                                goto label2 --[[  true, true  ]];
                            end;
                        end;
                        v51 = false;
                    end;
                    ::label2::;
                    if not v51 then
                        error(l_Error_0.new(tostring(l_unsubscribe_0) .. " is not a function"));
                    end;
                    v48 = l_unsubscribe_0;
                end;
                if v48 then
                    local v53;
                    l_unsubscribe_0, v53 = pcall(v48, l__cleanup_0);
                    v46 = l_unsubscribe_0;
                    v47 = v53;
                end;
            else
                local v54;
                v48, v54 = pcall(l__cleanup_0);
                v46 = v48;
                v47 = v54;
            end;
            if not v46 then
                v38(v47);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
local function _(v56)
    v56._observer = nil;
    v56._queue = nil;
    v56._state = "closed";
end;
local function v61(v58)
    local l__queue_0 = v58._queue;
    if l_Boolean_0.toJSBoolean(l__queue_0) then
        v58._queue = nil;
        v58._state = "ready";
        for v60 = 1, #l__queue_0 do
            v11(v58, l__queue_0[v60].type, l__queue_0[v60].value);
            if not (v58._state ~= "closed") then
                break;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v11 = function(v62, v63, v64)
    v62._state = "running";
    local l__observer_0 = v62._observer;
    local v66 = nil;
    local l_status_0, l_result_0 = pcall(v27, l__observer_0, v63);
    if l_status_0 then
        if v63 == "next" then
            if l_result_0 then
                local l_status_1, l_result_1 = pcall(l_result_0, l__observer_0, v64);
                l_status_0 = l_status_1;
                v66 = l_result_1;
            end;
        elseif v63 == "error" then
            v62._observer = nil;
            v62._queue = nil;
            v62._state = "closed";
            if not l_result_0 then
                v38(v64);
            else
                local l_status_2, l_result_2 = pcall(l_result_0, l__observer_0, v64);
                l_status_0 = l_status_2;
                v66 = l_result_2;
            end;
        elseif v63 == "complete" then
            v62._observer = nil;
            v62._queue = nil;
            v62._state = "closed";
            if l_result_0 then
                local l_status_3, l_result_3 = pcall(l_result_0, l__observer_0, v64);
                l_status_0 = l_status_3;
                v66 = l_result_3;
            end;
        end;
        if not l_status_0 then
            v38(v66);
        end;
        if v62._state == "closed" then
            v55(v62);
            return ;
        else
            if v62._state == "running" then
                v62._state = "ready";
            end;
            return ;
        end;
    else
        v38(l_result_0);
        return ;
    end;
end;
local function v80(v75, v76, v77)
    if v75._state == "closed" then
        return ;
    elseif v75._state == "buffering" then
        assert(v75._queue, "observable subscription queue nil during onNotify");
        table.insert(v75._queue, {
            type = v76, 
            value = v77
        });
        return ;
    elseif v75._state ~= "ready" then
        v75._state = "buffering";
        v75._queue = {
            {
                type = v76, 
                value = v77
            }
        };
        local function v78()
            return v61(v75);
        end;
        v2.delay(0):doneCall(function()
            xpcall(v78, function(v79)
                v38(v79);
            end);
        end);
        return ;
    else
        v11(v75, v76, v77);
        return ;
    end;
end;
local v81 = {};
v81.__index = function(v82, v83)
    if v83 == "closed" then
        return v82._state == "closed";
    elseif not rawget(v82, v83) then
        if not rawget(v81, v83) then
            return nil;
        else
            return (rawget(v81, v83));
        end;
    else
        return (rawget(v82, v83));
    end;
end;
v81.__newindex = function(v84, v85, v86)
    if v85 == "closed" then
        error("setting getter-only property 'closed'");
    end;
    rawset(v84, v85, v86);
end;
v81.new = function(v87, v88)
    local v89 = setmetatable({}, v81);
    v89._cleanup = nil;
    v89._observer = v87;
    v89._queue = nil;
    v89._state = "initializing";
    local v90 = v10.new(v89);
    local l_status_4, l_result_4 = pcall(v88, v90);
    if not l_status_4 then
        v90:error(l_result_4);
    else
        v89._cleanup = l_result_4;
    end;
    if v89._state == "initializing" then
        v89._state = "ready";
    end;
    return v89;
end;
v81.unsubscribe = function(v93)
    if v93._state ~= "closed" then
        v93._observer = nil;
        v93._queue = nil;
        v93._state = "closed";
        v55(v93);
    end;
end;
v10 = {};
v10.__index = function(v94, v95)
    if v95 == "closed" then
        return v94._subscription._state == "closed";
    elseif not rawget(v10, v95) then
        return (rawget(v94, v95));
    else
        return (rawget(v10, v95));
    end;
end;
v10.__newindex = function(v96, v97, v98)
    if v97 == "closed" then
        error("setting getter-only property 'closed'");
    end;
    rawset(v96, v97, v98);
end;
v10.new = function(v99)
    return (setmetatable({
        _subscription = v99
    }, v10));
end;
v10.next = function(v100, v101)
    v80(v100._subscription, "next", v101);
end;
v10.error = function(v102, v103)
    v80(v102._subscription, "error", v103);
end;
v10.complete = function(v104)
    v80(v104._subscription, "complete");
end;
v9 = {};
v9.__index = v9;
v12 = function(v105)
    local v106 = false;
    if typeof(v105) == "table" then
        v106 = false;
        if v105[v25] == v9[v25] then
            v106 = typeof((rawget(v105, "new"))) == "function";
        end;
    end;
    return v106;
end;
v9.new = function(v107)
    local v108;
    if typeof(v107) == "function" then
        v108 = true;
    else
        if typeof(v107) == "table" then
            local v109 = getmetatable(v107);
            if not v109 or not rawget(v109, "__call") then
                if v107._isMockFunction then
                    v108 = true;
                    goto label3 --[[  true, true  ]];
                end;
            else
                v108 = true;
                goto label3 --[[  true, true  ]];
            end;
        end;
        v108 = false;
    end;
    ::label3::;
    if not v108 then
        error("Observable initializer must be a function");
    end;
    return (setmetatable({
        _subscriber = v107
    }, v9));
end;
v9.subscribe = function(v110, v111, v112, v113)
    if not (typeof(v111) == "table") or v111 == nil then
        v111 = {
            start = nil, 
            next = v111, 
            error = v112, 
            complete = v113
        };
    end;
    return (v81.new(v111, v110._subscriber));
end;
v9.forEach = function(v114, v115)
    return v2.new(function(v116, v117)
        local l_v115_0 = v115;
        local v119;
        if typeof(l_v115_0) == "function" then
            v119 = true;
        else
            if typeof(l_v115_0) == "table" then
                local v120 = getmetatable(l_v115_0);
                if not v120 or not rawget(v120, "__call") then
                    if l_v115_0._isMockFunction then
                        v119 = true;
                        goto label4 --[[  true, true  ]];
                    end;
                else
                    v119 = true;
                    goto label4 --[[  true, true  ]];
                end;
            end;
            v119 = false;
        end;
        ::label4::;
        if v119 then
            v119 = nil;
            l_v115_0 = function()
                v119:unsubscribe();
                v116();
            end;
            v119 = v114:subscribe({
                next = function(_, v122)
                    local l_status_5, l_result_5 = pcall(v115, v122, l_v115_0);
                    if not l_status_5 then
                        v117(l_result_5);
                        v119:unsubscribe();
                    end;
                end, 
                error = function(_, v126)
                    v117(v126);
                end, 
                complete = function(_)
                    v116();
                end
            });
            return ;
        else
            v117(l_Error_0.new(tostring(v115) .. " is not a function"));
            return ;
        end;
    end);
end;
v9.map = function(v128, v129)
    local v130;
    if typeof(v129) == "function" then
        v130 = true;
    else
        if typeof(v129) == "table" then
            local v131 = getmetatable(v129);
            if not v131 or not rawget(v131, "__call") then
                if v129._isMockFunction then
                    v130 = true;
                    goto label5 --[[  true, true  ]];
                end;
            else
                v130 = true;
                goto label5 --[[  true, true  ]];
            end;
        end;
        v130 = false;
    end;
    ::label5::;
    if not v130 then
        error(l_Error_0.new(tostring(v129) .. " is not a function"));
    end;
    local v132 = v128[v26];
    return (if v132 ~= nil then v132 else v9).new(function(v133)
        return v128:subscribe({
            next = function(_, v135)
                local l_status_6, l_result_6 = pcall(v129, v135);
                if l_status_6 then
                    v133:next(l_result_6);
                    return ;
                else
                    v133:error(l_result_6);
                    return ;
                end;
            end, 
            error = function(_, v139)
                v133:error(v139);
            end, 
            complete = function(_)
                v133:complete();
            end
        });
    end);
end;
v9.filter = function(v141, v142)
    local v143;
    if typeof(v142) == "function" then
        v143 = true;
    else
        if typeof(v142) == "table" then
            local v144 = getmetatable(v142);
            if not v144 or not rawget(v144, "__call") then
                if v142._isMockFunction then
                    v143 = true;
                    goto label6 --[[  true, true  ]];
                end;
            else
                v143 = true;
                goto label6 --[[  true, true  ]];
            end;
        end;
        v143 = false;
    end;
    ::label6::;
    if not v143 then
        error(l_Error_0.new(tostring(v142) .. " is not a function"));
    end;
    local v145 = v141[v26];
    return (if v145 ~= nil then v145 else v9).new(function(v146)
        return v141:subscribe({
            next = function(_, v148)
                local v150, v151 = xpcall(v142, function(v149)
                    v146:error(v149);
                end, v148);
                if not v150 or l_Boolean_0.toJSBoolean(v151) then
                    if v150 then
                        v146:next(v148);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end, 
            error = function(_, v153)
                v146:error(v153);
            end, 
            complete = function(_)
                v146:complete();
            end
        });
    end);
end;
v9.reduce = function(v155, v156, ...)
    local v157 = {
        v156, 
        ...
    };
    local v158;
    if typeof(v156) == "function" then
        v158 = true;
    else
        if typeof(v156) == "table" then
            local v159 = getmetatable(v156);
            if not v159 or not rawget(v159, "__call") then
                if v156._isMockFunction then
                    v158 = true;
                    goto label7 --[[  true, true  ]];
                end;
            else
                v158 = true;
                goto label7 --[[  true, true  ]];
            end;
        end;
        v158 = false;
    end;
    ::label7::;
    if not v158 then
        error(l_Error_0.new(tostring(v156) .. " is not a function"));
    end;
    local v160 = v155[v26];
    v158 = if v160 ~= nil then v160 else v9;
    v160 = #v157 > 1;
    local v161 = false;
    local v162 = v157[2];
    return v158.new(function(v163)
        return v155:subscribe({
            next = function(_, v165)
                local v166 = not v161;
                v161 = true;
                if v166 and not v160 then
                    v162 = v165;
                    return ;
                else
                    local v167 = nil;
                    local v169, v170 = xpcall(v156, function(v168)
                        v163:error(v168);
                    end, v162, v165);
                    v162 = v170;
                    v167 = v169;
                    return ;
                end;
            end, 
            error = function(_, v172)
                v163:error(v172);
            end, 
            complete = function(_)
                if not (v161 or v160) then
                    v163:error(l_Error_0.new("Cannot reduce an empty sequence"));
                end;
                v163:next(v162);
                v163:complete();
            end
        });
    end);
end;
v9.concat = function(v174, ...)
    local v175 = {
        ...
    };
    local v176 = v174[v26];
    local v177 = if v176 ~= nil then v176 else v9;
    return v177.new(function(v178)
        local v179 = nil;
        local v180 = 1;
        local function v181(v182)
            v179 = v182:subscribe({
                next = function(_, v184)
                    v178:next(v184);
                end, 
                error = function(_, v186)
                    v178:error(v186);
                end, 
                complete = function(_)
                    if v180 == #v175 + 1 then
                        v179 = nil;
                        v178:complete();
                        return ;
                    else
                        local l_v181_0 = v181;
                        local l_from_0 = v177.from;
                        local l_v175_0 = v175;
                        local l_v180_0 = v180;
                        v180 = v180 + 1;
                        l_v181_0(l_from_0(l_v175_0[l_v180_0]));
                        return ;
                    end;
                end
            });
        end;
        v181(v174);
        return function()
            if l_Boolean_0.toJSBoolean(v179) then
                v179:unsubscribe();
                v179 = nil;
            end;
        end;
    end);
end;
v9.flatMap = function(v192, v193)
    local v194 = nil;
    local v195;
    if typeof(v193) == "function" then
        v195 = true;
    else
        if typeof(v193) == "table" then
            local v196 = getmetatable(v193);
            if not v196 or not rawget(v196, "__call") then
                if v193._isMockFunction then
                    v195 = true;
                    goto label8 --[[  true, true  ]];
                end;
            else
                v195 = true;
                goto label8 --[[  true, true  ]];
            end;
        end;
        v195 = false;
    end;
    ::label8::;
    if not v195 then
        error(l_Error_0.new(tostring(v193) .. " is not a function"));
    end;
    local v197 = v192[v26];
    v195 = if v197 ~= nil then v197 else v9;
    return v195.new(function(v198)
        local v199 = {};
        local v216 = v192:subscribe({
            next = function(_, v201)
                if l_Boolean_0.toJSBoolean(v193) then
                    local v202 = nil;
                    local v204, v205 = xpcall(v193, function(v203)
                        v198:error(v203);
                    end, v201);
                    v202 = v204;
                    v201 = v205;
                end;
                local v206 = nil;
                v206 = v195.from(v201):subscribe({
                    next = function(_, v208)
                        v198:next(v208);
                    end, 
                    error = function(_, v210)
                        v198:error(v210);
                    end, 
                    complete = function(_)
                        local v212 = l_Array_0.indexOf(v199, v206);
                        if v212 >= 1 then
                            l_Array_0.splice(v199, v212, 1);
                        end;
                        v194();
                    end
                });
                table.insert(v199, v206);
                return nil;
            end, 
            error = function(_, v214)
                v198:error(v214);
            end, 
            complete = function(_)
                v194();
            end
        });
        v194 = function()
            if v216.closed and #v199 == 0 then
                v198:complete();
            end;
        end;
        return function()
            l_Array_0.forEach(v199, function(v217)
                return v217:unsubscribe();
            end);
            v216:unsubscribe();
        end;
    end);
end;
v9[v25] = function(v218)
    return v218;
end;
v9.from = function(v219, v220)
    local v221 = nil;
    local v222 = nil;
    if not v12(v219) then
        v221 = v9;
        v222 = v219;
    else
        v221 = v219;
        v222 = v220;
    end;
    if v222 == nil then
        error(l_Error_0.new(tostring(v222) .. " is not an object"));
    end;
    local v223 = v222[v25];
    local v224;
    if v223 == nil then
        v224 = nil;
    else
        local v225;
        if typeof(v223) == "function" then
            v225 = true;
        else
            if typeof(v223) == "table" then
                local v226 = getmetatable(v223);
                if not v226 or not rawget(v226, "__call") then
                    if v223._isMockFunction then
                        v225 = true;
                        goto label9 --[[  true, true  ]];
                    end;
                else
                    v225 = true;
                    goto label9 --[[  true, true  ]];
                end;
            end;
            v225 = false;
        end;
        ::label9::;
        if not v225 then
            error(l_Error_0.new(tostring(v223) .. " is not a function"));
        end;
        v224 = v223;
    end;
    if not v224 then
        if not l_Array_0.isArray(v222) then
            error(l_Error_0.new(tostring(v222) .. " is not observable"));
            return ;
        else
            return v9.new(function(v227)
                local function v230()
                    if not v227.closed then
                        for _, v229 in pairs(v222) do
                            v227:next(v229);
                            if v227.closed then
                                return ;
                            end;
                        end;
                        v227:complete();
                        return ;
                    else
                        return ;
                    end;
                end;
                v2.delay(0):doneCall(function()
                    xpcall(v230, function(v231)
                        v38(v231);
                    end);
                end);
            end);
        end;
    else
        local v232 = v224(v222);
        if l_instanceof_0(v232, v9) and v232.new == v221.new then
            return v232;
        else
            return v221.new(function(v233)
                return v232:subscribe(v233);
            end);
        end;
    end;
end;
v9.of = function(v234, ...)
    local v235 = nil;
    local v236 = nil;
    if not v12(v234) then
        v235 = v9;
        v236 = {
            v234, 
            ...
        };
    else
        v235 = v234;
        v236 = {
            ...
        };
    end;
    return v235.new(function(v237)
        local function v240()
            if not v237.closed then
                for _, v239 in ipairs(v236) do
                    v237:next(v239);
                    if v237.closed then
                        return ;
                    end;
                end;
                v237:complete();
                return ;
            else
                return ;
            end;
        end;
        v2.delay(0):doneCall(function()
            xpcall(v240, function(v241)
                v38(v241);
            end);
        end);
    end);
end;
local v242 = false;
if typeof(l_Symbol_0) == "table" then
    v242 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v242 then
    v9[l_Symbol_0("extensions")] = {
        symbol = v25, 
        hostReportError = v38
    };
end;
return {
    Observable = v9
};
