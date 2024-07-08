local l_gql_0 = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient).gql;
local v1 = l_gql_0("\tquery UserProfiles($userIds: [String] $userIds) {\n\t\t\tid\n\t\t\tnames {\n\t\t\t\tcombinedName\n\t\t\t\tusername\n\t\t\t\talias\n\t\t\t\tdisplayName\n\t\t\t\tcontactName\n\t\t\t\tplatformName\n\t\t\t}\n\t\t\tplatformProfileId\n\t\t}\n\t}\n");
local v2 = l_gql_0("\tquery UserProfiles($userIds: [String] $userIds) {\n\t\t\tid\n\t\t\tnames {\n\t\t\t\tcombinedName\n\t\t\t\tusername\n\t\t\t\talias\n\t\t\t\tdisplayName\n\t\t\t\tcontactName\n\t\t\t\tplatformName\n\t\t\t}\n\t\t}\n\t}\n");
if not game:GetEngineFeature("PlatformFriendsService") or not game:GetEngineFeature("PlatformFriendsProfile") then
    return v2;
else
    return v1;
end;
