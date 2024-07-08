local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v5 = require(script.Parent.nilPlaceholder);
local v6 = {};
local _ = require(l_Parent_0.JestTypes);
local l_ErrorWithStack_0 = require(l_Parent_0.JestUtil).ErrorWithStack;
local l_default_0 = require(script.Parent.table.array).default;
local l_default_1 = require(script.Parent.table.template).default;
local v11 = require(script.Parent.validation);
local l_extractValidTemplateHeadings_0 = v11.extractValidTemplateHeadings;
local l_validateArrayTable_0 = v11.validateArrayTable;
local l_validateTemplateTableArguments_0 = v11.validateTemplateTableArguments;
local function v15()
    error("Method unavailable");
end;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
v6.default = function(v21, v22)
    local v23 = not (v22 ~= nil) or v22;
    local v24 = v21 or v15;
    return function(v25, ...)
        local v26 = if select("#", ...) > 0 then {
            ...
        } else {};
        local function v27(v28, v29, v30)
            local l_status_0, l_result_0 = pcall(function()
                return (l_Array_0.forEach(if not v16(v26) then v18(v28, v25, v26) else v17(v28, v25), function(v31)
                    return v24(v31.title, v20(v23, v31.arguments, v29), v30);
                end));
            end);
            if l_status_0 then
                return l_result_0;
            else
                local v34 = l_ErrorWithStack_0.new(l_result_0.message, v27);
                return v24(v28, function()
                    error(v34);
                end);
            end;
        end;
        return v27;
    end;
end;
v16 = function(v35)
    return #v35 == 0;
end;
v17 = function(v36, v37)
    l_validateArrayTable_0(v37);
    return l_default_0(v36, v37);
end;
v18 = function(v38, v39, v40)
    local v41 = v19(v39[1]);
    l_validateTemplateTableArguments_0(v41, v40);
    return l_default_1(v38, v41, v40);
end;
v19 = function(v42)
    return l_String_0.split(l_extractValidTemplateHeadings_0(v42):gsub("%s+", ""), "|");
end;
v20 = function(v43, v44, v45)
    local v46 = nil;
    v46 = if typeof(v45) == "function" then debug.info(v45, "a") else 0;
    local v47 = nil;
    v47 = function(v48)
        if v48 == v5 then
            return nil;
        elseif not l_Array_0.isArray(v48) then
            if typeof(v48) == "table" then
                l_Array_0.forEach(l_Object_0.keys(v48), function(v49)
                    v48[v49] = v47(v48[v49]);
                end);
                return v48;
            else
                return v48;
            end;
        else
            return l_Array_0.map(v48, function(v50)
                return v47(v50);
            end);
        end;
    end;
    local v51 = nil;
    v51 = function(v52, v53, ...)
        local v54 = if v53 ~= nil then v53 else #v52;
        if v54 == 0 then
            return ...;
        else
            return v51(v52, v54 - 1, v47(v52[v54]), ...);
        end;
    end;
    return (not not v43 and #v44 < v46) and function(v55)
        return v45(v51(v44), v55);
    end or function()
        return v45(v51(v44));
    end;
end;
return v6;
