local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local v4 = require(l_language_0.predicates);
local l_isTypeDefinitionNode_0 = v4.isTypeDefinitionNode;
local l_isTypeExtensionNode_0 = v4.isTypeExtensionNode;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
return {
    UniqueDirectivesPerLocationRule = function(v8)
        local v9 = {};
        local v10 = v8:getSchema();
        local v11 = if not v10 then l_specifiedDirectives_0 else v10:getDirectives();
        for _, v13 in ipairs(v11) do
            v9[v13.name] = not v13.isRepeatable;
        end;
        for _, v15 in ipairs(v8:getDocument().definitions) do
            if v15.kind == l_Kind_0.DIRECTIVE_DEFINITION then
                v9[v15.name.value] = not v15.repeatable;
            end;
        end;
        local v16 = {};
        local v17 = {};
        return {
            enter = function(_, v19)
                if v19.directives == nil then
                    return ;
                else
                    local v20 = nil;
                    if not (v19.kind ~= l_Kind_0.SCHEMA_DEFINITION) or v19.kind == l_Kind_0.SCHEMA_EXTENSION then
                        v20 = v16;
                    elseif not l_isTypeDefinitionNode_0(v19) and not l_isTypeExtensionNode_0(v19) then
                        v20 = {};
                    else
                        local l_value_0 = v19.name.value;
                        v20 = v17[l_value_0];
                        if v20 == nil then
                            v20 = {};
                            v17[l_value_0] = v20;
                        end;
                    end;
                    for _, v23 in ipairs(v19.directives) do
                        local l_value_1 = v23.name.value;
                        if v9[l_value_1] then
                            if not v20[l_value_1] then
                                v20[l_value_1] = v23;
                            else
                                v8:reportError(l_GraphQLError_0.new(("The directive \"@%s\" can only be used once at this location."):format(l_value_1), {
                                    v20[l_value_1], 
                                    v23
                                }));
                            end;
                        end;
                    end;
                    return ;
                end;
            end
        };
    end
};
