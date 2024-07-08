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
    if #v49 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v49, function(v51, v52)
            if not (l_Array_0.isArray(v50) and v52 <= #v50) or not v29(v50[v52], v51) then
                return l_printReceived_0(v51);
            else
                return v28(v51);
            end;
        end), ", ");
    end;
end;
v28 = function(v53)
    return l_DIM_COLOR_0(l_stringify_0(v53));
end;
v29 = function(v54, v55)
    return l_equals_0(v54, v55, {
        l_iterableEquality_0
    });
end;
v30 = function(v56, v57)
    return v29(v56, v57);
end;
v31 = function(v58, v59)
    local v60 = false;
    if v59.type == "return" then
        v60 = v29(v58, v59.value);
    end;
    return v60;
end;
v32 = function(v61)
    return l_Array_0.reduce(v61, function(v62, v63)
        if v63.type == "return" then
            return v62 + 1;
        else
            return v62;
        end;
    end, 0);
end;
v33 = function(v64, v65)
    local v66 = string.format("\nNumber of returns: %s", l_printReceived_0(v64));
    if v65 ~= v64 then
        v66 = v66 .. string.format("\nNumber of calls:   %s", l_printReceived_0(v65));
    end;
    return v66;
end;
v34 = function(v67)
    local v68 = v67:find(":");
    local v69 = v67:sub(v68);
    return function(v70, v71)
        local _ = nil;
        return if not v71 then string.rep(" ", (math.max(0, (v68 - 1) - #v70))) else "->" .. string.rep(" ", (math.max(0, (v68 - 3) - #v70))) .. v70 .. v69;
    end;
end;
v35 = function(v73, v74, v75, v76)
    if #v74 == 0 then
        return "";
    elseif not v75 then
        local v77 = v34("Received:       ");
        return "Received\n" .. l_Array_0.reduce(v74, function(v78, v79)
            local v80 = v79[1];
            return v78 .. v77(tostring(v80), v80 == v76) .. v27(v79[2], v73) .. "\n";
        end, "");
    else
        return "Received:       " .. v27(v74[1], v73) .. "\n";
    end;
end;
v36 = function(v81, v82, v83, v84, v85)
    local v86 = string.format("Expected: %s\n", v26(v81));
    if #v82 == 0 then
        return v86;
    elseif v84 and (not (v85 ~= 1) or v85 == nil) then
        local v87 = v82[1][2];
        if not v38(v81, v87) then
            return v86 .. "Received: " .. v27(v87, v81) .. "\n";
        else
            local v88 = {
                l_EXPECTED_COLOR_0("- Expected"), 
                l_RECEIVED_COLOR_0("+ Received"), 
                ""
            };
            for v89 = 1, math.max(#v81, #v87) do
                local l_v89_0 = v89;
                local v91 = false;
                if l_v89_0 <= #v81 and l_v89_0 <= #v87 then
                    if v29(v81[l_v89_0], v87[l_v89_0]) then
                        table.insert(v88, "  " .. v28(v87[l_v89_0]) .. ",");
                        v91 = true;
                    end;
                    if not (v91 or not v39(v81[l_v89_0], v87[l_v89_0])) then
                        local v92 = l_diff_0(v81[l_v89_0], v87[l_v89_0], {
                            v83
                        });
                        if not ((not (typeof(v92) == "string") or not v92:find("%- Expected")) or not v92:find("%+ Received")) then
                            local v93 = {};
                            for v94 in v92:gmatch("[^\n]+") do
                                table.insert(v93, v94);
                            end;
                            table.insert(v88, l_Array_0.join(l_Array_0.slice(v93, 3), "\n") .. ",");
                            v91 = true;
                        end;
                    end;
                end;
                if not v91 then
                    if l_v89_0 <= #v81 then
                        table.insert(v88, l_EXPECTED_COLOR_0("- " .. l_stringify_0(v81[l_v89_0])) .. ",");
                    end;
                    if l_v89_0 <= #v87 then
                        table.insert(v88, l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v87[l_v89_0])) .. ",");
                    end;
                end;
                l_v89_0 = l_v89_0 + 1;
            end;
            return table.concat(v88, "\n") .. "\n";
        end;
    else
        local v95 = v34("Received: ");
        return v86 .. "Received\n" .. l_Array_0.reduce(v82, function(v96, v97)
            local v98 = v97[1];
            local v99 = v97[2];
            local v100 = v95(tostring(v98), v98 == v85);
            if not (not (v98 ~= v85) or v85 == nil) or not v38(v81, v99) then
                return v96 .. v100 .. v27(v99, v81) .. "\n";
            else
                return v96 .. v100:sub(1, v100:find(":") - 1) .. "\n" .. v100:sub(v100:find(":") + 1, #v100) .. v37(v81, v99, v83) .. "\n";
            end;
        end, "");
    end;
end;
local v101 = string.gsub("Received", "[a-zA-Z0-9_]", " ");
v37 = function(v102, v103, v104)
    return l_Array_0.join(l_Array_0.map(v103, function(v105, v106)
        if v106 <= #v102 then
            if not v29(v102[v106], v105) then
                if v39(v102[v106], v105) then
                    local v107 = l_diff_0(v102[v106], v105, {
                        expand = v104
                    });
                    if not ((not (typeof(v107) == "string") or not v107:find("%- Expected")) or not v107:find("%+ Received")) then
                        local v108 = {};
                        for v109 in v107:gmatch("[^\n]+") do
                            table.insert(v108, v109);
                        end;
                        return l_Array_0.join(l_Array_0.map(l_Array_0.slice(v108, 3), function(v110)
                            return v101 .. v110;
                        end), "\n") .. ",";
                    end;
                end;
            else
                return v101 .. "  " .. v28(v105) .. ",";
            end;
        end;
        return v101 .. if v106 <= #v102 then "  " .. l_printReceived_0(v105) else l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v105)) .. ",";
    end), "\n");
end;
v38 = function(v111, v112)
    return l_Array_0.some(v111, function(v113, v114)
        local v115 = false;
        if v114 <= #v112 then
            v115 = v39(v113, v112[v114]);
        end;
        return v115;
    end);
end;
v39 = function(v116, v117)
    local v118 = l_getType_0(v116);
    local v119 = l_getType_0(v117);
    if v118 ~= v119 then
        return false;
    elseif not l_isPrimitive_0(v116) then
        if not ((v118 ~= "date" and v118 ~= "function") and v118 ~= "regexp") or v118 == "error" then
            return false;
        elseif v118 == "table" and typeof(v116.asymmetricMatch) == "function" then
            return false;
        elseif v119 == "table" and typeof(v117.asymmetricMatch) == "function" then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v40 = function(v120, v121)
    if v120.type == "throw" then
        return "function call threw an error";
    elseif v120.type == "incomplete" then
        return "function call has not returned yet";
    elseif not v29(v121, v120.value) then
        return l_printReceived_0(v120.value);
    else
        return v28(v120.value);
    end;
end;
v41 = function(v122, v123, v124, v125, v126)
    if #v124 == 0 then
        return "";
    elseif v125 and (not (v126 ~= 1) or v126 == nil) then
        return v122 .. v40(v124[1][2], v123) .. "\n";
    else
        local v127 = v34(v122);
        local v128 = v122:find(":") or 1;
        return l_String_0.trim(v122:sub(1, v128 - 1) .. v122:sub(v128 + 1, #v122)) .. "\n" .. l_Array_0.reduce(v124, function(v129, v130)
            local v131 = v130[1];
            return v129 .. v127(tostring(v131), v131 == v126) .. v40(v130[2], v123) .. "\n";
        end, "");
    end;
end;
local _ = function(v132)
    return function(v133, v134, v135)
        local v136 = {
            isNot = v133.isNot, 
            promise = v133.promise
        };
        l_ensureNoExpected_0(v135, v132, v136);
        v44(v134, v132, "", v136);
        local v137 = v43(v134);
        local v138 = nil;
        v138 = if not v137 then v134.getMockName() else "spy";
        local v139 = nil;
        v139 = if not v137 then #v134.mock.calls else v134.calls.count();
        local v140 = nil;
        v140 = if not v137 then v134.mock.calls else l_Array_0.map(v134.calls.all(), function(v141)
            return v141.args;
        end);
        local v142 = v139 > 0;
        local _ = nil;
        return {
            message = not v142 and function()
                return l_matcherHint_0(v132, v138, "", v136) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v139));
            end or function()
                return l_matcherHint_0(v132, v138, "", v136) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v139)) .. l_Array_0.join(l_Array_0.reduce(v140, function(v144, v145, v146)
                    if #v144 < 3 then
                        table.insert(v144, ("%s: %s"):format(tostring(v146), v27(v145)));
                    end;
                    return v144;
                end, {}), "\n");
            end, 
            pass = v142
        };
    end;
