local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_String_0 = v2.String;
local l_Symbol_0 = v2.Symbol;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local l_isPrimitive_0 = require(l_Parent_1.JestGetType).isPrimitive;
local v10 = require(l_Parent_1.JestMatcherUtils);
local l_DIM_COLOR_0 = v10.DIM_COLOR;
local l_EXPECTED_COLOR_0 = v10.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v10.RECEIVED_COLOR;
local l_diff_0 = v10.diff;
local l_ensureExpectedIsNonNegativeInteger_0 = v10.ensureExpectedIsNonNegativeInteger;
local l_ensureNoExpected_0 = v10.ensureNoExpected;
local l_matcherErrorMessage_0 = v10.matcherErrorMessage;
local l_matcherHint_0 = v10.matcherHint;
local l_printExpected_0 = v10.printExpected;
local l_printReceived_0 = v10.printReceived;
local l_printWithType_0 = v10.printWithType;
local l_stringify_0 = v10.stringify;
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local l_iterableEquality_0 = require(l_Parent_0.utils).iterableEquality;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
v25 = function(v46)
    return v46 ~= false;
end;
v26 = function(v47)
    if #v47 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v47, function(v48)
            return l_printExpected_0(v48);
        end), ", ");
    end;
end;
v27 = function(v49, v50)
    local v51 = v50 or {};
    if #v49 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v49, function(v52, v53)
            if not (l_Array_0.isArray(v51) and v53 <= #v51) or not v29(v51[v53], v52) then
                return l_printReceived_0(v52);
            else
                return v28(v52);
            end;
        end), ", ");
    end;
end;
v28 = function(v54)
    return l_DIM_COLOR_0(l_stringify_0(v54));
end;
v29 = function(v55, v56)
    return l_equals_0(v55, v56, {
        l_iterableEquality_0
    });
end;
v30 = function(v57, v58)
    return v29(v57, v58);
end;
v31 = function(v59, v60)
    local v61 = false;
    if v60.type == "return" then
        v61 = v29(v59, v60.value);
    end;
    return v61;
end;
v32 = function(v62)
    return l_Array_0.reduce(v62, function(v63, v64)
        if v64.type == "return" then
            return v63 + 1;
        else
            return v63;
        end;
    end, 0);
end;
v33 = function(v65, v66)
    local v67 = string.format("\nNumber of returns: %s", l_printReceived_0(v65));
    if v66 ~= v65 then
        v67 = v67 .. string.format("\nNumber of calls:   %s", l_printReceived_0(v66));
    end;
    return v67;
end;
v34 = function(v68)
    local v69 = v68:find(":");
    local v70 = v68:sub(v69);
    return function(v71, v72)
        local _ = nil;
        return if not v72 then string.rep(" ", (math.max(0, (v69 - 1) - #v71))) else "->" .. string.rep(" ", (math.max(0, (v69 - 3) - #v71))) .. v71 .. v70;
    end;
end;
v35 = function(v74, v75, v76, v77)
    if #v75 == 0 then
        return "";
    elseif not v76 then
        local v78 = v34("Received:       ");
        return "Received\n" .. l_Array_0.reduce(v75, function(v79, v80)
            local v81 = v80[1];
            return v79 .. v78(tostring(v81), v81 == v77) .. v27(v80[2], v74) .. "\n";
        end, "");
    else
        return "Received:       " .. v27(v75[1], v74) .. "\n";
    end;
end;
v36 = function(v82, v83, v84, v85, v86)
    local v87 = string.format("Expected: %s\n", v26(v82));
    if #v83 == 0 then
        return v87;
    elseif v85 and (not (v86 ~= 1) or v86 == nil) then
        local v88 = v83[1][2];
        if not v38(v82, v88) then
            return v87 .. "Received: " .. v27(v88, v82) .. "\n";
        else
            local v89 = {
                l_EXPECTED_COLOR_0("- Expected"), 
                l_RECEIVED_COLOR_0("+ Received"), 
                ""
            };
            for v90 = 1, math.max(#v82, #v88) do
                local l_v90_0 = v90;
                local v92 = false;
                if l_v90_0 <= #v82 and l_v90_0 <= #v88 then
                    if v29(v82[l_v90_0], v88[l_v90_0]) then
                        table.insert(v89, "  " .. v28(v88[l_v90_0]) .. ",");
                        v92 = true;
                    end;
                    if not (v92 or not v39(v82[l_v90_0], v88[l_v90_0])) then
                        local v93 = l_diff_0(v82[l_v90_0], v88[l_v90_0], {
                            v84
                        });
                        if not ((not (typeof(v93) == "string") or not v93:find("%- Expected")) or not v93:find("%+ Received")) then
                            local v94 = {};
                            for v95 in v93:gmatch("[^\n]+") do
                                table.insert(v94, v95);
                            end;
                            table.insert(v89, l_Array_0.join(l_Array_0.slice(v94, 3), "\n") .. ",");
                            v92 = true;
                        end;
                    end;
                end;
                if not v92 then
                    if l_v90_0 <= #v82 then
                        table.insert(v89, l_EXPECTED_COLOR_0("- " .. l_stringify_0(v82[l_v90_0])) .. ",");
                    end;
                    if l_v90_0 <= #v88 then
                        table.insert(v89, l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v88[l_v90_0])) .. ",");
                    end;
                end;
                l_v90_0 = l_v90_0 + 1;
            end;
            return table.concat(v89, "\n") .. "\n";
        end;
    else
        local v96 = v34("Received: ");
        return v87 .. "Received\n" .. l_Array_0.reduce(v83, function(v97, v98)
            local v99 = v98[1];
            local v100 = v98[2];
            local v101 = v96(tostring(v99), v99 == v86);
            if not (not (v99 ~= v86) or v86 == nil) or not v38(v82, v100) then
                return v97 .. v101 .. v27(v100, v82) .. "\n";
            else
                return v97 .. v101:sub(1, v101:find(":") - 1) .. "\n" .. v101:sub(v101:find(":") + 1, #v101) .. v37(v82, v100, v84) .. "\n";
            end;
        end, "");
    end;
end;
local v102 = string.gsub("Received", "[a-zA-Z0-9_]", " ");
v37 = function(v103, v104, v105)
    return l_Array_0.join(l_Array_0.map(v104, function(v106, v107)
        if v107 <= #v103 then
            if not v29(v103[v107], v106) then
                if v39(v103[v107], v106) then
                    local v108 = l_diff_0(v103[v107], v106, {
                        expand = v105
                    });
                    if not ((not (typeof(v108) == "string") or not v108:find("%- Expected")) or not v108:find("%+ Received")) then
                        local v109 = {};
                        for v110 in v108:gmatch("[^\n]+") do
                            table.insert(v109, v110);
                        end;
                        return l_Array_0.join(l_Array_0.map(l_Array_0.slice(v109, 3), function(v111)
                            return v102 .. v111;
                        end), "\n") .. ",";
                    end;
                end;
            else
                return v102 .. "  " .. v28(v106) .. ",";
            end;
        end;
        return v102 .. if v107 <= #v103 then "  " .. l_printReceived_0(v106) else l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v106)) .. ",";
    end), "\n");
end;
v38 = function(v112, v113)
    return l_Array_0.some(v112, function(v114, v115)
        local v116 = false;
        if v115 <= #v113 then
            v116 = v39(v114, v113[v115]);
        end;
        return v116;
    end);
end;
v39 = function(v117, v118)
    local v119 = l_getType_0(v117);
    local v120 = l_getType_0(v118);
    if v119 ~= v120 then
        return false;
    elseif not l_isPrimitive_0(v117) then
        if not ((v119 ~= "date" and v119 ~= "function") and v119 ~= "regexp") or v119 == "error" then
            return false;
        elseif v119 == "table" and typeof(v117.asymmetricMatch) == "function" then
            return false;
        elseif v120 == "table" and typeof(v118.asymmetricMatch) == "function" then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v40 = function(v121, v122)
    if v121.type == "throw" then
        return "function call threw an error";
    elseif v121.type == "incomplete" then
        return "function call has not returned yet";
    elseif not v29(v122, v121.value) then
        return l_printReceived_0(v121.value);
    else
        return v28(v121.value);
    end;
end;
v41 = function(v123, v124, v125, v126, v127)
    if #v125 == 0 then
        return "";
    elseif v126 and (not (v127 ~= 1) or v127 == nil) then
        return v123 .. v40(v125[1][2], v124) .. "\n";
    else
        local v128 = v34(v123);
        local v129 = v123:find(":") or 1;
        return l_String_0.trim(v123:sub(1, v129 - 1) .. v123:sub(v129 + 1, #v123)) .. "\n" .. l_Array_0.reduce(v125, function(v130, v131)
            local v132 = v131[1];
            return v130 .. v128(tostring(v132), v132 == v127) .. v40(v131[2], v124) .. "\n";
        end, "");
    end;
end;
local _ = function(v133)
    return function(v134, v135, v136)
        local v137 = {
            isNot = v134.isNot, 
            promise = v134.promise
        };
        l_ensureNoExpected_0(v136, v133, v137);
        v44(v135, v133, "", v137);
        local v138 = v43(v135);
        local v139 = nil;
        v139 = if not v138 then v135.getMockName() else "spy";
        local v140 = nil;
        v140 = if not v138 then #v135.mock.calls else v135.calls:count();
        local v141 = nil;
        v141 = if not v138 then v135.mock.calls else l_Array_0.map(v135.calls:all(), function(v142)
            return v142.args;
        end);
        local v143 = v140 > 0;
        local _ = nil;
        return {
            message = not v143 and function()
                return l_matcherHint_0(v133, v139, "", v137) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v140));
            end or function()
                return l_matcherHint_0(v133, v139, "", v137) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v140)) .. l_Array_0.join(l_Array_0.reduce(v141, function(v145, v146, v147)
                    if #v145 < 3 then
                        table.insert(v145, ("%s: %s"):format(tostring(v147), v27(v146)));
                    end;
                    return v145;
                end, {}), "\n");
            end, 
            pass = v143
        };
    end;
