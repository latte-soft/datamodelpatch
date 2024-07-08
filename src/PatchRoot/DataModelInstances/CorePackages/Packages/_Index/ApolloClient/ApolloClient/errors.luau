local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_toJSBoolean_0 = require(script.Parent.utilities.globals.null).toJSBoolean;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_DEV_0 = require(l_Parent_0.utilities).DEV;
l_invariant_0(typeof(l_DEV_0) == "boolean", (tostring(l_DEV_0)));
local _ = require(l_Parent_1.GraphQL);
local l_isNonEmptyArray_0 = require(l_Parent_0.utilities).isNonEmptyArray;
local v12 = require(l_Parent_0.luaUtils.hasOwnProperty);
local v13 = setmetatable({}, {
    __index = l_Error_0
});
v13.__index = v13;
v0.isApolloError = function(v14)
    return v12(v14, "graphQLErrors");
end;
local function v23(v15)
    local v16 = "";
    if not (not (l_isNonEmptyArray_0(v15.graphQLErrors) and l_isNonEmptyArray_0(v15.graphQLErrors)) and not l_isNonEmptyArray_0(v15.clientErrors)) then
        local l_concat_0 = l_Array_0.concat;
        local v18 = not not l_Boolean_0.toJSBoolean(v15.graphQLErrors) and v15.graphQLErrors or {};
        local v19 = not not l_Boolean_0.toJSBoolean(v15.clientErrors) and v15.clientErrors or {};
        for _, v21 in pairs((l_concat_0(v18, v19))) do
            v16 = v16 .. ("%s\n"):format(not l_toJSBoolean_0(v21) and "Error message not found." or v21.message);
        end;
    end;
    if v15.networkError ~= nil then
        local l_networkError_0 = v15.networkError;
        v16 = v16 .. ("%s\n"):format(if typeof(l_networkError_0) == "string" then l_networkError_0 else if l_networkError_0.message then l_networkError_0.message else l_networkError_0.error);
    end;
    return (string.gsub(v16, "\n$", ""));
end;
v13.new = function(v24)
    local l_graphQLErrors_0 = v24.graphQLErrors;
    local l_clientErrors_0 = v24.clientErrors;
    local l_networkError_1 = v24.networkError;
    local l_errorMessage_0 = v24.errorMessage;
    local l_extraInfo_0 = v24.extraInfo;
    local v30 = l_Error_0.new(l_errorMessage_0);
    v30.graphQLErrors = not not l_Boolean_0.toJSBoolean(l_graphQLErrors_0) and l_graphQLErrors_0 or {};
    v30.clientErrors = not not l_Boolean_0.toJSBoolean(l_clientErrors_0) and l_clientErrors_0 or {};
    v30.networkError = not not l_Boolean_0.toJSBoolean(l_networkError_1) and l_networkError_1 or nil;
    v30.message = not not l_Boolean_0.toJSBoolean(l_errorMessage_0) and l_errorMessage_0 or v23(v30);
    v30.extraInfo = l_extraInfo_0;
    return (setmetatable(v30, v13));
end;
v0.ApolloError = v13;
return v0;
