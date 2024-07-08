local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_Symbol_0 = v2.Symbol;
local v7 = require(l_Parent_0.ChalkLua);
local v8 = require(l_Parent_0.JestDiff);
local l_DIFF_DELETE_0 = v8.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v8.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v8.DIFF_INSERT;
local l_diff_0 = v8.diff;
local l_diffStringsRaw_0 = v8.diffStringsRaw;
local l_diffStringsUnified_0 = v8.diffStringsUnified;
local v15 = require(l_Parent_0.JestGetType);
local l_getType_0 = v15.getType;
local l_isPrimitive_0 = v15.isPrimitive;
local v18 = require(l_Parent_0.PrettyFormat);
local l_format_0 = v18.format;
local v20 = require(l_script_0.Replaceable);
local v21 = require(l_script_0.deepCyclicCopyReplaceable);
local l_plugins_0 = v18.plugins;
local v23 = {
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.RobloxInstance
};
local l_green_0 = v7.green;
local l_red_0 = v7.red;
local l_inverse_0 = v7.inverse;
local l_bold_0 = v7.bold;
local l_dim_0 = v7.dim;
local v29 = utf8.char(183);
local v30 = {
    "zero", 
    "one", 
    "two", 
    "three", 
    "four", 
    "five", 
    "six", 
    "seven", 
    "eight", 
    "nine", 
    "ten", 
    "eleven", 
    "twelve", 
    "thirteen"
};
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local function v39(v40, v41)
    if v40 == l_Symbol_0.for_("$$nil") then
        v40 = nil;
    end;
    v41 = v41 or 10;
    local v42 = nil;
    if not pcall(function()
        v42 = l_format_0(v40, {
            maxDepth = v41, 
            min = true, 
            plugins = v23
        });
    end) then
        v42 = l_format_0(v40, {
            callToJSON = false, 
            maxDepth = v41, 
            min = true, 
            plugins = v23
        });
    end;
    if not (#v42 >= 10000 and v41 > 1) or not v41 then
        return v42;
    else
        return v39(v40, (math.floor(v41 / 2)));
    end;
end;
local function v45(v43)
    return v43:gsub("%s+$", function(v44)
        return l_inverse_0(v44);
    end);
end;
v31 = function(v46)
    return v46:gsub("%s+$", function(v47)
        return string.rep(v29, #v47);
    end);
end;
local function v49(v48)
    return l_red_0(v31(v39(v48)));
end;
local function v51(v50)
    return l_green_0(v31(v39(v50)));
end;
local function v57(v52, v53, v54)
    local v55 = l_getType_0(v53);
    local _ = nil;
    return if v55 ~= "nil" then string.format("%s has type:  %s\n", v52, v55) else "" .. string.format("%s has value: %s", v52, v54(v53));
end;
local function v62(v58, v59, v60)
    if typeof(v58) ~= "nil" then
        local l_v59_0 = v59;
        if not v60 then
            l_v59_0 = "[.never]" .. l_v59_0;
        end;
        error(l_Error_0(v37(v38(l_v59_0, nil, "", v60), "this matcher must not have an expected argument", (v57("Expected", v58, v51)))));
    end;
end;
local function v67(v63, v64, v65)
    if typeof(v63) ~= "number" then
        local l_v64_0 = v64;
        if not v65 then
            l_v64_0 = "[.never]" .. l_v64_0;
        end;
        error(l_Error_0(v37(v38(l_v64_0, nil, nil, v65), l_red_0("received") .. " value must be a number", (v57("Received", v63, v49)))));
    end;
end;
local function v72(v68, v69, v70)
    if typeof(v68) ~= "number" then
        local l_v69_0 = v69;
        if not v70 then
            l_v69_0 = "[.never]" .. l_v69_0;
        end;
        error(l_Error_0(v37(v38(l_v69_0, nil, nil, v70), l_green_0("expected") .. " value must be a number", (v57("Expected", v68, v51)))));
    end;
end;
local function v77(v73, v74, v75, v76)
    v67(v73, v75, v76);
    v72(v74, v75, v76);
end;
local function v82(v78, v79, v80)
    if (not (typeof(v78) == "number") or not l_Number_0.isSafeInteger(v78)) or v78 < 0 then
        local l_v79_0 = v79;
        if not v80 then
            l_v79_0 = "[.never]" .. l_v79_0;
        end;
        error(l_Error_0(v37(v38(l_v79_0, nil, nil, v80), l_green_0("expected") .. " value must be a non-negative integer", (v57("Expected", v78, v51)))));
    end;
end;
v32 = function(v83, v84, v85)
    return l_Array_0.reduce(v83, function(v86, v87)
        if v87[1] == l_DIFF_EQUAL_0 then
            return v86 .. v87[2];
        elseif v87[1] ~= v84 then
            return v86;
        elseif not v85 then
            return v86 .. v87[2];
        else
            return v86 .. l_inverse_0(v87[2]);
        end;
    end, "");
end;
v33 = function(v88, v89)
    local v90 = l_getType_0(v88);
    local v91 = l_getType_0(v89);
    if v90 ~= v91 then
        return false;
    elseif not l_isPrimitive_0(v88) then
        if not (v90 ~= "DateTime") or v90 == "function" then
            return false;
        elseif v90 == "table" and typeof(v88.asymmetricMatch) == "function" then
            return false;
        elseif v91 == "table" and typeof(v89.asymmetricMatch) == "function" then
            return false;
        else
            return true;
        end;
    else
        local v92 = false;
        if typeof(v88) == "string" then
            v92 = false;
            if typeof(v89) == "string" then
                v92 = false;
                if #v88 ~= 0 then
                    v92 = false;
                    if #v89 ~= 0 then
                        v92 = not not (string.find(v88, "\n") or string.find(v89, "\n"));
                    end;
                end;
            end;
        end;
        return v92;
    end;
end;
printDiffOrStringify = function(v93, v94, v95, v96, v97)
    if (((((typeof(v93) == "string" and typeof(v94) == "string") and #v93 ~= 0) and #v94 ~= 0) and #v93 <= 20000) and #v94 <= 20000) and v93 ~= v94 then
        if not string.find(v93, "\n") and not string.find(v94, "\n") then
            local v98 = l_diffStringsRaw_0(v93, v94, true);
            local v100 = l_Array_0.some(v98, function(v99)
                return v99[1] == l_DIFF_EQUAL_0;
            end);
            local v101 = getLabelPrinter(v95, v96);
            return v101(v95) .. l_green_0(v31(v39((v32(v98, l_DIFF_DELETE_0, v100))))) .. "\n" .. v101(v96) .. l_red_0(v31(v39((v32(v98, l_DIFF_INSERT_0, v100)))));
        else
            return l_diffStringsUnified_0(v93, v94, {
                aAnnotation = v95, 
                bAnnotation = v96, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v97, 
                includeChangeCounts = true
            });
        end;
    else
        if v33(v93, v94) then
            local v102 = v35(v21(v93), v21(v94), {}, {});
            local v103 = l_diff_0(v102.replacedExpected, v102.replacedReceived, {
                aAnnotation = v95, 
                bAnnotation = v96, 
                expand = v97, 
                includeChangeCounts = true
            });
            if not ((not (typeof(v103) == "string") or not string.find(v103, "%- " .. v95)) or not string.find(v103, "%+ " .. v96)) then
                return v103;
            end;
        end;
        local v104 = getLabelPrinter(v95, v96);
        local v105 = v104(v95) .. l_green_0(v31(v39(v93)));
        local _ = nil;
        return v105 .. "\n" .. if v39(v93) == v39(v94) then v104(v96) .. "serializes to the same string" else v104(v96) .. l_red_0(v31(v39(v94)));
    end;
end;
v34 = function(v107, v108)
    if typeof(v107) == "number" and typeof(v108) == "number" then
        return false;
    elseif typeof(v107) == "boolean" and typeof(v108) == "boolean" then
        return false;
    else
        return true;
    end;
end;
v35 = function(v109, v110, v111, v112)
    if v20.isReplaceable(v109, v110) then
        if not (l_Array_0.indexOf(v111, v109) == -1) or l_Array_0.indexOf(v112, v110) ~= -1 then
            return {
                replacedExpected = v109, 
                replacedReceived = v110
            };
        else
            table.insert(v111, v109);
            table.insert(v112, v110);
            local v113 = v20.new(v109);
            local v114 = v20.new(v110);
            v113:forEach(function(v115, v116)
                local v117 = v114:get(v116);
                if not v36(v115) then
                    if not v36(v117) then
                        if v20.isReplaceable(v115, v117) then
                            local v118 = v35(v115, v117, v111, v112);
                            v113:set(v116, v118.replacedExpected);
                            v114:set(v116, v118.replacedReceived);
                        end;
                    elseif v117:asymmetricMatch(v115) then
                        v113:set(v116, v117);
                        return ;
                    end;
                elseif v115:asymmetricMatch(v117) then
                    v114:set(v116, v115);
                    return ;
                end;
            end);
            return {
                replacedExpected = v113.object, 
                replacedReceived = v114.object
            };
        end;
    else
        return {
            replacedExpected = v109, 
            replacedReceived = v110
        };
    end;
end;
v36 = function(v119)
    local v120 = l_getType_0(v119);
    local v121 = false;
    if v120 == "table" then
        v121 = typeof(v119.asymmetricMatch) == "function";
    end;
    return v121;
end;
local function v125(v122, v123, v124)
    return not not v34(v122, v123) and l_diff_0(v122, v123, v124) or nil;
end;
pluralize = function(v126, v127)
    if v127 == 1 then
        return (v30[v127 + 1] or v127) .. " " .. v126;
    else
        return (v30[v127 + 1] or v127) .. " " .. v126 .. "s";
    end;
end;
getLabelPrinter = function(...)
    local v130 = l_Array_0.reduce({
        ...
    }, function(v128, v129)
        return (math.max(#v129, v128));
    end, 0);
    return function(v131)
        if v130 < #v131 then
            error("Cannot print label for string with length larger than the max allowed of " .. v130);
        end;
        return string.format("%s: %s", v131, string.rep(" ", v130 - #v131));
    end;
end;
v37 = function(v132, v133, v134)
    if typeof(v134) == "string" then
        return string.format("%s\n\n%s: %s%s", v132, l_bold_0("Matcher error"), v133, "\n\n" .. v134);
    else
        return string.format("%s\n\n%s: %s%s", v132, l_bold_0("Matcher error"), v133, "");
    end;
end;
v38 = function(v135, v136, v137, v138)
    v136 = v136 or "received";
    v137 = v137 or "expected";
    v138 = v138 or {};
    local v139 = nil;
    local v140 = nil;
    local v141 = nil;
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    local v145 = nil;
    local v146 = nil;
    if v138 then
        v139 = v138.comment or "";
        v140 = v138.expectedColor or l_green_0;
        v141 = v138.isDirectExpectCall or false;
        v142 = v138.isNot or false;
        v143 = v138.promise or "";
        v144 = v138.receivedColor or l_red_0;
        v145 = v138.secondArgument or "";
        v146 = v138.secondArgumentColor or l_green_0;
    end;
    local v147 = "";
    local v148 = "expect";
    if not v141 and v136 ~= "" then
        v147 = v147 .. l_dim_0(v148 .. "(") .. v144(v136);
        v148 = ")";
    end;
    if v143 ~= "" then
        v147 = v147 .. l_dim_0(v148 .. ".") .. v143;
        v148 = "";
    end;
    if v142 then
        v147 = v147 .. l_dim_0(v148 .. ".") .. "never";
        v148 = "";
    end;
    if not string.find(v135, "%.") then
        v147 = v147 .. l_dim_0(v148 .. ".") .. v135;
        v148 = "";
    else
        v148 = v148 .. v135;
    end;
    if v137 == "" then
        v148 = v148 .. "()";
    else
        v147 = v147 .. l_dim_0(v148 .. "(") .. v140(v137);
        if v145 ~= "" then
            v147 = v147 .. l_dim_0(", ") .. v146(v145);
        end;
        v148 = ")";
    end;
    if v139 ~= "" then
        v148 = v148 .. " -- " .. v139;
    end;
    if v148 ~= "" then
        v147 = v147 .. l_dim_0(v148);
    end;
    return v147;
end;
return {
    EXPECTED_COLOR = l_green_0, 
    RECEIVED_COLOR = l_red_0, 
    INVERTED_COLOR = l_inverse_0, 
    BOLD_WEIGHT = l_bold_0, 
    DIM_COLOR = l_dim_0, 
    SUGGEST_TO_CONTAIN_EQUAL = "Looks like you wanted to test for object/array equality with the stricter `toContain` matcher. You probably need to use `toContainEqual` instead.", 
    stringify = v39, 
    highlightTrailingWhitespace = v45, 
    printReceived = v49, 
    printExpected = v51, 
    printWithType = v57, 
    ensureNoExpected = v62, 
    ensureActualIsNumber = v67, 
    ensureExpectedIsNumber = v72, 
    ensureNumbers = v77, 
    ensureExpectedIsNonNegativeInteger = v82, 
    printDiffOrStringify = printDiffOrStringify, 
    diff = v125, 
    pluralize = pluralize, 
    getLabelPrinter = getLabelPrinter, 
    matcherErrorMessage = v37, 
    matcherHint = v38
};
