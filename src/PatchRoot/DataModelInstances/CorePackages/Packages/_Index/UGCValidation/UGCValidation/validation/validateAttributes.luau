local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local function v7(v4)
    for v5, v6 in v4, nil, nil do
        if v5 ~= v2.GUIDAttributeName then
            return false;
        elseif typeof(v6) ~= "string" then
            return false;
        elseif v2.GUIDAttributeMaxLength < string.len(v6) then
            return false;
        end;
    end;
    return true;
end;
return function(v8)
    local v9 = {};
    if not v7(v8:GetAttributes()) then
        table.insert(v9, v8:GetFullName());
    end;
    for _, v11 in ipairs(v8:GetDescendants()) do
        if next(v11:GetAttributes()) ~= nil then
            table.insert(v9, v11:GetFullName());
        end;
    end;
    if #v9 > 0 then
        local v12 = {};
        if not v3() then
            table.insert(v12, "The following instances contained attributes:");
        else
            table.insert(v12, string.format("'%s' contains attributes in its properties that are not allowed. You need to remove the following attributes: ", v8.Name));
        end;
        for _, v14 in pairs(v9) do
            table.insert(v12, v14);
        end;
        v1.reportFailure(v1.ErrorType.validateAttributes);
        return false, v12;
    else
        return true;
    end;
end;