end;
local _ = function(v148)
    return function(v149, v150, v151)
        local v152 = {
            isNot = v149.isNot, 
            promise = v149.promise
        };
        l_ensureNoExpected_0(v151, v148, v152);
        v45(v150, v148, "", v152);
        local v153 = v150.getMockName();
        local v156 = l_Array_0.reduce(v150.mock.results, function(v154, v155)
            if v155.type == "return" then
                return v154 + 1;
            else
                return v154;
            end;
        end, 0);
        local v157 = v156 > 0;
        local _ = nil;
        return {
            message = not v157 and function()
                local v159 = l_matcherHint_0(v148, v153, "", v152) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v156));
                if #v150.mock.calls ~= v156 then
                    v159 = v159 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v150.mock.calls));
                end;
                return v159;
            end or function()
                local v163 = l_matcherHint_0(v148, v153, "", v152) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v156)) .. l_Array_0.join(l_Array_0.reduce(v150.mock.results, function(v160, v161, v162)
                    if v161.type == "return" and #v160 < 3 then
                        table.insert(v160, ("%s: %s"):format(tostring(v162), l_printReceived_0(v161.value)));
                    end;
                    return v160;
                end, {}), "\n");
                if #v150.mock.calls ~= v156 then
                    v163 = v163 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v150.mock.calls);
                end;
                return v163;
            end, 
            pass = v157
        };
    end;
end;
local _ = function(v165)
    return function(v166, v167, v168)
        local v169 = {
            isNot = v166.isNot, 
            promise = v166.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v168, v165, v169);
        v44(v167, v165, "expected", v169);
        local v170 = v43(v167);
        local v171 = nil;
        v171 = if not v170 then v167.getMockName() else "spy";
        local v172 = nil;
        v172 = if not v170 then #v167.mock.calls else v167.calls.count();
        local v173 = v172 == v168;
        local _ = nil;
        return {
            message = not v173 and function()
                return l_matcherHint_0(v165, v171, "expected", v169) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v168)) .. ("Received number of calls: %s"):format(l_printReceived_0(v172));
            end or function()
                return l_matcherHint_0(v165, v171, "expected", v169) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v168));
            end, 
            pass = v173
        };
    end;
end;
local _ = function(v176)
    return function(v177, v178, v179)
        local v180 = {
            isNot = v177.isNot, 
            promise = v177.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v179, v176, v180);
        v45(v178, v176, "expected", v180);
        local v181 = v178.getMockName();
        local v184 = l_Array_0.reduce(v178.mock.results, function(v182, v183)
            if v183.type == "return" then
                return v182 + 1;
            else
                return v182;
            end;
        end, 0);
        local v185 = v184 == v179;
        local _ = nil;
        return {
            message = not v185 and function()
                local v187 = l_matcherHint_0(v176, v181, "expected", v180) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v179)) .. ("Received number of returns: %s"):format(l_printReceived_0(v184));
                if #v178.mock.calls ~= v184 then
                    v187 = v187 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v178.mock.calls));
                end;
                return v187;
            end or function()
                local v188 = l_matcherHint_0(v176, v181, "expected", v180) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v179));
                if #v178.mock.calls ~= v184 then
                    v188 = v188 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v178.mock.calls));
                end;
                return v188;
            end, 
            pass = v185
        };
    end;
end;
local _ = function(v190)
    return function(v191, v192, ...)
        local v193 = {
            ...
        };
        for v194 = 1, select("#", ...) do
            if v193[v194] == nil then
                v193[v194] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v195 = {
            isNot = v191.isNot, 
            promise = v191.promise
        };
        v44(v192, v190, "...expected", v195);
        local v196 = v43(v192);
        local v197 = nil;
        v197 = if not v196 then v192.getMockName() else "spy";
        local v198 = nil;
        v198 = if not v196 then v192.mock.calls else l_Array_0.map(v192.calls.all(), function(v199)
            return v199.args;
        end);
        local v201 = l_Array_0.some(v198, function(v200)
            return v30(v193, v200);
        end);
        local _ = nil;
        return {
            message = not v201 and function()
                local v203 = {};
                local v204 = 1;
                while v204 <= #v198 and #v203 < 3 do
                    table.insert(v203, {
                        v204, 
                        v198[v204]
                    });
                    v204 = v204 + 1;
                end;
                return l_matcherHint_0(v190, v197, "...expected", v195) .. "\n\n" .. v36(v193, v203, v25(v191.expand), #v198 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v198));
            end or function()
                local v205 = {};
                local v206 = 1;
                while v206 <= #v198 and #v205 < 3 do
                    if v30(v193, v198[v206]) then
                        table.insert(v205, {
                            v206, 
                            v198[v206]
                        });
                    end;
                    v206 = v206 + 1;
                end;
                local v207 = l_matcherHint_0(v190, v197, "...expected", v195) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v193));
                if not (#v198 == 1) or l_stringify_0(v198[1]) ~= l_stringify_0(v193) then
                    v207 = v207 .. v35(v193, v205, #v198 == 1);
                end;
                return v207 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v198));
            end, 
            pass = v201
        };
    end;
