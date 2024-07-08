local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_instanceof_0 = v3.instanceof;
local l_Error_0 = v3.Error;
local _ = require(l_Parent_1.RegExp);
local v7 = require(l_Parent_1.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v7.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v7.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v7.matcherErrorMessage;
local l_matcherHint_0 = v7.matcherHint;
local l_printDiffOrStringify_0 = v7.printDiffOrStringify;
local l_printExpected_0 = v7.printExpected;
local l_printReceived_0 = v7.printReceived;
local l_printWithType_0 = v7.printWithType;
local l_stringify_0 = v7.stringify;
local l_formatStackTrace_0 = require(l_Parent_1.JestMessageUtil).formatStackTrace;
local v18 = require(l_Parent_0.print);
local l_printExpectedConstructorName_0 = v18.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v18.printExpectedConstructorNameNot;
local l_printReceivedConstructorName_0 = v18.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v18.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v18.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v18.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local l_isError_0 = require(l_Parent_0.utils).isError;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local function v38(v36)
    local v37 = false;
    if v36 ~= nil then
        v37 = true;
        if typeof(v36.message) ~= "string" then
            v37 = typeof(v36.message) == "table";
        end;
    end;
    if (v37 and typeof(v36.name) == "string") and typeof(v36.stack) == "string" then
        return {
            hasMessage = v37, 
            isError = true, 
            message = v36.message, 
            value = v36
        };
    elseif not v37 then
        return {
            hasMessage = v37, 
            isError = false, 
            message = tostring(v36), 
            value = v36
        };
    else
        return {
            hasMessage = v37, 
            isError = false, 
            message = v36.message, 
            value = v36
        };
    end;
end;
local function v67(v39, v40)
    return function(v41, v42, v43)
        local v44 = {
            isNot = v41.isNot, 
            promise = v41.promise
        };
        local v45 = nil;
        if not v40 or not l_isError_0(v42) then
            if not (typeof(v42) ~= "function") or not (not (typeof(v42) == "table") or not getmetatable(v42)) and getmetatable(v42).__call then
                local function _(v46)
                    return string.match(v46, "[^\n]+");
                end;
                local function v54(v48, v49)
                    local v50 = "";
                    local v51 = "";
                    local v52 = string.match(v48, "[^\n]+");
                    for v53 in string.gmatch(v49, "[^\n]+") do
                        if v53 == v52 then
                            return v51;
                        else
                            v51 = v50;
                            v50 = v50 .. "\n" .. v53;
                        end;
                    end;
                    return nil;
                end;
                local v55 = nil;
                do
                    local l_v55_0 = v55;
                    local v64, v65 = xpcall(function()
                        l_v55_0 = debug.traceback(nil, 2);
                        v42();
                    end, function(v57)
                        if v57 == nil then
                            v57 = "nil";
                        elseif l_getType_0(v57) ~= "error" and (not (typeof(v57) == "table") or not v57.message) then
                            if typeof(v57) == "string" then
                                local _, _, v60 = v57:find("[%S+\\.]+:[0-9]+:%s(.*)");
                                if v60 ~= nil then
                                    v57 = v60;
                                end;
                            elseif typeof(v57) == "table" then
                                v57 = l_stringify_0(v57);
                            end;
                        elseif v57.stack == nil then
                            v57.stack = v54(l_v55_0, debug.traceback());
                            return v57;
                        else
                            if not v57.stack:find("ThrowMatchers%-test%.js") then
                                v57.stack = v54(l_v55_0, v57.stack);
                            end;
                            return v57;
                        end;
                        local v61 = l_Error_0.new(v57);
                        l_Error_0.__captureStackTrace(v61, 3);
                        local _, v63 = string.find(v61.stack, string.match(v61.stack, "[^\n]+"), 1, true);
                        v61.stack = string.sub(v61.stack, (v63 + 1) + 1);
                        v61.stack = v54(l_v55_0, v61.stack);
                        v61["$$robloxInternalJestError"] = true;
                        return v61;
                    end);
                    if not v64 then
                        v45 = v38(v65);
                    end;
                end;
            elseif not v40 then
                local _ = nil;
                error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v39, nil, v43 == nil and "" or "expected", v44), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v42, l_printReceived_0))));
            end;
        else
            v45 = v38(v42);
        end;
        if v43 == nil then
            return v32(v39, v44, v45);
        elseif typeof(v43) == "table" and typeof(v43.asymmetricMatch) == "function" then
            return v28(v39, v44, v45, v43);
        elseif typeof(v43) == "string" then
            return v31(v39, v44, v45, v43);
        elseif l_getType_0(v43) == "regexp" then
            return v27(v39, v44, v45, v43);
        elseif (typeof(v43) == "table" and typeof(v43.test) == "function") and typeof(v43.exec) == "function" then
            return v27(v39, v44, v45, v43);
        elseif not (typeof(v43) == "table") or v43.message then
            if typeof(v43) == "table" then
                return v29(v39, v44, v45, v43);
            else
                error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v39, nil, nil, v44), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v43, l_printExpected_0))));
                return ;
            end;
        else
            return v30(v39, v44, v45, v43);
        end;
    end;
