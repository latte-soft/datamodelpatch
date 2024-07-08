local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v6 = {};
local l_visit_0 = require(l_Parent_0.GraphQL).visit;
local l_ApolloLink_0 = require(script.Parent.Parent.core).ApolloLink;
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
local l_serializeFetchParameter_0 = require(script.Parent.serializeFetchParameter).serializeFetchParameter;
local l_selectURI_0 = require(script.Parent.selectURI).selectURI;
local l_parseAndCheckHttpResponse_0 = require(script.Parent.parseAndCheckHttpResponse).parseAndCheckHttpResponse;
local l_checkFetcher_0 = require(script.Parent.checkFetcher).checkFetcher;
local v14 = require(script.Parent.selectHttpOptionsAndBody);
local l_selectHttpOptionsAndBody_0 = v14.selectHttpOptionsAndBody;
local l_fallbackHttpConfig_0 = v14.fallbackHttpConfig;
local l_createSignalIfSupported_0 = require(script.Parent.createSignalIfSupported).createSignalIfSupported;
local l_rewriteURIForGET_0 = require(script.Parent.rewriteURIForGET).rewriteURIForGET;
local l_fromError_0 = require(script.Parent.Parent.utils).fromError;
v6.createHttpLink = function(v20)
    local l_v20_0 = v20;
    if l_v20_0 == nil then
        l_v20_0 = {};
    end;
    local v22 = l_v20_0.uri ~= nil and l_v20_0.uri or "/graphql";
    local l_fetch_0 = l_v20_0.fetch;
    local l_includeExtensions_0 = l_v20_0.includeExtensions;
    local l_useGETForQueries_0 = l_v20_0.useGETForQueries;
    local v26 = l_v20_0.includeUnusedVariables ~= nil and (l_v20_0.includeUnusedVariables or false);
    local v27 = l_Object_0.assign({}, l_v20_0, {
        uri = l_Object_0.None, 
        fetch = l_Object_0.None, 
        includeExtensions = l_Object_0.None, 
        useGETForQueries = l_Object_0.None, 
        includeUnusedVariables = l_Object_0.None
    });
    l_checkFetcher_0(l_fetch_0);
    if not l_Boolean_0.toJSBoolean(l_fetch_0) then
        l_fetch_0 = _G.fetch;
    end;
    local v28 = {
        http = {
            includeExtensions = l_includeExtensions_0
        }, 
        options = v27.fetchOptions, 
        credentials = v27.credentials, 
        headers = v27.headers
    };
    return l_ApolloLink_0.new(function(_, v30)
        local v31 = l_selectURI_0(v30, v22);
        local v32 = v30:getContext();
        local v33 = {};
        if l_Boolean_0.toJSBoolean(v32.clientAwareness) then
            local l_name_0 = v32.clientAwareness.name;
            local l_version_0 = v32.clientAwareness.version;
            if l_Boolean_0.toJSBoolean(l_name_0) then
                v33["apollographql-client-name"] = l_name_0;
            end;
            if l_Boolean_0.toJSBoolean(l_version_0) then
                v33["apollographql-client-version"] = l_version_0;
            end;
        end;
        local v36 = l_selectHttpOptionsAndBody_0(v30, l_fallbackHttpConfig_0, v28, {
            http = v32.http, 
            options = v32.fetchOptions, 
            credentials = v32.credentials, 
            headers = l_Object_0.assign({}, v33, v32.headers)
        });
        local l_options_0 = v36.options;
        local l_body_0 = v36.body;
        if not (not (l_body_0.variables ~= nil) or v26) then
            local v39 = l_Set_0.new(l_Object_0.keys(l_body_0.variables));
            local l_v39_0 = v39 --[[ copy: 10 -> 15 ]];
            l_visit_0(v30.query, {
                Variable = function(_, v42, _, v44)
                    if l_Boolean_0.toJSBoolean(v44) and v44.kind ~= "VariableDefinition" then
                        l_v39_0:delete(v42.name.value);
                    end;
                end
            });
            if l_Boolean_0.toJSBoolean(v39.size) then
                l_body_0.variables = l_Object_0.assign({}, l_body_0.variables);
                v39:forEach(function(v45)
                    l_body_0.variables[v45] = nil;
                end);
            end;
        end;
        local v46 = nil;
        if not l_Boolean_0.toJSBoolean(l_options_0.signal) then
            local v47 = l_createSignalIfSupported_0();
            local l_controller_0 = v47.controller;
            local l_signal_0 = v47.signal;
            v46 = l_controller_0;
            if l_Boolean_0.toJSBoolean(v46) then
                l_options_0.signal = l_signal_0;
            end;
        end;
        local function v52(v50)
            local v51 = false;
            if v50.kind == "OperationDefinition" then
                v51 = v50.operation == "mutation";
            end;
            return v51;
        end;
        if not (not l_Boolean_0.toJSBoolean(l_useGETForQueries_0) or l_Array_0.some(v30.query.definitions, v52)) then
            l_options_0.method = "GET";
        end;
        if l_options_0.method == "GET" then
            local v53 = l_rewriteURIForGET_0(v31, l_body_0);
            local l_newURI_0 = v53.newURI;
            local l_parseError_0 = v53.parseError;
            if not l_Boolean_0.toJSBoolean(l_parseError_0) then
                v31 = l_newURI_0;
            else
                return l_fromError_0(l_parseError_0);
            end;
        else
            local l_status_0, l_result_0 = pcall(function()
                l_options_0.body = l_serializeFetchParameter_0(l_body_0, "Payload");
            end);
            if not l_status_0 then
                return l_fromError_0(l_result_0);
            end;
        end;
        return l_Observable_0.new(function(v58)
            l_fetch_0(v31, l_options_0):andThen(function(v59)
                v30:setContext({
                    response = v59
                });
                return v59;
            end):andThen(l_parseAndCheckHttpResponse_0(v30)):andThen(function(v60)
                v58:next(v60);
                v58:complete();
                return v60;
            end):catch(function(v61)
                if v61.name == "AbortError" then
                    return ;
                else
                    if not ((not l_Boolean_0.toJSBoolean(v61.result) or not l_Boolean_0.toJSBoolean(v61.result.errors)) or not l_Boolean_0.toJSBoolean(v61.result.data)) then
                        v58:next(v61.result);
                    end;
                    v58:error(v61);
                    return ;
                end;
            end);
            return function()
                if l_Boolean_0.toJSBoolean(v46) then
                    v46:abort();
                end;
            end;
        end);
    end);
end;
return v6;
