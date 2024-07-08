local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_valueFromASTUntyped_0 = require(l_Parent_0.GraphQL).valueFromASTUntyped;
local _ = require(script.Parent.types);
v5.getFieldsWithDirectives = function(v8, v9)
    local v10 = if v9 ~= nil then v9 else {};
    local v11 = {};
    local v12 = {
        "ObjectTypeDefinition", 
        "ObjectTypeExtension"
    };
    if l_Boolean_0.toJSBoolean(v10.includeInputTypes) then
        v12 = l_Array_0.concat({}, v12, {
            "InputObjectTypeDefinition", 
            "InputObjectTypeExtension"
        });
    end;
    for _, v15 in (l_Array_0.filter(v8.definitions, function(v13)
        return l_Array_0.includes(v12, v13.kind);
    end)), nil, nil do
        local l_value_0 = v15.name.value;
        if v15.fields ~= nil then
            for _, v18 in v15.fields, nil, nil do
                if l_Boolean_0.toJSBoolean(v18.directives) and #v18.directives > 0 then
                    v11[tostring((("%s.%s"):format(tostring(l_value_0), (tostring(v18.name.value)))))] = l_Array_0.map(v18.directives, function(v19)
                        return {
                            name = v19.name.value, 
                            args = l_Array_0.reduce(not not l_Boolean_0.toJSBoolean(v19.arguments) and v19.arguments or {}, function(v20, v21)
                                return l_Object_0.assign({}, v20, {
                                    [v21.name.value] = l_valueFromASTUntyped_0(v21.value, nil)
                                });
                            end, {})
                        };
                    end);
                end;
            end;
        end;
    end;
    return v11;
end;
return v5;