end;
local v68 = {};
local v69 = nil;
local v70 = "toThrow";
local l_v69_0 = v69 --[[ copy: 41 -> 43 ]];
local l_v70_0 = v70 --[[ copy: 42 -> 44 ]];
v68.toThrow = function(v73, v74, v75)
    local v76 = {
        isNot = v73.isNot, 
        promise = v73.promise
    };
    local v77 = nil;
    if not l_v69_0 or not l_isError_0(v74) then
        if not (typeof(v74) ~= "function") or not (not (typeof(v74) == "table") or not getmetatable(v74)) and getmetatable(v74).__call then
            local function _(v78)
                return string.match(v78, "[^\n]+");
            end;
            local function v86(v80, v81)
                local v82 = "";
                local v83 = "";
                local v84 = string.match(v80, "[^\n]+");
                for v85 in string.gmatch(v81, "[^\n]+") do
                    if v85 == v84 then
                        return v83;
                    else
                        v83 = v82;
                        v82 = v82 .. "\n" .. v85;
                    end;
                end;
                return nil;
            end;
            local v87 = nil;
            do
                local l_v87_0 = v87;
                local v96, v97 = xpcall(function()
                    l_v87_0 = debug.traceback(nil, 2);
                    v74();
                end, function(v89)
                    if v89 == nil then
                        v89 = "nil";
                    elseif l_getType_0(v89) ~= "error" and (not (typeof(v89) == "table") or not v89.message) then
                        if typeof(v89) == "string" then
                            local _, _, v92 = v89:find("[%S+\\.]+:[0-9]+:%s(.*)");
                            if v92 ~= nil then
                                v89 = v92;
                            end;
                        elseif typeof(v89) == "table" then
                            v89 = l_stringify_0(v89);
                        end;
                    elseif v89.stack == nil then
                        v89.stack = v86(l_v87_0, debug.traceback());
                        return v89;
                    else
                        if not v89.stack:find("ThrowMatchers%-test%.js") then
                            v89.stack = v86(l_v87_0, v89.stack);
                        end;
                        return v89;
                    end;
                    local v93 = l_Error_0.new(v89);
                    l_Error_0.__captureStackTrace(v93, 3);
                    local _, v95 = string.find(v93.stack, string.match(v93.stack, "[^\n]+"), 1, true);
                    v93.stack = string.sub(v93.stack, (v95 + 1) + 1);
                    v93.stack = v86(l_v87_0, v93.stack);
                    v93["$$robloxInternalJestError"] = true;
                    return v93;
                end);
                if not v96 then
                    v77 = v38(v97);
                end;
            end;
        elseif not l_v69_0 then
            local _ = nil;
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v70_0, nil, v75 == nil and "" or "expected", v76), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v74, l_printReceived_0))));
        end;
    else
        v77 = v38(v74);
    end;
    if v75 == nil then
        return v32(l_v70_0, v76, v77);
    elseif typeof(v75) == "table" and typeof(v75.asymmetricMatch) == "function" then
        return v28(l_v70_0, v76, v77, v75);
    elseif typeof(v75) == "string" then
        return v31(l_v70_0, v76, v77, v75);
    elseif l_getType_0(v75) == "regexp" then
        return v27(l_v70_0, v76, v77, v75);
    elseif (typeof(v75) == "table" and typeof(v75.test) == "function") and typeof(v75.exec) == "function" then
        return v27(l_v70_0, v76, v77, v75);
    elseif not (typeof(v75) == "table") or v75.message then
        if typeof(v75) == "table" then
            return v29(l_v70_0, v76, v77, v75);
        else
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v70_0, nil, nil, v76), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v75, l_printExpected_0))));
            return ;
        end;
    else
        return v30(l_v70_0, v76, v77, v75);
    end;
