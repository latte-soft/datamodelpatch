local v0 = require(script:FindFirstAncestor("GameProductInfoRodux").Parent.Result);
local v1 = {
    new = function()
        return {};
    end
};
v1.mock = function(v2)
    local v3 = v1.new();
    v3.universeId = v2;
    v3.isForSale = true;
    v3.productId = 12345;
    v3.price = 5;
    v3.sellerId = 6789;
    return v3;
end;
v1.fromJsonData = function(v4)
    if not (((type(v4.universeId) == "number" and type(v4.isForSale) == "boolean") and type(v4.productId) == "number") and type(v4.price) == "number") or type(v4.sellerId) ~= "number" then
        return v0.error("invalid data type");
    else
        local v5 = v1.new();
        v5.universeId = tostring(v4.universeId);
        v5.isForSale = v4.isForSale;
        v5.productId = v4.productId;
        v5.price = v4.price;
        v5.sellerId = v4.sellerId;
        return v0.success(v5);
    end;
end;
return v1;
