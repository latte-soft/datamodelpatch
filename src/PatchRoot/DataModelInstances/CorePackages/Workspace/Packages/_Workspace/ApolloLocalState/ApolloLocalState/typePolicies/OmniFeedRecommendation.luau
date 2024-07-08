return {
    keyFields = if not require(script:FindFirstAncestor("ApolloLocalState").Parent.SharedFlags).GetFFlagApolloClientFetchExperiences() then nil else {
        "contentId"
    }, 
    fields = {
        contentMetadata = {
            read = require(script.Parent.utils.makeDefaultReadPolicy)({})
        }
    }
};