end;
v69 = nil;
v70 = "toThrowError";
v68.toThrowError = function(v99, v100, v101)
    local v102 = {
        isNot = v99.isNot, 
        promise = v99.promise
    };
    local v103 = nil;
    if not v69 or not l_isError_0(v100) then
        if not (typeof(v100) ~= "function") or not (not (typeof(v100) == "table") or not getmetatable(v100)) and getmetatable(v100).__call then
            local function _(v104)
                return string.match(v104, "[^\n]+");
            end;
            local function v112(v106, v107)
                local v108 = "";
                local v109 = "";
                local v110 = string.match(v106, "[^\n]+");
                for v111 in string.gmatch(v107, "[^\n]+") do
                    if v111 == v110 then
                        return v109;
                    else
                        v109 = v108;
                        v108 = v108 .. "\n" .. v111;
                    end;
                end;
                return nil;
            end;
            local v113 = nil;
            do
                local l_v113_0 = v113;
                local v122, v123 = xpcall(function()
                    l_v113_0 = debug.traceback(nil, 2);
                    v100();
                end, function(v115)
                    if v115 == nil then
                        v115 = "nil";
                    elseif l_getType_0(v115) ~= "error" and (not (typeof(v115) == "table") or not v115.message) then
                        if typeof(v115) == "string" then
                            local _, _, v118 = v115:find("[%S+\\.]+:[0-9]+:%s(.*)");
                            if v118 ~= nil then
                                v115 = v118;
                            end;
                        elseif typeof(v115) == "table" then
                            v115 = l_stringify_0(v115);
                        end;
                    elseif v115.stack == nil then
                        v115.stack = v112(l_v113_0, debug.traceback());
                        return v115;
                    else
                        if not v115.stack:find("ThrowMatchers%-test%.js") then
                            v115.stack = v112(l_v113_0, v115.stack);
                        end;
                        return v115;
                    end;
                    local v119 = l_Error_0.new(v115);
                    l_Error_0.__captureStackTrace(v119, 3);
                    local _, v121 = string.find(v119.stack, string.match(v119.stack, "[^\n]+"), 1, true);
                    v119.stack = string.sub(v119.stack, (v121 + 1) + 1);
                    v119.stack = v112(l_v113_0, v119.stack);
                    v119["$$robloxInternalJestError"] = true;
                    return v119;
                end);
                if not v122 then
                    v103 = v38(v123);
                end;
            end;
        elseif not v69 then
            local _ = nil;
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v70, nil, v101 == nil and "" or "expected", v102), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v100, l_printReceived_0))));
        end;
    else
        v103 = v38(v100);
    end;
    if v101 == nil then
        return v32(v70, v102, v103);
    elseif typeof(v101) == "table" and typeof(v101.asymmetricMatch) == "function" then
        return v28(v70, v102, v103, v101);
    elseif typeof(v101) == "string" then
        return v31(v70, v102, v103, v101);
    elseif l_getType_0(v101) == "regexp" then
        return v27(v70, v102, v103, v101);
    elseif (typeof(v101) == "table" and typeof(v101.test) == "function") and typeof(v101.exec) == "function" then
        return v27(v70, v102, v103, v101);
    elseif not (typeof(v101) == "table") or v101.message then
        if typeof(v101) == "table" then
            return v29(v70, v102, v103, v101);
        else
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v70, nil, nil, v102), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v101, l_printExpected_0))));
            return ;
        end;
    else
        return v30(v70, v102, v103, v101);
    end;
end;
v27 = function(v125, v126, v127, v128)
    local v129 = false;
    if v127 ~= nil then
        v129 = v128:test(v127.message);
    end;
    local v130 = nil;
    if not v129 then
        v130 = function()
            local v131 = l_matcherHint_0(v125, nil, nil, v126) .. "\n\n" .. v33("Expected pattern: ", v128);
            if v127 == nil then
                return v131 .. "\n" .. "Received function never threw";
            elseif not v127.hasMessage or v127.value["$$robloxInternalJestError"] then
                return v131 .. v34("Received value:   ", v127, "message") .. v35(v127);
            else
                return v131 .. v34("Received message: ", v127, "message") .. v35(v127);
            end;
        end;
    else
        assert(v127 ~= nil);
        v130 = function()
            local v132 = l_matcherHint_0(v125, nil, nil, v126) .. "\n\n" .. v33("Expected pattern: never ", v128);
            if (not (v127 ~= nil) or not v127.hasMessage) or v127.value["$$robloxInternalJestError"] then
                return v132 .. v34("Received value:         ", v127, "message") .. v35(v127);
            else
                return v132 .. v34("Received message:       ", v127, "message", v128) .. v35(v127);
            end;
        end;
    end;
    return {
        message = v130, 
        pass = v129
    };