end;
local _ = function(v209)
    return function(v210, v211, v212)
        local v213 = {
            isNot = v210.isNot, 
            promise = v210.promise
        };
        v45(v211, v209, "expected", v213);
        local v214 = v211.getMockName();
        local l_mock_0 = v211.mock;
        local l_calls_0 = l_mock_0.calls;
        local l_results_0 = l_mock_0.results;
        local v219 = l_Array_0.some(l_results_0, function(v218)
            return v31(v212, v218);
        end);
        local _ = nil;
        return {
            message = not v219 and function()
                local v221 = {};
                local v222 = 1;
                while v222 <= #l_results_0 and #v221 < 3 do
                    table.insert(v221, {
                        v222, 
                        l_results_0[v222]
                    });
                    v222 = v222 + 1;
                end;
                return l_matcherHint_0(v209, v214, "expected", v213) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v212)) .. v41("Received: ", v212, v221, #l_results_0 == 1) .. v33(v32(l_results_0), #l_calls_0);
            end or function()
                local v223 = {};
                local v224 = 1;
                while v224 <= #l_results_0 and #v223 < 3 do
                    if v31(v212, l_results_0[v224]) then
                        table.insert(v223, {
                            v224, 
                            l_results_0[v224]
                        });
                    end;
                    v224 = v224 + 1;
                end;
                local v225 = l_matcherHint_0(v209, v214, "expected", v213) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v212));
                if not (#l_results_0 == 1 and l_results_0[1].type == "return") or l_stringify_0(l_results_0[1].value) ~= l_stringify_0(v212) then
                    v225 = v225 .. v41("Received:       ", v212, v223, #l_results_0 == 1);
                end;
                return v225 .. v33(v32(l_results_0), #l_calls_0);
            end, 
            pass = v219
        };
    end;
end;
local _ = function(v227)
    return function(v228, v229, ...)
        local v230 = {
            ...
        };
        for v231 = 1, select("#", ...) do
            if v230[v231] == nil then
                v230[v231] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v232 = {
            isNot = v228.isNot, 
            promise = v228.promise
        };
        v44(v229, v227, "...expected", v232);
        local v233 = v43(v229);
        local v234 = nil;
        v234 = if not v233 then v229.getMockName() else "spy";
        local v235 = nil;
        v235 = if not v233 then v229.mock.calls else l_Array_0.map(v229.calls.all(), function(v236)
            return v236.args;
        end);
        local v237 = #v235;
        local v238 = false;
        if v237 >= 1 then
            v238 = v30(v230, v235[v237]);
        end;
        local _ = nil;
        return {
            message = not v238 and function()
                local v240 = {};
                if v237 >= 1 then
                    if v237 > 1 then
                        local v241 = v237 - 1;
                        while not (not (v241 >= 1) or v30(v230, v235[v241])) do
                            v241 = v241 - 1;
                        end;
                        if v241 < 1 then
                            v241 = v237 - 1;
                        end;
                        table.insert(v240, {
                            v241, 
                            v235[v241]
                        });
                    end;
                    table.insert(v240, {
                        v237, 
                        v235[v237]
                    });
                end;
                return l_matcherHint_0(v227, v234, "...expected", v232) .. "\n\n" .. v36(v230, v240, v25(v228.expand), #v235 == 1, v237) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v235));
            end or function()
                local v242 = {};
                if v237 > 1 then
                    table.insert(v242, {
                        v237 - 1, 
                        v235[v237 - 1]
                    });
                end;
                table.insert(v242, {
                    v237, 
                    v235[v237]
                });
                local v243 = l_matcherHint_0(v227, v234, "...expected", v232) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v230));
                if not (#v235 == 1) or l_stringify_0(v235[1]) ~= l_stringify_0(v230) then
                    v243 = v243 .. v35(v230, v242, #v235 == 1, v237);
                end;
                return v243 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v235));
            end, 
            pass = v238
        };
    end;
end;
local _ = function(v245)
    return function(v246, v247, v248)
        local v249 = {
            isNot = v246.isNot, 
            promise = v246.promise
        };
        v45(v247, v245, "expected", v249);
        local v250 = v247.getMockName();
        local l_mock_1 = v247.mock;
        local l_calls_1 = l_mock_1.calls;
        local l_results_1 = l_mock_1.results;
        local v254 = #l_results_1;
        local v255 = false;
        if v254 >= 1 then
            v255 = v31(v248, l_results_1[v254]);
        end;
        local _ = nil;
        return {
            message = not v255 and function()
                local v257 = {};
                if v254 >= 1 then
                    if v254 > 1 then
                        local v258 = v254 - 1;
                        while not (not (v258 >= 1) or v31(v248, l_results_1[v258])) do
                            v258 = v258 - 1;
                        end;
                        if v258 < 1 then
                            v258 = v254 - 1;
                        end;
                        table.insert(v257, {
                            v258, 
                            l_results_1[v258]
                        });
                    end;
                    table.insert(v257, {
                        v254, 
                        l_results_1[v254]
                    });
                end;
                return l_matcherHint_0(v245, v250, "expected", v249) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v248)) .. v41("Received: ", v248, v257, #l_results_1 == 1, v254) .. v33(v32(l_results_1), #l_calls_1);
            end or function()
                local v259 = {};
                if v254 > 1 then
                    table.insert(v259, {
                        v254 - 1, 
                        l_results_1[v254 - 1]
                    });
                end;
                table.insert(v259, {
                    v254, 
                    l_results_1[v254]
                });
                local v260 = l_matcherHint_0(v245, v250, "expected", v249) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v248));
                if not (#l_results_1 == 1 and l_results_1[1].type == "return") or l_stringify_0(l_results_1[1].value) ~= l_stringify_0(v248) then
                    v260 = v260 .. v41("Received:       ", v248, v259, #l_results_1 == 1, v254);
                end;
                return v260 .. v33(v32(l_results_1), #l_calls_1);
            end, 
            pass = v255
        };
    end;
end;
local _ = function(v262)
    return function(v263, v264, v265, ...)
        local v266 = {
            ...
        };
        for v267 = 1, select("#", ...) do
            if v266[v267] == nil then
                v266[v267] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v269 = {
            expectedColor = function(v268)
                return v268;
            end, 
            isNot = v263.isNot, 
            promise = v263.promise, 
            secondArgument = "...expected"
        };
        v44(v264, v262, "n", v269);
        if not l_Number_0.isSafeInteger(v265) or v265 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v262, nil, "n", v269), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v265, l_stringify_0))));
        end;
        local v270 = v43(v264);
        local v271 = nil;
        v271 = if not v270 then v264.getMockName() else "spy";
        local v272 = nil;
        v272 = if not v270 then v264.mock.calls else l_Array_0.map(v264.calls.all(), function(v273)
            return v273.args;
        end);
        local v274 = #v272;
        local v275 = false;
        if v265 <= v274 then
            v275 = v30(v266, v272[v265]);
        end;
        local _ = nil;
        return {
            message = not v275 and function()
                local v277 = {};
                if v265 <= v274 then
                    if v265 - 1 >= 1 then
                        local v278 = v265 - 1;
                        while not (not (v278 >= 1) or v30(v266, v272[v278])) do
                            v278 = v278 - 1;
                        end;
                        if v278 < 1 then
                            v278 = v265 - 1;
                        end;
                        table.insert(v277, {
                            v278, 
                            v272[v278]
                        });
                    end;
                    table.insert(v277, {
                        v265, 
                        v272[v265]
                    });
                    if v265 + 1 <= v274 then
                        local v279 = v265 + 1;
                        while not (not (v279 <= v274) or v30(v266, v272[v279])) do
                            v279 = v279 + 1;
                        end;
                        if v274 <= v279 then
                            v279 = v265 + 1;
                        end;
                        table.insert(v277, {
                            v279, 
                            v272[v279]
                        });
                    end;
                elseif v274 > 1 then
                    local v280 = v274 - 1;
                    while not (not (v280 >= 1) or v30(v266, v272[v280])) do
                        v280 = v280 - 1;
                    end;
                    if v280 < 1 then
                        v280 = v274 - 1;
                    end;
                    table.insert(v277, {
                        v280, 
                        v272[v280]
                    });
                end;
                return l_matcherHint_0(v262, v271, "n", v269) .. "\n\n" .. ("n: %s\n"):format((tostring(v265))) .. v36(v266, v277, v25(v263.expand), #v272 == 1, v265) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v272));
            end or function()
                local v281 = {};
                if v265 - 1 >= 1 then
                    table.insert(v281, {
                        v265 - 1, 
                        v272[v265 - 1]
                    });
                end;
                table.insert(v281, {
                    v265, 
                    v272[v265]
                });
                if v265 + 1 <= v274 then
                    table.insert(v281, {
                        v265 + 1, 
                        v272[v265 + 1]
                    });
                end;
                local v282 = l_matcherHint_0(v262, v271, "n", v269) .. "\n\n" .. ("n: %s\n"):format((tostring(v265))) .. ("Expected: never %s\n"):format(v26(v266));
                if not (#v272 == 1) or l_stringify_0(v272[1]) ~= l_stringify_0(v266) then
                    v282 = v282 .. v35(v266, v281, #v272 == 1, v265);
                end;
                return v282 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v272));
            end, 
            pass = v275
        };
    end;
end;
local _ = function(v284)
    return function(v285, v286, v287, v288)
        local v290 = {
            expectedColor = function(v289)
                return v289;
            end, 
            isNot = v285.isNot, 
            promise = v285.promise, 
            secondArgument = "expected"
        };
        v45(v286, v284, "n", v290);
        if not l_Number_0.isSafeInteger(v287) or v287 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v284, nil, "n", v290), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v287, l_stringify_0))));
        end;
        local v291 = v286.getMockName();
        local l_mock_2 = v286.mock;
        local l_calls_2 = l_mock_2.calls;
        local l_results_2 = l_mock_2.results;
        local v295 = #l_results_2;
        local v296 = false;
        if v287 <= v295 then
            v296 = v31(v288, l_results_2[v287]);
        end;
        local _ = nil;
        return {
            message = not v296 and function()
                local v298 = {};
                if v287 <= v295 then
                    if v287 - 1 >= 1 then
                        local v299 = v287 - 1;
                        while not (not (v299 >= 1) or v31(v288, l_results_2[v299])) do
                            v299 = v299 - 1;
                        end;
                        if v299 < 1 then
                            v299 = v287 - 1;
                        end;
                        table.insert(v298, {
                            v299, 
                            l_results_2[v299]
                        });
                    end;
                    table.insert(v298, {
                        v287, 
                        l_results_2[v287]
                    });
                    if v287 + 1 <= v295 then
                        local v300 = v287 + 1;
                        while not (not (v300 <= v295) or v31(v288, l_results_2[v300])) do
                            v300 = v300 + 1;
                        end;
                        if v295 < v300 then
                            v300 = v287 + 1;
                        end;
                        table.insert(v298, {
                            v300, 
                            l_results_2[v300]
                        });
                    end;
                elseif v295 > 0 then
                    local l_v295_0 = v295;
                    while not (not (l_v295_0 >= 1) or v31(v288, l_results_2[l_v295_0])) do
                        l_v295_0 = l_v295_0 - 1;
                    end;
                    if l_v295_0 < 1 then
                        l_v295_0 = v295 - 1;
                    end;
                    table.insert(v298, {
                        l_v295_0, 
                        l_results_2[l_v295_0]
                    });
                end;
                return l_matcherHint_0(v284, v291, "n", v290) .. "\n\n" .. ("n: %s\n"):format((tostring(v287))) .. ("Expected: %s\n"):format(l_printExpected_0(v288)) .. v41("Received: ", v288, v298, #l_results_2 == 1, v287) .. v33(v32(l_results_2), #l_calls_2);
            end or function()
                local v302 = {};
                if v287 - 1 >= 1 then
                    table.insert(v302, {
                        v287 - 1, 
                        l_results_2[v287 - 1]
                    });
                end;
                table.insert(v302, {
                    v287, 
                    l_results_2[v287]
                });
                if v287 + 1 <= v295 then
                    table.insert(v302, {
                        v287 + 1, 
                        l_results_2[v287 + 1]
                    });
                end;
                local v303 = l_matcherHint_0(v284, v291, "n", v290) .. "\n\n" .. ("n: %s\n"):format((tostring(v287))) .. ("Expected: never %s\n"):format(l_printExpected_0(v288));
                if not (#l_results_2 == 1 and l_results_2[1].type == "return") or l_stringify_0(l_results_2[1].value) ~= l_stringify_0(v288) then
                    v303 = v303 .. v41("Received:       ", v288, v302, #l_results_2 == 1, v287);
                end;
                return v303 .. v33(v32(l_results_2), #l_calls_2);
            end, 
            pass = v296
        };
    end;
end;
local v305 = {};
local v306 = "lastCalledWith";
local l_v306_0 = v306 --[[ copy: 61 -> 62 ]];
v305.lastCalledWith = function(v308, v309, ...)
    local v310 = {
        ...
    };
    for v311 = 1, select("#", ...) do
        if v310[v311] == nil then
            v310[v311] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v312 = {
        isNot = v308.isNot, 
        promise = v308.promise
    };
    v44(v309, l_v306_0, "...expected", v312);
    local v313 = v43(v309);
    local v314 = nil;
    v314 = if not v313 then v309.getMockName() else "spy";
    local v315 = nil;
    v315 = if not v313 then v309.mock.calls else l_Array_0.map(v309.calls.all(), function(v316)
        return v316.args;
    end);
    local v317 = #v315;
    local v318 = false;
    if v317 >= 1 then
        v318 = v30(v310, v315[v317]);
    end;
    local _ = nil;
    return {
        message = not v318 and function()
            local v320 = {};
            if v317 >= 1 then
                if v317 > 1 then
                    local v321 = v317 - 1;
                    while not (not (v321 >= 1) or v30(v310, v315[v321])) do
                        v321 = v321 - 1;
                    end;
                    if v321 < 1 then
                        v321 = v317 - 1;
                    end;
                    table.insert(v320, {
                        v321, 
                        v315[v321]
                    });
                end;
                table.insert(v320, {
                    v317, 
                    v315[v317]
                });
            end;
            return l_matcherHint_0(l_v306_0, v314, "...expected", v312) .. "\n\n" .. v36(v310, v320, v25(v308.expand), #v315 == 1, v317) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v315));
        end or function()
            local v322 = {};
            if v317 > 1 then
                table.insert(v322, {
                    v317 - 1, 
                    v315[v317 - 1]
                });
            end;
            table.insert(v322, {
                v317, 
                v315[v317]
            });
            local v323 = l_matcherHint_0(l_v306_0, v314, "...expected", v312) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v310));
            if not (#v315 == 1) or l_stringify_0(v315[1]) ~= l_stringify_0(v310) then
                v323 = v323 .. v35(v310, v322, #v315 == 1, v317);
            end;
            return v323 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v315));
        end, 
        pass = v318
    };
end;
v306 = "lastReturnedWith";
local l_v306_1 = v306 --[[ copy: 61 -> 63 ]];
v305.lastReturnedWith = function(v325, v326, v327)
    local v328 = {
        isNot = v325.isNot, 
        promise = v325.promise
    };
    v45(v326, l_v306_1, "expected", v328);
    local v329 = v326.getMockName();
    local l_mock_3 = v326.mock;
    local l_calls_3 = l_mock_3.calls;
    local l_results_3 = l_mock_3.results;
    local v333 = #l_results_3;
    local v334 = false;
    if v333 >= 1 then
        v334 = v31(v327, l_results_3[v333]);
    end;
    local _ = nil;
    return {
        message = not v334 and function()
            local v336 = {};
            if v333 >= 1 then
                if v333 > 1 then
                    local v337 = v333 - 1;
                    while not (not (v337 >= 1) or v31(v327, l_results_3[v337])) do
                        v337 = v337 - 1;
                    end;
                    if v337 < 1 then
                        v337 = v333 - 1;
                    end;
                    table.insert(v336, {
                        v337, 
                        l_results_3[v337]
                    });
                end;
                table.insert(v336, {
                    v333, 
                    l_results_3[v333]
                });
            end;
            return l_matcherHint_0(l_v306_1, v329, "expected", v328) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v327)) .. v41("Received: ", v327, v336, #l_results_3 == 1, v333) .. v33(v32(l_results_3), #l_calls_3);
        end or function()
            local v338 = {};
            if v333 > 1 then
                table.insert(v338, {
                    v333 - 1, 
                    l_results_3[v333 - 1]
                });
            end;
            table.insert(v338, {
                v333, 
                l_results_3[v333]
            });
            local v339 = l_matcherHint_0(l_v306_1, v329, "expected", v328) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v327));
            if not (#l_results_3 == 1 and l_results_3[1].type == "return") or l_stringify_0(l_results_3[1].value) ~= l_stringify_0(v327) then
                v339 = v339 .. v41("Received:       ", v327, v338, #l_results_3 == 1, v333);
            end;
            return v339 .. v33(v32(l_results_3), #l_calls_3);
        end, 
        pass = v334
    };
end;
v306 = "nthCalledWith";
local l_v306_2 = v306 --[[ copy: 61 -> 64 ]];
v305.nthCalledWith = function(v341, v342, v343, ...)
    local v344 = {
        ...
    };
    for v345 = 1, select("#", ...) do
        if v344[v345] == nil then
            v344[v345] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v347 = {
        expectedColor = function(v346)
            return v346;
        end, 
        isNot = v341.isNot, 
        promise = v341.promise, 
        secondArgument = "...expected"
    };
    v44(v342, l_v306_2, "n", v347);
    if not l_Number_0.isSafeInteger(v343) or v343 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v306_2, nil, "n", v347), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v343, l_stringify_0))));
    end;
    local v348 = v43(v342);
    local v349 = nil;
    v349 = if not v348 then v342.getMockName() else "spy";
    local v350 = nil;
    v350 = if not v348 then v342.mock.calls else l_Array_0.map(v342.calls.all(), function(v351)
        return v351.args;
    end);
    local v352 = #v350;
    local v353 = false;
    if v343 <= v352 then
        v353 = v30(v344, v350[v343]);
    end;
    local _ = nil;
    return {
        message = not v353 and function()
            local v355 = {};
            if v343 <= v352 then
                if v343 - 1 >= 1 then
                    local v356 = v343 - 1;
                    while not (not (v356 >= 1) or v30(v344, v350[v356])) do
                        v356 = v356 - 1;
                    end;
                    if v356 < 1 then
                        v356 = v343 - 1;
                    end;
                    table.insert(v355, {
                        v356, 
                        v350[v356]
                    });
                end;
                table.insert(v355, {
                    v343, 
                    v350[v343]
                });
                if v343 + 1 <= v352 then
                    local v357 = v343 + 1;
                    while not (not (v357 <= v352) or v30(v344, v350[v357])) do
                        v357 = v357 + 1;
                    end;
                    if v352 <= v357 then
                        v357 = v343 + 1;
                    end;
                    table.insert(v355, {
                        v357, 
                        v350[v357]
                    });
                end;
            elseif v352 > 1 then
                local v358 = v352 - 1;
                while not (not (v358 >= 1) or v30(v344, v350[v358])) do
                    v358 = v358 - 1;
                end;
                if v358 < 1 then
                    v358 = v352 - 1;
                end;
                table.insert(v355, {
                    v358, 
                    v350[v358]
                });
            end;
            return l_matcherHint_0(l_v306_2, v349, "n", v347) .. "\n\n" .. ("n: %s\n"):format((tostring(v343))) .. v36(v344, v355, v25(v341.expand), #v350 == 1, v343) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v350));
        end or function()
            local v359 = {};
            if v343 - 1 >= 1 then
                table.insert(v359, {
                    v343 - 1, 
                    v350[v343 - 1]
                });
            end;
            table.insert(v359, {
                v343, 
                v350[v343]
            });
            if v343 + 1 <= v352 then
                table.insert(v359, {
                    v343 + 1, 
                    v350[v343 + 1]
                });
            end;
            local v360 = l_matcherHint_0(l_v306_2, v349, "n", v347) .. "\n\n" .. ("n: %s\n"):format((tostring(v343))) .. ("Expected: never %s\n"):format(v26(v344));
            if not (#v350 == 1) or l_stringify_0(v350[1]) ~= l_stringify_0(v344) then
                v360 = v360 .. v35(v344, v359, #v350 == 1, v343);
            end;
            return v360 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v350));
        end, 
        pass = v353
    };
end;
v306 = "nthReturnedWith";
local l_v306_3 = v306 --[[ copy: 61 -> 65 ]];
v305.nthReturnedWith = function(v362, v363, v364, v365)
    local v367 = {
        expectedColor = function(v366)
            return v366;
        end, 
        isNot = v362.isNot, 
        promise = v362.promise, 
        secondArgument = "expected"
    };
    v45(v363, l_v306_3, "n", v367);
    if not l_Number_0.isSafeInteger(v364) or v364 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v306_3, nil, "n", v367), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v364, l_stringify_0))));
    end;
    local v368 = v363.getMockName();
    local l_mock_4 = v363.mock;
    local l_calls_4 = l_mock_4.calls;
    local l_results_4 = l_mock_4.results;
    local v372 = #l_results_4;
    local v373 = false;
    if v364 <= v372 then
        v373 = v31(v365, l_results_4[v364]);
    end;
    local _ = nil;
    return {
        message = not v373 and function()
            local v375 = {};
            if v364 <= v372 then
                if v364 - 1 >= 1 then
                    local v376 = v364 - 1;
                    while not (not (v376 >= 1) or v31(v365, l_results_4[v376])) do
                        v376 = v376 - 1;
                    end;
                    if v376 < 1 then
                        v376 = v364 - 1;
                    end;
                    table.insert(v375, {
                        v376, 
                        l_results_4[v376]
                    });
                end;
                table.insert(v375, {
                    v364, 
                    l_results_4[v364]
                });
                if v364 + 1 <= v372 then
                    local v377 = v364 + 1;
                    while not (not (v377 <= v372) or v31(v365, l_results_4[v377])) do
                        v377 = v377 + 1;
                    end;
                    if v372 < v377 then
                        v377 = v364 + 1;
                    end;
                    table.insert(v375, {
                        v377, 
                        l_results_4[v377]
                    });
                end;
            elseif v372 > 0 then
                local l_v372_0 = v372;
                while not (not (l_v372_0 >= 1) or v31(v365, l_results_4[l_v372_0])) do
                    l_v372_0 = l_v372_0 - 1;
                end;
                if l_v372_0 < 1 then
                    l_v372_0 = v372 - 1;
                end;
                table.insert(v375, {
                    l_v372_0, 
                    l_results_4[l_v372_0]
                });
            end;
            return l_matcherHint_0(l_v306_3, v368, "n", v367) .. "\n\n" .. ("n: %s\n"):format((tostring(v364))) .. ("Expected: %s\n"):format(l_printExpected_0(v365)) .. v41("Received: ", v365, v375, #l_results_4 == 1, v364) .. v33(v32(l_results_4), #l_calls_4);
        end or function()
            local v379 = {};
            if v364 - 1 >= 1 then
                table.insert(v379, {
                    v364 - 1, 
                    l_results_4[v364 - 1]
                });
            end;
            table.insert(v379, {
                v364, 
                l_results_4[v364]
            });
            if v364 + 1 <= v372 then
                table.insert(v379, {
                    v364 + 1, 
                    l_results_4[v364 + 1]
                });
            end;
            local v380 = l_matcherHint_0(l_v306_3, v368, "n", v367) .. "\n\n" .. ("n: %s\n"):format((tostring(v364))) .. ("Expected: never %s\n"):format(l_printExpected_0(v365));
            if not (#l_results_4 == 1 and l_results_4[1].type == "return") or l_stringify_0(l_results_4[1].value) ~= l_stringify_0(v365) then
                v380 = v380 .. v41("Received:       ", v365, v379, #l_results_4 == 1, v364);
            end;
            return v380 .. v33(v32(l_results_4), #l_calls_4);
        end, 
        pass = v373
    };
end;
v306 = "toBeCalled";
local l_v306_4 = v306 --[[ copy: 61 -> 66 ]];
v305.toBeCalled = function(v382, v383, v384)
    local v385 = {
        isNot = v382.isNot, 
        promise = v382.promise
    };
    l_ensureNoExpected_0(v384, l_v306_4, v385);
    v44(v383, l_v306_4, "", v385);
    local v386 = v43(v383);
    local v387 = nil;
    v387 = if not v386 then v383.getMockName() else "spy";
    local v388 = nil;
    v388 = if not v386 then #v383.mock.calls else v383.calls.count();
    local v389 = nil;
    v389 = if not v386 then v383.mock.calls else l_Array_0.map(v383.calls.all(), function(v390)
        return v390.args;
    end);
    local v391 = v388 > 0;
    local _ = nil;
    return {
        message = not v391 and function()
            return l_matcherHint_0(l_v306_4, v387, "", v385) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v388));
        end or function()
            return l_matcherHint_0(l_v306_4, v387, "", v385) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v388)) .. l_Array_0.join(l_Array_0.reduce(v389, function(v393, v394, v395)
                if #v393 < 3 then
                    table.insert(v393, ("%s: %s"):format(tostring(v395), v27(v394)));
                end;
                return v393;
            end, {}), "\n");
        end, 
        pass = v391
    };
