local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local _ = require(script.Parent["merge-typedefs_types"]);
v4.mergeScalar = function(v8, v9, v10)
    if not v9 then
        if not v10 or not l_Boolean_0.toJSBoolean(v10.convertExtensions) then
            return v8;
        else
            return (l_Object_0.assign({}, v8, {
                kind = l_Kind_0.SCALAR_TYPE_DEFINITION
            }));
        end;
    else
        return {
            name = v8.name, 
            description = if not l_Boolean_0.toJSBoolean(v8.description) then v9.description else v8.description, 
            kind = (not (not (not not v10 and l_Boolean_0.toJSBoolean(v10.convertExtensions)) and v8.kind ~= "ScalarTypeDefinition") or v9.kind == "ScalarTypeDefinition") and "ScalarTypeDefinition" or "ScalarTypeExtension", 
            loc = v8.loc, 
            directives = l_mergeDirectives_0(v8.directives, v9.directives, v10)
        };
    end;
end;
return v4;
