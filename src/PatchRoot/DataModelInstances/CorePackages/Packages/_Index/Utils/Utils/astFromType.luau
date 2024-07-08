local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_isNonNullType_0 = v5.isNonNullType;
local l_Kind_0 = v5.Kind;
local l_isListType_0 = v5.isListType;
local l_inspect_0 = require(script.Parent.inspect).inspect;
local function v10(v11)
    if not l_Boolean_0.toJSBoolean(l_isNonNullType_0(v11)) then
        if not l_Boolean_0.toJSBoolean(l_isListType_0(v11)) then
            return {
                kind = l_Kind_0.NAMED_TYPE, 
                name = {
                    kind = l_Kind_0.NAME, 
                    value = v11.name
                }
            };
        else
            return {
                kind = l_Kind_0.LIST_TYPE, 
                type = v10(v11.ofType)
            };
        end;
    else
        local v12 = v10(v11.ofType);
        if v12.kind == l_Kind_0.NON_NULL_TYPE then
            error(l_Error_0.new(("Invalid type node %s. Inner type of non-null type cannot be a non-null type."):format((tostring(l_inspect_0(v11))))));
        end;
        return {
            kind = l_Kind_0.NON_NULL_TYPE, 
            type = v12
        };
    end;
end;
v4.astFromType = v10;
return v4;