end;
v306 = "toBeCalledTimes";
local l_v306_5 = v306 --[[ copy: 61 -> 67 ]];
v305.toBeCalledTimes = function(v397, v398, v399)
    local v400 = {
        isNot = v397.isNot, 
        promise = v397.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v399, l_v306_5, v400);
    v44(v398, l_v306_5, "expected", v400);
    local v401 = v43(v398);
    local v402 = nil;
    v402 = if not v401 then v398.getMockName() else "spy";
    local v403 = nil;
    v403 = if not v401 then #v398.mock.calls else v398.calls.count();
    local v404 = v403 == v399;
    local _ = nil;
    return {
        message = not v404 and function()
            return l_matcherHint_0(l_v306_5, v402, "expected", v400) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v399)) .. ("Received number of calls: %s"):format(l_printReceived_0(v403));
        end or function()
            return l_matcherHint_0(l_v306_5, v402, "expected", v400) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v399));
        end, 
        pass = v404
    };
end;
v306 = "toBeCalledWith";
local l_v306_6 = v306 --[[ copy: 61 -> 68 ]];
v305.toBeCalledWith = function(v407, v408, ...)
    local v409 = {
        ...
    };
    for v410 = 1, select("#", ...) do
        if v409[v410] == nil then
            v409[v410] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v411 = {
        isNot = v407.isNot, 
        promise = v407.promise
    };
    v44(v408, l_v306_6, "...expected", v411);
    local v412 = v43(v408);
    local v413 = nil;
    v413 = if not v412 then v408.getMockName() else "spy";
    local v414 = nil;
    v414 = if not v412 then v408.mock.calls else l_Array_0.map(v408.calls.all(), function(v415)
        return v415.args;
    end);
    local v417 = l_Array_0.some(v414, function(v416)
        return v30(v409, v416);
    end);
    local _ = nil;
    return {
        message = not v417 and function()
            local v419 = {};
            local v420 = 1;
            while v420 <= #v414 and #v419 < 3 do
                table.insert(v419, {
                    v420, 
                    v414[v420]
                });
                v420 = v420 + 1;
            end;
            return l_matcherHint_0(l_v306_6, v413, "...expected", v411) .. "\n\n" .. v36(v409, v419, v25(v407.expand), #v414 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v414));
        end or function()
            local v421 = {};
            local v422 = 1;
            while v422 <= #v414 and #v421 < 3 do
                if v30(v409, v414[v422]) then
                    table.insert(v421, {
                        v422, 
                        v414[v422]
                    });
                end;
                v422 = v422 + 1;
            end;
            local v423 = l_matcherHint_0(l_v306_6, v413, "...expected", v411) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v409));
            if not (#v414 == 1) or l_stringify_0(v414[1]) ~= l_stringify_0(v409) then
                v423 = v423 .. v35(v409, v421, #v414 == 1);
            end;
            return v423 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v414));
        end, 
        pass = v417
    };
