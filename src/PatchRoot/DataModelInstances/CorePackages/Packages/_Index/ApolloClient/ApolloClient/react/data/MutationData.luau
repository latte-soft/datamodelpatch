local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.jsutils.equal);
local l_DocumentType_0 = require(script.Parent.Parent.parser).DocumentType;
local l_ApolloError_0 = require(l_Parent_0.errors).ApolloError;
local _ = require(script.Parent.Parent.types.types);
local l_OperationData_0 = require(script.Parent.OperationData).OperationData;
local l_mergeOptions_0 = require(l_Parent_0.core).mergeOptions;
local _ = require(l_Parent_0.link.core);
local v12 = setmetatable({}, {
    __index = l_OperationData_0
});
v12.__index = v12;
v12.new = function(v13)
    local v14 = l_OperationData_0.new(v13.options, v13.context);
    v14.runMutation = function(v15)
        if v15 == nil then
            v15 = {};
        end;
        v14:onMutationStart();
        local v16 = v14:generateNewMutationId();
        return v14:mutate(v15):andThen(function(v17)
            v14:onMutationCompleted(v17, v16);
            return v17;
        end):catch(function(v18)
            local v19 = v14:getOptions();
            local l_onError_0 = v19.onError;
            v14:onMutationError(v18, v16);
            if not l_Boolean_0.toJSBoolean(l_onError_0) then
                error(v18);
                return ;
            else
                l_onError_0(v19, v18);
                return {
                    data = nil, 
                    errors = v18
                };
            end;
        end);
    end;
    v14:verifyDocumentType(v13.options.mutation, l_DocumentType_0.Mutation);
    v14.result = v13.result;
    v14.setResult = v13.setResult;
    v14.mostRecentMutationId = 0;
    return (setmetatable(v14, v12));
end;
v12.execute = function(v21, v22)
    v21.isMounted = true;
    v21:verifyDocumentType(v21:getOptions().mutation, l_DocumentType_0.Mutation);
    return {
        v21.runMutation, 
        l_Object_0.assign({}, v22, {
            client = v21:refreshClient().client
        })
    };
end;
v12.afterExecute = function(v23)
    v23.isMounted = true;
    return function(...)
        return v23:unmount(...);
    end;
end;
v12.cleanup = function(_)
end;
v12.mutate = function(v25, v26)
    return v25:refreshClient().client:mutate(l_mergeOptions_0(v25:getOptions(), v26));
end;
v12.onMutationStart = function(v27)
    if not (v27.result.loading or v27:getOptions().ignoreResults) then
        v27:updateResult({
            loading = true, 
            error = nil, 
            data = nil, 
            called = true
        });
    end;
end;
v12.onMutationCompleted = function(v28, v29, v30)
    local v31 = v28:getOptions();
    local l_onCompleted_0 = v31.onCompleted;
    local l_ignoreResults_0 = v31.ignoreResults;
    local l_data_0 = v29.data;
    local l_errors_0 = v29.errors;
    local v36 = if not not l_errors_0 and #l_errors_0 > 0 then l_ApolloError_0.new({
        graphQLErrors = l_errors_0
    }) else nil;
    local function _()
        if not l_Boolean_0.toJSBoolean(l_onCompleted_0) then
            return nil;
        else
            return l_onCompleted_0(l_data_0);
        end;
    end;
    if not (not v28:isMostRecentMutation(v30) or l_ignoreResults_0) then
        v28:updateResult({
            called = true, 
            loading = false, 
            data = l_data_0, 
            error = v36
        });
    end;
    if not l_Boolean_0.toJSBoolean(l_onCompleted_0) then
        return ;
    else
        local _ = l_onCompleted_0(l_data_0);
        return ;
    end;
end;
v12.onMutationError = function(v39, v40, v41)
    if v39:isMostRecentMutation(v41) then
        v39:updateResult({
            loading = false, 
            error = v40, 
            data = nil, 
            called = true
        });
    end;
end;
v12.generateNewMutationId = function(v42)
    v42.mostRecentMutationId = v42.mostRecentMutationId + 1;
    return v42.mostRecentMutationId;
end;
v12.isMostRecentMutation = function(v43, v44)
    return v43.mostRecentMutationId == v44;
end;
v12.updateResult = function(v45, v46)
    if not v45.isMounted or v45.previousResult and v5(v45.previousResult, v46) then
        return nil;
    else
        v45:setResult(v46);
        v45.previousResult = v46;
        return v46;
    end;
end;
v0.MutationData = v12;
return v0;
