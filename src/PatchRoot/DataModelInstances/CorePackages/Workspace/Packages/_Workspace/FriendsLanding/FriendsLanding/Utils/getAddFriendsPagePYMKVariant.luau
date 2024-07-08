return function(v0)
    local _ = nil;
    local v2 = nil;
    local l_add_friends_page_pymk_variant_0 = v0.add_friends_page_pymk_variant;
    if l_add_friends_page_pymk_variant_0 == "requestsFiveRows" then
        return true, 5;
    elseif l_add_friends_page_pymk_variant_0 == "requestsTwoRows" then
        return true, 2;
    elseif l_add_friends_page_pymk_variant_0 == "requestsOneRow" then
        return true, 1;
    else
        return false, v2;
    end;
end;