end;
v306 = "toHaveBeenCalled";
local l_v306_7 = v306 --[[ copy: 61 -> 69 ]];
v305.toHaveBeenCalled = function(v425, v426, v427)
    local v428 = {
        isNot = v425.isNot, 
        promise = v425.promise
    };
    l_ensureNoExpected_0(v427, l_v306_7, v428);
    v44(v426, l_v306_7, "", v428);
    local v429 = v43(v426);
    local v430 = nil;
    v430 = if not v429 then v426.getMockName() else "spy";
    local v431 = nil;
    v431 = if not v429 then #v426.mock.calls else v426.calls.count();
    local v432 = nil;
    v432 = if not v429 then v426.mock.calls else l_Array_0.map(v426.calls.all(), function(v433)
        return v433.args;
    end);
    local v434 = v431 > 0;
    local _ = nil;
    return {
        message = not v434 and function()
            return l_matcherHint_0(l_v306_7, v430, "", v428) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v431));
        end or function()
            return l_matcherHint_0(l_v306_7, v430, "", v428) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v431)) .. l_Array_0.join(l_Array_0.reduce(v432, function(v436, v437, v438)
                if #v436 < 3 then
                    table.insert(v436, ("%s: %s"):format(tostring(v438), v27(v437)));
                end;
                return v436;
            end, {}), "\n");
        end, 
        pass = v434
    };
