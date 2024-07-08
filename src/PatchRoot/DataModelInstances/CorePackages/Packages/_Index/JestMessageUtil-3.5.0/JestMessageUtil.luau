local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local v6 = require(l_Parent_0.RegExp);
local v7 = {};
local v8 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local l_normalizePromiseError_0 = require(l_Parent_0.RobloxShared).normalizePromiseError;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = v8.bold("\226\151\143 ");
local l_dim_0 = v8.dim;
v7.indentAllLines = function(v17, v18)
    local v19 = string.split(v17, "\n");
    for v20, v21 in v19, nil, nil do
        v19[v20] = (v18 or "") .. v21;
    end;
    return table.concat(v19, "\n");
end;
local function v23(v22)
    return l_String_0.trim(v22 or "");
end;
local function _(v24)
    if not v24:find("%s*at.*%(?:%d*:%d*%)?") and not v24:find("%s*at.*%(?native%)?") then
        return v24;
    else
        return v23(v24);
    end;
end;
local v28 = {
    test = function(_, v27)
        return string.match(v27, "%S") == nil;
    end
};
local function _(v29)
    return v29;
end;
v7.formatExecError = function(v31, v32, v33, v34, v35)
    if not l_Boolean_0.toJSBoolean(v31) or typeof(v31) == "number" then
        v31 = l_Error_0.new(("Expected an Error, but \"%s\" was thrown"):format((tostring(v31))));
        v31.stack = "";
    end;
    local v36 = nil;
    local v37 = nil;
    if (not (typeof(v31) ~= "string") or not l_Boolean_0.toJSBoolean(v31)) or v31 == nil then
        if not l_Boolean_0.toJSBoolean(v31) then
            v31 = "EMPTY ERROR";
        end;
        v36 = "";
        v37 = v31;
    else
        if v31.kind == "ExecutionError" then
            v31 = l_normalizePromiseError_0(v31);
        end;
        v36 = v31.message;
        v37 = if typeof(v31.stack) == "string" then v31.stack else ("thrown: %s"):format(l_format_0(v31, {
            maxDepth = 3
        }));
    end;
    local v38 = v14(not not l_Boolean_0.toJSBoolean(v37) and v37 or "");
    v37 = v38.stack;
    if string.find(v38.message, l_String_0.trim(v36 or ""), 1, true) ~= nil then
        v36 = v38.message;
    end;
    local v39 = string.split(v36, "\n");
    for v40, v41 in v39, nil, nil do
        v39[v40] = "    " .. v41;
    end;
    v36 = table.concat(v39, "\n");
    v37 = (not l_Boolean_0.toJSBoolean(v37) or v33.noStackTrace) and "" or "\n" .. v12(v37, v32, v33, v34);
    if not (typeof(v37) == "string" and (not v28:test(v36) or not v28:test(v37))) then
        v36 = ("thrown: %s"):format((tostring(l_format_0(v31, {
            maxDepth = 3
        }))));
    end;
    local _ = nil;
    return "  " .. v15 .. if not v35 then ("%s\n\n%s"):format("Test suite failed to run", v36) else (" %s"):format(l_String_0.trim(v36)) .. v37 .. "\n";
end;
local function v47(v43, v44)
    local v45 = 0;
    return l_Array_0.filter(v43, function(v46)
        if not v46:find("^%s+at <anonymous>.*$") then
            if not v46:find("^%s+at Promise %(<anonymous>%).*$") and not v46:find("^%s+at new Promise %(<anonymous>%).*$") then
                if not v46:find("^%s+at Generator.next %(<anonymous>%).*$") then
                    if not v46:find("^%s+at next %(native%).*$") then
                        if v46:find("%s*at.*%(?:%d*:%d*%)?") and v46:find("%s*at.*%(?native%)?") then
                            if not v46:find("%s+at(.jasmine%-)") and not v46:find("%s+at(%s+jasmine%.buildExpectationResult)") then
                                v45 = v45 + 1;
                                if v45 == 1 then
                                    return true;
                                elseif not v44.noStackTrace then
                                    return true;
                                else
                                    return false;
                                end;
                            else
                                return false;
                            end;
                        else
                            return true;
                        end;
                    else
                        return false;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end);
end;
local _ = function(_, _, v50)
    return v50;
end;
v13 = function(v52, v53)
    if v53 == nil then
        v53 = {
            noCodeFrame = false, 
            noStackTrace = false
        };
    end;
    return v47(string.split(v52, "\n"), v53);
end;
v7.getStackTraceLines = v13;
v12 = function(v54, v55, v56, v57)
    local v58 = v13(v54, v56);
    local v59 = nil;
    if v57 then
        v59 = "unsupported";
    end;
    return string.format("\n%s", (table.concat(l_Array_0.map(l_Array_0.filter(v58, l_Boolean_0.toJSBoolean), function(v60)
        local v61 = "      ";
        local _ = v55;
        local _ = v59;
        return v61 .. if v60:find("%s*at.*%(?:%d*:%d*%)?") or v60:find("%s*at.*%(?native%)?") then l_String_0.trim(v60 or "") else v60;
    end), "\n")));
end;
v7.formatStackTrace = v12;
v7.formatResultsErrors = function(v64, v65, v66, v67)
    local v71 = l_Array_0.reduce(v64, function(v68, v69)
        l_Array_0.forEach(v69.failureMessages, function(v70)
            table.insert(v68, {
                content = v70, 
                result = v69
            });
        end);
        return v68;
    end, {});
    if #v71 <= 0 then
        return nil;
    else
        return l_Array_0.join(l_Array_0.map(v71, function(v72)
            local l_result_0 = v72.result;
            local v74 = v14(v72.content);
            local l_message_0 = v74.message;
            local v76 = if not v66.noStackTrace then l_dim_0(v12(v74.stack, v65, v66, v67)) .. "\n" else "";
            local v77 = string.split(l_message_0, "\n");
            for v78, v79 in v77, nil, nil do
                v77[v78] = "    " .. v79;
            end;
            return v8.bold(v8.red("  " .. v15 .. l_Array_0.join(l_result_0.ancestorTitles, " \226\128\186 ") .. (#l_result_0.ancestorTitles > 0 and " \226\128\186 " or "") .. l_result_0.title)) .. "\n" .. "\n" .. table.concat(v77, "\n") .. "\n" .. v76;
        end), "\n");
    end;
end;
local function v82(v80)
    return l_String_0.trimRight(table.concat(l_Array_0.filter(l_String_0.split(v80, "\n"), function(v81)
        return not v81:find("^Error:?%s*$");
    end), "\n"));
end;
v14 = function(v83)
    if v83 then
        local v84 = v6("^(?:Error: )?([\\s\\S]*?(?=\\n\\s*LoadedCode.*:\\d*)|\\s*.*)([\\s\\S]*)$"):exec(v83);
        if not v84 then
            error("If you hit this error, the regex above is buggy.");
        end;
        return {
            message = v82(v84[2]), 
            stack = v82(v84[3])
        };
    else
        return {
            message = "", 
            stack = ""
        };
    end;
end;
v7.separateMessageFromStack = v14;
return v7;
