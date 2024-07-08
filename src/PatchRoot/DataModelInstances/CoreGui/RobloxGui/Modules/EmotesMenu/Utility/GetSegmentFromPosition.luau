local v0 = require(script.Parent.Parent.Constants);
return function(v1)
    local v2 = math.deg((math.atan2(v1.X, v1.Y)));
    if v2 < 0 then
        v2 = v2 + 360;
    end;
    local v3 = 360 / v0.EmotesPerPage;
    local v4 = math.ceil(math.ceil(math.fmod(v2 + math.ceil(v3 / 2), 360) / v3) + (v0.SegmentsStartRotation + 90) / v3);
    if v0.EmotesPerPage < v4 then
        return v4 - v0.EmotesPerPage;
    else
        if v4 < 1 then
            v4 = v4 + v0.EmotesPerPage;
        end;
        return v4;
    end;
end;
