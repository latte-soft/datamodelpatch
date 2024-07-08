local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v2 = require(l_Parent_0.GraphQL);
local v3 = require(l_Parent_0.Promise);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local _ = require(l_Parent_0.DataLoader);
local v7 = require(script.Parent.Response);
local v8 = require(script.Parent.graphql);
local l_typeDefs_0 = v8.typeDefs;
local l_resolvers_0 = v8.resolvers;
local l_dataLoaders_0 = v8.dataLoaders;
local v12 = require(script.Parent.schemaUtils.buildTypeResolver);
local v13 = require(script.Parent.schemaUtils.buildRootValue);
local v14 = require(script.Parent.schemaUtils.buildFieldResolver);
local v15 = require(script.Parent.schemaUtils.addMockResolvers);
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchThumbnails;
local l_getFFlagUserProfilesDataLoaderEnabled_0 = require(l_Parent_0.SharedFlags).getFFlagUserProfilesDataLoaderEnabled;
local v18 = {};
v18.__index = v18;
local v19 = {
    thumbnails = {
        makeDataLoader = l_dataLoaders_0.makeThumbnailsDataLoader, 
        dataLoaderOptions = {
            batchSize = 100, 
            batchDelay = 0
        }
    }
};
v18.new = function(v20)
    local v21 = {
        port = not v20.port and 4000 or v20.port, 
        schema = v2.buildSchema(if not v20.typeDefs then l_typeDefs_0 else v20.typeDefs)
    };
    local v22 = if not v20.resolvers then l_resolvers_0 else v20.resolvers;
    if type(v20.mockResolvers) == "table" then
        v22 = v15(v22, v20.mockResolvers);
    end;
    v21.rootValue = v13(v22);
    v21.typeResolver = v12(v22);
    v21.fieldResolver = v14(v22);
    v21.fetchImpl = if not v20.fetchImpl then l_fetch_0 else v20.fetchImpl;
    if l_GetFFlagApolloClientFetchThumbnails_0() then
        v21.dataLoaderInitializers = l_Object_0.assign({}, v19, v20.dataLoaderInitializers or {});
    end;
    if l_getFFlagUserProfilesDataLoaderEnabled_0() then
        v21.clientLoaders = l_Object_0.assign({}, {
            userProfiles = l_dataLoaders_0.userProfilesDataLoader.new()
        }, v20.dataLoaderInitializers or {});
    end;
    setmetatable(v21, v18);
    return v21;
end;
v18.fetchLocal = function(v23, v24)
    local v25 = if not v24 then {} else l_HttpService_0:JSONDecode(v24.body);
    local v26 = {};
    if l_GetFFlagApolloClientFetchThumbnails_0() then
        for v27, v28 in v23.dataLoaderInitializers, nil, nil do
            v26[v27] = v28.makeDataLoader(v23.fetchImpl, v28.dataLoaderOptions);
        end;
    end;
    return v3.new(function(v29, _)
        v2.graphql({
            schema = v23.schema, 
            source = v25.query or v25.mutation, 
            rootValue = v23.rootValue, 
            contextValue = {
                fetchImpl = v23.fetchImpl, 
                dataLoaders = if not l_getFFlagUserProfilesDataLoaderEnabled_0() then v26 else l_Object_0.assign({}, v26, v23.clientLoaders)
            }, 
            typeResolver = v23.typeResolver, 
            fieldResolver = v23.fieldResolver, 
            variableValues = v25.variables
        }):andThen(function(v31)
            v29(v7.new(v31));
            if l_GetFFlagApolloClientFetchThumbnails_0() then
                for _, v33 in v26, nil, nil do
                    v33:clearAll();
                end;
            end;
        end);
    end);
end;
return v18;
