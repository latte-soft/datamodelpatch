local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v5 = require(script.Parent.nilPlaceholder);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local v8 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v8.ErrorWithStack;
local l_convertDescriptorToString_0 = v8.convertDescriptorToString;
local l_default_0 = require(script.Parent.table.array).default;
local l_default_1 = require(script.Parent.table.template).default;
local v13 = require(script.Parent.validation);
local l_extractValidTemplateHeadings_0 = v13.extractValidTemplateHeadings;
local l_validateArrayTable_0 = v13.validateArrayTable;
local l_validateTemplateTableArguments_0 = v13.validateTemplateTableArguments;
local function v17()
    error("Method unavailable");
end;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
v6.default = function(v23, v24)
    local v25 = not (v24 ~= nil) or v24;
    local v26 = v23 or v17;
    return function(v27, ...)
        local v28 = if select("#", ...) > 0 then {
            ...
        } else {};
        local function v29(v30, v31, v32)
            v30 = l_convertDescriptorToString_0(v30);
            local l_status_0, l_result_0 = pcall(function()
                return (l_Array_0.forEach(if not v18(v28) then v20(v30, v27, v28) else v19(v30, v27), function(v33)
                    return v26(v33.title, v22(v25, v33.arguments, v31), v32);
                end));
            end);
            if l_status_0 then
                return l_result_0;
            else
                local v36 = l_ErrorWithStack_0.new(l_result_0.message, v29);
                return v26(v30, function()
                    error(v36);
                end);
            end;
        end;
        return v29;
    end;
end;
v18 = function(v37)
    return #v37 == 0;
end;
v19 = function(v38, v39)
    l_validateArrayTable_0(v39);
    return l_default_0(v38, v39);
end;
v20 = function(v40, v41, v42)
    local v43 = v21(if not l_Array_0.isArray(v41) then v41 else v41[1]);
    l_validateTemplateTableArguments_0(v43, v42);
    return l_default_1(v40, v43, v42);
end;
v21 = function(v44)
    return l_String_0.split(l_extractValidTemplateHeadings_0(v44):gsub("%s+", ""), "|");
end;
v22 = function(v45, v46, v47)
    local v48 = nil;
    v48 = if typeof(v47) == "function" then debug.info(v47, "a") else 0;
    local v49 = nil;
    v49 = function(v50)
        if v50 == v5 then
            return nil;
        elseif not l_Array_0.isArray(v50) then
            if typeof(v50) == "table" then
                l_Array_0.forEach(l_Object_0.keys(v50), function(v51)
                    v50[v51] = v49(v50[v51]);
                end);
                return v50;
            else
                return v50;
            end;
        else
            return l_Array_0.map(v50, function(v52)
                return v49(v52);
            end);
        end;
    end;
    local v53 = nil;
    v53 = function(v54, v55, ...)
        local v56 = if v55 ~= nil then v55 else #v54;
        if v56 == 0 then
            return ...;
        else
            return v53(v54, v56 - 1, v49(v54[v56]), ...);
        end;
    end;
    return (not not v45 and #v46 < v48) and function(v57)
        return v47(v53(v46), v57);
    end or function()
        return v47(v53(v46));
    end;
end;
return v6;
