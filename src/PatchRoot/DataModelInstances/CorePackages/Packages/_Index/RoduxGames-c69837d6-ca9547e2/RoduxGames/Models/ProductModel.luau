local v0 = require(script:FindFirstAncestor("RoduxGames").Parent.t);
local v1 = {};
v1.new = function(v2)
    assert(v1.isValid(v2));
    v1.__index = v1;
    setmetatable(v2, v1);
    return v2;
end;
v1.mock = function(v3)
    local v4 = v3 or {};
    return (v1.new({
        productId = v4.productId or "productId", 
        sellerId = v4.sellerId or "sellerId", 
        price = v4.price or 666, 
        isForSale = v4.isForSale or true
    }));
end;
v1.format = function(v5)
    return (v1.new({
        productId = tostring(v5.productId), 
        sellerId = tostring(v5.sellerId), 
        isForSale = v5.isForSale or false, 
        price = v5.price or 0
    }));
end;
v1.isValid = v0.strictInterface({
    productId = v0.string, 
    sellerId = v0.string, 
    price = v0.number, 
    isForSale = v0.boolean
});
return v1;
