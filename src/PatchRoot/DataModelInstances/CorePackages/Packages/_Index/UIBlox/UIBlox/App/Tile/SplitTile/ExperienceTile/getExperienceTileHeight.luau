local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent.Parent.Parent.Style.StyleTypes);
local _ = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Enum.AspectRatioMode);
local v4 = require(l_Parent_0.getExperienceTileRelativeHeight);
return function(v5, v6, v7, v8, v9, v10)
    local v11 = v4(v5, v7, v8, v9, v10);
    return (math.floor(v6 * v11.Scale + v11.Offset));
end;
