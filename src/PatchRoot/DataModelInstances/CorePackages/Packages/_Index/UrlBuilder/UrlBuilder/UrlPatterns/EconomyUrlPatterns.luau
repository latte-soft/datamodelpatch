return function(v0)
    return {
        paymentsGateway = {
            getUpsellProduct = v0.fromString("apis:payments-gateway/v1/products/get-upsell-product"), 
            preparePayment = v0.fromString("apis:payments-gateway/v1/prepare-payment")
        }, 
        purchaseWarning = {
            getPurchaseWarning = function(v1, v2, v3)
                local v4 = "";
                if v1 ~= nil then
                    v4 = string.format("%s?mobileProductId=%s", "apis:purchase-warning/v1/purchase-warnings", v1);
                elseif v2 ~= nil then
                    v4 = string.format("%s?productId=%d", "apis:purchase-warning/v1/purchase-warnings", v2);
                else
                    warn(string.format("%s - Invalid parameters, needs mobileProductId or productId", (tostring(script.Name))));
                    return nil;
                end;
                if v3 then
                    v4 = string.format("%s&is13To17ScaryModalEnabled=True", v4);
                end;
                return v0.fromString(v4)();
            end, 
            ackPurchaseWarning = v0.fromString("apis:purchase-warning/v1/purchase-warnings/acknowledge")
        }
    };
end;
