local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_Object_0 = v2.Object;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local v9 = require(l_Parent_1.JestGetType);
local l_getType_0 = v9.getType;
local l_isPrimitive_0 = v9.isPrimitive;
local v12 = require(l_Parent_1.JestMatcherUtils);
local l_DIM_COLOR_0 = v12.DIM_COLOR;
local l_EXPECTED_COLOR_0 = v12.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v12.RECEIVED_COLOR;
local l_SUGGEST_TO_CONTAIN_EQUAL_0 = v12.SUGGEST_TO_CONTAIN_EQUAL;
local l_ensureExpectedIsNonNegativeInteger_0 = v12.ensureExpectedIsNonNegativeInteger;
local l_ensureNoExpected_0 = v12.ensureNoExpected;
local l_ensureNumbers_0 = v12.ensureNumbers;
local l_getLabelPrinter_0 = v12.getLabelPrinter;
local l_matcherErrorMessage_0 = v12.matcherErrorMessage;
local l_matcherHint_0 = v12.matcherHint;
local l_printDiffOrStringify_0 = v12.printDiffOrStringify;
local l_printExpected_0 = v12.printExpected;
local l_printReceived_0 = v12.printReceived;
local l_printWithType_0 = v12.printWithType;
local l_stringify_0 = v12.stringify;
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v29 = require(l_Parent_0.print);
local l_printCloseTo_0 = v29.printCloseTo;
local l_printExpectedConstructorName_0 = v29.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v29.printExpectedConstructorNameNot;
local l_printReceivedArrayContainExpectedItem_0 = v29.printReceivedArrayContainExpectedItem;
local l_printReceivedConstructorName_0 = v29.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v29.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v29.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v29.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local v39 = require(l_Parent_0.utils);
local l_getObjectSubset_0 = v39.getObjectSubset;
local l_getPath_0 = v39.getPath;
local l_iterableEquality_0 = v39.iterableEquality;
local l_pathAsArray_0 = v39.pathAsArray;
local l_subsetEquality_0 = v39.subsetEquality;
local l_typeEquality_0 = v39.typeEquality;
local v46 = require(l_Parent_1.RobloxShared);
local l_instanceSubsetEquality_0 = v46.RobloxInstance.instanceSubsetEquality;
local l_getInstanceSubset_0 = v46.RobloxInstance.getInstanceSubset;
local function _(v49)
    return not not v49;
end;
local v51 = {
    l_typeEquality_0
};
local function v60(v52, v53, v54)
    local v55 = {
        comment = "Object.is equality", 
        isNot = v52.isNot, 
        promise = v52.promise
    };
    local v56 = l_Object_0.is(v53, v54);
    local _ = nil;
    return {
        actual = v53, 
        expected = v54, 
        message = not v56 and function()
            local v58 = nil;
            if l_equals_0(v53, v54, {
                l_iterableEquality_0
            }) then
                v58 = "toEqual";
            end;
            local v59 = l_matcherHint_0("toBe", nil, nil, v55) .. "\n\n";
            if v58 ~= nil then
                v59 = v59 .. l_DIM_COLOR_0(string.format("If it should pass with deep equality, replace \"%s\" with \"%s\"", "toBe", v58)) .. "\n\n";
            end;
            return v59 .. l_printDiffOrStringify_0(v54, v53, "Expected", "Received", not not v52.expand);
        end or function()
            return l_matcherHint_0("toBe", nil, nil, v55) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v54));
        end, 
        name = "toBe", 
        pass = v56
    };
end;
local function v74(v61, v62, v63, v64)
    local v65 = nil;
    if not v64 then
        v64 = 2;
    else
        v65 = "precision";
    end;
    local l_isNot_0 = v61.isNot;
    local v68 = {
        isNot = l_isNot_0, 
        promise = v61.promise, 
        secondArgument = v65, 
        secondArgumentColor = function(v67)
            return v67;
        end
    };
    if typeof(v63) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v68), string.format("%s value must be a number", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v63, l_printExpected_0))));
    end;
    if typeof(v62) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v68), string.format("%s value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v62, l_printReceived_0))));
    end;
    local v69 = false;
    local v70 = 0;
    local v71 = 0;
    if v62 == math.huge and v63 == math.huge then
        v69 = true;
    elseif v62 == -math.huge and v63 == -math.huge then
        v69 = true;
    else
        v70 = 10 ^ (-v64) / 2;
        v71 = math.abs(v63 - v62);
        v69 = v71 < v70;
    end;
    local _ = nil;
    return {
        message = not v69 and function()
            return l_matcherHint_0("toBeCloseTo", nil, nil, v68) .. "\n\n" .. string.format("Expected: %s\n", l_printExpected_0(v63)) .. string.format("Received: %s\n", l_printReceived_0(v62)) .. "\n" .. l_printCloseTo_0(v71, v70, v64, l_isNot_0);
        end or function()
            local v73 = l_matcherHint_0("toBeCloseTo", nil, nil, v68) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v63));
            if v71 == 0 then
                return v73;
            else
                return v73 .. string.format("Received:       %s\n", l_printReceived_0(v62)) .. "\n" .. l_printCloseTo_0(v71, v70, v64, l_isNot_0);
            end;
        end, 
        pass = v69
    };
