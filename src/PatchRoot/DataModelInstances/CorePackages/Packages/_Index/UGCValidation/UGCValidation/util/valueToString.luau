local v0 = require(script.Parent.Parent.Parent.Cryo);
local function _(v1, v2)
    local v3 = 10 ^ (v2 or 0);
    return math.floor(v1 * v3 + 0.5) / v3;
end;
return function(v5)
    local v6 = typeof(v5);
    if v5 == v0.None then
        return "not defined";
    elseif v6 == "Vector3" then
        return string.format("%d, %d, %d", math.floor(v5.X * 100 + 0.5) / 100, math.floor(v5.Y * 100 + 0.5) / 100, math.floor(v5.Z * 100 + 0.5) / 100);
    elseif v6 == "Color3" then
        return string.format("%d, %d, %d", math.floor(v5.r * 255), math.floor(v5.g * 255), (math.floor(v5.b * 255)));
    else
        return (tostring(v5));
    end;
end;
