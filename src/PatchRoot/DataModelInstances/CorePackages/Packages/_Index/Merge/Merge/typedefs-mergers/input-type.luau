local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_mergeFields_0 = require(script.Parent.fields).mergeFields;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
v5.mergeInputType = function(v10, v11, v12)
    if not l_Boolean_0.toJSBoolean(v11) then
        if not v12 or not l_Boolean_0.toJSBoolean(v12.convertExtensions) then
            return v10;
        else
            return (l_Object_0.assign({}, v10, {
                kind = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION
            }));
        end;
    else
        local l_status_0, l_result_0 = pcall(function()
            return {
                name = v10.name, 
                description = if not l_Boolean_0.toJSBoolean(v10.description) then v11.description else v10.description, 
                kind = (not (not l_Boolean_0.toJSBoolean(v12 and v12.convertExtensions) and v10.kind ~= "InputObjectTypeDefinition") or v11.kind == "InputObjectTypeDefinition") and "InputObjectTypeDefinition" or "InputObjectTypeExtension", 
                loc = v10.loc, 
                fields = l_mergeFields_0(v10, v10.fields, v11.fields, v12), 
                directives = l_mergeDirectives_0(v10.directives, v11.directives, v12)
            };
        end);
        if not l_status_0 then
            error(l_Error_0.new(("Unable to merge GraphQL input type \"%s\": %s"):format(tostring(v10.name.value), (tostring(l_result_0.message)))));
        end;
        return l_result_0;
    end;
end;
return v5;