end;
local _ = function(v149)
    return function(v150, v151, v152)
        local v153 = {
            isNot = v150.isNot, 
            promise = v150.promise
        };
        l_ensureNoExpected_0(v152, v149, v153);
        v45(v151, v149, "", v153);
        local v154 = v151.getMockName();
        local v157 = l_Array_0.reduce(v151.mock.results, function(v155, v156)
            if v156.type == "return" then
                return v155 + 1;
            else
                return v155;
            end;
        end, 0);
        local v158 = v157 > 0;
        local _ = nil;
        return {
            message = not v158 and function()
                local v160 = l_matcherHint_0(v149, v154, "", v153) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v157));
                if #v151.mock.calls ~= v157 then
                    v160 = v160 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v151.mock.calls));
                end;
                return v160;
            end or function()
                local v164 = l_matcherHint_0(v149, v154, "", v153) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v157)) .. l_Array_0.join(l_Array_0.reduce(v151.mock.results, function(v161, v162, v163)
                    if v162.type == "return" and #v161 < 3 then
                        table.insert(v161, ("%s: %s"):format(tostring(v163), l_printReceived_0(v162.value)));
                    end;
                    return v161;
                end, {}), "\n");
                if #v151.mock.calls ~= v157 then
                    v164 = v164 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v151.mock.calls);
                end;
                return v164;
            end, 
            pass = v158
        };
    end;
end;
local _ = function(v166)
    return function(v167, v168, v169)
        local v170 = {
            isNot = v167.isNot, 
            promise = v167.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v169, v166, v170);
        v44(v168, v166, "expected", v170);
        local v171 = v43(v168);
        local v172 = nil;
        v172 = if not v171 then v168.getMockName() else "spy";
        local v173 = nil;
        v173 = if not v171 then #v168.mock.calls else v168.calls:count();
        local v174 = v173 == v169;
        local _ = nil;
        return {
            message = not v174 and function()
                return l_matcherHint_0(v166, v172, "expected", v170) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v169)) .. ("Received number of calls: %s"):format(l_printReceived_0(v173));
            end or function()
                return l_matcherHint_0(v166, v172, "expected", v170) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v169));
            end, 
            pass = v174
        };
    end;
end;
local _ = function(v177)
    return function(v178, v179, v180)
        local v181 = {
            isNot = v178.isNot, 
            promise = v178.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v180, v177, v181);
        v45(v179, v177, "expected", v181);
        local v182 = v179.getMockName();
        local v185 = l_Array_0.reduce(v179.mock.results, function(v183, v184)
            if v184.type == "return" then
                return v183 + 1;
            else
                return v183;
            end;
        end, 0);
        local v186 = v185 == v180;
        local _ = nil;
        return {
            message = not v186 and function()
                local v188 = l_matcherHint_0(v177, v182, "expected", v181) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v180)) .. ("Received number of returns: %s"):format(l_printReceived_0(v185));
                if #v179.mock.calls ~= v185 then
                    v188 = v188 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v179.mock.calls));
                end;
                return v188;
            end or function()
                local v189 = l_matcherHint_0(v177, v182, "expected", v181) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v180));
                if #v179.mock.calls ~= v185 then
                    v189 = v189 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v179.mock.calls));
                end;
                return v189;
            end, 
            pass = v186
        };
    end;
end;
local _ = function(v191)
    return function(v192, v193, ...)
        local v194 = {
            ...
        };
        for v195 = 1, select("#", ...) do
            if v194[v195] == nil then
                v194[v195] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v196 = {
            isNot = v192.isNot, 
            promise = v192.promise
        };
        v44(v193, v191, "...expected", v196);
        local v197 = v43(v193);
        local v198 = nil;
        v198 = if not v197 then v193.getMockName() else "spy";
        local v199 = nil;
        v199 = if not v197 then v193.mock.calls else l_Array_0.map(v193.calls:all(), function(v200)
            return v200.args;
        end);
        local v202 = l_Array_0.some(v199, function(v201)
            return v30(v194, v201);
        end);
        local _ = nil;
        return {
            message = not v202 and function()
                local v204 = {};
                local v205 = 1;
                while v205 <= #v199 and #v204 < 3 do
                    table.insert(v204, {
                        v205, 
                        v199[v205]
                    });
                    v205 = v205 + 1;
                end;
                return l_matcherHint_0(v191, v198, "...expected", v196) .. "\n\n" .. v36(v194, v204, v25(v192.expand), #v199 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v199));
            end or function()
                local v206 = {};
                local v207 = 1;
                while v207 <= #v199 and #v206 < 3 do
                    if v30(v194, v199[v207]) then
                        table.insert(v206, {
                            v207, 
                            v199[v207]
                        });
                    end;
                    v207 = v207 + 1;
                end;
                local v208 = l_matcherHint_0(v191, v198, "...expected", v196) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v194));
                if not (#v199 == 1) or l_stringify_0(v199[1]) ~= l_stringify_0(v194) then
                    v208 = v208 .. v35(v194, v206, #v199 == 1);
                end;
                return v208 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v199));
            end, 
            pass = v202
        };
    end;
