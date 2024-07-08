local l_makeVar_0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient).makeVar;
return {
    nextPageToken = l_makeVar_0(nil), 
    omniSessionId = l_makeVar_0(""), 
    localSorts = l_makeVar_0({}), 
    homeGameSorts = l_makeVar_0({}), 
    supportedTreatmentTypes = l_makeVar_0({})
};
