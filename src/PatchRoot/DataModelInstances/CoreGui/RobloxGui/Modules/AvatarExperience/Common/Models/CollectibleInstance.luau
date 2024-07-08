return {
    fromGetCollectibleItemInstances = function(v0)
        return {
            collectibleInstanceId = v0.collectibleInstanceId, 
            collectibleItemId = v0.collectibleItemId, 
            collectibleProductId = v0.collectibleProductId, 
            serialNumber = v0.serialNumber, 
            isHeld = v0.isHeld, 
            saleState = v0.saleState, 
            price = v0.price
        };
    end, 
    fromGetCollectibleResellers = function(v1, v2)
        return {
            collectibleInstanceId = v1.collectibleItemInstanceId, 
            collectibleItemId = v2, 
            collectibleProductId = v1.collectibleProductId, 
            serialNumber = v1.serialNumber, 
            price = v1.price, 
            seller = if not v1.seller then nil else {
                sellerId = v1.seller.sellerId, 
                sellerType = v1.seller.sellerType, 
                name = v1.seller.name, 
                hasVerifiedBadge = v1.seller.hasVerifiedBadge
            }
        };
    end
};
