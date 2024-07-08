local v0 = {
    ["catalog/sponsored-items"] = "avatar_experience_sponsored_items", 
    ["marketplace-widgets/v1/widgets?requestId"] = "avatar_experience_marketplace_widgets", 
    ["v3/outfits"] = "avatar_experience_outfits", 
    ["catalog/items/details"] = "avatar_experience_item_details", 
    ["recommendations/user-inventory"] = "avatar_experience_recommended_user_inventory", 
    ["v1/purchases/products"] = "avatar_experience_purchase_product", 
    ["autocomplete-avatar/v2/suggest"] = "avatar_experience_auto_complete", 
    ["topic/get-topics"] = "avatar_experience_get_topics", 
    ["widgets/search"] = "avatar_experience_widget_search", 
    ["widgets/hydrate"] = "avatar_experience_widget_hydrate"
};
local v7 = {
    getMatchingErrorName = function(v1, v2)
        local v3 = nil;
        local v4 = tostring(v2);
        for v5, v6 in v0, nil, nil do
            if string.find(v1, v5, 1, true) then
                return "api_error_" .. v6 .. "_" .. v4;
            end;
        end;
        return v3;
    end
};
v7.sendCounterIfKeyMatchesFetchStatus = function(v8, v9, v10)
    if not v10 then
        v10 = game:GetService("RbxAnalyticsService");
    end;
    local v11 = v7.getMatchingErrorName(v8, v9);
    if not (not v11 or not v10) then
        v10:ReportCounter(v11, 1);
    end;
end;
return v7;
