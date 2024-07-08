local l_CorePackages_0 = game:GetService("CorePackages");
local l_gql_0 = require(l_CorePackages_0.Packages.ApolloClient).gql;
local l_SetGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.SetGameIcons;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local v6 = require(script.Parent.parseGameIconsFromGraphqlData);
local v7 = l_gql_0("\tquery GetExperienceThumbnails($universeIds: [String) {\n\t\texperienceThumbnails(universeIds: $universeIds) {\n\t\t\tuniverseId\n\t\t\tthumbnails {\n\t\t\t\turl\n\t\t\t}\n\t\t}\n\t}\n");
return function(v8, v9, v10)
    return (v8:query({
        query = v7, 
        variables = {
            universeIds = if not v10.Game then {} else v3.Dictionary.keys(v10.Game)
        }, 
        fetchPolicy = "network-only"
    }):andThen(function(v11)
        v9:dispatch(l_SetGameIcons_0((v6(v11.data.experienceThumbnails or {}))));
    end));
end;
