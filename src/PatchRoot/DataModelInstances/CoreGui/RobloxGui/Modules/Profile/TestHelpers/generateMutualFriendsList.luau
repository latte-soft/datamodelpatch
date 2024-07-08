local _ = require(game:GetService("CorePackages").Workspace.Packages.GraphQLServer);
return function(v1)
    local v2 = {};
    if v1 then
        for v3 = 1, v1 do
            table.insert(v2, {
                __typename = "MutualFriend", 
                displayName = ("%*_displayName"):format(v3), 
                id = ("%*"):format(v3), 
                username = ("%*_username"):format(v3)
            });
        end;
        return v2;
    else
        return v2;
    end;
end;
