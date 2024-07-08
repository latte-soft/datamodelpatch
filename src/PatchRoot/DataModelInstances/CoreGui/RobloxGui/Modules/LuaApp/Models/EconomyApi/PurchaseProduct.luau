local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck);
local v1 = {
    new = function()
        return {};
    end
};
v1.fromJsonData = function(v2)
    local v3 = v1.new();
    v0.isType(v2, "table", "PurchaseProduct.fromJsonData's jsonData");
    v0.isType(v2.purchased, "boolean", "PurchaseProduct.fromJsonData's jsonData.purchased");
    v0.isType(v2.productId, "number", "PurchaseProduct.fromJsonData's jsonData.productId");
    v0.isTypeOrNil(v2.title, "string", "PurchaseProduct.fromJsonData's jsonData.title");
    v0.isTypeOrNil(v2.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId");
    v0.isTypeOrNil(v2.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice");
    v0.isTypeOrNil(v2.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode");
    if type(v2) == "table" then
        v3.purchased = v2.purchased == true;
        v3.productId = tonumber(v2.productId);
        v3.title = v2.title;
        v3.showDivId = v2.showDivId;
        v3.shortfallPrice = v2.shortfallPrice;
        v3.statusCode = v2.statusCode;
    end;
    return v3;
end;
return v1;