end;
v28 = function(v133, v134, v135, v136)
    local v137 = false;
    if v135 ~= nil then
        v137 = v136:asymmetricMatch(v135.value);
    end;
    local v138 = nil;
    if not v137 then
        v138 = function()
            local v139 = l_matcherHint_0(v133, nil, nil, v134) .. "\n\n" .. v33("Expected asymmetric matcher: ", v136) .. "\n";
            if v135 == nil then
                return v139 .. "Received function never threw";
            elseif not v135.hasMessage or v135.value["$$robloxInternalJestError"] then
                return v139 .. v34("Thrown value: ", v135, "message") .. v35(v135);
            else
                return v139 .. v34("Received name:    ", v135, "name") .. v34("Received message: ", v135, "message") .. v35(v135);
            end;
        end;
    else
        assert(v135 ~= nil);
        v138 = function()
            local v140 = l_matcherHint_0(v133, nil, nil, v134) .. "\n\n" .. v33("Expected asymmetric matcher: never ", v136) .. "\n";
            if (not (v135 ~= nil) or not v135.hasMessage) or v135.value["$$robloxInternalJestError"] then
                return v140 .. v34("Thrown value: ", v135, "message") .. v35(v135);
            else
                return v140 .. v34("Received name:    ", v135, "name") .. v34("Received message: ", v135, "message") .. v35(v135);
            end;
        end;
    end;
    return {
        message = v138, 
        pass = v137
    };
end;
v29 = function(v141, v142, v143, v144)
    local v145 = false;
    if v143 ~= nil then
        v145 = v143.message == v144.message;
    end;
    local v146 = nil;
    if not v145 then
        v146 = function()
            local v147 = l_matcherHint_0(v141, nil, nil, v142) .. "\n\n";
            if v143 == nil then
                return v147 .. v33("Expected message: ", v144.message) .. "\n" .. "Received function never threw";
            elseif not v143.hasMessage or v143.value["$$robloxInternalJestError"] then
                return v147 .. v33("Expected message: ", v144.message) .. v34("Received value:   ", v143, "message") .. v35(v143);
            else
                return v147 .. l_printDiffOrStringify_0(v144.message, v143.message, "Expected message", "Received message", true) .. "\n" .. v35(v143);
            end;
        end;
    else
        assert(v143 ~= nil);
        v146 = function()
            local v148 = l_matcherHint_0(v141, nil, nil, v142) .. "\n\n" .. v33("Expected message: never ", v144.message);
            if (not (v143 ~= nil) or not v143.hasMessage) or v143.value["$$robloxInternalJestError"] then
                return v148 .. v34("Received value:         ", v143, "message") .. v35(v143);
            else
                return v148 .. v35(v143);
            end;
        end;
    end;
    return {
        message = v146, 
        pass = v145
    };
end;
v30 = function(v149, v150, v151, v152)
    local function _(v153)
        return (v153 and getmetatable(v153)) and getmetatable(v153).__index;
    end;
    local v155 = false;
    if v151 ~= nil then
        v155 = false;
        if v151.value ~= nil then
            v155 = l_instanceof_0(v151.value, v152);
        end;
    end;
    local _ = nil;
    return {
        message = not v155 and function()
            local v157 = l_matcherHint_0(v149, nil, nil, v150) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v152);
            if v151 == nil then
                return v157 .. "\n" .. "Received function never threw";
            else
                if v151.value ~= nil then
                    local l_value_0 = v151.value;
                    if not (not ((l_value_0 and getmetatable(l_value_0)) and getmetatable(l_value_0).__index) or v151.value["$$robloxInternalJestError"]) then
                        v157 = v157 .. l_printReceivedConstructorName_0("Received constructor", (getmetatable(v151.value)));
                    end;
                end;
                v157 = v157 .. "\n";
                if not v151.hasMessage or v151.value["$$robloxInternalJestError"] then
                    return v157 .. v34("Received value: ", v151, "message") .. v35(v151);
                else
                    return v157 .. v34("Received message: ", v151, "message") .. v35(v151);
                end;
            end;
        end or function()
            local v159 = l_matcherHint_0(v149, nil, nil, v150) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v152);
            if v151 ~= nil then
                local l_value_1 = v151.value;
                if (l_value_1 and getmetatable(l_value_1)) and getmetatable(l_value_1).__index then
                    l_value_1 = v152;
                    if not (not (((l_value_1 and getmetatable(l_value_1)) and getmetatable(l_value_1).__index) and getmetatable(v151.value).__index ~= v152) or v151.value["$$robloxInternalJestError"]) then
                        v159 = v159 .. l_printReceivedConstructorNameNot_0("Received constructor", getmetatable(v151.value), v152);
                    end;
                end;
            end;
            v159 = v159 .. "\n";
            if (not (v151 ~= nil) or not v151.hasMessage) or v151.value["$$robloxInternalJestError"] then
                return v159 .. v34("Received value: ", v151, "message") .. v35(v151);
            else
                return v159 .. v34("Received message: ", v151, "message") .. v35(v151);
            end;
        end, 
        pass = v155
    };
