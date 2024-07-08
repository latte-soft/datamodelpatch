return function(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
    local v11 = nil;
    local v12 = nil;
    for v13, v14 in string.gmatch(v5, "(%w+)-(%w+)") do
        v12 = string.upper(v13);
        v11 = v14;
    end;
    return {
        purchase_flow_uuid = v0, 
        purchase_flow_event_type = v1, 
        view_name = v2, 
        input_type = v3, 
        subscription_provider_id = v4, 
        subscription_product_type_prefix = v12, 
        subscription_id = v11, 
        localized_subscription_name = v6, 
        localized_subscription_description = v7, 
        subscription_period = v8, 
        price_in_cents_usd = v9, 
        display_price = v10
    };
end;
