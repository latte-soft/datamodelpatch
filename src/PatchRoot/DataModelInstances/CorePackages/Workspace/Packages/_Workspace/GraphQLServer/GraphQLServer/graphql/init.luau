local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
return {
    typeDefs = require(l_Parent_0.GraphQL).print((require(l_Parent_0.GraphqlToolsMerge).mergeTypeDefs((require(script.luaTypeDefs))))), 
    resolvers = require(script.resolvers), 
    generatedTypes = require(script.generatedTypes), 
    dataLoaders = require(script.dataLoaders), 
    mocks = require(script.mocks)
};
