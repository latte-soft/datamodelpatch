local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.Parent.LuauPolyfill).Map;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_isEnumType_0 = require(l_Parent_0.type.definition).isEnumType;
return {
    UniqueEnumValueNamesRule = function(v4)
        local v5 = v4:getSchema();
        local v6 = not not v5 and v5:getTypeMap() or l_Map_0.new();
        local v7 = {};
        local function v17(_, v9)
            local l_value_0 = v9.name.value;
            if not v7[l_value_0] then
                v7[l_value_0] = {};
            end;
            local v11 = v9.values or {};
            local v12 = v7[l_value_0];
            for _, v14 in ipairs(v11) do
                local l_value_1 = v14.name.value;
                local v16 = v6:get(l_value_0);
                if not l_isEnumType_0(v16) or not v16:getValue(l_value_1) then
                    if not v12[l_value_1] then
                        v12[l_value_1] = v14.name;
                    else
                        v4:reportError(l_GraphQLError_0.new(("Enum value \"%s.%s\" can only be defined once."):format(l_value_0, l_value_1), {
                            v12[l_value_1], 
                            v14.name
                        }));
                    end;
                else
                    v4:reportError(l_GraphQLError_0.new(("Enum value \"%s.%s\" already exists in the schema. It cannot also be defined in this type extension."):format(l_value_0, l_value_1), v14.name));
                end;
            end;
            return false;
        end;
        return {
            EnumTypeDefinition = v17, 
            EnumTypeExtension = v17
        };
    end
};
