local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_specifiedDirectives_0 = require(l_Parent_0.type.directives).specifiedDirectives;
local v11 = {};
v11.KnownArgumentNamesRule = function(v12)
    return l_Object_0.assign({}, v11.KnownArgumentNamesOnDirectivesRule(v12), {
        Argument = function(_, v14)
            local v15 = v12:getArgument();
            local v16 = v12:getFieldDef();
            local v17 = v12:getParentType();
            if not ((v15 or not v16) or not v17) then
                local l_value_0 = v14.name.value;
                v12:reportError(l_GraphQLError_0.new(("Unknown argument \"%s\" on field \"%s.%s\"."):format(l_value_0, v17.name, v16.name) .. l_didYouMean_0((l_suggestionList_0(l_value_0, (l_Array_0.map(v16.args, function(v19)
                    return v19.name;
                end))))), v14));
            end;
        end
    });
end;
v11.KnownArgumentNamesOnDirectivesRule = function(v20)
    local v21 = {};
    local v22 = v20:getSchema();
    local l_l_specifiedDirectives_0_0 = l_specifiedDirectives_0;
    if v22 then
        l_l_specifiedDirectives_0_0 = v22:getDirectives();
    end;
    for _, v25 in ipairs(l_l_specifiedDirectives_0_0) do
        v21[v25.name] = l_Array_0.map(v25.args, function(v26)
            return v26.name;
        end);
    end;
    for _, v28 in ipairs(v20:getDocument().definitions) do
        if v28.kind == l_Kind_0.DIRECTIVE_DEFINITION then
            v21[v28.name.value] = l_Array_0.map(v28.arguments or {}, function(v29)
                return v29.name.value;
            end);
        end;
    end;
    return {
        Directive = function(_, v31)
            local l_value_1 = v31.name.value;
            local v33 = v21[l_value_1];
            if not (not v31.arguments or not v33) then
                for _, v35 in ipairs(v31.arguments) do
                    local l_value_2 = v35.name.value;
                    if l_Array_0.indexOf(v33, l_value_2) == -1 then
                        v20:reportError(l_GraphQLError_0.new(("Unknown argument \"%s\" on directive \"@%s\"."):format(l_value_2, l_value_1) .. l_didYouMean_0((l_suggestionList_0(l_value_2, v33))), v35));
                    end;
                end;
            end;
            return false;
        end
    };
end;
return v11;
