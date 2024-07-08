return {
    query = require(script:FindFirstAncestor("UserSearch").Parent.ApolloClient).gql("\tquery ProfilesInsights($userIds: [String] Int, $pageId: String) {\n\t\tprofilesInsights(userIds: $userIds, count: $count, pageId: $pageId) {\n\t\t\tid\n\t\t\tprofileInsights {\n\t\t\t\ttargetUserId\n\t\t\t\tisOfflineFrequents\n\t\t\t\tmutualFriends {\n\t\t\t\t\tid\n\t\t\t\t\tusername\n\t\t\t\t\tdisplayName\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t}\n"), 
    createPageId = function(v0)
        return "PROFILE_INSIGHTS_SEARCH_PAGE_ID" .. ":" .. v0;
    end
};