end;
local function v79(v75, v76, v77)
    local v78 = {
        isNot = v75.isNot, 
        promise = v75.promise
    };
    l_ensureNoExpected_0(v77, "toBeDefined", v78);
    return {
        message = function()
            return l_matcherHint_0("toBeDefined", nil, "", v78) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v76));
        end, 
        pass = v76 ~= nil
    };
end;
local function v84(v80, v81, v82)
    local v83 = {
        isNot = v80.isNot, 
        promise = v80.promise
    };
    l_ensureNoExpected_0(v82, "toBeFalsy", v83);
    return {
        message = function()
            return l_matcherHint_0("toBeFalsy", nil, "", v83) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v81));
        end, 
        pass = not v81
    };
end;
local function v90(v85, v86, v87)
    local l_isNot_1 = v85.isNot;
    local v89 = {
        isNot = l_isNot_1, 
        promise = v85.promise
    };
    l_ensureNumbers_0(v86, v87, "toBeGreaterThan", v89);
    return {
        message = function()
            return l_matcherHint_0("toBeGreaterThan", nil, nil, v89) .. "\n\n" .. string.format("Expected:%s > %s\n", not l_isNot_1 and "" or " never", l_printExpected_0(v87)) .. string.format("Received:%s   %s", not l_isNot_1 and "" or "      ", l_printReceived_0(v86));
        end, 
        pass = v87 < v86
    };
end;
local function v96(v91, v92, v93)
    local l_isNot_2 = v91.isNot;
    local v95 = {
        isNot = l_isNot_2, 
        promise = v91.promise
    };
    l_ensureNumbers_0(v92, v93, "toBeGreaterThanOrEqual", v95);
    return {
        message = function()
            return l_matcherHint_0("toBeGreaterThanOrEqual", nil, nil, v95) .. "\n\n" .. string.format("Expected:%s >= %s\n", not l_isNot_2 and "" or " never", l_printExpected_0(v93)) .. string.format("Received:%s    %s", not l_isNot_2 and "" or "      ", l_printReceived_0(v92));
        end, 
        pass = v93 <= v92
    };
end;
local function v106(v97, v98, v99)
    local v100 = {
        isNot = v97.isNot, 
        promise = v97.promise
    };
    if typeof(v99) ~= "table" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeInstanceOf", nil, nil, v100), string.format("%s value must be a prototype class", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v99, l_printExpected_0))));
    end;
    local v101 = l_instanceof_0(v98, v99);
    local v102 = nil;
    if typeof((getmetatable(v98))) == "table" and typeof(getmetatable(v98).__index) == "table" then
        v102 = getmetatable(v98).__index;
    end;
    local _ = nil;
    return {
        message = not v101 and function()
            local v104 = l_matcherHint_0("toBeInstanceOf", nil, nil, v100) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v99);
            if l_isPrimitive_0(v98) or v102 == nil then
                return v104 .. string.format("\nReceived value has no prototype\nReceived value: %s", l_printReceived_0(v98));
            else
                return v104 .. l_printReceivedConstructorName_0("Received constructor", v102);
            end;
        end or function()
            local v105 = l_matcherHint_0("toBeInstanceOf", nil, nil, v100) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v99);
            if v102 and v102 ~= v99 then
                v105 = v105 .. l_printReceivedConstructorNameNot_0("Received constructor", v102, v99);
            end;
            return v105;
        end, 
        pass = v101
    };
