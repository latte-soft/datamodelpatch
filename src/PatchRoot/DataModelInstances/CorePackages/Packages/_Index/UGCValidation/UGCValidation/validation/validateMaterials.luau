local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
return function(v3)
    local v4 = {};
    local l_v3_Descendants_0 = v3:GetDescendants();
    table.insert(l_v3_Descendants_0, v3);
    for _, v7 in l_v3_Descendants_0, nil, nil do
        if not (not v7:IsA("BasePart") or v2.MATERIAL_WHITELIST[v7.Material]) then
            table.insert(v4, v7:GetFullName());
        end;
    end;
    if #v4 > 0 then
        local v8 = {};
        local v9 = {};
        for v10 in pairs(v2.MATERIAL_WHITELIST) do
            table.insert(v9, v10.Name);
        end;
        table.insert(v8, "Invalid material setup for");
        for _, v12 in pairs(v4) do
            table.insert(v8, v12);
        end;
        table.insert(v8, "Accepted values are: " .. table.concat(v9, ", "));
        v1.reportFailure(v1.ErrorType.validateMaterials);
        return false, v8;
    else
        return true;
    end;
end;
