local v0 = require(script:FindFirstAncestor("Profile").Flags.SortCurrentlyWearingItemsIXP);
local v1 = 0;
local function _()
    v1 = v1 + 1;
    return (tostring(v1));
end;
return {
    mock = function()
        local v3 = {};
        v1 = v1 + 1;
        v3.id = tostring(v1);
        v3.assetType = "0";
        v3.name = "";
        return v3;
    end, 
    fromAsset = function(v4)
        local v5 = {
            id = tostring(v4.id), 
            assetType = tostring(v4.assetType), 
            name = v4.name
        };
        if v0.FFlagIsSetupEnabled() then
            v5.price = v4.price;
            v5.lowestResalePrice = v4.lowestResalePrice;
            v5.isOffSale = v4.isOffSale;
            v5.favoriteCount = v4.favoriteCount;
        end;
        return v5;
    end
};