end;
v306 = "toHaveBeenCalledTimes";
local l_v306_8 = v306 --[[ copy: 61 -> 70 ]];
v305.toHaveBeenCalledTimes = function(v440, v441, v442)
    local v443 = {
        isNot = v440.isNot, 
        promise = v440.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v442, l_v306_8, v443);
    v44(v441, l_v306_8, "expected", v443);
    local v444 = v43(v441);
    local v445 = nil;
    v445 = if not v444 then v441.getMockName() else "spy";
    local v446 = nil;
    v446 = if not v444 then #v441.mock.calls else v441.calls.count();
    local v447 = v446 == v442;
    local _ = nil;
    return {
        message = not v447 and function()
            return l_matcherHint_0(l_v306_8, v445, "expected", v443) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v442)) .. ("Received number of calls: %s"):format(l_printReceived_0(v446));
        end or function()
            return l_matcherHint_0(l_v306_8, v445, "expected", v443) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v442));
        end, 
        pass = v447
    };
end;
v306 = "toHaveBeenCalledWith";
local l_v306_9 = v306 --[[ copy: 61 -> 71 ]];
v305.toHaveBeenCalledWith = function(v450, v451, ...)
    local v452 = {
        ...
    };
    for v453 = 1, select("#", ...) do
        if v452[v453] == nil then
            v452[v453] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v454 = {
        isNot = v450.isNot, 
        promise = v450.promise
    };
    v44(v451, l_v306_9, "...expected", v454);
    local v455 = v43(v451);
    local v456 = nil;
    v456 = if not v455 then v451.getMockName() else "spy";
    local v457 = nil;
    v457 = if not v455 then v451.mock.calls else l_Array_0.map(v451.calls.all(), function(v458)
        return v458.args;
    end);
    local v460 = l_Array_0.some(v457, function(v459)
        return v30(v452, v459);
    end);
    local _ = nil;
    return {
        message = not v460 and function()
            local v462 = {};
            local v463 = 1;
            while v463 <= #v457 and #v462 < 3 do
                table.insert(v462, {
                    v463, 
                    v457[v463]
                });
                v463 = v463 + 1;
            end;
            return l_matcherHint_0(l_v306_9, v456, "...expected", v454) .. "\n\n" .. v36(v452, v462, v25(v450.expand), #v457 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v457));
        end or function()
            local v464 = {};
            local v465 = 1;
            while v465 <= #v457 and #v464 < 3 do
                if v30(v452, v457[v465]) then
                    table.insert(v464, {
                        v465, 
                        v457[v465]
                    });
                end;
                v465 = v465 + 1;
            end;
            local v466 = l_matcherHint_0(l_v306_9, v456, "...expected", v454) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v452));
            if not (#v457 == 1) or l_stringify_0(v457[1]) ~= l_stringify_0(v452) then
                v466 = v466 .. v35(v452, v464, #v457 == 1);
            end;
            return v466 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v457));
        end, 
        pass = v460
    };
end;
v306 = "toHaveBeenLastCalledWith";
local l_v306_10 = v306 --[[ copy: 61 -> 72 ]];
v305.toHaveBeenLastCalledWith = function(v468, v469, ...)
    local v470 = {
        ...
    };
    for v471 = 1, select("#", ...) do
        if v470[v471] == nil then
            v470[v471] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v472 = {
        isNot = v468.isNot, 
        promise = v468.promise
    };
    v44(v469, l_v306_10, "...expected", v472);
    local v473 = v43(v469);
    local v474 = nil;
    v474 = if not v473 then v469.getMockName() else "spy";
    local v475 = nil;
    v475 = if not v473 then v469.mock.calls else l_Array_0.map(v469.calls.all(), function(v476)
        return v476.args;
    end);
    local v477 = #v475;
    local v478 = false;
    if v477 >= 1 then
        v478 = v30(v470, v475[v477]);
    end;
    local _ = nil;
    return {
        message = not v478 and function()
            local v480 = {};
            if v477 >= 1 then
                if v477 > 1 then
                    local v481 = v477 - 1;
                    while not (not (v481 >= 1) or v30(v470, v475[v481])) do
                        v481 = v481 - 1;
                    end;
                    if v481 < 1 then
                        v481 = v477 - 1;
                    end;
                    table.insert(v480, {
                        v481, 
                        v475[v481]
                    });
                end;
                table.insert(v480, {
                    v477, 
                    v475[v477]
                });
            end;
            return l_matcherHint_0(l_v306_10, v474, "...expected", v472) .. "\n\n" .. v36(v470, v480, v25(v468.expand), #v475 == 1, v477) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v475));
        end or function()
            local v482 = {};
            if v477 > 1 then
                table.insert(v482, {
                    v477 - 1, 
                    v475[v477 - 1]
                });
            end;
            table.insert(v482, {
                v477, 
                v475[v477]
            });
            local v483 = l_matcherHint_0(l_v306_10, v474, "...expected", v472) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v470));
            if not (#v475 == 1) or l_stringify_0(v475[1]) ~= l_stringify_0(v470) then
                v483 = v483 .. v35(v470, v482, #v475 == 1, v477);
            end;
            return v483 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v475));
        end, 
        pass = v478
    };
