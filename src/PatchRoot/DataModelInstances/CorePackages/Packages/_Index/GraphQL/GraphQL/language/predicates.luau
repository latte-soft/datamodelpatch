local l_Kind_0 = require(script.Parent.kinds).Kind;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v10(v9)
    return (v1(v9) or v5(v9)) or v7(v9);
end;
v1 = function(v11)
    local v12 = true;
    if v11.kind ~= l_Kind_0.OPERATION_DEFINITION then
        v12 = v11.kind == l_Kind_0.FRAGMENT_DEFINITION;
    end;
    return v12;
end;
v2 = function(v13)
    local v14 = true;
    if v13.kind ~= l_Kind_0.FIELD then
        v14 = true;
        if v13.kind ~= l_Kind_0.FRAGMENT_SPREAD then
            v14 = v13.kind == l_Kind_0.INLINE_FRAGMENT;
        end;
    end;
    return v14;
end;
v3 = function(v15)
    local v16 = true;
    if v15.kind ~= l_Kind_0.VARIABLE then
        v16 = true;
        if v15.kind ~= l_Kind_0.INT then
            v16 = true;
            if v15.kind ~= l_Kind_0.FLOAT then
                v16 = true;
                if v15.kind ~= l_Kind_0.STRING then
                    v16 = true;
                    if v15.kind ~= l_Kind_0.BOOLEAN then
                        v16 = true;
                        if v15.kind ~= l_Kind_0.NULL then
                            v16 = true;
                            if v15.kind ~= l_Kind_0.ENUM then
                                v16 = true;
                                if v15.kind ~= l_Kind_0.LIST then
                                    v16 = v15.kind == l_Kind_0.OBJECT;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v16;
end;
v4 = function(v17)
    local v18 = true;
    if v17.kind ~= l_Kind_0.NAMED_TYPE then
        v18 = true;
        if v17.kind ~= l_Kind_0.LIST_TYPE then
            v18 = v17.kind == l_Kind_0.NON_NULL_TYPE;
        end;
    end;
    return v18;
end;
v5 = function(v19)
    local v20 = true;
    if v19.kind ~= l_Kind_0.SCHEMA_DEFINITION then
        v20 = v6(v19) or v19.kind == l_Kind_0.DIRECTIVE_DEFINITION;
    end;
    return v20;
end;
v6 = function(v21)
    local v22 = true;
    if v21.kind ~= l_Kind_0.SCALAR_TYPE_DEFINITION then
        v22 = true;
        if v21.kind ~= l_Kind_0.OBJECT_TYPE_DEFINITION then
            v22 = true;
            if v21.kind ~= l_Kind_0.INTERFACE_TYPE_DEFINITION then
                v22 = true;
                if v21.kind ~= l_Kind_0.UNION_TYPE_DEFINITION then
                    v22 = true;
                    if v21.kind ~= l_Kind_0.ENUM_TYPE_DEFINITION then
                        v22 = v21.kind == l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION;
                    end;
                end;
            end;
        end;
    end;
    return v22;
end;
v7 = function(v23)
    local v24 = true;
    if v23.kind ~= l_Kind_0.SCHEMA_EXTENSION then
        v24 = v8(v23);
    end;
    return v24;
end;
v8 = function(v25)
    local v26 = true;
    if v25.kind ~= l_Kind_0.SCALAR_TYPE_EXTENSION then
        v26 = true;
        if v25.kind ~= l_Kind_0.OBJECT_TYPE_EXTENSION then
            v26 = true;
            if v25.kind ~= l_Kind_0.INTERFACE_TYPE_EXTENSION then
                v26 = true;
                if v25.kind ~= l_Kind_0.UNION_TYPE_EXTENSION then
                    v26 = true;
                    if v25.kind ~= l_Kind_0.ENUM_TYPE_EXTENSION then
                        v26 = v25.kind == l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION;
                    end;
                end;
            end;
        end;
    end;
    return v26;
end;
return {
    isDefinitionNode = v10, 
    isExecutableDefinitionNode = v1, 
    isSelectionNode = v2, 
    isValueNode = v3, 
    isTypeNode = v4, 
    isTypeSystemDefinitionNode = v5, 
    isTypeDefinitionNode = v6, 
    isTypeSystemExtensionNode = v7, 
    isTypeExtensionNode = v8
};
