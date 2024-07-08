local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Enum.IconSize);
local v2 = require(l_Parent_0.getIconSize);
return function(v3)
    assert(v1.isEnumValue(v3));
    local v4 = v2(v3);
    return UDim2.fromOffset(v4, v4);
end;
