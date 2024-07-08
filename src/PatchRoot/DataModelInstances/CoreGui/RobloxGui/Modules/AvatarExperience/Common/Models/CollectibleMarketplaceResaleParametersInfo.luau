local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXResalePriceFloor);
return {
    mock = function()
        local v1 = {
            resalePercentageFee = 30, 
            minimumFee = 1
        };
        if v0() then
            v1.priceFloor = 0;
        end;
        return v1;
    end, 
    fromGetCollectibleMarketplaceResaleParameters = function(v2, v3)
        local v4 = {
            resalePercentageFee = v2.resalePercentageFee, 
            minimumFee = v2.minimumFee
        };
        if v0() then
            local l_resellableLimitedItemPriceFloors_0 = v2.resellableLimitedItemPriceFloors;
            if l_resellableLimitedItemPriceFloors_0 then
                local v6 = l_resellableLimitedItemPriceFloors_0[v3] and l_resellableLimitedItemPriceFloors_0[v3].priceFloor;
                if v6 then
                    v4.priceFloor = v6;
                end;
            end;
        end;
        return v4;
    end
};