end;
local _ = function(v210)
    return function(v211, v212, v213)
        local v214 = {
            isNot = v211.isNot, 
            promise = v211.promise
        };
        v45(v212, v210, "expected", v214);
        local v215 = v212.getMockName();
        local l_mock_0 = v212.mock;
        local l_calls_0 = l_mock_0.calls;
        local l_results_0 = l_mock_0.results;
        local v220 = l_Array_0.some(l_results_0, function(v219)
            return v31(v213, v219);
        end);
        local _ = nil;
        return {
            message = not v220 and function()
                local v222 = {};
                local v223 = 1;
                while v223 <= #l_results_0 and #v222 < 3 do
                    table.insert(v222, {
                        v223, 
                        l_results_0[v223]
                    });
                    v223 = v223 + 1;
                end;
                return l_matcherHint_0(v210, v215, "expected", v214) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v213)) .. v41("Received: ", v213, v222, #l_results_0 == 1) .. v33(v32(l_results_0), #l_calls_0);
            end or function()
                local v224 = {};
                local v225 = 1;
                while v225 <= #l_results_0 and #v224 < 3 do
                    if v31(v213, l_results_0[v225]) then
                        table.insert(v224, {
                            v225, 
                            l_results_0[v225]
                        });
                    end;
                    v225 = v225 + 1;
                end;
                local v226 = l_matcherHint_0(v210, v215, "expected", v214) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v213));
                if not (#l_results_0 == 1 and l_results_0[1].type == "return") or l_stringify_0(l_results_0[1].value) ~= l_stringify_0(v213) then
                    v226 = v226 .. v41("Received:       ", v213, v224, #l_results_0 == 1);
                end;
                return v226 .. v33(v32(l_results_0), #l_calls_0);
            end, 
            pass = v220
        };
    end;
end;
local _ = function(v228)
    return function(v229, v230, ...)
        local v231 = {
            ...
        };
        for v232 = 1, select("#", ...) do
            if v231[v232] == nil then
                v231[v232] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v233 = {
            isNot = v229.isNot, 
            promise = v229.promise
        };
        v44(v230, v228, "...expected", v233);
        local v234 = v43(v230);
        local v235 = nil;
        v235 = if not v234 then v230.getMockName() else "spy";
        local v236 = nil;
        v236 = if not v234 then v230.mock.calls else l_Array_0.map(v230.calls:all(), function(v237)
            return v237.args;
        end);
        local v238 = #v236;
        local v239 = false;
        if v238 >= 1 then
            v239 = v30(v231, v236[v238]);
        end;
        local _ = nil;
        return {
            message = not v239 and function()
                local v241 = {};
                if v238 >= 1 then
                    if v238 > 1 then
                        local v242 = v238 - 1;
                        while not (not (v242 >= 1) or v30(v231, v236[v242])) do
                            v242 = v242 - 1;
                        end;
                        if v242 < 1 then
                            v242 = v238 - 1;
                        end;
                        table.insert(v241, {
                            v242, 
                            v236[v242]
                        });
                    end;
                    table.insert(v241, {
                        v238, 
                        v236[v238]
                    });
                end;
                return l_matcherHint_0(v228, v235, "...expected", v233) .. "\n\n" .. v36(v231, v241, v25(v229.expand), #v236 == 1, v238) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v236));
            end or function()
                local v243 = {};
                if v238 > 1 then
                    table.insert(v243, {
                        v238 - 1, 
                        v236[v238 - 1]
                    });
                end;
                table.insert(v243, {
                    v238, 
                    v236[v238]
                });
                local v244 = l_matcherHint_0(v228, v235, "...expected", v233) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v231));
                if not (#v236 == 1) or l_stringify_0(v236[1]) ~= l_stringify_0(v231) then
                    v244 = v244 .. v35(v231, v243, #v236 == 1, v238);
                end;
                return v244 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v236));
            end, 
            pass = v239
        };
    end;
end;
local _ = function(v246)
    return function(v247, v248, v249)
        local v250 = {
            isNot = v247.isNot, 
            promise = v247.promise
        };
        v45(v248, v246, "expected", v250);
        local v251 = v248.getMockName();
        local l_mock_1 = v248.mock;
        local l_calls_1 = l_mock_1.calls;
        local l_results_1 = l_mock_1.results;
        local v255 = #l_results_1;
        local v256 = false;
        if v255 >= 1 then
            v256 = v31(v249, l_results_1[v255]);
        end;
        local _ = nil;
        return {
            message = not v256 and function()
                local v258 = {};
                if v255 >= 1 then
                    if v255 > 1 then
                        local v259 = v255 - 1;
                        while not (not (v259 >= 1) or v31(v249, l_results_1[v259])) do
                            v259 = v259 - 1;
                        end;
                        if v259 < 1 then
                            v259 = v255 - 1;
                        end;
                        table.insert(v258, {
                            v259, 
                            l_results_1[v259]
                        });
                    end;
                    table.insert(v258, {
                        v255, 
                        l_results_1[v255]
                    });
                end;
                return l_matcherHint_0(v246, v251, "expected", v250) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v249)) .. v41("Received: ", v249, v258, #l_results_1 == 1, v255) .. v33(v32(l_results_1), #l_calls_1);
            end or function()
                local v260 = {};
                if v255 > 1 then
                    table.insert(v260, {
                        v255 - 1, 
                        l_results_1[v255 - 1]
                    });
                end;
                table.insert(v260, {
                    v255, 
                    l_results_1[v255]
                });
                local v261 = l_matcherHint_0(v246, v251, "expected", v250) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v249));
                if not (#l_results_1 == 1 and l_results_1[1].type == "return") or l_stringify_0(l_results_1[1].value) ~= l_stringify_0(v249) then
                    v261 = v261 .. v41("Received:       ", v249, v260, #l_results_1 == 1, v255);
                end;
                return v261 .. v33(v32(l_results_1), #l_calls_1);
            end, 
            pass = v256
        };
    end;
end;
local _ = function(v263)
    return function(v264, v265, v266, ...)
        local v267 = {
            ...
        };
        for v268 = 1, select("#", ...) do
            if v267[v268] == nil then
                v267[v268] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v270 = {
            expectedColor = function(v269)
                return v269;
            end, 
            isNot = v264.isNot, 
            promise = v264.promise, 
            secondArgument = "...expected"
        };
        v44(v265, v263, "n", v270);
        if not l_Number_0.isSafeInteger(v266) or v266 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v263, nil, "n", v270), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v266, l_stringify_0))));
        end;
        local v271 = v43(v265);
        local v272 = nil;
        v272 = if not v271 then v265.getMockName() else "spy";
        local v273 = nil;
        v273 = if not v271 then v265.mock.calls else l_Array_0.map(v265.calls:all(), function(v274)
            return v274.args;
        end);
        local v275 = #v273;
        local v276 = false;
        if v266 <= v275 then
            v276 = v30(v267, v273[v266]);
        end;
        local _ = nil;
        return {
            message = not v276 and function()
                local v278 = {};
                if v266 <= v275 then
                    if v266 - 1 >= 1 then
                        local v279 = v266 - 1;
                        while not (not (v279 >= 1) or v30(v267, v273[v279])) do
                            v279 = v279 - 1;
                        end;
                        if v279 < 1 then
                            v279 = v266 - 1;
                        end;
                        table.insert(v278, {
                            v279, 
                            v273[v279]
                        });
                    end;
                    table.insert(v278, {
                        v266, 
                        v273[v266]
                    });
                    if v266 + 1 <= v275 then
                        local v280 = v266 + 1;
                        while not (not (v280 <= v275) or v30(v267, v273[v280])) do
                            v280 = v280 + 1;
                        end;
                        if v275 <= v280 then
                            v280 = v266 + 1;
                        end;
                        table.insert(v278, {
                            v280, 
                            v273[v280]
                        });
                    end;
                elseif v275 > 1 then
                    local v281 = v275 - 1;
                    while not (not (v281 >= 1) or v30(v267, v273[v281])) do
                        v281 = v281 - 1;
                    end;
                    if v281 < 1 then
                        v281 = v275 - 1;
                    end;
                    table.insert(v278, {
                        v281, 
                        v273[v281]
                    });
                end;
                return l_matcherHint_0(v263, v272, "n", v270) .. "\n\n" .. ("n: %s\n"):format((tostring(v266))) .. v36(v267, v278, v25(v264.expand), #v273 == 1, v266) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v273));
            end or function()
                local v282 = {};
                if v266 - 1 >= 1 then
                    table.insert(v282, {
                        v266 - 1, 
                        v273[v266 - 1]
                    });
                end;
                table.insert(v282, {
                    v266, 
                    v273[v266]
                });
                if v266 + 1 <= v275 then
                    table.insert(v282, {
                        v266 + 1, 
                        v273[v266 + 1]
                    });
                end;
                local v283 = l_matcherHint_0(v263, v272, "n", v270) .. "\n\n" .. ("n: %s\n"):format((tostring(v266))) .. ("Expected: never %s\n"):format(v26(v267));
                if not (#v273 == 1) or l_stringify_0(v273[1]) ~= l_stringify_0(v267) then
                    v283 = v283 .. v35(v267, v282, #v273 == 1, v266);
                end;
                return v283 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v273));
            end, 
            pass = v276
        };
    end;
end;
local _ = function(v285)
    return function(v286, v287, v288, v289)
        local v291 = {
            expectedColor = function(v290)
                return v290;
            end, 
            isNot = v286.isNot, 
            promise = v286.promise, 
            secondArgument = "expected"
        };
        v45(v287, v285, "n", v291);
        if not l_Number_0.isSafeInteger(v288) or v288 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v285, nil, "n", v291), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v288, l_stringify_0))));
        end;
        local v292 = v287.getMockName();
        local l_mock_2 = v287.mock;
        local l_calls_2 = l_mock_2.calls;
        local l_results_2 = l_mock_2.results;
        local v296 = #l_results_2;
        local v297 = false;
        if v288 <= v296 then
            v297 = v31(v289, l_results_2[v288]);
        end;
        local _ = nil;
        return {
            message = not v297 and function()
                local v299 = {};
                if v288 <= v296 then
                    if v288 - 1 >= 1 then
                        local v300 = v288 - 1;
                        while not (not (v300 >= 1) or v31(v289, l_results_2[v300])) do
                            v300 = v300 - 1;
                        end;
                        if v300 < 1 then
                            v300 = v288 - 1;
                        end;
                        table.insert(v299, {
                            v300, 
                            l_results_2[v300]
                        });
                    end;
                    table.insert(v299, {
                        v288, 
                        l_results_2[v288]
                    });
                    if v288 + 1 <= v296 then
                        local v301 = v288 + 1;
                        while not (not (v301 <= v296) or v31(v289, l_results_2[v301])) do
                            v301 = v301 + 1;
                        end;
                        if v296 < v301 then
                            v301 = v288 + 1;
                        end;
                        table.insert(v299, {
                            v301, 
                            l_results_2[v301]
                        });
                    end;
                elseif v296 > 0 then
                    local l_v296_0 = v296;
                    while not (not (l_v296_0 >= 1) or v31(v289, l_results_2[l_v296_0])) do
                        l_v296_0 = l_v296_0 - 1;
                    end;
                    if l_v296_0 < 1 then
                        l_v296_0 = v296 - 1;
                    end;
                    table.insert(v299, {
                        l_v296_0, 
                        l_results_2[l_v296_0]
                    });
                end;
                return l_matcherHint_0(v285, v292, "n", v291) .. "\n\n" .. ("n: %s\n"):format((tostring(v288))) .. ("Expected: %s\n"):format(l_printExpected_0(v289)) .. v41("Received: ", v289, v299, #l_results_2 == 1, v288) .. v33(v32(l_results_2), #l_calls_2);
            end or function()
                local v303 = {};
                if v288 - 1 >= 1 then
                    table.insert(v303, {
                        v288 - 1, 
                        l_results_2[v288 - 1]
                    });
                end;
                table.insert(v303, {
                    v288, 
                    l_results_2[v288]
                });
                if v288 + 1 <= v296 then
                    table.insert(v303, {
                        v288 + 1, 
                        l_results_2[v288 + 1]
                    });
                end;
                local v304 = l_matcherHint_0(v285, v292, "n", v291) .. "\n\n" .. ("n: %s\n"):format((tostring(v288))) .. ("Expected: never %s\n"):format(l_printExpected_0(v289));
                if not (#l_results_2 == 1 and l_results_2[1].type == "return") or l_stringify_0(l_results_2[1].value) ~= l_stringify_0(v289) then
                    v304 = v304 .. v41("Received:       ", v289, v303, #l_results_2 == 1, v288);
                end;
                return v304 .. v33(v32(l_results_2), #l_calls_2);
            end, 
            pass = v297
        };
    end;
end;
local v306 = {};
local v307 = "lastCalledWith";
local l_v307_0 = v307 --[[ copy: 61 -> 62 ]];
v306.lastCalledWith = function(v309, v310, ...)
    local v311 = {
        ...
    };
    for v312 = 1, select("#", ...) do
        if v311[v312] == nil then
            v311[v312] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v313 = {
        isNot = v309.isNot, 
        promise = v309.promise
    };
    v44(v310, l_v307_0, "...expected", v313);
    local v314 = v43(v310);
    local v315 = nil;
    v315 = if not v314 then v310.getMockName() else "spy";
    local v316 = nil;
    v316 = if not v314 then v310.mock.calls else l_Array_0.map(v310.calls:all(), function(v317)
        return v317.args;
    end);
    local v318 = #v316;
    local v319 = false;
    if v318 >= 1 then
        v319 = v30(v311, v316[v318]);
    end;
    local _ = nil;
    return {
        message = not v319 and function()
            local v321 = {};
            if v318 >= 1 then
                if v318 > 1 then
                    local v322 = v318 - 1;
                    while not (not (v322 >= 1) or v30(v311, v316[v322])) do
                        v322 = v322 - 1;
                    end;
                    if v322 < 1 then
                        v322 = v318 - 1;
                    end;
                    table.insert(v321, {
                        v322, 
                        v316[v322]
                    });
                end;
                table.insert(v321, {
                    v318, 
                    v316[v318]
                });
            end;
            return l_matcherHint_0(l_v307_0, v315, "...expected", v313) .. "\n\n" .. v36(v311, v321, v25(v309.expand), #v316 == 1, v318) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v316));
        end or function()
            local v323 = {};
            if v318 > 1 then
                table.insert(v323, {
                    v318 - 1, 
                    v316[v318 - 1]
                });
            end;
            table.insert(v323, {
                v318, 
                v316[v318]
            });
            local v324 = l_matcherHint_0(l_v307_0, v315, "...expected", v313) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v311));
            if not (#v316 == 1) or l_stringify_0(v316[1]) ~= l_stringify_0(v311) then
                v324 = v324 .. v35(v311, v323, #v316 == 1, v318);
            end;
            return v324 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v316));
        end, 
        pass = v319
    };
end;
v307 = "lastReturnedWith";
local l_v307_1 = v307 --[[ copy: 61 -> 63 ]];
v306.lastReturnedWith = function(v326, v327, v328)
    local v329 = {
        isNot = v326.isNot, 
        promise = v326.promise
    };
    v45(v327, l_v307_1, "expected", v329);
    local v330 = v327.getMockName();
    local l_mock_3 = v327.mock;
    local l_calls_3 = l_mock_3.calls;
    local l_results_3 = l_mock_3.results;
    local v334 = #l_results_3;
    local v335 = false;
    if v334 >= 1 then
        v335 = v31(v328, l_results_3[v334]);
    end;
    local _ = nil;
    return {
        message = not v335 and function()
            local v337 = {};
            if v334 >= 1 then
                if v334 > 1 then
                    local v338 = v334 - 1;
                    while not (not (v338 >= 1) or v31(v328, l_results_3[v338])) do
                        v338 = v338 - 1;
                    end;
                    if v338 < 1 then
                        v338 = v334 - 1;
                    end;
                    table.insert(v337, {
                        v338, 
                        l_results_3[v338]
                    });
                end;
                table.insert(v337, {
                    v334, 
                    l_results_3[v334]
                });
            end;
            return l_matcherHint_0(l_v307_1, v330, "expected", v329) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v328)) .. v41("Received: ", v328, v337, #l_results_3 == 1, v334) .. v33(v32(l_results_3), #l_calls_3);
        end or function()
            local v339 = {};
            if v334 > 1 then
                table.insert(v339, {
                    v334 - 1, 
                    l_results_3[v334 - 1]
                });
            end;
            table.insert(v339, {
                v334, 
                l_results_3[v334]
            });
            local v340 = l_matcherHint_0(l_v307_1, v330, "expected", v329) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v328));
            if not (#l_results_3 == 1 and l_results_3[1].type == "return") or l_stringify_0(l_results_3[1].value) ~= l_stringify_0(v328) then
                v340 = v340 .. v41("Received:       ", v328, v339, #l_results_3 == 1, v334);
            end;
            return v340 .. v33(v32(l_results_3), #l_calls_3);
        end, 
        pass = v335
    };
end;
v307 = "nthCalledWith";
local l_v307_2 = v307 --[[ copy: 61 -> 64 ]];
v306.nthCalledWith = function(v342, v343, v344, ...)
    local v345 = {
        ...
    };
    for v346 = 1, select("#", ...) do
        if v345[v346] == nil then
            v345[v346] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v348 = {
        expectedColor = function(v347)
            return v347;
        end, 
        isNot = v342.isNot, 
        promise = v342.promise, 
        secondArgument = "...expected"
    };
    v44(v343, l_v307_2, "n", v348);
    if not l_Number_0.isSafeInteger(v344) or v344 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v307_2, nil, "n", v348), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v344, l_stringify_0))));
    end;
    local v349 = v43(v343);
    local v350 = nil;
    v350 = if not v349 then v343.getMockName() else "spy";
    local v351 = nil;
    v351 = if not v349 then v343.mock.calls else l_Array_0.map(v343.calls:all(), function(v352)
        return v352.args;
    end);
    local v353 = #v351;
    local v354 = false;
    if v344 <= v353 then
        v354 = v30(v345, v351[v344]);
    end;
    local _ = nil;
    return {
        message = not v354 and function()
            local v356 = {};
            if v344 <= v353 then
                if v344 - 1 >= 1 then
                    local v357 = v344 - 1;
                    while not (not (v357 >= 1) or v30(v345, v351[v357])) do
                        v357 = v357 - 1;
                    end;
                    if v357 < 1 then
                        v357 = v344 - 1;
                    end;
                    table.insert(v356, {
                        v357, 
                        v351[v357]
                    });
                end;
                table.insert(v356, {
                    v344, 
                    v351[v344]
                });
                if v344 + 1 <= v353 then
                    local v358 = v344 + 1;
                    while not (not (v358 <= v353) or v30(v345, v351[v358])) do
                        v358 = v358 + 1;
                    end;
                    if v353 <= v358 then
                        v358 = v344 + 1;
                    end;
                    table.insert(v356, {
                        v358, 
                        v351[v358]
                    });
                end;
            elseif v353 > 1 then
                local v359 = v353 - 1;
                while not (not (v359 >= 1) or v30(v345, v351[v359])) do
                    v359 = v359 - 1;
                end;
                if v359 < 1 then
                    v359 = v353 - 1;
                end;
                table.insert(v356, {
                    v359, 
                    v351[v359]
                });
            end;
            return l_matcherHint_0(l_v307_2, v350, "n", v348) .. "\n\n" .. ("n: %s\n"):format((tostring(v344))) .. v36(v345, v356, v25(v342.expand), #v351 == 1, v344) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v351));
        end or function()
            local v360 = {};
            if v344 - 1 >= 1 then
                table.insert(v360, {
                    v344 - 1, 
                    v351[v344 - 1]
                });
            end;
            table.insert(v360, {
                v344, 
                v351[v344]
            });
            if v344 + 1 <= v353 then
                table.insert(v360, {
                    v344 + 1, 
                    v351[v344 + 1]
                });
            end;
            local v361 = l_matcherHint_0(l_v307_2, v350, "n", v348) .. "\n\n" .. ("n: %s\n"):format((tostring(v344))) .. ("Expected: never %s\n"):format(v26(v345));
            if not (#v351 == 1) or l_stringify_0(v351[1]) ~= l_stringify_0(v345) then
                v361 = v361 .. v35(v345, v360, #v351 == 1, v344);
            end;
            return v361 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v351));
        end, 
        pass = v354
    };
end;
v307 = "nthReturnedWith";
local l_v307_3 = v307 --[[ copy: 61 -> 65 ]];
v306.nthReturnedWith = function(v363, v364, v365, v366)
    local v368 = {
        expectedColor = function(v367)
            return v367;
        end, 
        isNot = v363.isNot, 
        promise = v363.promise, 
        secondArgument = "expected"
    };
    v45(v364, l_v307_3, "n", v368);
    if not l_Number_0.isSafeInteger(v365) or v365 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v307_3, nil, "n", v368), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v365, l_stringify_0))));
    end;
    local v369 = v364.getMockName();
    local l_mock_4 = v364.mock;
    local l_calls_4 = l_mock_4.calls;
    local l_results_4 = l_mock_4.results;
    local v373 = #l_results_4;
    local v374 = false;
    if v365 <= v373 then
        v374 = v31(v366, l_results_4[v365]);
    end;
    local _ = nil;
    return {
        message = not v374 and function()
            local v376 = {};
            if v365 <= v373 then
                if v365 - 1 >= 1 then
                    local v377 = v365 - 1;
                    while not (not (v377 >= 1) or v31(v366, l_results_4[v377])) do
                        v377 = v377 - 1;
                    end;
                    if v377 < 1 then
                        v377 = v365 - 1;
                    end;
                    table.insert(v376, {
                        v377, 
                        l_results_4[v377]
                    });
                end;
                table.insert(v376, {
                    v365, 
                    l_results_4[v365]
                });
                if v365 + 1 <= v373 then
                    local v378 = v365 + 1;
                    while not (not (v378 <= v373) or v31(v366, l_results_4[v378])) do
                        v378 = v378 + 1;
                    end;
                    if v373 < v378 then
                        v378 = v365 + 1;
                    end;
                    table.insert(v376, {
                        v378, 
                        l_results_4[v378]
                    });
                end;
            elseif v373 > 0 then
                local l_v373_0 = v373;
                while not (not (l_v373_0 >= 1) or v31(v366, l_results_4[l_v373_0])) do
                    l_v373_0 = l_v373_0 - 1;
                end;
                if l_v373_0 < 1 then
                    l_v373_0 = v373 - 1;
                end;
                table.insert(v376, {
                    l_v373_0, 
                    l_results_4[l_v373_0]
                });
            end;
            return l_matcherHint_0(l_v307_3, v369, "n", v368) .. "\n\n" .. ("n: %s\n"):format((tostring(v365))) .. ("Expected: %s\n"):format(l_printExpected_0(v366)) .. v41("Received: ", v366, v376, #l_results_4 == 1, v365) .. v33(v32(l_results_4), #l_calls_4);
        end or function()
            local v380 = {};
            if v365 - 1 >= 1 then
                table.insert(v380, {
                    v365 - 1, 
                    l_results_4[v365 - 1]
                });
            end;
            table.insert(v380, {
                v365, 
                l_results_4[v365]
            });
            if v365 + 1 <= v373 then
                table.insert(v380, {
                    v365 + 1, 
                    l_results_4[v365 + 1]
                });
            end;
            local v381 = l_matcherHint_0(l_v307_3, v369, "n", v368) .. "\n\n" .. ("n: %s\n"):format((tostring(v365))) .. ("Expected: never %s\n"):format(l_printExpected_0(v366));
            if not (#l_results_4 == 1 and l_results_4[1].type == "return") or l_stringify_0(l_results_4[1].value) ~= l_stringify_0(v366) then
                v381 = v381 .. v41("Received:       ", v366, v380, #l_results_4 == 1, v365);
            end;
            return v381 .. v33(v32(l_results_4), #l_calls_4);
        end, 
        pass = v374
    };
end;
v307 = "toBeCalled";
local l_v307_4 = v307 --[[ copy: 61 -> 66 ]];
v306.toBeCalled = function(v383, v384, v385)
    local v386 = {
        isNot = v383.isNot, 
        promise = v383.promise
    };
    l_ensureNoExpected_0(v385, l_v307_4, v386);
    v44(v384, l_v307_4, "", v386);
    local v387 = v43(v384);
    local v388 = nil;
    v388 = if not v387 then v384.getMockName() else "spy";
    local v389 = nil;
    v389 = if not v387 then #v384.mock.calls else v384.calls:count();
    local v390 = nil;
    v390 = if not v387 then v384.mock.calls else l_Array_0.map(v384.calls:all(), function(v391)
        return v391.args;
    end);
    local v392 = v389 > 0;
    local _ = nil;
    return {
        message = not v392 and function()
            return l_matcherHint_0(l_v307_4, v388, "", v386) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v389));
        end or function()
            return l_matcherHint_0(l_v307_4, v388, "", v386) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v389)) .. l_Array_0.join(l_Array_0.reduce(v390, function(v394, v395, v396)
                if #v394 < 3 then
                    table.insert(v394, ("%s: %s"):format(tostring(v396), v27(v395)));
                end;
                return v394;
            end, {}), "\n");
        end, 
        pass = v392
    };
