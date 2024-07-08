local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics.DiagActionList);
local v2 = require(l_Parent_0.Analytics.EventNames);
return function(v3)
    assert(v2.isEnumValue(v3), "Invalid event name");
    local v4 = v1[v3];
    return v4.name, v4.count or 1;
end;
