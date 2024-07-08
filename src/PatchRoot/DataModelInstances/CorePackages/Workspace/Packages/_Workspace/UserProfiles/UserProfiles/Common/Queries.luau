local l_queries_0 = require(script:FindFirstAncestor("UserProfiles").Parent.ApolloLocalState).queries;
return {
    userProfilesCombinedNameByUserIds = l_queries_0.userProfilesCombinedNameByUserIds, 
    userProfilesCombinedNameAndAliasByUserIds = l_queries_0.userProfilesCombinedNameAndAliasByUserIds, 
    userProfilesCombinedNameAndUsernameByUserIds = l_queries_0.userProfilesCombinedNameAndUsernameByUserIds, 
    userProfilesAllNamesByUserIds = l_queries_0.userProfilesAllNamesByUserIds, 
    userProfilesDisplayNameAndUsernameByUserIds = l_queries_0.userProfilesDisplayNameAndUsernameByUserIds, 
    userProfilesDisplayUserPlatformNamesByUserIds = l_queries_0.userProfilesDisplayUserPlatformNamesByUserIds, 
    userProfilesCombinedAndPlatformByUserIds = l_queries_0.userProfilesCombinedAndPlatformByUserIds, 
    userProfilesPlatformNamesByUserIds = l_queries_0.userProfilesPlatformNamesByUserIds, 
    userProfilesPlatformProfileIdsByUserIds = l_queries_0.userProfilesPlatformProfileIdsByUserIds
};