end;
local function v112(v107, v108, v109)
    local l_isNot_3 = v107.isNot;
    local v111 = {
        isNot = l_isNot_3, 
        promise = v107.promise
    };
    l_ensureNumbers_0(v108, v109, "toBeLessThan", v111);
    return {
        message = function()
            return l_matcherHint_0("toBeLessThan", nil, nil, v111) .. "\n\n" .. string.format("Expected:%s < %s\n", not l_isNot_3 and "" or " never", l_printExpected_0(v109)) .. string.format("Received:%s   %s", not l_isNot_3 and "" or "      ", l_printReceived_0(v108));
        end, 
        pass = v108 < v109
    };
end;
local function v118(v113, v114, v115)
    local l_isNot_4 = v113.isNot;
    local v117 = {
        isNot = l_isNot_4, 
        promise = v113.promise
    };
    l_ensureNumbers_0(v114, v115, "toBeLessThanOrEqual", v117);
    return {
        message = function()
            return l_matcherHint_0("toBeLessThanOrEqual", nil, nil, v117) .. "\n\n" .. string.format("Expected:%s <= %s\n", not l_isNot_4 and "" or " never", l_printExpected_0(v115)) .. string.format("Received:%s    %s", not l_isNot_4 and "" or "      ", l_printReceived_0(v114));
        end, 
        pass = v114 <= v115
    };
end;
local function v123(v119, v120, v121)
    local v122 = {
        isNot = v119.isNot, 
        promise = v119.promise
    };
    l_ensureNoExpected_0(v121, "toBeNan", v122);
    return {
        message = function()
            return l_matcherHint_0("toBeNan", nil, "", v122) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v120));
        end, 
        pass = l_Number_0.isNaN(v120)
    };
end;
local function v128(v124, v125, v126)
    local v127 = {
        isNot = v124.isNot, 
        promise = v124.promise
    };
    l_ensureNoExpected_0(v126, "toBeNil", v127);
    return {
        message = function()
            return l_matcherHint_0("toBeNil", nil, "", v127) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v125));
        end, 
        pass = v125 == nil
    };
