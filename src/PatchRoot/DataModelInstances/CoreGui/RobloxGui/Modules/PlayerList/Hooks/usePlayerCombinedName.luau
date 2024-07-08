local l_CorePackages_0 = game:GetService("CorePackages");
local l_useQuery_0 = require(l_CorePackages_0.Packages.ApolloClient).useQuery;
local v2 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
return function(v3, v4)
    local v5 = l_useQuery_0(v2.Queries.userProfilesCombinedNameByUserIds, {
        variables = {
            userIds = {
                v3
            }
        }
    });
    return if not v5.data then nil else v2.Selectors.getCombinedNameFromId(v5.data, v3) or v4;
end;
