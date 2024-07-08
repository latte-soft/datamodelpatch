local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
return function(v2, v3)
    local v4 = v0(v2);
    local v5 = v0(v3);
    local l_v1_0 = v1;
    local v7 = false;
    if math.abs(v4.Min.X - v5.Min.X) * 2 < v4.Width + v5.Width then
        v7 = math.abs(v4.Min.Y - v5.Min.Y) * 2 < v4.Height + v5.Height;
    end;
    return l_v1_0(v7, "Intersects the element", "Does not intersect the element");
end;
