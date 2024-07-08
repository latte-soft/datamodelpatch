local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v3 = require(l_Parent_0.type.definition);
local l_getNamedType_0 = v3.getNamedType;
local l_isInputObjectType_0 = v3.isInputObjectType;
return {
    NoDeprecatedCustomRule = function(v6)
        return {
            Field = function(_, v8)
                local v9 = v6:getFieldDef();
                local v10 = v9 and v9.deprecationReason;
                if v9 and v10 ~= nil then
                    local v11 = v6:getParentType();
                    l_invariant_0(v11 ~= nil);
                    v6:reportError(l_GraphQLError_0.new(("The field %s.%s is deprecated. %s"):format(v11.name, v9.name, v10), v8));
                end;
            end, 
            Argument = function(_, v13)
                local v14 = v6:getArgument();
                local v15 = v14 and v14.deprecationReason;
                if v14 and v15 ~= nil then
                    local v16 = v6:getDirective();
                    if v16 ~= nil then
                        v6:reportError(l_GraphQLError_0.new(("Directive \"@%s\" argument \"%s\" is deprecated. %s"):format(v16.name, v14.name, v15), v13));
                        return ;
                    else
                        local v17 = v6:getParentType();
                        local v18 = v6:getFieldDef();
                        local l_l_invariant_0_0 = l_invariant_0;
                        local v20 = false;
                        if v17 ~= nil then
                            v20 = v18 ~= nil;
                        end;
                        l_l_invariant_0_0(v20);
                        v6:reportError(l_GraphQLError_0.new(("Field \"%s.%s\" argument \"%s\" is deprecated. %s"):format(v17.name, v18.name, v14.name, v15), v13));
                    end;
                end;
            end, 
            ObjectField = function(_, v22)
                local v23 = l_getNamedType_0(v6:getParentInputType());
                if l_isInputObjectType_0(v23) then
                    local v24 = v23:getFields():get(v22.name.value);
                    local v25 = v24 and v24.deprecationReason;
                    if v25 ~= nil then
                        v6:reportError(l_GraphQLError_0.new(("The input field %s.%s is deprecated. %s"):format(v23.name, v24.name, v25), v22));
                    end;
                end;
            end, 
            EnumValue = function(_, v27)
                local v28 = v6:getEnumValue();
                local v29 = v28 and v28.deprecationReason;
                if v28 and v29 ~= nil then
                    local v30 = l_getNamedType_0(v6:getInputType());
                    l_invariant_0(v30 ~= nil);
                    v6:reportError(l_GraphQLError_0.new(("The enum value \"%s.%s\" is deprecated. %s"):format(v30.name, v28.name, v29), v27));
                end;
            end
        };
    end
};
