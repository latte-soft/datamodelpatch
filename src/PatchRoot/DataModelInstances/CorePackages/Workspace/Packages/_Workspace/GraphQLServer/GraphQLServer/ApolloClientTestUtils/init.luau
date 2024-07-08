local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v2 = require(l_Parent_0.ApolloClient);
local l_ApolloClient_0 = v2.ApolloClient;
local l_HttpLink_0 = v2.HttpLink;
local l_InMemoryCache_0 = v2.InMemoryCache;
local l_typePolicies_0 = require(l_Parent_0.ApolloLocalState).typePolicies;
local v7 = require(script.Parent.Server);
local l_buildFetch_0 = require(l_Parent_0.Fetch).buildFetch;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local _ = require(script.ApolloClientTestUtilsTypes);
return {
    mockApolloClient = function(v11)
        local v17 = v7.new({
            mockResolvers = v11.mockResolvers, 
            fetchImpl = l_buildFetch_0({
                RequestInternal = function(_, v13)
                    return {
                        Start = function(_, v15)
                            local v16 = nil;
                            v16 = if not not v11.responseMap and v11.responseMap[v13.Url] then v11.responseMap[v13.Url] else v11.defaultResponse or {};
                            v15(true, {
                                Body = l_HttpService_0:JSONEncode(v16.Body), 
                                Success = not (v16.Success ~= nil) or v16.Success, 
                                StatusCode = not v16.StatusCode and 200 or v16.StatusCode, 
                                StatusMessage = not v16.StatusMessage and "OK" or v16.StatusMessage, 
                                Headers = if not v16.Headers then {} else v16.Headers
                            });
                            if v11.responseSpy then
                                v11.responseSpy(v13);
                            end;
                        end
                    };
                end
            })
        });
        return (l_ApolloClient_0.new({
            cache = l_InMemoryCache_0.new({
                typePolicies = l_typePolicies_0
            }), 
            link = l_HttpLink_0.new({
                uri = "/api", 
                fetch = function(_, v19)
                    return v17:fetchLocal(v19);
                end
            })
        }));
    end, 
    mockHttpService = function(v20)
        return {
            RequestInternal = function(_, v22)
                return {
                    Start = function(_, v24)
                        local v25 = nil;
                        v25 = if not not v20.responseMap and v20.responseMap[v22.Url] then v20.responseMap[v22.Url] else v20.defaultResponse or {};
                        v24(true, {
                            Body = l_HttpService_0:JSONEncode(v25.Body), 
                            Success = not (v25.Success ~= nil) or v25.Success, 
                            StatusCode = not v25.StatusCode and 200 or v25.StatusCode, 
                            StatusMessage = not v25.StatusMessage and "OK" or v25.StatusMessage, 
                            Headers = if not v25.Headers then {} else v25.Headers
                        });
                        if v20.responseSpy then
                            v20.responseSpy(v22);
                        end;
                    end
                };
            end
        };
    end, 
    appendApolloClientToReducer = function(v26, v27)
        return function(v28, v29)
            return (l_Object_0.assign(table.clone((v26(v28 or {}, v29))), {
                ApolloClient = {
                    apolloClient = v27
                }
            }));
        end;
    end
};