end;
v307 = "toBeCalledTimes";
local l_v307_5 = v307 --[[ copy: 61 -> 67 ]];
v306.toBeCalledTimes = function(v398, v399, v400)
    local v401 = {
        isNot = v398.isNot, 
        promise = v398.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v400, l_v307_5, v401);
    v44(v399, l_v307_5, "expected", v401);
    local v402 = v43(v399);
    local v403 = nil;
    v403 = if not v402 then v399.getMockName() else "spy";
    local v404 = nil;
    v404 = if not v402 then #v399.mock.calls else v399.calls:count();
    local v405 = v404 == v400;
    local _ = nil;
    return {
        message = not v405 and function()
            return l_matcherHint_0(l_v307_5, v403, "expected", v401) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v400)) .. ("Received number of calls: %s"):format(l_printReceived_0(v404));
        end or function()
            return l_matcherHint_0(l_v307_5, v403, "expected", v401) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v400));
        end, 
        pass = v405
    };
end;
v307 = "toBeCalledWith";
local l_v307_6 = v307 --[[ copy: 61 -> 68 ]];
v306.toBeCalledWith = function(v408, v409, ...)
    local v410 = {
        ...
    };
    for v411 = 1, select("#", ...) do
        if v410[v411] == nil then
            v410[v411] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v412 = {
        isNot = v408.isNot, 
        promise = v408.promise
    };
    v44(v409, l_v307_6, "...expected", v412);
    local v413 = v43(v409);
    local v414 = nil;
    v414 = if not v413 then v409.getMockName() else "spy";
    local v415 = nil;
    v415 = if not v413 then v409.mock.calls else l_Array_0.map(v409.calls:all(), function(v416)
        return v416.args;
    end);
    local v418 = l_Array_0.some(v415, function(v417)
        return v30(v410, v417);
    end);
    local _ = nil;
    return {
        message = not v418 and function()
            local v420 = {};
            local v421 = 1;
            while v421 <= #v415 and #v420 < 3 do
                table.insert(v420, {
                    v421, 
                    v415[v421]
                });
                v421 = v421 + 1;
            end;
            return l_matcherHint_0(l_v307_6, v414, "...expected", v412) .. "\n\n" .. v36(v410, v420, v25(v408.expand), #v415 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v415));
        end or function()
            local v422 = {};
            local v423 = 1;
            while v423 <= #v415 and #v422 < 3 do
                if v30(v410, v415[v423]) then
                    table.insert(v422, {
                        v423, 
                        v415[v423]
                    });
                end;
                v423 = v423 + 1;
            end;
            local v424 = l_matcherHint_0(l_v307_6, v414, "...expected", v412) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v410));
            if not (#v415 == 1) or l_stringify_0(v415[1]) ~= l_stringify_0(v410) then
                v424 = v424 .. v35(v410, v422, #v415 == 1);
            end;
            return v424 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v415));
        end, 
        pass = v418
    };
