return function(v0)
    local v1 = nil;
    local v2 = nil;
    local v3 = {};
    local v4 = {};
    for _, v6 in ipairs(v0) do
        if v6.agreementType == "TermsOfService" then
            v1 = v6;
        elseif v6.agreementType == "PrivacyPolicy" then
            v2 = v6;
        elseif not string.find(v6.agreementType, "Optional") then
            table.insert(v4, v6);
        else
            table.insert(v3, v6);
        end;
    end;
    local v7 = {};
    if v1 then
        table.insert(v7, v1);
    end;
    if v2 then
        table.insert(v7, v2);
    end;
    for _, v9 in ipairs(v4) do
        table.insert(v7, v9);
    end;
    for _, v11 in ipairs(v3) do
        table.insert(v7, v11);
    end;
    return v7;
end;
