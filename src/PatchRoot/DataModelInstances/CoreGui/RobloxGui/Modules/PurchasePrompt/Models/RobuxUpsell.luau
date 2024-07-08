local _ = script.Parent.Parent;
return {
    new = function(v1, v2, v3, v4)
        return {
            id = v1, 
            providerId = v2, 
            productName = v3, 
            robuxAmount = v4
        };
    end, 
    fromJson = function(v5)
        return {
            id = v5.roblox_product_id, 
            providerId = v5.provider_product_id, 
            productName = v5.roblox_product_name, 
            robuxAmount = v5.robux_amount
        };
    end
};