end;
v307 = "toHaveBeenCalled";
local l_v307_7 = v307 --[[ copy: 61 -> 69 ]];
v306.toHaveBeenCalled = function(v426, v427, v428)
    local v429 = {
        isNot = v426.isNot, 
        promise = v426.promise
    };
    l_ensureNoExpected_0(v428, l_v307_7, v429);
    v44(v427, l_v307_7, "", v429);
    local v430 = v43(v427);
    local v431 = nil;
    v431 = if not v430 then v427.getMockName() else "spy";
    local v432 = nil;
    v432 = if not v430 then #v427.mock.calls else v427.calls:count();
    local v433 = nil;
    v433 = if not v430 then v427.mock.calls else l_Array_0.map(v427.calls:all(), function(v434)
        return v434.args;
    end);
    local v435 = v432 > 0;
    local _ = nil;
    return {
        message = not v435 and function()
            return l_matcherHint_0(l_v307_7, v431, "", v429) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v432));
        end or function()
            return l_matcherHint_0(l_v307_7, v431, "", v429) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v432)) .. l_Array_0.join(l_Array_0.reduce(v433, function(v437, v438, v439)
                if #v437 < 3 then
                    table.insert(v437, ("%s: %s"):format(tostring(v439), v27(v438)));
                end;
                return v437;
            end, {}), "\n");
        end, 
        pass = v435
    };
