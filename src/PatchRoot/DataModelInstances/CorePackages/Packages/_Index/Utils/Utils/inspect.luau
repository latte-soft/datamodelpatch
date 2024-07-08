local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local l_Error_0 = v1.Error;
local v7 = {};
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_isAggregateError_0 = require(script.Parent.AggregateError).isAggregateError;
v7.inspect = function(v16)
    return v8(v16, {});
end;
v8 = function(v17, v18)
    local v19 = typeof(v17);
    if v19 == "string" then
        return "\"" .. v17 .. "\"";
    elseif v19 == "function" then
        local v20 = debug.info(v17, "n");
        if not l_Boolean_0.toJSBoolean(v20) then
            return "[function]";
        else
            return (("[function %s]"):format(v20));
        end;
    elseif v19 == "table" then
        return v9(v17, v18);
    else
        return (tostring(v17));
    end;
end;
local function v22(v21)
    if not l_instanceof_0(v21, l_GraphQLError_0) then
        return ("%s: %s;\n %s"):format(tostring(v21.name), tostring(v21.message), (tostring(v21.stack)));
    else
        return (tostring(v21));
    end;
end;
v9 = function(v23, v24)
    if v23 == nil then
        return "null";
    elseif not l_instanceof_0(v23, l_Error_0) then
        if not l_Boolean_0.toJSBoolean(l_Array_0.includes(v24, v23)) then
            local v25 = l_Array_0.concat({}, v24, {
                v23
            });
            if not l_Boolean_0.toJSBoolean(v11(v23)) then
                if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v23)) then
                    return v10(v23, v25);
                end;
            else
                local v26 = v23:toJSON();
                if v26 ~= v23 then
                    if typeof(v26) == "string" then
                        return v26;
                    else
                        return (v8(v26, v25));
                    end;
                end;
            end;
            return v12(v23, v25);
        else
            return "[Circular]";
        end;
    elseif not l_isAggregateError_0(v23) then
        return v22(v23);
    else
        return if not l_instanceof_0(v23, l_GraphQLError_0) then ("%s: %s;\n %s"):format(tostring(v23.name), tostring(v23.message), (tostring(v23.stack))) else tostring(v23) .. "\n" .. v10(v23.errors, v24);
    end;
end;
v11 = function(v27)
    return typeof(v27.toJSON) == "function";
end;
v12 = function(v28, v29)
    local v30 = l_Object_0.entries(v28);
    if #v30 == 0 then
        return "{}";
    elseif #v29 > 3 then
        return "[" .. tostring(v13(v28)) .. "]";
    else
        return "{ " .. tostring(l_Array_0.join(l_Array_0.map(v30, function(v31)
            local v32, v33 = table.unpack(v31, 1, 2);
            return tostring(v32) .. ": " .. tostring(v8(v33, v29));
        end), ", ")) .. " }";
    end;
end;
v10 = function(v34, v35)
    if #v34 == 0 then
        return "[]";
    elseif #v35 > 3 then
        return "[Array]";
    else
        local v36 = #v34;
        local v37 = #v34;
        local v38 = {};
        local v39 = 1;
        while v39 <= v36 do
            table.insert(v38, v8(v34[v39], v35));
            v39 = v39 + 1;
        end;
        if v37 == 1 then
            table.insert(v38, "... 1 more item");
        elseif v37 > 1 then
            table.insert(v38, ("... %s more items"):format((tostring(v37))));
        end;
        return "[" .. tostring(l_Array_0.join(v38, ", ")) .. "]";
    end;
end;
v13 = function(_)
    return "Object";
end;
return v7;
