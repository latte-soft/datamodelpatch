local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Collections);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.Boolean);
local v6 = require(l_Parent_1.String);
local _ = require(l_Parent_1.ES7Types);
local l_inspect_0 = v2.inspect;
local v9 = require(l_Parent_0.Error);
local v10 = require(l_Parent_1.InstanceOf);
local v11 = {
    stderr = {
        isTTY = false, 
        columns = 0, 
        hasColors = function(...)
            return true;
        end
    }
};
ErrorCaptureStackTrace = function(v12, ...)
    v9.captureStackTrace(v12, ...);
end;
local function _(v13)
    return v13;
end;
local v15 = "";
local v16 = "";
local v17 = "";
local v18 = "";
local v19 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:", 
    strictEqual = "Expected values to be strictly equal:", 
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":", 
    deepEqual = "Expected values to be loosely deep-equal:", 
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:", 
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:", 
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":", 
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:", 
    notIdentical = "Values have same structure but are not reference-equal:", 
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:"
};
local _ = function(v20)
    local v21 = l_Object_0.keys(v20);
    local v22 = {};
    for _, v24 in v21, nil, nil do
        v22[v24] = v20[v24];
    end;
    v22.message = v20.message;
    return v22;
end;
local function _(v26)
    return l_inspect_0(v26, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = math.huge, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
end;
local function v59(v28, v29, v30)
    local v31 = "";
    local v32 = "";
    local v33 = "";
    local v34 = false;
    local v35 = l_inspect_0(v28, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = math.huge, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
    local v36 = v6.split(v35, "\n");
    local v37 = v6.split(l_inspect_0(v29, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = math.huge, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    }), "\n");
    local v38 = 0;
    local v39 = "";
    if v30 == "strictEqual" and (not (not ((typeof(v28) == "table" and v28 ~= nil) and typeof(v29) == "table") or v29 == nil) or typeof(v28) == "function" and typeof(v29) == "function") then
        v30 = "strictEqualObject";
    end;
    if (#v36 == 1 and #v37 == 1) and v36[1] ~= v37[1] then
        local v40 = v36[1];
        local v41 = if not v5.toJSBoolean(false) then v37[1] else v37[1];
        local v42 = string.len(v40) + string.len(v41);
        if v42 <= 12 then
            if ((not (typeof(v28) == "table") or v28 == nil) and (not (typeof(v29) == "table") or v29 == nil)) and (not (v28 == 0) or v29 ~= 0) then
                return ("%s\n\n"):format(v19[v30]) .. ("%s format(v36[1], v37[1]);
            end;
        elseif v30 ~= "strictEqualObject" and v42 < (not v11.stderr.isTTY and 80 or v11.stderr.columns) then
            while string.sub(v40, v38 + 1, v38 + 1) == string.sub(v41, v38 + 1, v38 + 1) do
                v38 = v38 + 1;
            end;
            if v38 > 2 then
                v39 = ("\n  %s^"):format(string.rep(" ", v38));
                v38 = 0;
            end;
        end;
    end;
    local v43 = v36[#v36];
    local v44 = v37[#v37];
    while v43 == v44 do
        local l_v38_0 = v38;
        v38 = v38 + 1;
        if l_v38_0 < 3 then
            v33 = ("\n  %s%s"):format(v43, v33);
        else
            v31 = v43;
        end;
        table.remove(v36);
        table.remove(v37);
        if #v36 ~= 0 and #v37 ~= 0 then
            v43 = v36[#v36];
            v44 = v37[#v37];
        else
            break;
        end;
    end;
    local v46 = math.max(#v36, #v37);
    if v46 == 0 then
        local v47 = v6.split(v35, "\n");
        if #v47 > 50 then
            v47[47] = ("%s...%s"):format(v15, v18);
            while #v47 > 47 do
                table.remove(v47);
            end;
        end;
        return ("%s\n\n"):format(v19.notIdentical) .. ("%s\n"):format(l_Array_0.join(v47, "\n"));
    else
        if v38 >= 5 then
            v33 = ("\n%s...%s%s"):format(v15, v18, v33);
            v34 = true;
        end;
        if v31 ~= "" then
            v33 = ("\n  %s%s"):format(v31, v33);
            v31 = "";
        end;
        local v48 = 0;
        local v49 = 0;
        local v50 = v19[v30] .. ("\n%s+ actual%s %s- expected%s"):format(v16, v18, v17, v18);
        local v51 = (" %s...%s Lines skipped"):format(v15, v18);
        local l_v36_0 = v36;
        local v53 = ("%s+%s"):format(v16, v18);
        local v54 = #v37;
        if #v36 < v46 then
            l_v36_0 = v37;
            v53 = ("%s-%s"):format(v17, v18);
            v54 = #v36;
        end;
        for v55 = 1, v46 do
            v38 = v55;
            if v54 < v55 then
                if v49 > 2 then
                    if v49 > 3 then
                        if v49 > 4 then
                            if v49 == 5 then
                                v32 = v32 .. ("\n  %s"):format(l_v36_0[v55 - 3]);
                                v48 = v48 + 1;
                            else
                                v32 = v32 .. ("\n%s...%s"):format(v15, v18);
                                v34 = true;
                            end;
                        end;
                        v32 = v32 .. ("\n  %s"):format(l_v36_0[v55 - 2]);
                        v48 = v48 + 1;
                    end;
                    v32 = v32 .. ("\n  %s"):format(l_v36_0[v55 - 1]);
                    v48 = v48 + 1;
                end;
                v49 = 0;
                if l_v36_0 == v36 then
                    v32 = v32 .. ("\n%s %s"):format(v53, l_v36_0[v55]);
                else
                    v31 = v31 .. ("\n%s %s"):format(v53, l_v36_0[v55]);
                end;
                v48 = v48 + 1;
            else
                local v56 = v37[v55];
                local v57 = v36[v55];
                local v58 = false;
                if v57 ~= v56 then
                    v58 = not v5.toJSBoolean(v6.endsWith(v57, ",")) or v6.slice(v57, 0, -1) ~= v56;
                end;
                if not (not v58 or not v6.endsWith(v56, ",")) and v6.slice(v56, 0, -1) == v57 then
                    v58 = false;
                    v57 = v57 .. ",";
                end;
                if not v58 then
                    v32 = v32 .. v31;
                    v31 = "";
                    v49 = v49 + 1;
                    if v49 <= 2 then
                        v32 = v32 .. ("\n  %s"):format(v57);
                        v48 = v48 + 1;
                    end;
                else
                    if v49 > 2 then
                        if v49 > 3 then
                            if v49 > 4 then
                                if v49 == 5 then
                                    v32 = v32 .. ("\n  %s"):format(v36[v55 - 3]);
                                    v48 = v48 + 1;
                                else
                                    v32 = v32 .. ("\n%s...%s"):format(v15, v18);
                                    v34 = true;
                                end;
                            end;
                            v32 = v32 .. ("\n  %s"):format(v36[v55 - 2]);
                            v48 = v48 + 1;
                        end;
                        v32 = v32 .. ("\n  %s"):format(v36[v55 - 1]);
                        v48 = v48 + 1;
                    end;
                    v49 = 0;
                    v32 = v32 .. ("\n%s+%s %s"):format(v16, v18, v57);
                    v31 = v31 .. ("\n%s-%s %s"):format(v17, v18, v56);
                    v48 = v48 + 2;
                end;
            end;
            if v48 > 50 and v55 < v46 - 2 then
                return ("%s%s\n%s\n%s...%s%s\n"):format(v50, v51, v32, v15, v18, v31) .. ("%s...%s"):format(v15, v18);
            end;
        end;
        return ("%s%s\n%s%s%s%s"):format(v50, not v34 and "" or v51, v32, v31, v33, v39);
    end;
end;
local v60 = setmetatable({}, {
    __index = v9
});
v60.__index = v60;
v60.__tostring = function(v61)
    return v61:toString();
end;
v60.new = function(v62)
    local v63 = nil;
    local l_message_0 = v62.message;
    local l_operator_0 = v62.operator;
    local l_stackStartFn_0 = v62.stackStartFn;
    local l_actual_0 = v62.actual;
    local l_expected_0 = v62.expected;
    if l_message_0 ~= nil then
        v63 = setmetatable(v9.new((tostring(l_message_0))), v60);
    else
        if v11.stderr.isTTY then
            if not v11.stderr:hasColors() then
                v15 = "";
                v16 = "";
                v18 = "";
                v17 = "";
            else
                v15 = "\027[34m";
                v16 = "\027[32m";
                v18 = "\027[39m";
                v17 = "\027[31m";
            end;
        end;
        if not (not (not (not ((((typeof(l_actual_0) == "table" and l_actual_0 ~= nil) and typeof(l_expected_0) == "table") and l_expected_0 ~= nil) and l_Array_0.indexOf(l_Object_0.keys(l_actual_0), "stack") ~= -1) or not v10(l_actual_0, v9)) and l_Array_0.indexOf(l_Object_0.keys(l_expected_0), "stack") ~= -1) or not v10(l_expected_0, v9)) then
            local l_l_actual_0_0 = l_actual_0;
            local v70 = l_Object_0.keys(l_l_actual_0_0);
            local v71 = {};
            for _, v73 in v70, nil, nil do
                v71[v73] = l_l_actual_0_0[v73];
            end;
            v71.message = l_l_actual_0_0.message;
            l_actual_0 = v71;
            l_l_actual_0_0 = l_expected_0;
            v70 = l_Object_0.keys(l_l_actual_0_0);
            v71 = {};
            for _, v75 in v70, nil, nil do
                v71[v75] = l_l_actual_0_0[v75];
            end;
            v71.message = l_l_actual_0_0.message;
            l_expected_0 = v71;
        end;
        if not (l_operator_0 ~= "deepStrictEqual") or l_operator_0 == "strictEqual" then
            v63 = setmetatable(v9.new(v59(l_actual_0, l_expected_0, l_operator_0)), v60);
        elseif not (l_operator_0 ~= "notDeepStrictEqual") or l_operator_0 == "notStrictEqual" then
            local v76 = v19[l_operator_0];
            local v77 = v6.split(l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = math.huge, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            }), "\n");
            if l_operator_0 == "notStrictEqual" and (not (not (typeof(l_actual_0) == "table") or l_actual_0 == nil) or typeof(l_actual_0) == "function") then
                v76 = v19.notStrictEqualObject;
            end;
            if #v77 > 50 then
                v77[47] = ("%s...%s"):format(v15, v18);
                while #v77 > 47 do
                    table.remove(v77);
                end;
            end;
            v63 = if #v77 == 1 then setmetatable(v9.new(("%s%s%s"):format(v76, string.len(v77[1]) > 5 and "\n\n" or " ", v77[1])), v60) else setmetatable(v9.new(("%s\n\n%s\n"):format(v76, l_Array_0.join(v77, "\n"))), v60);
        else
            local v78 = l_inspect_0(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = math.huge, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v79 = l_inspect_0(l_expected_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = math.huge, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v80 = v19[tostring(l_operator_0)];
            if l_operator_0 == "notDeepEqual" and v78 == v79 then
                v78 = ("%s\n\n%s"):format(v80, v78);
                if string.len(v78) > 1024 then
                    v78 = ("%s..."):format(v6.slice(v78, 0, 1021));
                end;
                v63 = setmetatable(v9.new(v78), v60);
            else
                if string.len(v78) > 512 then
                    v78 = ("%s..."):format(v6.slice(v78, 0, 509));
                end;
                if string.len(v79) > 512 then
                    v79 = ("%s..."):format(v6.slice(v79, 0, 509));
                end;
                if l_operator_0 == "deepEqual" then
                    v78 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v80, v78);
                else
                    local v81 = v19[("%sUnequal"):format((tostring(l_operator_0)))];
                    if not v5.toJSBoolean(v81) then
                        v79 = (" %s %s"):format(tostring(l_operator_0), v79);
                    else
                        v78 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v81, v78);
                    end;
                end;
                v63 = setmetatable(v9.new(("%s%s"):format(v78, v79)), v60);
            end;
        end;
    end;
    v63.generatedMessage = not v5.toJSBoolean(l_message_0);
    v63.name = "AssertionError [ERR_ASSERTION]";
    v63.code = "ERR_ASSERTION";
    v63.actual = l_actual_0;
    v63.expected = l_expected_0;
    v63.operator = l_operator_0;
    ErrorCaptureStackTrace(v63, l_stackStartFn_0 or v60.new);
    v63.name = "AssertionError";
    return v63;
end;
v60.toString = function(v82)
    return ("%s [%s]: %s"):format(v82.name, v82.code, v82.message);
end;
v60.name = "AssertionError";
return {
    AssertionError = v60
};
