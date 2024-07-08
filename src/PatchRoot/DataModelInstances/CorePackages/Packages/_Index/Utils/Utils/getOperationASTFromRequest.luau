local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v4 = {};
local l_getOperationAST_0 = require(l_Parent_0.GraphQL).getOperationAST;
local _ = require(script.Parent.Interfaces);
local l_memoize1_0 = require(script.Parent.memoize).memoize1;
local function v11(v8, v9)
    local v10 = l_getOperationAST_0(v8, v9);
    if not l_Boolean_0.toJSBoolean(v10) then
        error(l_Error_0.new(("Cannot infer operation %s"):format((tostring(not not l_Boolean_0.toJSBoolean(v9) and v9 or "")))));
    end;
    return v10;
end;
v4.getOperationASTFromDocument = v11;
v4.getOperationASTFromRequest = l_memoize1_0(function(v12)
    return (v11(v12.document, v12.operationName));
end);
return v4;
