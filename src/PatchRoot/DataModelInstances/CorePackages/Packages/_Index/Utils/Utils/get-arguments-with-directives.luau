local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(script.Parent.types);
local v7 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v7.Kind;
local l_valueFromASTUntyped_0 = v7.valueFromASTUntyped;
local function v12(v10)
    local v11 = true;
    if v10.kind ~= l_Kind_0.OBJECT_TYPE_DEFINITION then
        v11 = v10.kind == l_Kind_0.OBJECT_TYPE_EXTENSION;
    end;
    return v11;
end;
v5.getArgumentsWithDirectives = function(v13)
    local v14 = {};
    for _, v16 in (l_Array_0.filter(v13.definitions, v12)), nil, nil do
        if v16.fields ~= nil then
            for _, v18 in v16.fields, nil, nil do
                local v19 = if typeof(v18.arguments) == "table" then v18.arguments else nil;
                local v21 = if v19 ~= nil then l_Array_0.filter(v19, function(v20)
                    return l_Boolean_0.toJSBoolean(if typeof(v20.directives) == "table" then #v20.directives else nil);
                end) else nil;
                if l_Boolean_0.toJSBoolean(if typeof(v21) == "table" then #v21 else nil) then
                    v14[tostring(("%s.%s"):format(tostring(v16.name.value), (tostring(v18.name.value))))] = {};
                    local v22 = v14[tostring(("%s.%s"):format(tostring(v16.name.value), (tostring(v18.name.value))))];
                    for _, v24 in v21, nil, nil do
                        v22[tostring(v24.name.value)] = l_Array_0.map(v24.directives, function(v25)
                            return {
                                name = v25.name.value, 
                                args = l_Array_0.reduce(not not l_Boolean_0.toJSBoolean(v25.arguments) and v25.arguments or {}, function(v26, v27)
                                    return l_Object_0.assign({}, v26, {
                                        [v27.name.value] = l_valueFromASTUntyped_0(v27.value, {})
                                    });
                                end, {})
                            };
                        end);
                    end;
                end;
            end;
        end;
    end;
    return v14;
end;
return v5;
