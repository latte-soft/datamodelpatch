local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Boolean_0 = require(l_Parent_1.LuauPolyfill).Boolean;
local _ = require(l_Parent_1.GraphQL);
local v5 = require(l_Parent_0.jsutils.equal);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(script.Parent.Parent.Parent.core);
local v8 = require(script.Parent.Parent.parser);
local l_parser_0 = v8.parser;
local l_operationName_0 = v8.operationName;
local _ = require(script.Parent.Parent.types.types);
local v12 = {};
v12.__index = v12;
v12.new = function(v13, v14)
    return (setmetatable({
        options = not not l_Boolean_0.toJSBoolean(v13) and v13 or {}, 
        context = not not l_Boolean_0.toJSBoolean(v14) and v14 or {}
    }, v12));
end;
v12.getOptions = function(v15)
    return v15.options;
end;
v12.setOptions = function(v16, v17, v18)
    if v18 == nil then
        v18 = false;
    end;
    if not (not v18 or v5(v16.options, v17)) then
        v16.previousOptions = v16.options;
    end;
    v16.options = v17;
end;
v12.unmount = function(v19)
    v19.isMounted = false;
end;
v12.refreshClient = function(v20)
    local v21 = not not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v20.options) then v20.options else v20.options.client) and if not l_Boolean_0.toJSBoolean(v20.options) then v20.options else v20.options.client or if l_Boolean_0.toJSBoolean(v20.context) then v20.context.client else v20.context;
    l_invariant_0(l_Boolean_0.toJSBoolean(v21), "Could not find \"client\" in the context or passed in as an option. " .. "Wrap the root component in an <ApolloProvider>, or pass an " .. "ApolloClient instance in via options.");
    local v22 = false;
    if v21 ~= v20.client then
        v22 = true;
        v20.client = v21;
        v20:cleanup();
    end;
    return {
        client = v20.client, 
        isNew = v22
    };
end;
v12.verifyDocumentType = function(_, v24, v25)
    local v26 = l_parser_0(v24);
    local v27 = l_operationName_0(v25);
    l_invariant_0(v26.type == v25, ("Running a %s requires a graphql "):format(v27) .. ("%s, but a %s was used instead."):format(v27, (l_operationName_0(v26.type))));
end;
v0.OperationData = v12;
return v0;
