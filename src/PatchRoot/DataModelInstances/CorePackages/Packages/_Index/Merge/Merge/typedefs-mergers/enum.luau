local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local l_mergeEnumValues_0 = require(script.Parent["enum-values"]).mergeEnumValues;
local _ = require(script.Parent["merge-typedefs_types"]);
v4.mergeEnum = function(v9, v10, v11)
    if not l_Boolean_0.toJSBoolean(v10) then
        if not v11 or not l_Boolean_0.toJSBoolean(v11.convertExtensions) then
            return v9;
        else
            return (l_Object_0.assign({}, v9, {
                kind = l_Kind_0.ENUM_TYPE_DEFINITION
            }));
        end;
    else
        return {
            name = v9.name, 
            description = if not l_Boolean_0.toJSBoolean(v9.description) then v10.description else v9.description, 
            kind = (not (not (not not v11 and l_Boolean_0.toJSBoolean(v11.convertExtensions)) and v9.kind ~= "EnumTypeDefinition") or v10.kind == "EnumTypeDefinition") and "EnumTypeDefinition" or "EnumTypeExtension", 
            loc = v9.loc, 
            directives = l_mergeDirectives_0(v9.directives, v10.directives, v11), 
            values = l_mergeEnumValues_0(v9.values, v10.values, v11)
        };
    end;
end;
return v4;
