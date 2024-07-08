return {
    clampBetween0And1 = function(v0)
        if math.abs(v0) < 0.001 then
            return 0, false;
        elseif math.abs(v0 - 1) < 0.001 then
            return 1, false;
        elseif v0 >= 0 and v0 <= 1 then
            return v0, false;
        else
            return math.clamp(v0, 0, 1), true;
        end;
    end
};
