local v0 = require(script.Parent.toRect);
local v1 = require(script.Parent.returnValue);
return function(v2, v3, v4)
    local v5 = v0(v2).Min - v0(v3).Max;
    if not v4 then
        return v1(v5.Y >= 0, "Was below the element", "Was above the element");
    else
        if typeof(v4) == "number" then
            v4 = NumberRange.new(v4);
        end;
        local l_v1_0 = v1;
        local v7 = false;
        if v4.Min <= v5.Y then
            v7 = v5.Y <= v4.Max;
        end;
        return l_v1_0(v7, "Was within range", "Was not within range ( " .. tostring(v4) .. ")");
    end;
end;
