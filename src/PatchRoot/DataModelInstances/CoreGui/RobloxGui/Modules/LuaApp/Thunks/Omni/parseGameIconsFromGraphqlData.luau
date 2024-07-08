local _ = require(game:GetService("CorePackages").Workspace.Packages.GraphQLServer);
return function(v1)
    local v2 = {};
    for _, v4 in v1, nil, nil do
        local v5 = if not not v4.thumbnails and #v4.thumbnails > 0 then v4.thumbnails[1].url else nil;
        if v5 then
            v2[v4.universeId] = {
                universeId = v4.universeId, 
                state = "Completed", 
                url = v5, 
                size = "150x150"
            };
        end;
    end;
    return v2;
end;
