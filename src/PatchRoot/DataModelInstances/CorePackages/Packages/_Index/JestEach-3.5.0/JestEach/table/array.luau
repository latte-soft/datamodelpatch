local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = require(l_Parent_0.RegExp);
local v5 = {};
local v6 = require(script.Parent.format);
local _ = require(l_Parent_0.JestTypes);
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local l_interpolateVariables_0 = require(script.Parent.interpolation).interpolateVariables;
local v10 = v4("%[sdifjoOp]");
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
v5.default = function(v21, v22)
    if not v11(v21, v22) then
        return l_Array_0.map(v12(v22), function(v23, v24)
            return {
                arguments = l_Array_0.map(v23, function(v25)
                    return v25;
                end), 
                title = v13(v21, v23, v24)
            };
        end);
    else
        return l_Array_0.map(v22, function(v26, v27)
            return {
                arguments = {
                    v26
                }, 
                title = l_interpolateVariables_0(v21, v26, v27):gsub("%%%%", "%%")
            };
        end);
    end;
end;
v11 = function(v28, v29)
    return (not v10:test(v14(v28)) and not v15(v29)) and l_Array_0.every(v29, function(v30)
        local v31 = false;
        if v30 ~= nil then
            v31 = typeof(v30) == "table";
        end;
        return v31;
    end);
end;
v12 = function(v32)
    if not v15(v32) then
        return (l_Array_0.map(v32, v16));
    else
        return v32;
    end;
end;
v15 = function(v33)
    return l_Array_0.every(v33, l_Array_0.isArray);
end;
v16 = function(v34)
    return {
        v34
    };
end;
v13 = function(v35, v36, v37)
    return l_Array_0.reduce(v36, function(v38, v39)
        local v40 = v18(v38)[1];
        local v41 = v17(v39);
        if l_Boolean_0.toJSBoolean(v40) then
            if v40 == "%p" then
                return v19(v38, v41);
            else
                return v6(v38, v41);
            end;
        else
            return v38;
        end;
    end, v20(v14(v35), v37)):gsub("@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@", "%%");
end;
v17 = function(v42)
    if typeof(v42) == "string" then
        return (v42:gsub("%%", "@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@"));
    else
        return v42;
    end;
end;
v18 = function(v43)
    local v44 = nil;
    for v45 in v43:gmatch("%%[sdifjoOp#]") do
        if v44 == nil then
            v44 = {};
        end;
        table.insert(v44, v45);
    end;
    return v44 or {};
end;
v14 = function(v46)
    return (v46:gsub("%%%%", "@@__JEST_EACH_PLACEHOLDER_ESCAPE__@@"));
end;
v20 = function(v47, v48)
    return (v47:gsub("%%#", tostring(v48), 1));
end;
v19 = function(v49, v50)
    return (v49:gsub("%%p", l_format_0(v50, {
        maxDepth = 1, 
        min = true
    }), 1));
end;
return v5;
