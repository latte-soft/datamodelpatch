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
local function v39(v40, v41, v42)
    if v40 == l_Symbol_0.for_("$$nil") then
        v40 = nil;
    end;
    local v43 = if v41 ~= nil then v41 else 10;
    local v44 = if v42 ~= nil then v42 else 10;
    local v45 = nil;
    if not pcall(function()
        v45 = l_format_0(v40, {
            maxDepth = v43, 
            maxWidth = v44, 
            min = true, 
            plugins = v23
        });
    end) then
        v45 = l_format_0(v40, {
            callToJSON = false, 
            maxDepth = v43, 
            maxWidth = v44, 
            min = true, 
            plugins = v23
        });
    end;
    if #v45 >= 10000 and v43 > 1 then
        return v39(v40, math.floor(v43 / 2), v44);
    elseif #v45 >= 10000 and v44 > 1 then
        return v39(v40, v43, (math.floor(v44 / 2)));
    else
        return v45;
    end;
end;
local function v48(v46)
    return v46:gsub("%s+$", function(v47)
        return l_inverse_0(v47);
    end);
end;
v31 = function(v49)
    return v49:gsub("%s+$", function(v50)
        return string.rep(v29, #v50);
    end);
end;
local function v52(v51)
    return l_red_0(v31(v39(v51)));
end;
local function v54(v53)
    return l_green_0(v31(v39(v53)));
end;
local function v60(v55, v56, v57)
    local v58 = l_getType_0(v56);
    local _ = nil;
    return if v58 ~= "nil" then string.format("%s has type:  %s\n", v55, v58) else "" .. string.format("%s has value: %s", v55, v57(v56));
end;
local function v65(v61, v62, v63)
    if typeof(v61) ~= "nil" then
        local l_v62_0 = v62;
        if not v63 then
            l_v62_0 = "[.never]" .. l_v62_0;
        end;
        error(l_Error_0(v37(v38(l_v62_0, nil, "", v63), "this matcher must not have an expected argument", (v60("Expected", v61, v54)))));
    end;
end;
local function v70(v66, v67, v68)
    if typeof(v66) ~= "number" then
        local l_v67_0 = v67;
        if not v68 then
            l_v67_0 = "[.never]" .. l_v67_0;
        end;
        error(l_Error_0(v37(v38(l_v67_0, nil, nil, v68), l_red_0("received") .. " value must be a number", (v60("Received", v66, v52)))));
    end;
end;
local function v75(v71, v72, v73)
    if typeof(v71) ~= "number" then
        local l_v72_0 = v72;
        if not v73 then
            l_v72_0 = "[.never]" .. l_v72_0;
        end;
        error(l_Error_0(v37(v38(l_v72_0, nil, nil, v73), l_green_0("expected") .. " value must be a number", (v60("Expected", v71, v54)))));
    end;
end;
local function v80(v76, v77, v78, v79)
    v70(v76, v78, v79);
    v75(v77, v78, v79);
end;
local function v85(v81, v82, v83)
    if (not (typeof(v81) == "number") or not l_Number_0.isSafeInteger(v81)) or v81 < 0 then
        local l_v82_0 = v82;
        if not v83 then
            l_v82_0 = "[.never]" .. l_v82_0;
        end;
        error(l_Error_0(v37(v38(l_v82_0, nil, nil, v83), l_green_0("expected") .. " value must be a non-negative integer", (v60("Expected", v81, v54)))));
    end;
end;
v32 = function(v86, v87, v88)
    return l_Array_0.reduce(v86, function(v89, v90)
        if v90[1] == l_DIFF_EQUAL_0 then
            return v89 .. v90[2];
        elseif v90[1] ~= v87 then
            return v89;
        elseif not v88 then
            return v89 .. v90[2];
        else
            return v89 .. l_inverse_0(v90[2]);
        end;
    end, "");
end;
v33 = function(v91, v92)
    local v93 = l_getType_0(v91);
    local v94 = l_getType_0(v92);
    if v93 ~= v94 then
        return false;
    elseif not l_isPrimitive_0(v91) then
        if not (v93 ~= "DateTime") or v93 == "function" then
            return false;
        elseif v93 == "table" and typeof(v91.asymmetricMatch) == "function" then
            return false;
        elseif v94 == "table" and typeof(v92.asymmetricMatch) == "function" then
            return false;
        else
            return true;
        end;
    else
        local v95 = false;
        if typeof(v91) == "string" then
            v95 = false;
            if typeof(v92) == "string" then
                v95 = false;
                if #v91 ~= 0 then
                    v95 = false;
                    if #v92 ~= 0 then
                        v95 = not not (string.find(v91, "\n") or string.find(v92, "\n"));
                    end;
                end;
            end;
        end;
        return v95;
    end;
end;
printDiffOrStringify = function(v96, v97, v98, v99, v100)
    if (((((typeof(v96) == "string" and typeof(v97) == "string") and #v96 ~= 0) and #v97 ~= 0) and #v96 <= 20000) and #v97 <= 20000) and v96 ~= v97 then
        if not string.find(v96, "\n") and not string.find(v97, "\n") then
            local v101 = l_diffStringsRaw_0(v96, v97, true);
            local v103 = l_Array_0.some(v101, function(v102)
                return v102[1] == l_DIFF_EQUAL_0;
            end);
            local v104 = getLabelPrinter(v98, v99);
            return v104(v98) .. l_green_0(v31(v39((v32(v101, l_DIFF_DELETE_0, v103))))) .. "\n" .. v104(v99) .. l_red_0(v31(v39((v32(v101, l_DIFF_INSERT_0, v103)))));
        else
            return l_diffStringsUnified_0(v96, v97, {
                aAnnotation = v98, 
                bAnnotation = v99, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v100, 
                includeChangeCounts = true
            });
        end;
    else
        if v33(v96, v97) then
            local v105 = v35(v21(v96), v21(v97), {}, {});
            local v106 = l_diff_0(v105.replacedExpected, v105.replacedReceived, {
                aAnnotation = v98, 
                bAnnotation = v99, 
                expand = v100, 
                includeChangeCounts = true
            });
            if not ((not (typeof(v106) == "string") or not string.find(v106, "%- " .. v98)) or not string.find(v106, "%+ " .. v99)) then
                return v106;
            end;
        end;
        local v107 = getLabelPrinter(v98, v99);
        local v108 = v107(v98) .. l_green_0(v31(v39(v96)));
        local _ = nil;
        return v108 .. "\n" .. if v39(v96) == v39(v97) then v107(v99) .. "serializes to the same string" else v107(v99) .. l_red_0(v31(v39(v97)));
    end;
end;
v34 = function(v110, v111)
    if typeof(v110) == "number" and typeof(v111) == "number" then
        return false;
    elseif typeof(v110) == "boolean" and typeof(v111) == "boolean" then
        return false;
    else
        return true;
    end;
end;
v35 = function(v112, v113, v114, v115)
    if v20.isReplaceable(v112, v113) then
        if not (l_Array_0.indexOf(v114, v112) == -1) or l_Array_0.indexOf(v115, v113) ~= -1 then
            return {
                replacedExpected = v112, 
                replacedReceived = v113
            };
        else
            table.insert(v114, v112);
            table.insert(v115, v113);
            local v116 = v20.new(v112);
            local v117 = v20.new(v113);
            v116:forEach(function(v118, v119)
                local v120 = v117:get(v119);
                if not v36(v118) then
                    if not v36(v120) then
                        if v20.isReplaceable(v118, v120) then
                            local v121 = v35(v118, v120, v114, v115);
                            v116:set(v119, v121.replacedExpected);
                            v117:set(v119, v121.replacedReceived);
                        end;
                    elseif v120:asymmetricMatch(v118) then
                        v116:set(v119, v120);
                        return ;
                    end;
                elseif v118:asymmetricMatch(v120) then
                    v117:set(v119, v118);
                    return ;
                end;
            end);
            return {
                replacedExpected = v116.object, 
                replacedReceived = v117.object
            };
        end;
    else
        return {
            replacedExpected = v112, 
            replacedReceived = v113
        };
    end;
end;
v36 = function(v122)
    local v123 = l_getType_0(v122);
    local v124 = false;
    if v123 == "table" then
        v124 = typeof(v122.asymmetricMatch) == "function";
    end;
    return v124;
end;
local function v128(v125, v126, v127)
    return not not v34(v125, v126) and l_diff_0(v125, v126, v127) or nil;
end;
pluralize = function(v129, v130)
    if v130 == 1 then
        return (v30[v130 + 1] or v130) .. " " .. v129;
    else
        return (v30[v130 + 1] or v130) .. " " .. v129 .. "s";
    end;
end;
getLabelPrinter = function(...)
    local v133 = l_Array_0.reduce({
        ...
    }, function(v131, v132)
        return (math.max(#v132, v131));
    end, 0);
    return function(v134)
        if v133 < #v134 then
            error("Cannot print label for string with length larger than the max allowed of " .. v133);
        end;
        return string.format("%s: %s", v134, string.rep(" ", v133 - #v134));
    end;
end;
v37 = function(v135, v136, v137)
    if typeof(v137) == "string" then
        return string.format("%s\n\n%s: %s%s", v135, l_bold_0("Matcher error"), v136, "\n\n" .. v137);
    else
        return string.format("%s\n\n%s: %s%s", v135, l_bold_0("Matcher error"), v136, "");
    end;
end;
v38 = function(v138, v139, v140, v141)
    v139 = v139 or "received";
    v140 = v140 or "expected";
    v141 = v141 or {};
    local v142 = nil;
    local v143 = nil;
    local v144 = nil;
    local v145 = nil;
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    local v149 = nil;
    if v141 then
        v142 = v141.comment or "";
        v143 = v141.expectedColor or l_green_0;
        v144 = v141.isDirectExpectCall or false;
        v145 = v141.isNot or false;
        v146 = v141.promise or "";
        v147 = v141.receivedColor or l_red_0;
        v148 = v141.secondArgument or "";
        v149 = v141.secondArgumentColor or l_green_0;
    end;
    local v150 = "";
    local v151 = "expect";
    if not v144 and v139 ~= "" then
        v150 = v150 .. l_dim_0(v151 .. "(") .. v147(v139);
        v151 = ")";
    end;
    if v146 ~= "" then
        v150 = v150 .. l_dim_0(v151 .. ".") .. v146;
        v151 = "";
    end;
    if v145 then
        v150 = v150 .. l_dim_0(v151 .. ".") .. "never";
        v151 = "";
    end;
    if not string.find(v138, "%.") then
        v150 = v150 .. l_dim_0(v151 .. ".") .. v138;
        v151 = "";
    else
        v151 = v151 .. v138;
    end;
    if v140 == "" then
        v151 = v151 .. "()";
    else
        v150 = v150 .. l_dim_0(v151 .. "(") .. v143(v140);
        if v148 ~= "" then
            v150 = v150 .. l_dim_0(", ") .. v149(v148);
        end;
        v151 = ")";
    end;
    if v142 ~= "" then
        v151 = v151 .. " -- " .. v142;
    end;
    if v151 ~= "" then
        v150 = v150 .. l_dim_0(v151);
    end;
    return v150;
end;
return {
    EXPECTED_COLOR = l_green_0, 
    RECEIVED_COLOR = l_red_0, 
    INVERTED_COLOR = l_inverse_0, 
    BOLD_WEIGHT = l_bold_0, 
    DIM_COLOR = l_dim_0, 
    SUGGEST_TO_CONTAIN_EQUAL = "Looks like you wanted to test for object/array equality with the stricter `toContain` matcher. You probably need to use `toContainEqual` instead.", 
    stringify = v39, 
    highlightTrailingWhitespace = v48, 
    printReceived = v52, 
    printExpected = v54, 
    printWithType = v60, 
    ensureNoExpected = v65, 
    ensureActualIsNumber = v70, 
    ensureExpectedIsNumber = v75, 
    ensureNumbers = v80, 
    ensureExpectedIsNonNegativeInteger = v85, 
    printDiffOrStringify = printDiffOrStringify, 
    diff = v128, 
    pluralize = pluralize, 
    getLabelPrinter = getLabelPrinter, 
    matcherErrorMessage = v37, 
    matcherHint = v38
};