end;
v31 = function(v161, v162, v163, v164)
    local v165 = false;
    if not (not (v163 ~= nil and typeof(v163.message) == "string") or not v163.message:find(v164, 1, true)) then
        v165 = true;
    end;
    local v166 = nil;
    if not v165 then
        v166 = function()
            local v167 = l_matcherHint_0(v161, nil, nil, v162) .. "\n\n" .. v33("Expected substring: ", v164);
            if v163 == nil then
                return v167 .. "\n" .. "Received function never threw";
            elseif not v163.hasMessage or v163.value["$$robloxInternalJestError"] then
                return v167 .. v34("Received value:     ", v163, "message") .. v35(v163);
            else
                return v167 .. v34("Received message:   ", v163, "message") .. v35(v163);
            end;
        end;
    else
        assert(v163 ~= nil);
        v166 = function()
            local v168 = l_matcherHint_0(v161, nil, nil, v162) .. "\n\n" .. v33("Expected substring: never ", v164);
            if (not (v163 ~= nil) or not v163.hasMessage) or v163.value["$$robloxInternalJestError"] then
                return v168 .. v34("Received value:           ", v163, "message") .. v35(v163);
            else
                return v168 .. v34("Received message:         ", v163, "message", v164) .. v35(v163);
            end;
        end;
    end;
    return {
        message = v166, 
        pass = v165
    };
end;
v32 = function(v169, v170, v171)
    local v172 = v171 ~= nil;
    local v173 = nil;
    if not v172 then
        v173 = function()
            return l_matcherHint_0(v169, nil, "", v170) .. "\n\n" .. "Received function never threw";
        end;
    else
        assert(v171 ~= nil);
        v173 = function()
            local v174 = l_matcherHint_0(v169, nil, "", v170) .. "\n\n";
            if (not (v171 ~= nil) or not v171.hasMessage) or v171.value["$$robloxInternalJestError"] then
                return v174 .. v34("Thrown value: ", v171, "message") .. v35(v171);
            else
                return v174 .. v34("Error name:    ", v171, "name") .. v34("Error message: ", v171, "message") .. v35(v171);
            end;
        end;
    end;
    return {
        message = v173, 
        pass = v172
    };
end;
v33 = function(v175, v176)
    return v175 .. l_printExpected_0(v176) .. "\n";
end;
v34 = function(v177, v178, v179, v180)
    if v178 == nil then
        return "";
    elseif v179 == "message" then
        local l_message_0 = v178.message;
        if typeof(v180) == "string" then
            local v182 = l_message_0:find(v180);
            if v182 then
                return v177 .. l_printReceivedStringContainExpectedSubstring_0(l_message_0, v182, #v180) .. "\n";
            end;
        elseif l_getType_0(v180) == "regexp" then
            return v177 .. l_printReceivedStringContainExpectedResult_0(l_message_0, v180:exec(l_message_0)) .. "\n";
        end;
        return v177 .. l_printReceived_0(l_message_0) .. "\n";
    elseif v179 == "name" then
        if not v178.isError then
            return "";
        else
            return v177 .. l_printReceived_0(v178.value.name) .. "\n";
        end;
    elseif v179 == "value" then
        if not v178.isError then
            return v177 .. l_printReceived_0(v178.value) .. "\n";
        else
            return "";
        end;
    else
        return "";
    end;
end;
v35 = function(v183)
    if v183 ~= nil and v183.isError then
        return l_formatStackTrace_0(v183.value.stack, {
            testMatch = {}
        }, {
            noStackTrace = true
        });
    else
        return "";
    end;
end;
return {
    createMatcher = v67, 
    matchers = v68
};
