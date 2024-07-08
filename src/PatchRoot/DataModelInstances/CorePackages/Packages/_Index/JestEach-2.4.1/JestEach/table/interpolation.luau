local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v6 = {};
local l_isPrimitive_0 = require(l_Parent_0.JestGetType).isPrimitive;
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v9 = nil;
local v10 = nil;
local v11 = nil;
v6.interpolateVariables = function(v12, v13, v14)
    return l_Array_0.reduce(l_Array_0.reduce(l_Object_0.keys(v13), v9(v12), {}), v10(v13), v12):gsub("%$#", tostring(v14), 1);
end;
v9 = function(v15)
    return function(v16, v17)
        return l_Array_0.concat(v16, ((function()
            local v18 = {};
            for v19 in v15:gmatch(("%%$%s[%%.%%w]*"):format(v17)) do
                table.insert(v18, v19);
            end;
            return v18;
        end)()));
    end;
end;
v10 = function(v20)
    return function(v21, v22)
        local v23 = v11(v20, (l_String_0.split(v22:gsub("%$", "", 1), "%.")));
        if not l_isPrimitive_0(v23) then
            return v21:gsub(v22, l_format_0(v23, {
                maxDepth = 1, 
                min = true
            }), 1);
        else
            return v21:gsub(v22, tostring(v23), 1);
        end;
    end;
end;
v11 = function(v24, v25)
    local v26 = table.unpack(v25, 1, 1);
    local v27 = if #v25 > 1 then {
        table.unpack(v25, 2)
    } else {};
    if not l_Boolean_0.toJSBoolean(v26) or v24[v26] == nil then
        return v24;
    else
        return v11(v24[v26], v27);
    end;
end;
v6.getPath = v11;
return v6;
