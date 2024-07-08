local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local v11 = require(l_Parent_0.type.definition);
local l_isType_0 = v11.isType;
local l_isRequiredArgument_0 = v11.isRequiredArgument;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v15 = {};
v15.ProvidedRequiredArgumentsRule = function(v16)
    return l_Object_0.assign({}, v15.ProvidedRequiredArgumentsOnDirectivesRule(v16), {
        Field = {
            leave = function(_, v18)
                local v19 = v16:getFieldDef();
                if v19 then
                    local v21 = l_keyMap_0(v18.arguments or {}, function(v20)
                        return v20.name.value;
                    end);
                    for _, v23 in ipairs(v19.args) do
                        if not (v21[v23.name] or not l_isRequiredArgument_0(v23)) then
                            v16:reportError(l_GraphQLError_0.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(v19.name, v23.name, (l_inspect_0(v23.type))), v18));
                        end;
                    end;
                    return ;
                else
                    return false;
                end;
            end
        }
    });
end;
v15.ProvidedRequiredArgumentsOnDirectivesRule = function(v24)
    local v25 = {};
    local v26 = v24:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v26 then
        l_l_specifiedDirectives_0_0 = v26:getDirectives();
    end;
    for _, v29 in ipairs(l_l_specifiedDirectives_0_0) do
        v25[v29.name] = l_keyMap_0(l_Array_0.filter(v29.args, l_isRequiredArgument_0), function(v30)
            return v30.name;
        end);
    end;
    for _, v32 in ipairs(v24:getDocument().definitions) do
        if v32.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            v25[v32.name.value] = l_keyMap_0(l_Array_0.filter(v32.arguments or {}, isRequiredArgumentNode), function(v33)
                return v33.name.value;
            end);
        end;
    end;
    return {
        Directive = {
            leave = function(_, v35)
                local l_value_0 = v35.name.value;
                local v37 = v25[l_value_0];
                if v37 then
                    local v39 = l_keyMap_0(v35.arguments or {}, function(v38)
                        return v38.name.value;
                    end);
                    for _, v41 in ipairs(l_Object_0.keys(v37)) do
                        if not v39[v41] then
                            local l_type_0 = v37[v41].type;
                            v24:reportError(l_GraphQLError_0.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(l_value_0, v41, not not l_isType_0(l_type_0) and l_inspect_0(l_type_0) or l_print_0(l_type_0)), v35));
                        end;
                    end;
                end;
            end
        }
    };
end;
isRequiredArgumentNode = function(v43)
    local v44 = false;
    if v43.type.kind == l_Kind_0.NON_NULL_TYPE then
        v44 = v43.defaultValue == nil;
    end;
    return v44;
end;
return v15;
