local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local l_buildASTSchema_0 = require(l_Parent_0.GraphQL).buildASTSchema;
local _ = require(script.Parent.types);
local l_getDocumentNodeFromSchema_0 = require(script.Parent["print-schema-with-directives"]).getDocumentNodeFromSchema;
local function v10(v8, v9)
    return l_buildASTSchema_0(l_getDocumentNodeFromSchema_0(v8), l_Object_0.assign({}, not not l_Boolean_0.toJSBoolean(v9) and v9 or {}));
end;
v4.fixSchemaAst = function(v11, v12)
    local v13 = nil;
    if not (l_Boolean_0.toJSBoolean(v11.astNode) and l_Boolean_0.toJSBoolean(v11.extensionASTNodes)) then
        v13 = v10(v11, v12);
    end;
    if not ((l_Boolean_0.toJSBoolean(v11.astNode) or not v13) or not l_Boolean_0.toJSBoolean(v13.astNode)) then
        v11.astNode = v13.astNode;
    end;
    if not ((l_Boolean_0.toJSBoolean(v11.extensionASTNodes) or not v13) or not l_Boolean_0.toJSBoolean(v13.astNode)) then
        v11.extensionASTNodes = v13.extensionASTNodes;
    end;
    return v11;
end;
return v4;
