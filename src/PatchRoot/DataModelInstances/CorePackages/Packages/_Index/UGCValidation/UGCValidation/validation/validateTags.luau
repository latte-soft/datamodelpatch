local l_CollectionService_0 = game:GetService("CollectionService");
local v1 = require(script.Parent.Parent.Analytics);
return function(v2)
    local l_v2_Descendants_0 = v2:GetDescendants();
    table.insert(l_v2_Descendants_0, v2);
    local v4 = {};
    for _, v6 in ipairs(l_v2_Descendants_0) do
        if #l_CollectionService_0:GetTags(v6) > 0 then
            table.insert(v4, v6);
        end;
    end;
    if #v4 > 0 then
        local v7 = {
            "Found the following instance tags which are not allowed:"
        };
        for _, v9 in ipairs(v4) do
            table.insert(v7, v9:GetFullName());
        end;
        v1.reportFailure(v1.ErrorType.validateTags);
        return false, v7;
    else
        return true;
    end;
end;