end;
v306 = "toHaveBeenNthCalledWith";
local l_v306_11 = v306 --[[ copy: 61 -> 73 ]];
v305.toHaveBeenNthCalledWith = function(v485, v486, v487, ...)
    local v488 = {
        ...
    };
    for v489 = 1, select("#", ...) do
        if v488[v489] == nil then
            v488[v489] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v491 = {
        expectedColor = function(v490)
            return v490;
        end, 
        isNot = v485.isNot, 
        promise = v485.promise, 
        secondArgument = "...expected"
    };
    v44(v486, l_v306_11, "n", v491);
    if not l_Number_0.isSafeInteger(v487) or v487 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v306_11, nil, "n", v491), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v487, l_stringify_0))));
    end;
    local v492 = v43(v486);
    local v493 = nil;
    v493 = if not v492 then v486.getMockName() else "spy";
    local v494 = nil;
    v494 = if not v492 then v486.mock.calls else l_Array_0.map(v486.calls.all(), function(v495)
        return v495.args;
    end);
    local v496 = #v494;
    local v497 = false;
    if v487 <= v496 then
        v497 = v30(v488, v494[v487]);
    end;
    local _ = nil;
    return {
        message = not v497 and function()
            local v499 = {};
            if v487 <= v496 then
                if v487 - 1 >= 1 then
                    local v500 = v487 - 1;
                    while not (not (v500 >= 1) or v30(v488, v494[v500])) do
                        v500 = v500 - 1;
                    end;
                    if v500 < 1 then
                        v500 = v487 - 1;
                    end;
                    table.insert(v499, {
                        v500, 
                        v494[v500]
                    });
                end;
                table.insert(v499, {
                    v487, 
                    v494[v487]
                });
                if v487 + 1 <= v496 then
                    local v501 = v487 + 1;
                    while not (not (v501 <= v496) or v30(v488, v494[v501])) do
                        v501 = v501 + 1;
                    end;
                    if v496 <= v501 then
                        v501 = v487 + 1;
                    end;
                    table.insert(v499, {
                        v501, 
                        v494[v501]
                    });
                end;
            elseif v496 > 1 then
                local v502 = v496 - 1;
                while not (not (v502 >= 1) or v30(v488, v494[v502])) do
                    v502 = v502 - 1;
                end;
                if v502 < 1 then
                    v502 = v496 - 1;
                end;
                table.insert(v499, {
                    v502, 
                    v494[v502]
                });
            end;
            return l_matcherHint_0(l_v306_11, v493, "n", v491) .. "\n\n" .. ("n: %s\n"):format((tostring(v487))) .. v36(v488, v499, v25(v485.expand), #v494 == 1, v487) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v494));
        end or function()
            local v503 = {};
            if v487 - 1 >= 1 then
                table.insert(v503, {
                    v487 - 1, 
                    v494[v487 - 1]
                });
            end;
            table.insert(v503, {
                v487, 
                v494[v487]
            });
            if v487 + 1 <= v496 then
                table.insert(v503, {
                    v487 + 1, 
                    v494[v487 + 1]
                });
            end;
            local v504 = l_matcherHint_0(l_v306_11, v493, "n", v491) .. "\n\n" .. ("n: %s\n"):format((tostring(v487))) .. ("Expected: never %s\n"):format(v26(v488));
            if not (#v494 == 1) or l_stringify_0(v494[1]) ~= l_stringify_0(v488) then
                v504 = v504 .. v35(v488, v503, #v494 == 1, v487);
            end;
            return v504 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v494));
        end, 
        pass = v497
    };
end;
v306 = "toHaveLastReturnedWith";
local l_v306_12 = v306 --[[ copy: 61 -> 74 ]];
v305.toHaveLastReturnedWith = function(v506, v507, v508)
    local v509 = {
        isNot = v506.isNot, 
        promise = v506.promise
    };
    v45(v507, l_v306_12, "expected", v509);
    local v510 = v507.getMockName();
    local l_mock_5 = v507.mock;
    local l_calls_5 = l_mock_5.calls;
    local l_results_5 = l_mock_5.results;
    local v514 = #l_results_5;
    local v515 = false;
    if v514 >= 1 then
        v515 = v31(v508, l_results_5[v514]);
    end;
    local _ = nil;
    return {
        message = not v515 and function()
            local v517 = {};
            if v514 >= 1 then
                if v514 > 1 then
                    local v518 = v514 - 1;
                    while not (not (v518 >= 1) or v31(v508, l_results_5[v518])) do
                        v518 = v518 - 1;
                    end;
                    if v518 < 1 then
                        v518 = v514 - 1;
                    end;
                    table.insert(v517, {
                        v518, 
                        l_results_5[v518]
                    });
                end;
                table.insert(v517, {
                    v514, 
                    l_results_5[v514]
                });
            end;
            return l_matcherHint_0(l_v306_12, v510, "expected", v509) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v508)) .. v41("Received: ", v508, v517, #l_results_5 == 1, v514) .. v33(v32(l_results_5), #l_calls_5);
        end or function()
            local v519 = {};
            if v514 > 1 then
                table.insert(v519, {
                    v514 - 1, 
                    l_results_5[v514 - 1]
                });
            end;
            table.insert(v519, {
                v514, 
                l_results_5[v514]
            });
            local v520 = l_matcherHint_0(l_v306_12, v510, "expected", v509) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v508));
            if not (#l_results_5 == 1 and l_results_5[1].type == "return") or l_stringify_0(l_results_5[1].value) ~= l_stringify_0(v508) then
                v520 = v520 .. v41("Received:       ", v508, v519, #l_results_5 == 1, v514);
            end;
            return v520 .. v33(v32(l_results_5), #l_calls_5);
        end, 
        pass = v515
    };
end;
v306 = "toHaveNthReturnedWith";
local l_v306_13 = v306 --[[ copy: 61 -> 75 ]];
v305.toHaveNthReturnedWith = function(v522, v523, v524, v525)
    local v527 = {
        expectedColor = function(v526)
            return v526;
        end, 
        isNot = v522.isNot, 
        promise = v522.promise, 
        secondArgument = "expected"
    };
    v45(v523, l_v306_13, "n", v527);
    if not l_Number_0.isSafeInteger(v524) or v524 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v306_13, nil, "n", v527), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v524, l_stringify_0))));
    end;
    local v528 = v523.getMockName();
    local l_mock_6 = v523.mock;
    local l_calls_6 = l_mock_6.calls;
    local l_results_6 = l_mock_6.results;
    local v532 = #l_results_6;
    local v533 = false;
    if v524 <= v532 then
        v533 = v31(v525, l_results_6[v524]);
    end;
    local _ = nil;
    return {
        message = not v533 and function()
            local v535 = {};
            if v524 <= v532 then
                if v524 - 1 >= 1 then
                    local v536 = v524 - 1;
                    while not (not (v536 >= 1) or v31(v525, l_results_6[v536])) do
                        v536 = v536 - 1;
                    end;
                    if v536 < 1 then
                        v536 = v524 - 1;
                    end;
                    table.insert(v535, {
                        v536, 
                        l_results_6[v536]
                    });
                end;
                table.insert(v535, {
                    v524, 
                    l_results_6[v524]
                });
                if v524 + 1 <= v532 then
                    local v537 = v524 + 1;
                    while not (not (v537 <= v532) or v31(v525, l_results_6[v537])) do
                        v537 = v537 + 1;
                    end;
                    if v532 < v537 then
                        v537 = v524 + 1;
                    end;
                    table.insert(v535, {
                        v537, 
                        l_results_6[v537]
                    });
                end;
            elseif v532 > 0 then
                local l_v532_0 = v532;
                while not (not (l_v532_0 >= 1) or v31(v525, l_results_6[l_v532_0])) do
                    l_v532_0 = l_v532_0 - 1;
                end;
                if l_v532_0 < 1 then
                    l_v532_0 = v532 - 1;
                end;
                table.insert(v535, {
                    l_v532_0, 
                    l_results_6[l_v532_0]
                });
            end;
            return l_matcherHint_0(l_v306_13, v528, "n", v527) .. "\n\n" .. ("n: %s\n"):format((tostring(v524))) .. ("Expected: %s\n"):format(l_printExpected_0(v525)) .. v41("Received: ", v525, v535, #l_results_6 == 1, v524) .. v33(v32(l_results_6), #l_calls_6);
        end or function()
            local v539 = {};
            if v524 - 1 >= 1 then
                table.insert(v539, {
                    v524 - 1, 
                    l_results_6[v524 - 1]
                });
            end;
            table.insert(v539, {
                v524, 
                l_results_6[v524]
            });
            if v524 + 1 <= v532 then
                table.insert(v539, {
                    v524 + 1, 
                    l_results_6[v524 + 1]
                });
            end;
            local v540 = l_matcherHint_0(l_v306_13, v528, "n", v527) .. "\n\n" .. ("n: %s\n"):format((tostring(v524))) .. ("Expected: never %s\n"):format(l_printExpected_0(v525));
            if not (#l_results_6 == 1 and l_results_6[1].type == "return") or l_stringify_0(l_results_6[1].value) ~= l_stringify_0(v525) then
                v540 = v540 .. v41("Received:       ", v525, v539, #l_results_6 == 1, v524);
            end;
            return v540 .. v33(v32(l_results_6), #l_calls_6);
        end, 
        pass = v533
    };
end;
v306 = "toHaveReturned";
local l_v306_14 = v306 --[[ copy: 61 -> 76 ]];
v305.toHaveReturned = function(v542, v543, v544)
    local v545 = {
        isNot = v542.isNot, 
        promise = v542.promise
    };
    l_ensureNoExpected_0(v544, l_v306_14, v545);
    v45(v543, l_v306_14, "", v545);
    local v546 = v543.getMockName();
    local v549 = l_Array_0.reduce(v543.mock.results, function(v547, v548)
        if v548.type == "return" then
            return v547 + 1;
        else
            return v547;
        end;
    end, 0);
    local v550 = v549 > 0;
    local _ = nil;
    return {
        message = not v550 and function()
            local v552 = l_matcherHint_0(l_v306_14, v546, "", v545) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v549));
            if #v543.mock.calls ~= v549 then
                v552 = v552 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v543.mock.calls));
            end;
            return v552;
        end or function()
            local v556 = l_matcherHint_0(l_v306_14, v546, "", v545) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v549)) .. l_Array_0.join(l_Array_0.reduce(v543.mock.results, function(v553, v554, v555)
                if v554.type == "return" and #v553 < 3 then
                    table.insert(v553, ("%s: %s"):format(tostring(v555), l_printReceived_0(v554.value)));
                end;
                return v553;
            end, {}), "\n");
            if #v543.mock.calls ~= v549 then
                v556 = v556 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v543.mock.calls);
            end;
            return v556;
        end, 
        pass = v550
    };
