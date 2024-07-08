local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.Parent.LuauPolyfill).Map;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v4 = require(l_Parent_0.type.definition);
local l_isObjectType_0 = v4.isObjectType;
local l_isInterfaceType_0 = v4.isInterfaceType;
local l_isInputObjectType_0 = v4.isInputObjectType;
local v8 = {};
local v9 = nil;
v8.UniqueFieldDefinitionNamesRule = function(v10)
    local v11 = v10:getSchema();
    local v12 = not not v11 and v11:getTypeMap() or l_Map_0.new();
    local v13 = {};
    local function v22(_, v15)
        local l_value_0 = v15.name.value;
        if not v13[l_value_0] then
            v13[l_value_0] = {};
        end;
        local v17 = v15.fields or {};
        local v18 = v13[l_value_0];
        for _, v20 in ipairs(v17) do
            local l_value_1 = v20.name.value;
            if not v9(v12:get(l_value_0), l_value_1) then
                if not v18[l_value_1] then
                    v18[l_value_1] = v20.name;
                else
                    v10:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" can only be defined once."):format(l_value_0, l_value_1), {
                        v18[l_value_1], 
                        v20.name
                    }));
                end;
            else
                v10:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(l_value_0, l_value_1), v20.name));
            end;
        end;
        return false;
    end;
    return {
        InputObjectTypeDefinition = v22, 
        InputObjectTypeExtension = v22, 
        InterfaceTypeDefinition = v22, 
        InterfaceTypeExtension = v22, 
        ObjectTypeDefinition = v22, 
        ObjectTypeExtension = v22
    };
end;
v9 = function(v23, v24)
    if not (l_isObjectType_0(v23) or l_isInterfaceType_0(v23)) and not l_isInputObjectType_0(v23) then
        return false;
    else
        return l_isNotNillish_0(v23:getFields():get(v24));
    end;
end;
return v8;
