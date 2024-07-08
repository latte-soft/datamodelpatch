local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local _ = require(l_Parent_0.GraphQL);
v1.getResponseKeyFromInfo = function(v3)
    if v3.fieldNodes[1] and v3.fieldNodes[1].alias ~= nil then
        return v3.fieldNodes[1].alias.value;
    else
        return v3.fieldName;
    end;
end;
return v1;