end;
v307 = "toHaveBeenCalledTimes";
local l_v307_8 = v307 --[[ copy: 61 -> 70 ]];
v306.toHaveBeenCalledTimes = function(v441, v442, v443)
    local v444 = {
        isNot = v441.isNot, 
        promise = v441.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v443, l_v307_8, v444);
    v44(v442, l_v307_8, "expected", v444);
    local v445 = v43(v442);
    local v446 = nil;
    v446 = if not v445 then v442.getMockName() else "spy";
    local v447 = nil;
    v447 = if not v445 then #v442.mock.calls else v442.calls:count();
    local v448 = v447 == v443;
    local _ = nil;
    return {
        message = not v448 and function()
            return l_matcherHint_0(l_v307_8, v446, "expected", v444) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v443)) .. ("Received number of calls: %s"):format(l_printReceived_0(v447));
        end or function()
            return l_matcherHint_0(l_v307_8, v446, "expected", v444) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v443));
        end, 
        pass = v448
    };
end;
v307 = "toHaveBeenCalledWith";
local l_v307_9 = v307 --[[ copy: 61 -> 71 ]];
v306.toHaveBeenCalledWith = function(v451, v452, ...)
    local v453 = {
        ...
    };
    for v454 = 1, select("#", ...) do
        if v453[v454] == nil then
            v453[v454] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v455 = {
        isNot = v451.isNot, 
        promise = v451.promise
    };
    v44(v452, l_v307_9, "...expected", v455);
    local v456 = v43(v452);
    local v457 = nil;
    v457 = if not v456 then v452.getMockName() else "spy";
    local v458 = nil;
    v458 = if not v456 then v452.mock.calls else l_Array_0.map(v452.calls:all(), function(v459)
        return v459.args;
    end);
    local v461 = l_Array_0.some(v458, function(v460)
        return v30(v453, v460);
    end);
    local _ = nil;
    return {
        message = not v461 and function()
            local v463 = {};
            local v464 = 1;
            while v464 <= #v458 and #v463 < 3 do
                table.insert(v463, {
                    v464, 
                    v458[v464]
                });
                v464 = v464 + 1;
            end;
            return l_matcherHint_0(l_v307_9, v457, "...expected", v455) .. "\n\n" .. v36(v453, v463, v25(v451.expand), #v458 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v458));
        end or function()
            local v465 = {};
            local v466 = 1;
            while v466 <= #v458 and #v465 < 3 do
                if v30(v453, v458[v466]) then
                    table.insert(v465, {
                        v466, 
                        v458[v466]
                    });
                end;
                v466 = v466 + 1;
            end;
            local v467 = l_matcherHint_0(l_v307_9, v457, "...expected", v455) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v453));
            if not (#v458 == 1) or l_stringify_0(v458[1]) ~= l_stringify_0(v453) then
                v467 = v467 .. v35(v453, v465, #v458 == 1);
            end;
            return v467 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v458));
        end, 
        pass = v461
    };
end;
v307 = "toHaveBeenLastCalledWith";
local l_v307_10 = v307 --[[ copy: 61 -> 72 ]];
v306.toHaveBeenLastCalledWith = function(v469, v470, ...)
    local v471 = {
        ...
    };
    for v472 = 1, select("#", ...) do
        if v471[v472] == nil then
            v471[v472] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v473 = {
        isNot = v469.isNot, 
        promise = v469.promise
    };
    v44(v470, l_v307_10, "...expected", v473);
    local v474 = v43(v470);
    local v475 = nil;
    v475 = if not v474 then v470.getMockName() else "spy";
    local v476 = nil;
    v476 = if not v474 then v470.mock.calls else l_Array_0.map(v470.calls:all(), function(v477)
        return v477.args;
    end);
    local v478 = #v476;
    local v479 = false;
    if v478 >= 1 then
        v479 = v30(v471, v476[v478]);
    end;
    local _ = nil;
    return {
        message = not v479 and function()
            local v481 = {};
            if v478 >= 1 then
                if v478 > 1 then
                    local v482 = v478 - 1;
                    while not (not (v482 >= 1) or v30(v471, v476[v482])) do
                        v482 = v482 - 1;
                    end;
                    if v482 < 1 then
                        v482 = v478 - 1;
                    end;
                    table.insert(v481, {
                        v482, 
                        v476[v482]
                    });
                end;
                table.insert(v481, {
                    v478, 
                    v476[v478]
                });
            end;
            return l_matcherHint_0(l_v307_10, v475, "...expected", v473) .. "\n\n" .. v36(v471, v481, v25(v469.expand), #v476 == 1, v478) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v476));
        end or function()
            local v483 = {};
            if v478 > 1 then
                table.insert(v483, {
                    v478 - 1, 
                    v476[v478 - 1]
                });
            end;
            table.insert(v483, {
                v478, 
                v476[v478]
            });
            local v484 = l_matcherHint_0(l_v307_10, v475, "...expected", v473) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v471));
            if not (#v476 == 1) or l_stringify_0(v476[1]) ~= l_stringify_0(v471) then
                v484 = v484 .. v35(v471, v483, #v476 == 1, v478);
            end;
            return v484 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v476));
        end, 
        pass = v479
    };
