local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
return function(v2, v3, v4)
    local v5 = v0(v2);
    local v6 = v0(v3);
    if v4 == Enum.VerticalAlignment.Top then
        return v1(v5.Min.Y == v6.Min.Y, "", "");
    elseif v4 == Enum.VerticalAlignment.Center then
        return v1(((v5.Min + v5.Max) / 2).Y == ((v6.Min + v6.Max) / 2).Y, "", "");
    elseif v4 == Enum.VerticalAlignment.Bottom then
        return v1(v5.Max.Y == v6.Max.Y, "", "");
    else
        return v1(false, "Invalid VerticalAlignment");
    end;
end;
