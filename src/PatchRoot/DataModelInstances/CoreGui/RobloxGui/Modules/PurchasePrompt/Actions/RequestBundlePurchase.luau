local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.makeActionCreator);
if not require(l_Parent_0.Parent.Flags.FFlagEnableUGC4ACollectiblePurchaseSupport) then
    return v1(script.Name, "id");
else
    return v1(script.Name, "id", "idempotencyKey", "purchaseAuthToken", "collectibleItemId", "collectibleItemInstanceId", "collectibleProductId", "expectedPrice");
end;
