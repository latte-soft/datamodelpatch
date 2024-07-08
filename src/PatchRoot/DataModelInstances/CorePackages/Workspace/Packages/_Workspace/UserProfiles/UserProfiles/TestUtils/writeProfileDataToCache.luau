local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Queries);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.ApolloClient);
return function(v5, v6, v7)
    local v8 = if not not v7 and v7.query then v7.query else v2.userProfilesAllNamesByUserIds;
    for v9, v10 in v6, nil, nil do
        v5:writeQuery({
            variables = {
                userIds = v9
            }, 
            query = v8, 
            data = {
                userProfiles = {
                    {
                        __typename = "UserProfile", 
                        id = v9, 
                        names = v3.Dictionary.join({
                            __typename = "Names", 
                            alias = "", 
                            contactName = "", 
                            displayName = "", 
                            username = "", 
                            platformName = ""
                        }, v10)
                    }
                }
            }
        });
    end;
end;
