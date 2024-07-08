local l_MockId_0 = require(game:GetService("CorePackages").Workspace.Packages.UnitTestHelpers).MockId;
return {
    mock = function()
        return {
            userAssetId = tostring(l_MockId_0()), 
            userId = tostring(l_MockId_0()), 
            userName = "", 
            sellerHasVerifiedBadge = false, 
            serialNumber = tostring(l_MockId_0()), 
            priceInRobux = 0
        };
    end, 
    fromSellPageAndResellers = function(v1)
        local v2 = {
            userAssetId = tostring(v1.userAssetId)
        };
        if v1.seller then
            v2.userId = tostring(v1.seller.id);
            v2.userName = v1.seller.name;
            v2.sellerHasVerifiedBadge = v1.seller.hasVerifiedBadge;
        end;
        v2.serialNumber = not not v1.serialNumber and tostring(v1.serialNumber) or nil;
        v2.priceInRobux = v1.price;
        v2.isOnHold = v1.isOnHold;
        return v2;
    end, 
    fromPriceInRobux = function(v3, v4)
        return {
            userAssetId = tostring(v3), 
            priceInRobux = v4
        };
    end
};
