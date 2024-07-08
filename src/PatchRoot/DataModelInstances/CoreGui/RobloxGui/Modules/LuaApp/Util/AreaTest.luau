return {
    IsPointInRect = function(v0, v1)
        local l_Min_0 = v0.Min;
        local l_Max_0 = v0.Max;
        local v4 = false;
        if l_Min_0.X <= v1.X then
            v4 = false;
            if l_Min_0.Y <= v1.Y then
                v4 = false;
                if v1.X <= l_Max_0.X then
                    v4 = v1.Y <= l_Max_0.Y;
                end;
            end;
        end;
        return v4;
    end
};
