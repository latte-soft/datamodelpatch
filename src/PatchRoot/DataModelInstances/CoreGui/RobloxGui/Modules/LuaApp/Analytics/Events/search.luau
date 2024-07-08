local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v1, v2, v3, v4, v5)
    assert(type(v2) == "string", "Expected eventContext to be a string");
    assert(type(v3) == "string", "Expected act to be a string");
    if v4 then
        assert(type(v4) == "string", "Expected keyword to be a string");
    end;
    v1:setRBXEventStream(v2, "search", {
        act = v3, 
        kwd = v4, 
        locale = l_LocalizationService_0.RobloxLocaleId, 
        isAutoSearchType = v5
    });
end;