end;
return {
    toBe = v60, 
    toBeCloseTo = v74, 
    toBeDefined = v79, 
    toBeFalsy = v84, 
    toBeGreaterThan = v90, 
    toBeGreaterThanOrEqual = v96, 
    toBeInstanceOf = v106, 
    toBeLessThan = v112, 
    toBeLessThanOrEqual = v118, 
    toBeNan = v123, 
    toBeNaN = v123, 
    toBeNil = v128, 
    toBeNull = v128, 
    toBeTruthy = function(v129, v130, v131)
        local v132 = {
            isNot = v129.isNot, 
            promise = v129.promise
        };
        l_ensureNoExpected_0(v131, "toBeTruthy", v132);
        return {
            message = function()
                return l_matcherHint_0("toBeTruthy", nil, "", v132) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v130));
            end, 
            pass = not not v130
        };
    end, 
    toBeUndefined = function(v133, v134, v135)
        local v136 = {
            isNot = v133.isNot, 
            promise = v133.promise
        };
        l_ensureNoExpected_0(v135, "toBeUndefined", v136);
        return {
            message = function()
                return l_matcherHint_0("toBeUndefined", nil, "", v136) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v134));
            end, 
            pass = v134 == nil
        };
    end, 
    toContain = function(v137, v138, v139)
        local l_isNot_5 = v137.isNot;
        local v141 = {
            comment = "string.find or table.find", 
            isNot = l_isNot_5, 
            promise = v137.promise
        };
        if v138 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContain", nil, nil, v141), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v138, l_printReceived_0))));
        end;
        if typeof(v138) == "string" then
            local v142 = ("%s value must be a string if %s value is a string"):format(l_EXPECTED_COLOR_0("expected"), l_RECEIVED_COLOR_0("received"));
            if typeof(v139) ~= "string" then
                error(l_Error_0.new(l_matcherErrorMessage_0(l_matcherHint_0("toContain", v138, tostring(v139), v141), v142, tostring(l_printWithType_0("Expected", v139, l_printExpected_0)) .. "\n" .. tostring(l_printWithType_0("Received", v138, l_printReceived_0)))));
            end;
            local v143 = v138:find(tostring(v139), 1, true);
            return {
                message = function()
                    local v144 = string.format("Expected %s", typeof(v139) == "string" and "substring" or "value");
                    local v145 = l_getLabelPrinter_0(v144, "Received string");
                    return l_matcherHint_0("toContain", nil, nil, v141) .. "\n\n" .. string.format("%s%s%s\n", v145(v144), not l_isNot_5 and "" or "never ", l_printExpected_0(v139)) .. string.format("%s%s%s", v145("Received string"), not l_isNot_5 and "" or "      ", not not l_isNot_5 and l_printReceivedStringContainExpectedSubstring_0(v138, v143, #tostring(v139)) or l_printReceived_0(v138));
                end, 
                pass = v143 ~= nil
            };
        else
            local v146 = table.find(l_Array_0.from(v138), v139);
            return {
                message = function()
                    local v147 = string.format("Received %s", l_getType_0(v138));
                    local v148 = l_getLabelPrinter_0("Expected value", v147);
                    local v149 = l_matcherHint_0("toContain", nil, nil, v141) .. "\n\n" .. string.format("%s%s%s\n", v148("Expected value"), not l_isNot_5 and "" or "never ", l_printExpected_0(v139)) .. string.format("%s%s", v148(v147), not l_isNot_5 and "" or "      ");
                    v149 = if not not l_isNot_5 and l_Array_0.isArray(v138) then v149 .. l_printReceivedArrayContainExpectedItem_0(v138, v146) else v149 .. l_printReceived_0(v138);
                    if not l_isNot_5 and l_Array_0.findIndex(v138, function(v150)
                        return l_equals_0(v150, v139, {
                            l_iterableEquality_0
                        });
                    end) ~= -1 then
                        v149 = v149 .. string.format("\n\n%s", l_SUGGEST_TO_CONTAIN_EQUAL_0);
                    end;
                    return v149;
                end, 
                pass = v146 ~= nil
            };
        end;
    end, 
    toContainEqual = function(v151, v152, v153)
        local l_isNot_6 = v151.isNot;
        local v155 = {
            comment = "deep equality", 
            isNot = l_isNot_6, 
            promise = v151.promise
        };
        if v152 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContainEqual", nil, nil, v155), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v152, l_printReceived_0))));
        end;
        local v157 = l_Array_0.findIndex(l_Array_0.from(v152), function(v156)
            return l_equals_0(v156, v153, {
                l_iterableEquality_0
            });
        end);
        return {
            message = function()
                local v158 = string.format("Received %s", l_getType_0(v152));
                local v159 = l_getLabelPrinter_0("Expected value", v158);
                local v160 = l_matcherHint_0("toContainEqual", nil, nil, v155) .. "\n\n" .. string.format("%s%s%s\n", v159("Expected value"), not l_isNot_6 and "" or "never ", l_printExpected_0(v153)) .. string.format("%s%s", v159(v158), not l_isNot_6 and "" or "      ");
                if not l_isNot_6 or not l_Array_0.isArray(v152) then
                    return v160 .. l_printReceived_0(v152);
                else
                    return v160 .. l_printReceivedArrayContainExpectedItem_0(v152, v157);
                end;
            end, 
            pass = v157 ~= -1
        };
    end, 
    toEqual = function(v161, v162, v163)
        local v164 = {
            comment = "deep equality", 
            isNot = v161.isNot, 
            promise = v161.promise
        };
        local v165 = l_equals_0(v162, v163, {
            l_iterableEquality_0
        });
        local _ = nil;
        return {
            actual = v162, 
            expected = v163, 
            message = not v165 and function()
                return l_matcherHint_0("toEqual", nil, nil, v164) .. "\n\n" .. l_printDiffOrStringify_0(v163, v162, "Expected", "Received", not not v161.expand);
            end or function()
                local v167 = l_matcherHint_0("toEqual", nil, nil, v164) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v163));
                if l_stringify_0(v163) ~= l_stringify_0(v162) then
                    v167 = v167 .. string.format("Received:       %s", l_printReceived_0(v162));
                end;
                return v167;
            end, 
            name = "toEqual", 
            pass = v165
        };
    end, 
    toHaveLength = function(v168, v169, v170)
        local l_isNot_7 = v168.isNot;
        local v172 = {
            isNot = l_isNot_7, 
            promise = v168.promise
        };
        local v173 = false;
        if typeof(v169) == "table" then
            v173 = typeof(v169.length) == "number";
        end;
        if not (not (not l_Array_0.isArray(v169) and typeof(v169) ~= "string") or v173) then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveLength", nil, nil, v172), string.format("%s value must have a length property whose value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v169, l_printReceived_0))));
        end;
        l_ensureExpectedIsNonNegativeInteger_0(v170, "toHaveLength", v172);
        local v174 = nil;
        local v175 = nil;
        if v169.length ~= nil then
            v175 = v169.length;
            v174 = v175 == v170;
        else
            v175 = #v169;
            v174 = v175 == v170;
        end;
        return {
            message = function()
                local v176 = string.format("Received %s", l_getType_0(v169));
                local v177 = l_getLabelPrinter_0("Expected length", "Received length", v176);
                local v178 = l_matcherHint_0("toHaveLength", nil, nil, v172) .. "\n\n" .. string.format("%s%s%s\n", v177("Expected length"), not l_isNot_7 and "" or "never ", l_printExpected_0(v170));
                if not l_isNot_7 then
                    v178 = v178 .. string.format("%s%s\n", v177("Received length"), l_printReceived_0(v175));
                end;
                return v178 .. string.format("%s%s%s", v177(v176), not l_isNot_7 and "" or "      ", l_printReceived_0(v169));
            end, 
            pass = v174
        };
    end, 
    toHaveProperty = function(v179, v180, v181, v182)
        local v183 = v182 ~= nil;
        local v184 = {
            isNot = v179.isNot, 
            promise = v179.promise, 
            secondArgument = not v183 and "" or "value"
        };
        if v180 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v184), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v180, l_printReceived_0))));
        end;
        local v185 = l_getType_0(v181);
        if v185 ~= "string" and v185 ~= "table" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v184), string.format("%s path must be a string or array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v181, l_printExpected_0))));
        end;
        local v186 = nil;
        v186 = if typeof(v181) == "string" then #l_pathAsArray_0(v181) else #v181;
        if v185 == "table" and v186 == 0 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v184), string.format("%s path must not be an empty array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v181, l_printExpected_0))));
        end;
        local v187 = l_getPath_0(v180, v181);
        local l_lastTraversedObject_0 = v187.lastTraversedObject;
        local l_hasEndProp_0 = v187.hasEndProp;
        local l_traversedPath_0 = v187.traversedPath;
        local v191 = #l_traversedPath_0 == v186;
        local v192 = nil;
        v192 = if not v191 then l_lastTraversedObject_0 else v187.value;
        local v193 = nil;
        v193 = if not v183 then not not l_hasEndProp_0 else l_equals_0(v187.value, v182, {
            l_iterableEquality_0
        });
        local _ = nil;
        return {
            message = not v193 and function()
                local v195 = l_matcherHint_0("toHaveProperty", nil, "path", v184) .. "\n\n" .. string.format("Expected path: %s\n", l_printExpected_0(v181));
                if not v191 then
                    v195 = v195 .. "Received path: ";
                    v195 = if not (v185 ~= "table") or #l_traversedPath_0 == 0 then v195 .. string.format("%s\n\n", l_printReceived_0(l_traversedPath_0)) else v195 .. string.format("%s\n\n", l_printReceived_0(table.concat(l_traversedPath_0, ".")));
                    if v183 then
                        v195 = v195 .. string.format("Expected value: %s\n", l_printExpected_0(v182));
                    end;
                    return v195 .. string.format("Received value: %s", l_printReceived_0(v192));
                else
                    return v195 .. "\n" .. l_printDiffOrStringify_0(v182, v192, "Expected value", "Received value", not not v179.expand);
                end;
            end or function()
                local v196 = l_matcherHint_0("toHaveProperty", nil, "path", v184) .. "\n\n";
                if not v183 then
                    return v196 .. string.format("Expected path: never %s\n\n", l_printExpected_0(v181)) .. string.format("Received value: %s", l_printReceived_0(v192));
                else
                    v196 = v196 .. string.format("Expected path: %s\n\n", l_printExpected_0(v181)) .. string.format("Expected value: never %s", l_printExpected_0(v182));
                    if l_stringify_0(v182) ~= l_stringify_0(v192) then
                        return v196 .. string.format("\nReceived value:       %s", l_printReceived_0(v192));
                    else
                        return v196;
                    end;
                end;
            end, 
            pass = v193
        };
    end, 
    toMatch = function(v197, v198, v199)
        local v200 = {
            isNot = v197.isNot, 
            promise = v197.promise
        };
        if typeof(v198) ~= "string" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v200), string.format("%s value must be a string", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v198, l_printReceived_0))));
        end;
        if typeof(v199) ~= "string" and l_getType_0(v199) ~= "regexp" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v200), string.format("%s value must be a string or regular expression", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v199, l_printExpected_0))));
        end;
        local v201 = nil;
        if typeof(v199) == "string" then
            v199 = string.gsub(v199, string.char(27) .. "%[", string.char(27) .. "%%[");
            v201 = v198:find(v199) ~= nil;
        else
            v201 = v199:test(v198);
        end;
        local _ = nil;
        return {
            message = not v201 and function()
                local v203 = l_getLabelPrinter_0("Expected pattern", "Received string");
                return l_matcherHint_0("toMatch", nil, nil, v200) .. "\n\n" .. string.format("%s%s\n", v203("Expected pattern"), l_printExpected_0(v199)) .. string.format("%s%s", v203("Received string"), l_printReceived_0(v198));
            end or function()
                local v204 = l_matcherHint_0("toMatch", nil, nil, v200) .. "\n\n" .. string.format("Expected pattern: never %s\n", l_printExpected_0(v199));
                if typeof(v199) == "string" then
                    return v204 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedSubstring_0(v198, v198:find(v199), #v199));
                else
                    return v204 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedResult_0(v198, v199:exec(v198)));
                end;
            end, 
            pass = v201
        };
    end, 
    toMatchObject = function(v205, v206, v207)
        local v208 = {
            isNot = v205.isNot, 
            promise = v205.promise
        };
        if not (typeof(v206) == "table") or v206 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v208), string.format("%s value must be a non-nil object", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v206, l_printReceived_0))));
        end;
        if not (typeof(v207) == "table") or v207 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v208), string.format("%s value must be a non-nil object", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v207, l_printExpected_0))));
        end;
        local v209 = l_equals_0(v206, v207, {
            l_iterableEquality_0, 
            l_subsetEquality_0
        });
        local _ = nil;
        return {
            message = not v209 and function()
                return l_matcherHint_0("toMatchObject", nil, nil, v208) .. "\n\n" .. l_printDiffOrStringify_0(v207, l_getObjectSubset_0(v206, v207), "Expected", "Received", not not v205.expand);
            end or function()
                local v211 = l_matcherHint_0("toMatchObject", nil, nil, v208) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v207));
                if l_stringify_0(v207) ~= l_stringify_0(v206) then
                    return v211 .. string.format("\nReceived:       %s", l_printReceived_0(v206));
                else
                    return v211;
                end;
            end, 
            pass = v209
        };
    end, 
    toStrictEqual = function(v212, v213, v214)
        local v215 = {
            comment = "deep equality", 
            isNot = v212.isNot, 
            promise = v212.promise
        };
        local v216 = l_equals_0(v213, v214, v51, true);
        local _ = nil;
        return {
            actual = v213, 
            expected = v214, 
            message = not v216 and function()
                return l_matcherHint_0("toStrictEqual", nil, nil, v215) .. "\n\n" .. l_printDiffOrStringify_0(v214, v213, "Expected", "Received", not not v212.expand);
            end or function()
                local v218 = l_matcherHint_0("toStrictEqual", nil, nil, v215) .. "\n\n" .. string.format("Expected: not %s\n", l_printExpected_0(v214));
                if l_stringify_0(v214) ~= l_stringify_0(v213) then
                    v218 = v218 .. string.format("Received:     %s", l_printReceived_0(v213));
                end;
                return v218;
            end, 
            name = "toStrictEqual", 
            pass = v216
        };
    end, 
    toMatchInstance = function(v219, v220, v221)
        local v222 = {
            isNot = v219.isNot, 
            promise = v219.promise
        };
        if not (l_getType_0(v220) == "Instance") or v220 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v222), string.format("%s value must be a Roblox Instance", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v220, l_printReceived_0))));
        end;
        if not (typeof(v221) == "table") or v221 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v222), string.format("%s value must be a table", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v221, l_printExpected_0))));
        end;
        local v223 = l_equals_0(v220, v221, {
            l_instanceSubsetEquality_0
        });
        local v224 = nil;
        if not v223 then
            local v225, v226 = l_getInstanceSubset_0(v220, v221);
            v224 = function()
                return l_matcherHint_0("toMatchInstance", nil, nil, v222) .. "\n\n" .. l_printDiffOrStringify_0(v226, v225, "Expected", "Received", not not v219.expand);
            end;
        else
            v224 = function()
                local v227 = l_matcherHint_0("toMatchInstance", nil, nil, v222) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v221));
                if l_stringify_0(v221) ~= l_stringify_0(v220) then
                    return v227 .. string.format("\nReceived:       %s", l_printReceived_0(v220));
                else
                    return v227;
                end;
            end;
        end;
        return {
            message = v224, 
            pass = v223
        };
    end
};
