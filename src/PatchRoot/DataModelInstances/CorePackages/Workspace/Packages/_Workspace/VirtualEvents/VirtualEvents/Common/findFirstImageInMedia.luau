local _ = require(script:FindFirstAncestor("VirtualEvents").Parent.GraphQLServer);
return function(v1)
    for _, v3 in v1, nil, nil do
        if not (not (v3.assetType == "Image") or not v3.imageId) then
            return ("rbxassetid://%s"):format(v3.imageId);
        end;
    end;
    return nil;
end;
