local l_llama_0 = require(script.Parent.dependencies).llama;
local v5 = {
    createIdToAgreementMap = function(v1)
        local v2 = {};
        for _, v4 in v1, nil, nil do
            v2[v4.id] = v4.agreementType;
        end;
        return v2;
    end
};
v5.getCheckBoxStatusVariables = function(v6, v7)
    local v8 = true;
    local v9 = false;
    local v10 = true;
    local v11 = v5.createIdToAgreementMap(v7);
    for v12, v13 in v6, nil, nil do
        local v14 = string.find(v11[v12]:lower(), "optional");
        if v14 then
            v9 = true;
        end;
        if not v13 then
            v10 = false;
            if not v14 then
                v8 = false;
            end;
        end;
    end;
    return v8, v9, v10;
end;
v5.getAgreedUserAgreements = function(v15)
    return (l_llama_0.Dictionary.keys((l_llama_0.Dictionary.filter(v15, function(v16)
        return v16 == true;
    end))));
end;
return v5;