end;
v307 = "toHaveBeenNthCalledWith";
local l_v307_11 = v307 --[[ copy: 61 -> 73 ]];
v306.toHaveBeenNthCalledWith = function(v486, v487, v488, ...)
    local v489 = {
        ...
    };
    for v490 = 1, select("#", ...) do
        if v489[v490] == nil then
            v489[v490] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v492 = {
        expectedColor = function(v491)
            return v491;
        end, 
        isNot = v486.isNot, 
        promise = v486.promise, 
        secondArgument = "...expected"
    };
    v44(v487, l_v307_11, "n", v492);
    if not l_Number_0.isSafeInteger(v488) or v488 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v307_11, nil, "n", v492), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v488, l_stringify_0))));
    end;
    local v493 = v43(v487);
    local v494 = nil;
    v494 = if not v493 then v487.getMockName() else "spy";
    local v495 = nil;
    v495 = if not v493 then v487.mock.calls else l_Array_0.map(v487.calls:all(), function(v496)
        return v496.args;
    end);
    local v497 = #v495;
    local v498 = false;
    if v488 <= v497 then
        v498 = v30(v489, v495[v488]);
    end;
    local _ = nil;
    return {
        message = not v498 and function()
            local v500 = {};
            if v488 <= v497 then
                if v488 - 1 >= 1 then
                    local v501 = v488 - 1;
                    while not (not (v501 >= 1) or v30(v489, v495[v501])) do
                        v501 = v501 - 1;
                    end;
                    if v501 < 1 then
                        v501 = v488 - 1;
                    end;
                    table.insert(v500, {
                        v501, 
                        v495[v501]
                    });
                end;
                table.insert(v500, {
                    v488, 
                    v495[v488]
                });
                if v488 + 1 <= v497 then
                    local v502 = v488 + 1;
                    while not (not (v502 <= v497) or v30(v489, v495[v502])) do
                        v502 = v502 + 1;
                    end;
                    if v497 <= v502 then
                        v502 = v488 + 1;
                    end;
                    table.insert(v500, {
                        v502, 
                        v495[v502]
                    });
                end;
            elseif v497 > 1 then
                local v503 = v497 - 1;
                while not (not (v503 >= 1) or v30(v489, v495[v503])) do
                    v503 = v503 - 1;
                end;
                if v503 < 1 then
                    v503 = v497 - 1;
                end;
                table.insert(v500, {
                    v503, 
                    v495[v503]
                });
            end;
            return l_matcherHint_0(l_v307_11, v494, "n", v492) .. "\n\n" .. ("n: %s\n"):format((tostring(v488))) .. v36(v489, v500, v25(v486.expand), #v495 == 1, v488) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v495));
        end or function()
            local v504 = {};
            if v488 - 1 >= 1 then
                table.insert(v504, {
                    v488 - 1, 
                    v495[v488 - 1]
                });
            end;
            table.insert(v504, {
                v488, 
                v495[v488]
            });
            if v488 + 1 <= v497 then
                table.insert(v504, {
                    v488 + 1, 
                    v495[v488 + 1]
                });
            end;
            local v505 = l_matcherHint_0(l_v307_11, v494, "n", v492) .. "\n\n" .. ("n: %s\n"):format((tostring(v488))) .. ("Expected: never %s\n"):format(v26(v489));
            if not (#v495 == 1) or l_stringify_0(v495[1]) ~= l_stringify_0(v489) then
                v505 = v505 .. v35(v489, v504, #v495 == 1, v488);
            end;
            return v505 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v495));
        end, 
        pass = v498
    };
end;
v307 = "toHaveLastReturnedWith";
local l_v307_12 = v307 --[[ copy: 61 -> 74 ]];
v306.toHaveLastReturnedWith = function(v507, v508, v509)
    local v510 = {
        isNot = v507.isNot, 
        promise = v507.promise
    };
    v45(v508, l_v307_12, "expected", v510);
    local v511 = v508.getMockName();
    local l_mock_5 = v508.mock;
    local l_calls_5 = l_mock_5.calls;
    local l_results_5 = l_mock_5.results;
    local v515 = #l_results_5;
    local v516 = false;
    if v515 >= 1 then
        v516 = v31(v509, l_results_5[v515]);
    end;
    local _ = nil;
    return {
        message = not v516 and function()
            local v518 = {};
            if v515 >= 1 then
                if v515 > 1 then
                    local v519 = v515 - 1;
                    while not (not (v519 >= 1) or v31(v509, l_results_5[v519])) do
                        v519 = v519 - 1;
                    end;
                    if v519 < 1 then
                        v519 = v515 - 1;
                    end;
                    table.insert(v518, {
                        v519, 
                        l_results_5[v519]
                    });
                end;
                table.insert(v518, {
                    v515, 
                    l_results_5[v515]
                });
            end;
            return l_matcherHint_0(l_v307_12, v511, "expected", v510) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v509)) .. v41("Received: ", v509, v518, #l_results_5 == 1, v515) .. v33(v32(l_results_5), #l_calls_5);
        end or function()
            local v520 = {};
            if v515 > 1 then
                table.insert(v520, {
                    v515 - 1, 
                    l_results_5[v515 - 1]
                });
            end;
            table.insert(v520, {
                v515, 
                l_results_5[v515]
            });
            local v521 = l_matcherHint_0(l_v307_12, v511, "expected", v510) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v509));
            if not (#l_results_5 == 1 and l_results_5[1].type == "return") or l_stringify_0(l_results_5[1].value) ~= l_stringify_0(v509) then
                v521 = v521 .. v41("Received:       ", v509, v520, #l_results_5 == 1, v515);
            end;
            return v521 .. v33(v32(l_results_5), #l_calls_5);
        end, 
        pass = v516
    };
end;
v307 = "toHaveNthReturnedWith";
local l_v307_13 = v307 --[[ copy: 61 -> 75 ]];
v306.toHaveNthReturnedWith = function(v523, v524, v525, v526)
    local v528 = {
        expectedColor = function(v527)
            return v527;
        end, 
        isNot = v523.isNot, 
        promise = v523.promise, 
        secondArgument = "expected"
    };
    v45(v524, l_v307_13, "n", v528);
    if not l_Number_0.isSafeInteger(v525) or v525 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v307_13, nil, "n", v528), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v525, l_stringify_0))));
    end;
    local v529 = v524.getMockName();
    local l_mock_6 = v524.mock;
    local l_calls_6 = l_mock_6.calls;
    local l_results_6 = l_mock_6.results;
    local v533 = #l_results_6;
    local v534 = false;
    if v525 <= v533 then
        v534 = v31(v526, l_results_6[v525]);
    end;
    local _ = nil;
    return {
        message = not v534 and function()
            local v536 = {};
            if v525 <= v533 then
                if v525 - 1 >= 1 then
                    local v537 = v525 - 1;
                    while not (not (v537 >= 1) or v31(v526, l_results_6[v537])) do
                        v537 = v537 - 1;
                    end;
                    if v537 < 1 then
                        v537 = v525 - 1;
                    end;
                    table.insert(v536, {
                        v537, 
                        l_results_6[v537]
                    });
                end;
                table.insert(v536, {
                    v525, 
                    l_results_6[v525]
                });
                if v525 + 1 <= v533 then
                    local v538 = v525 + 1;
                    while not (not (v538 <= v533) or v31(v526, l_results_6[v538])) do
                        v538 = v538 + 1;
                    end;
                    if v533 < v538 then
                        v538 = v525 + 1;
                    end;
                    table.insert(v536, {
                        v538, 
                        l_results_6[v538]
                    });
                end;
            elseif v533 > 0 then
                local l_v533_0 = v533;
                while not (not (l_v533_0 >= 1) or v31(v526, l_results_6[l_v533_0])) do
                    l_v533_0 = l_v533_0 - 1;
                end;
                if l_v533_0 < 1 then
                    l_v533_0 = v533 - 1;
                end;
                table.insert(v536, {
                    l_v533_0, 
                    l_results_6[l_v533_0]
                });
            end;
            return l_matcherHint_0(l_v307_13, v529, "n", v528) .. "\n\n" .. ("n: %s\n"):format((tostring(v525))) .. ("Expected: %s\n"):format(l_printExpected_0(v526)) .. v41("Received: ", v526, v536, #l_results_6 == 1, v525) .. v33(v32(l_results_6), #l_calls_6);
        end or function()
            local v540 = {};
            if v525 - 1 >= 1 then
                table.insert(v540, {
                    v525 - 1, 
                    l_results_6[v525 - 1]
                });
            end;
            table.insert(v540, {
                v525, 
                l_results_6[v525]
            });
            if v525 + 1 <= v533 then
                table.insert(v540, {
                    v525 + 1, 
                    l_results_6[v525 + 1]
                });
            end;
            local v541 = l_matcherHint_0(l_v307_13, v529, "n", v528) .. "\n\n" .. ("n: %s\n"):format((tostring(v525))) .. ("Expected: never %s\n"):format(l_printExpected_0(v526));
            if not (#l_results_6 == 1 and l_results_6[1].type == "return") or l_stringify_0(l_results_6[1].value) ~= l_stringify_0(v526) then
                v541 = v541 .. v41("Received:       ", v526, v540, #l_results_6 == 1, v525);
            end;
            return v541 .. v33(v32(l_results_6), #l_calls_6);
        end, 
        pass = v534
    };
end;
v307 = "toHaveReturned";
local l_v307_14 = v307 --[[ copy: 61 -> 76 ]];
v306.toHaveReturned = function(v543, v544, v545)
    local v546 = {
        isNot = v543.isNot, 
        promise = v543.promise
    };
    l_ensureNoExpected_0(v545, l_v307_14, v546);
    v45(v544, l_v307_14, "", v546);
    local v547 = v544.getMockName();
    local v550 = l_Array_0.reduce(v544.mock.results, function(v548, v549)
        if v549.type == "return" then
            return v548 + 1;
        else
            return v548;
        end;
    end, 0);
    local v551 = v550 > 0;
    local _ = nil;
    return {
        message = not v551 and function()
            local v553 = l_matcherHint_0(l_v307_14, v547, "", v546) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v550));
            if #v544.mock.calls ~= v550 then
                v553 = v553 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v544.mock.calls));
            end;
            return v553;
        end or function()
            local v557 = l_matcherHint_0(l_v307_14, v547, "", v546) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v550)) .. l_Array_0.join(l_Array_0.reduce(v544.mock.results, function(v554, v555, v556)
                if v555.type == "return" and #v554 < 3 then
                    table.insert(v554, ("%s: %s"):format(tostring(v556), l_printReceived_0(v555.value)));
                end;
                return v554;
            end, {}), "\n");
            if #v544.mock.calls ~= v550 then
                v557 = v557 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v544.mock.calls);
            end;
            return v557;
        end, 
        pass = v551
    };
