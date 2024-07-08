local v0 = require(script.Parent.Enum.PurchaseErrors);
local function _(v1, v2)
    return tostring(v1) .. "." .. tostring(v2);
end;
local v4 = {
    [tostring(nil) .. "." .. tostring("PriceChangedView")] = v0.UnknownFailure, 
    [tostring("Membership Level Too Low") .. "." .. tostring("TransactionFailureView")] = v0.UnknownFailure, 
    [tostring("Purchases are Currently Disabled") .. "." .. tostring("TransactionFailureView")] = v0.PurchaseDisabled, 
    [tostring("Item Not For Sale") .. "." .. tostring("TransactionFailureView")] = v0.NotForSale, 
    [tostring("Age Restricted Item") .. "." .. tostring("TransactionFailureView")] = v0.Under13, 
    [tostring("Item Owned") .. "." .. tostring("TransactionFailureView")] = v0.AlreadyOwn, 
    [tostring("Too Many Purchases") .. "." .. tostring("TransactionFailureView")] = v0.TooManyPurchases, 
    [tostring("Invalid Parameter") .. "." .. tostring("TransactionFailureView")] = v0.InvalidRequest, 
    [tostring("Unauthorized") .. "." .. tostring("TransactionFailureView")] = v0.Unauthorized
};
local function _(v5, v6)
    return v4[tostring(v5) .. "." .. tostring(v6)];
end;
return function(v8)
    local v9 = false;
    if v8 ~= nil then
        v9 = type(v8) == "table";
    end;
    assert(v9, "err must be a valid table");
    local l_title_0 = v8.title;
    v9 = v8.showDivId;
    local l_shortfallPrice_0 = v8.shortfallPrice;
    if ((not (v9 ~= "TransactionFailureView") or v9 == "InsufficientFundsView") and l_shortfallPrice_0 ~= nil) and l_shortfallPrice_0 > 0 then
        return v0.NotEnoughRobux;
    else
        return v4[tostring(l_title_0) .. "." .. tostring(v9)] or v0.UnknownFailure;
    end;
end;
