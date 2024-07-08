return (require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient).gql("\tquery UserProfiles($userIds: [String] $userIds) {\n\t\t\tid\n\t\t\tplatformProfileId\n\t\t}\n\t}\n"));
