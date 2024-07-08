local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.Boolean);
local v3 = require(l_Parent_0.Object);
local v4 = require(l_Parent_0.String);
local v5 = require(l_Parent_0.Error);
local v6 = require(l_Parent_0.instanceof);
local v7 = require(l_Parent_0.util.inspect);
local v8 = {
    stderr = {
        isTTY = false, 
        columns = 0, 
        hasColors = function(...)
            return true;
        end
    }
};
ErrorCaptureStackTrace = function(...)
end;
local function _(v9)
    return v9;
end;
local v11 = "";
local v12 = "";
local v13 = "";
local v14 = "";
local v15 = {
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
local function v21(v16)
    local v17 = v3.keys(v16);
    local v18 = {};
    for _, v20 in ipairs(v17) do
        v18[v20] = v16[v20];
    end;
    v18.message = v16.message;
    return v18;
end;
local function _(v22)
    return v7(v22, {
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
local function v55(v24, v25, v26)
    local v27 = "";
    local v28 = "";
    local v29 = "";
    local v30 = false;
    local v31 = v7(v24, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = math.huge, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    });
    local v32 = v4.split(v31, "\n");
    local v33 = v4.split(v7(v25, {
        compact = false, 
        customInspect = false, 
        depth = 1000, 
        maxArrayLength = math.huge, 
        showHidden = false, 
        showProxy = false, 
        sorted = true, 
        getters = true
    }), "\n");
    local v34 = 0;
    local v35 = "";
    if v26 == "strictEqual" and (not (not ((typeof(v24) == "table" and v24 ~= nil) and typeof(v25) == "table") or v25 == nil) or typeof(v24) == "function" and typeof(v25) == "function") then
        v26 = "strictEqualObject";
    end;
    if (#v32 == 1 and #v33 == 1) and v32[1] ~= v33[1] then
        local v36 = v32[1];
        local v37 = if not v2.toJSBoolean(false) then v33[1] else v33[1];
        local v38 = string.len(v36) + string.len(v37);
        if v38 <= 12 then
            if ((not (typeof(v24) == "table") or v24 == nil) and (not (typeof(v25) == "table") or v25 == nil)) and (not (v24 == 0) or v25 ~= 0) then
                return ("%s\n\n"):format(v15[v26]) .. ("%s format(v32[1], v33[1]);
            end;
        elseif v26 ~= "strictEqualObject" and v38 < (not v8.stderr.isTTY and 80 or v8.stderr.columns) then
            while string.sub(v36, v34 + 1, v34 + 1) == string.sub(v37, v34 + 1, v34 + 1) do
                v34 = v34 + 1;
            end;
            if v34 > 2 then
                v35 = ("\n  %s^"):format(string.rep(" ", v34));
                v34 = 0;
            end;
        end;
    end;
    local v39 = v32[#v32];
    local v40 = v33[#v33];
    while v39 == v40 do
        local l_v34_0 = v34;
        v34 = v34 + 1;
        if l_v34_0 < 3 then
            v29 = ("\n  %s%s"):format(v39, v29);
        else
            v27 = v39;
        end;
        table.remove(v32);
        table.remove(v33);
        if #v32 ~= 0 and #v33 ~= 0 then
            v39 = v32[#v32];
            v40 = v33[#v33];
        else
            break;
        end;
    end;
    local v42 = math.max(#v32, #v33);
    if v42 == 0 then
        local v43 = v4.split(v31, "\n");
        if #v43 > 50 then
            v43[47] = ("%s...%s"):format(v11, v14);
            while #v43 > 47 do
                table.remove(v43);
            end;
        end;
        return ("%s\n\n"):format(v15.notIdentical) .. ("%s\n"):format(v1.join(v43, "\n"));
    else
        if v34 >= 5 then
            v29 = ("\n%s...%s%s"):format(v11, v14, v29);
            v30 = true;
        end;
        if v27 ~= "" then
            v29 = ("\n  %s%s"):format(v27, v29);
            v27 = "";
        end;
        local v44 = 0;
        local v45 = 0;
        local v46 = v15[v26] .. ("\n%s+ actual%s %s- expected%s"):format(v12, v14, v13, v14);
        local v47 = (" %s...%s Lines skipped"):format(v11, v14);
        local l_v32_0 = v32;
        local v49 = ("%s+%s"):format(v12, v14);
        local v50 = #v33;
        if #v32 < v42 then
            l_v32_0 = v33;
            v49 = ("%s-%s"):format(v13, v14);
            v50 = #v32;
        end;
        for v51 = 1, v42 do
            v34 = v51;
            if v50 < v51 then
                if v45 > 2 then
                    if v45 > 3 then
                        if v45 > 4 then
                            if v45 == 5 then
                                v28 = v28 .. ("\n  %s"):format(l_v32_0[v51 - 3]);
                                v44 = v44 + 1;
                            else
                                v28 = v28 .. ("\n%s...%s"):format(v11, v14);
                                v30 = true;
                            end;
                        end;
                        v28 = v28 .. ("\n  %s"):format(l_v32_0[v51 - 2]);
                        v44 = v44 + 1;
                    end;
                    v28 = v28 .. ("\n  %s"):format(l_v32_0[v51 - 1]);
                    v44 = v44 + 1;
                end;
                v45 = 0;
                if l_v32_0 == v32 then
                    v28 = v28 .. ("\n%s %s"):format(v49, l_v32_0[v51]);
                else
                    v27 = v27 .. ("\n%s %s"):format(v49, l_v32_0[v51]);
                end;
                v44 = v44 + 1;
            else
                local v52 = v33[v51];
                local v53 = v32[v51];
                local v54 = false;
                if v53 ~= v52 then
                    v54 = not v2.toJSBoolean(v4.endsWith(v53, ",")) or v4.slice(v53, 0, -1) ~= v52;
                end;
                if not (not v54 or not v4.endsWith(v52, ",")) and v4.slice(v52, 0, -1) == v53 then
                    v54 = false;
                    v53 = v53 .. ",";
                end;
                if not v54 then
                    v28 = v28 + v27;
                    v27 = "";
                    v45 = v45 + 1;
                    if v45 <= 2 then
                        v28 = v28 .. ("\n  %s"):format(v53);
                        v44 = v44 + 1;
                    end;
                else
                    if v45 > 2 then
                        if v45 > 3 then
                            if v45 > 4 then
                                if v45 == 5 then
                                    v28 = v28 .. ("\n  %s"):format(v32[v51 - 3]);
                                    v44 = v44 + 1;
                                else
                                    v28 = v28 .. ("\n%s...%s"):format(v11, v14);
                                    v30 = true;
                                end;
                            end;
                            v28 = v28 .. ("\n  %s"):format(v32[v51 - 2]);
                            v44 = v44 + 1;
                        end;
                        v28 = v28 .. ("\n  %s"):format(v32[v51 - 1]);
                        v44 = v44 + 1;
                    end;
                    v45 = 0;
                    v28 = v28 .. ("\n%s+%s %s"):format(v12, v14, v53);
                    v27 = v27 .. ("\n%s-%s %s"):format(v13, v14, v52);
                    v44 = v44 + 2;
                end;
            end;
            if v44 > 50 and v51 < v42 - 2 then
                return ("%s%s\n%s\n%s...%s%s\n"):format(v46, v47, v28, v11, v14, v27) .. ("%s...%s"):format(v11, v14);
            end;
        end;
        return ("%s%s\n%s%s%s%s"):format(v46, not v30 and "" or v47, v28, v27, v29, v35);
    end;
end;
local v56 = setmetatable({}, {
    __index = v5
});
v56.__index = v56;
v56.__tostring = function(v57)
    return v57:toString();
end;
v56.new = function(v58)
    local v59 = nil;
    local l_message_0 = v58.message;
    local l_operator_0 = v58.operator;
    local l_stackStartFn_0 = v58.stackStartFn;
    local l_details_0 = v58.details;
    local l_stackStartFunction_0 = v58.stackStartFunction;
    local l_actual_0 = v58.actual;
    local l_expected_0 = v58.expected;
    if l_message_0 ~= nil then
        v59 = setmetatable(v5.new((tostring(l_message_0))), v56);
    else
        if v8.stderr.isTTY then
            if not v8.stderr:hasColors() then
                v11 = "";
                v12 = "";
                v14 = "";
                v13 = "";
            else
                v11 = "\027[34m";
                v12 = "\027[32m";
                v14 = "\027[39m";
                v13 = "\027[31m";
            end;
        end;
        if not (not (not (not ((((typeof(l_actual_0) == "table" and l_actual_0 ~= nil) and typeof(l_expected_0) == "table") and l_expected_0 ~= nil) and v1.indexOf(v3.keys(l_actual_0), "stack") ~= -1) or not v6(l_actual_0, v5)) and v1.indexOf(v3.keys(l_expected_0), "stack") ~= -1) or not v6(l_expected_0, v5)) then
            l_actual_0 = v21(l_actual_0);
            l_expected_0 = v21(l_expected_0);
        end;
        if not (l_operator_0 ~= "deepStrictEqual") or l_operator_0 == "strictEqual" then
            v59 = setmetatable(v5.new(v55(l_actual_0, l_expected_0, l_operator_0)), v56);
        elseif not (l_operator_0 ~= "notDeepStrictEqual") or l_operator_0 == "notStrictEqual" then
            local v67 = v15[l_operator_0];
            local v68 = v4.split(v7(l_actual_0, {
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
                v67 = v15.notStrictEqualObject;
            end;
            if #v68 > 50 then
                v68[47] = ("%s...%s"):format(v11, v14);
                while #v68 > 47 do
                    table.remove(v68);
                end;
            end;
            v59 = if #v68 == 1 then setmetatable(v5.new(("%s%s%s"):format(v67, string.len(v68[1]) > 5 and "\n\n" or " ", v68[1])), v56) else setmetatable(v5.new(("%s\n\n%s\n"):format(v67, v1.join(v68, "\n"))), v56);
        else
            local v69 = v7(l_actual_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = math.huge, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v70 = v7(l_expected_0, {
                compact = false, 
                customInspect = false, 
                depth = 1000, 
                maxArrayLength = math.huge, 
                showHidden = false, 
                showProxy = false, 
                sorted = true, 
                getters = true
            });
            local v71 = v15[tostring(l_operator_0)];
            if l_operator_0 == "notDeepEqual" and v69 == v70 then
                v69 = ("%s\n\n%s"):format(v71, v69);
                if string.len(v69) > 1024 then
                    v69 = ("%s..."):format(v4.slice(v69, 0, 1021));
                end;
                v59 = setmetatable(v5.new(v69), v56);
            else
                if string.len(v69) > 512 then
                    v69 = ("%s..."):format(v4.slice(v69, 0, 509));
                end;
                if string.len(v70) > 512 then
                    v70 = ("%s..."):format(v4.slice(v70, 0, 509));
                end;
                if l_operator_0 == "deepEqual" then
                    v69 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v71, v69);
                else
                    local v72 = v15[("%sUnequal"):format(l_operator_0)];
                    if not v2.toJSBoolean(v72) then
                        v70 = (" %s %s"):format(l_operator_0, v70);
                    else
                        v69 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v72, v69);
                    end;
                end;
                v59 = setmetatable(v5.new(("%s%s"):format(v69, v70)), v56);
            end;
        end;
    end;
    v59.generatedMessage = not v2.toJSBoolean(l_message_0);
    v59.name = "AssertionError [ERR_ASSERTION]";
    v59.code = "ERR_ASSERTION";
    if l_details_0 ~= nil then
        v59.actual = nil;
        v59.expected = nil;
        v59.operator = nil;
        for v73 = 1, #l_details_0 do
            v59["message " .. tostring(v73)] = l_details_0[v73].message;
            v59["actual " .. tostring(v73)] = l_details_0[v73].actual;
            v59["expected " .. tostring(v73)] = l_details_0[v73].expected;
            v59["operator " .. tostring(v73)] = l_details_0[v73].operator;
            v59["stack trace " .. tostring(v73)] = l_details_0[v73].stack;
        end;
    else
        v59.actual = l_actual_0;
        v59.expected = l_expected_0;
        v59.operator = l_operator_0;
    end;
    ErrorCaptureStackTrace(v59, l_stackStartFn_0 or l_stackStartFunction_0);
    v59.name = "AssertionError";
    return v59;
end;
v56.toString = function(v74)
    return ("%s [%s]: %s"):format(v74.name, v74.code, v74.message);
end;
v56.name = "AssertionError";
return {
    AssertionError = v56
};
