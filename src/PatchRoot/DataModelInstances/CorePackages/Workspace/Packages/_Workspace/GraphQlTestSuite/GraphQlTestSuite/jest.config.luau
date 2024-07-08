local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.GraphQLServer)["jest.config"], 
        require(l_Parent_0.RobloxApolloClient)["jest.config"], 
        require(l_Parent_0.GraphQlShared)["jest.config"], 
        require(l_Parent_0.ApolloLocalState)["jest.config"]
    }
};
