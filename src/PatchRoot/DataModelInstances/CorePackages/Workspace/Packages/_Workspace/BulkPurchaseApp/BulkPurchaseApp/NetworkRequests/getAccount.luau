local v0 = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Http);
return function(v1)
    return v1(("%s/users/authenticated/app-launch-info"):format(v0.Url.USERS_URL), "GET");
end;
