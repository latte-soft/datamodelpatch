return {
    new = function()
        return {};
    end, 
    fromGetCollectibleItemInstances = function(v0)
        return {
            collectibleInstanceId = v0.collectibleInstanceId, 
            collectibleItemId = v0.collectibleItemId, 
            collectibleProductId = v0.collectibleProductId, 
            serialNumber = v0.serialNumber, 
            instanceState = v0.instanceState, 
            saleState = v0.saleState, 
            price = v0.price
        };
    end
};
