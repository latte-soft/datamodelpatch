local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
local l_devAssert_0 = require(script.Parent.Parent.jsutils.devAssert).devAssert;
local _ = require(script.Parent.Parent.language.source);
local _ = require(script.Parent.Parent.language.ast);
local v4 = require(script.Parent.Parent.language.parser);
local l_Kind_0 = require(script.Parent.Parent.language.kinds).Kind;
local l_parse_0 = v4.parse;
local l_assertValidSDL_0 = require(script.Parent.Parent.validation.validate).assertValidSDL;
local l_GraphQLSchema_0 = require(script.Parent.Parent.type.schema).GraphQLSchema;
local l_specifiedDirectives_0 = require(script.Parent.Parent.type.directives).specifiedDirectives;
local l_extendSchemaImpl_0 = require(script.Parent.extendSchema).extendSchemaImpl;
local function v21(v11, v12)
    local l_l_devAssert_0_0 = l_devAssert_0;
    local v14 = false;
    if v11 ~= nil then
        v14 = v11.kind == l_Kind_0.DOCUMENT;
    end;
    l_l_devAssert_0_0(v14, "Must provide valid Document AST.");
    if not ((not (v12 ~= nil) or v12.assumeValid) or v12.assumeValidSDL) then
        l_assertValidSDL_0(v11);
    end;
    v14 = l_extendSchemaImpl_0({
        description = nil, 
        types = {}, 
        directives = {}, 
        extensions = nil, 
        extensionASTNodes = {}, 
        assumeValid = false
    }, v11, v12);
    if v14.astNode == nil then
        for _, v16 in ipairs(v14.types) do
            if v16.name == "Query" then
                v14.query = v16;
            elseif v16.name == "Mutation" then
                v14.mutation = v16;
            elseif v16.name == "Subscription" then
                v14.subscription = v16;
            end;
        end;
    end;
    local l_directives_0 = v14.directives;
    for _, v19 in ipairs(l_specifiedDirectives_0) do
        if l_Array_0.every(l_directives_0, function(v20)
            return v20.name ~= v19.name;
        end) then
            table.insert(l_directives_0, v19);
        end;
    end;
    return l_GraphQLSchema_0.new(v14);
end;
return {
    buildASTSchema = v21, 
    buildSchema = function(v22, v23)
        return v21(l_parse_0(v22, {
            noLocation = if not v23 then nil else v23.noLocation, 
            experimentalFragmentVariables = if not v23 then nil else v23.experimentalFragmentVariables
        }), {
            assumeValidSDL = if not v23 then nil else v23.assumeValidSDL, 
            assumeValid = if not v23 then nil else v23.assumeValid
        });
    end
};