end;
v307 = "toHaveReturnedTimes";
local l_v307_15 = v307 --[[ copy: 61 -> 77 ]];
v306.toHaveReturnedTimes = function(v559, v560, v561)
    local v562 = {
        isNot = v559.isNot, 
        promise = v559.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v561, l_v307_15, v562);
    v45(v560, l_v307_15, "expected", v562);
    local v563 = v560.getMockName();
    local v566 = l_Array_0.reduce(v560.mock.results, function(v564, v565)
        if v565.type == "return" then
            return v564 + 1;
        else
            return v564;
        end;
    end, 0);
    local v567 = v566 == v561;
    local _ = nil;
    return {
        message = not v567 and function()
            local v569 = l_matcherHint_0(l_v307_15, v563, "expected", v562) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v561)) .. ("Received number of returns: %s"):format(l_printReceived_0(v566));
            if #v560.mock.calls ~= v566 then
                v569 = v569 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v560.mock.calls));
            end;
            return v569;
        end or function()
            local v570 = l_matcherHint_0(l_v307_15, v563, "expected", v562) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v561));
            if #v560.mock.calls ~= v566 then
                v570 = v570 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v560.mock.calls));
            end;
            return v570;
        end, 
        pass = v567
    };
end;
v307 = "toHaveReturnedWith";
local l_v307_16 = v307 --[[ copy: 61 -> 78 ]];
v306.toHaveReturnedWith = function(v572, v573, v574)
    local v575 = {
        isNot = v572.isNot, 
        promise = v572.promise
    };
    v45(v573, l_v307_16, "expected", v575);
    local v576 = v573.getMockName();
    local l_mock_7 = v573.mock;
    local l_calls_7 = l_mock_7.calls;
    local l_results_7 = l_mock_7.results;
    local v581 = l_Array_0.some(l_results_7, function(v580)
        return v31(v574, v580);
    end);
    local _ = nil;
    return {
        message = not v581 and function()
            local v583 = {};
            local v584 = 1;
            while v584 <= #l_results_7 and #v583 < 3 do
                table.insert(v583, {
                    v584, 
                    l_results_7[v584]
                });
                v584 = v584 + 1;
            end;
            return l_matcherHint_0(l_v307_16, v576, "expected", v575) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v574)) .. v41("Received: ", v574, v583, #l_results_7 == 1) .. v33(v32(l_results_7), #l_calls_7);
        end or function()
            local v585 = {};
            local v586 = 1;
            while v586 <= #l_results_7 and #v585 < 3 do
                if v31(v574, l_results_7[v586]) then
                    table.insert(v585, {
                        v586, 
                        l_results_7[v586]
                    });
                end;
                v586 = v586 + 1;
            end;
            local v587 = l_matcherHint_0(l_v307_16, v576, "expected", v575) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v574));
            if not (#l_results_7 == 1 and l_results_7[1].type == "return") or l_stringify_0(l_results_7[1].value) ~= l_stringify_0(v574) then
                v587 = v587 .. v41("Received:       ", v574, v585, #l_results_7 == 1);
            end;
            return v587 .. v33(v32(l_results_7), #l_calls_7);
        end, 
        pass = v581
    };
end;
v307 = "toReturn";
local l_v307_17 = v307 --[[ copy: 61 -> 79 ]];
v306.toReturn = function(v589, v590, v591)
    local v592 = {
        isNot = v589.isNot, 
        promise = v589.promise
    };
    l_ensureNoExpected_0(v591, l_v307_17, v592);
    v45(v590, l_v307_17, "", v592);
    local v593 = v590.getMockName();
    local v596 = l_Array_0.reduce(v590.mock.results, function(v594, v595)
        if v595.type == "return" then
            return v594 + 1;
        else
            return v594;
        end;
    end, 0);
    local v597 = v596 > 0;
    local _ = nil;
    return {
        message = not v597 and function()
            local v599 = l_matcherHint_0(l_v307_17, v593, "", v592) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v596));
            if #v590.mock.calls ~= v596 then
                v599 = v599 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v590.mock.calls));
            end;
            return v599;
        end or function()
            local v603 = l_matcherHint_0(l_v307_17, v593, "", v592) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v596)) .. l_Array_0.join(l_Array_0.reduce(v590.mock.results, function(v600, v601, v602)
                if v601.type == "return" and #v600 < 3 then
                    table.insert(v600, ("%s: %s"):format(tostring(v602), l_printReceived_0(v601.value)));
                end;
                return v600;
            end, {}), "\n");
            if #v590.mock.calls ~= v596 then
                v603 = v603 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v590.mock.calls);
            end;
            return v603;
        end, 
        pass = v597
    };
end;
v307 = "toReturnTimes";
local l_v307_18 = v307 --[[ copy: 61 -> 80 ]];
v306.toReturnTimes = function(v605, v606, v607)
    local v608 = {
        isNot = v605.isNot, 
        promise = v605.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v607, l_v307_18, v608);
    v45(v606, l_v307_18, "expected", v608);
    local v609 = v606.getMockName();
    local v612 = l_Array_0.reduce(v606.mock.results, function(v610, v611)
        if v611.type == "return" then
            return v610 + 1;
        else
            return v610;
        end;
    end, 0);
    local v613 = v612 == v607;
    local _ = nil;
    return {
        message = not v613 and function()
            local v615 = l_matcherHint_0(l_v307_18, v609, "expected", v608) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v607)) .. ("Received number of returns: %s"):format(l_printReceived_0(v612));
            if #v606.mock.calls ~= v612 then
                v615 = v615 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v606.mock.calls));
            end;
            return v615;
        end or function()
            local v616 = l_matcherHint_0(l_v307_18, v609, "expected", v608) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v607));
            if #v606.mock.calls ~= v612 then
                v616 = v616 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v606.mock.calls));
            end;
            return v616;
        end, 
        pass = v613
    };
end;
v307 = "toReturnWith";
v306.toReturnWith = function(v617, v618, v619)
    local v620 = {
        isNot = v617.isNot, 
        promise = v617.promise
    };
    v45(v618, v307, "expected", v620);
    local v621 = v618.getMockName();
    local l_mock_8 = v618.mock;
    local l_calls_8 = l_mock_8.calls;
    local l_results_8 = l_mock_8.results;
    local v626 = l_Array_0.some(l_results_8, function(v625)
        return v31(v619, v625);
    end);
    local _ = nil;
    return {
        message = not v626 and function()
            local v628 = {};
            local v629 = 1;
            while v629 <= #l_results_8 and #v628 < 3 do
                table.insert(v628, {
                    v629, 
                    l_results_8[v629]
                });
                v629 = v629 + 1;
            end;
            return l_matcherHint_0(v307, v621, "expected", v620) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v619)) .. v41("Received: ", v619, v628, #l_results_8 == 1) .. v33(v32(l_results_8), #l_calls_8);
        end or function()
            local v630 = {};
            local v631 = 1;
            while v631 <= #l_results_8 and #v630 < 3 do
                if v31(v619, l_results_8[v631]) then
                    table.insert(v630, {
                        v631, 
                        l_results_8[v631]
                    });
                end;
                v631 = v631 + 1;
            end;
            local v632 = l_matcherHint_0(v307, v621, "expected", v620) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v619));
            if not (#l_results_8 == 1 and l_results_8[1].type == "return") or l_stringify_0(l_results_8[1].value) ~= l_stringify_0(v619) then
                v632 = v632 .. v41("Received:       ", v619, v630, #l_results_8 == 1);
            end;
            return v632 .. v33(v32(l_results_8), #l_calls_8);
        end, 
        pass = v626
    };
end;
v42 = function(v633)
    local v634 = false;
    if v633 ~= nil then
        v634 = false;
        if typeof(v633) == "table" then
            v634 = v633._isMockFunction == true;
        end;
    end;
    return v634;
end;
v43 = function(v635)
    local v636 = false;
    if v635 ~= nil then
        v636 = false;
        if typeof(v635) == "table" then
            v636 = false;
            if v635.calls ~= nil then
                v636 = false;
                if typeof(v635.calls.all) == "function" then
                    v636 = typeof(v635.calls.count) == "function";
                end;
            end;
        end;
    end;
    return v636;
end;
v44 = function(v637, v638, v639, v640)
    if not (v42(v637) or v43(v637)) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v638, nil, v639, v640), ("%s value must be a mock or spy function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v637, l_printReceived_0))));
    end;
end;
v45 = function(v641, v642, v643, v644)
    if not v42(v641) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v642, nil, v643, v644), ("%s value must be a mock function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v641, l_printReceived_0))));
    end;
end;
return v306;
