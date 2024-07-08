local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_GetCurrentlyWearing_0 = v0.NetworkingCurrentlyWearing.GetCurrentlyWearing;
local l_GetItemDetails_0 = v0.NetworkingCurrentlyWearing.GetItemDetails;
return function(v3)
    return function(v4)
        return v4:dispatch(l_GetCurrentlyWearing_0.API(v3)):andThen(function(v5)
            return v4:dispatch(l_GetItemDetails_0.API(v5.responseBody.assetIds));
        end);
    end;
end;
