local v0 = require(script:FindFirstAncestor("AuthCommon").Actions.SetCountryCodeList);
return function(v1, v2)
    v1 = v1 or {};
    assert(v1, "");
    if v2.type == v0.name then
        v1 = v2.countryCodeList;
    end;
    return v1;
end;