end;
v306 = "toHaveReturnedTimes";
local l_v306_15 = v306 --[[ copy: 61 -> 77 ]];
v305.toHaveReturnedTimes = function(v558, v559, v560)
    local v561 = {
        isNot = v558.isNot, 
        promise = v558.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v560, l_v306_15, v561);
    v45(v559, l_v306_15, "expected", v561);
    local v562 = v559.getMockName();
    local v565 = l_Array_0.reduce(v559.mock.results, function(v563, v564)
        if v564.type == "return" then
            return v563 + 1;
        else
            return v563;
        end;
    end, 0);
    local v566 = v565 == v560;
    local _ = nil;
    return {
        message = not v566 and function()
            local v568 = l_matcherHint_0(l_v306_15, v562, "expected", v561) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v560)) .. ("Received number of returns: %s"):format(l_printReceived_0(v565));
            if #v559.mock.calls ~= v565 then
                v568 = v568 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v559.mock.calls));
            end;
            return v568;
        end or function()
            local v569 = l_matcherHint_0(l_v306_15, v562, "expected", v561) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v560));
            if #v559.mock.calls ~= v565 then
                v569 = v569 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v559.mock.calls));
            end;
            return v569;
        end, 
        pass = v566
    };
end;
v306 = "toHaveReturnedWith";
local l_v306_16 = v306 --[[ copy: 61 -> 78 ]];
v305.toHaveReturnedWith = function(v571, v572, v573)
    local v574 = {
        isNot = v571.isNot, 
        promise = v571.promise
    };
    v45(v572, l_v306_16, "expected", v574);
    local v575 = v572.getMockName();
    local l_mock_7 = v572.mock;
    local l_calls_7 = l_mock_7.calls;
    local l_results_7 = l_mock_7.results;
    local v580 = l_Array_0.some(l_results_7, function(v579)
        return v31(v573, v579);
    end);
    local _ = nil;
    return {
        message = not v580 and function()
            local v582 = {};
            local v583 = 1;
            while v583 <= #l_results_7 and #v582 < 3 do
                table.insert(v582, {
                    v583, 
                    l_results_7[v583]
                });
                v583 = v583 + 1;
            end;
            return l_matcherHint_0(l_v306_16, v575, "expected", v574) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v573)) .. v41("Received: ", v573, v582, #l_results_7 == 1) .. v33(v32(l_results_7), #l_calls_7);
        end or function()
            local v584 = {};
            local v585 = 1;
            while v585 <= #l_results_7 and #v584 < 3 do
                if v31(v573, l_results_7[v585]) then
                    table.insert(v584, {
                        v585, 
                        l_results_7[v585]
                    });
                end;
                v585 = v585 + 1;
            end;
            local v586 = l_matcherHint_0(l_v306_16, v575, "expected", v574) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v573));
            if not (#l_results_7 == 1 and l_results_7[1].type == "return") or l_stringify_0(l_results_7[1].value) ~= l_stringify_0(v573) then
                v586 = v586 .. v41("Received:       ", v573, v584, #l_results_7 == 1);
            end;
            return v586 .. v33(v32(l_results_7), #l_calls_7);
        end, 
        pass = v580
    };
end;
v306 = "toReturn";
local l_v306_17 = v306 --[[ copy: 61 -> 79 ]];
v305.toReturn = function(v588, v589, v590)
    local v591 = {
        isNot = v588.isNot, 
        promise = v588.promise
    };
    l_ensureNoExpected_0(v590, l_v306_17, v591);
    v45(v589, l_v306_17, "", v591);
    local v592 = v589.getMockName();
    local v595 = l_Array_0.reduce(v589.mock.results, function(v593, v594)
        if v594.type == "return" then
            return v593 + 1;
        else
            return v593;
        end;
    end, 0);
    local v596 = v595 > 0;
    local _ = nil;
    return {
        message = not v596 and function()
            local v598 = l_matcherHint_0(l_v306_17, v592, "", v591) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v595));
            if #v589.mock.calls ~= v595 then
                v598 = v598 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v589.mock.calls));
            end;
            return v598;
        end or function()
            local v602 = l_matcherHint_0(l_v306_17, v592, "", v591) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v595)) .. l_Array_0.join(l_Array_0.reduce(v589.mock.results, function(v599, v600, v601)
                if v600.type == "return" and #v599 < 3 then
                    table.insert(v599, ("%s: %s"):format(tostring(v601), l_printReceived_0(v600.value)));
                end;
                return v599;
            end, {}), "\n");
            if #v589.mock.calls ~= v595 then
                v602 = v602 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v589.mock.calls);
            end;
            return v602;
        end, 
        pass = v596
    };
end;
v306 = "toReturnTimes";
local l_v306_18 = v306 --[[ copy: 61 -> 80 ]];
v305.toReturnTimes = function(v604, v605, v606)
    local v607 = {
        isNot = v604.isNot, 
        promise = v604.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v606, l_v306_18, v607);
    v45(v605, l_v306_18, "expected", v607);
    local v608 = v605.getMockName();
    local v611 = l_Array_0.reduce(v605.mock.results, function(v609, v610)
        if v610.type == "return" then
            return v609 + 1;
        else
            return v609;
        end;
    end, 0);
    local v612 = v611 == v606;
    local _ = nil;
    return {
        message = not v612 and function()
            local v614 = l_matcherHint_0(l_v306_18, v608, "expected", v607) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v606)) .. ("Received number of returns: %s"):format(l_printReceived_0(v611));
            if #v605.mock.calls ~= v611 then
                v614 = v614 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v605.mock.calls));
            end;
            return v614;
        end or function()
            local v615 = l_matcherHint_0(l_v306_18, v608, "expected", v607) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v606));
            if #v605.mock.calls ~= v611 then
                v615 = v615 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v605.mock.calls));
            end;
            return v615;
        end, 
        pass = v612
    };
end;
v306 = "toReturnWith";
v305.toReturnWith = function(v616, v617, v618)
    local v619 = {
        isNot = v616.isNot, 
        promise = v616.promise
    };
    v45(v617, v306, "expected", v619);
    local v620 = v617.getMockName();
    local l_mock_8 = v617.mock;
    local l_calls_8 = l_mock_8.calls;
    local l_results_8 = l_mock_8.results;
    local v625 = l_Array_0.some(l_results_8, function(v624)
        return v31(v618, v624);
    end);
    local _ = nil;
    return {
        message = not v625 and function()
            local v627 = {};
            local v628 = 1;
            while v628 <= #l_results_8 and #v627 < 3 do
                table.insert(v627, {
                    v628, 
                    l_results_8[v628]
                });
                v628 = v628 + 1;
            end;
            return l_matcherHint_0(v306, v620, "expected", v619) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v618)) .. v41("Received: ", v618, v627, #l_results_8 == 1) .. v33(v32(l_results_8), #l_calls_8);
        end or function()
            local v629 = {};
            local v630 = 1;
            while v630 <= #l_results_8 and #v629 < 3 do
                if v31(v618, l_results_8[v630]) then
                    table.insert(v629, {
                        v630, 
                        l_results_8[v630]
                    });
                end;
                v630 = v630 + 1;
            end;
            local v631 = l_matcherHint_0(v306, v620, "expected", v619) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v618));
            if not (#l_results_8 == 1 and l_results_8[1].type == "return") or l_stringify_0(l_results_8[1].value) ~= l_stringify_0(v618) then
                v631 = v631 .. v41("Received:       ", v618, v629, #l_results_8 == 1);
            end;
            return v631 .. v33(v32(l_results_8), #l_calls_8);
        end, 
        pass = v625
    };
end;
v42 = function(v632)
    local v633 = false;
    if v632 ~= nil then
        v633 = false;
        if typeof(v632) == "table" then
            v633 = v632._isMockFunction == true;
        end;
    end;
    return v633;
end;
v43 = function(v634)
    local v635 = false;
    if v634 ~= nil then
        v635 = false;
        if typeof(v634) == "table" then
            v635 = false;
            if v634.calls ~= nil then
                v635 = false;
                if typeof(v634.calls.all) == "function" then
                    v635 = typeof(v634.calls.count) == "function";
                end;
            end;
        end;
    end;
    return v635;
end;
v44 = function(v636, v637, v638, v639)
    if not (v42(v636) or v43(v636)) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v637, nil, v638, v639), ("%s value must be a mock or spy function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v636, l_printReceived_0))));
    end;
end;
v45 = function(v640, v641, v642, v643)
    if not v42(v640) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v641, nil, v642, v643), ("%s value must be a mock function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v640, l_printReceived_0))));
    end;
end;
return v305;
