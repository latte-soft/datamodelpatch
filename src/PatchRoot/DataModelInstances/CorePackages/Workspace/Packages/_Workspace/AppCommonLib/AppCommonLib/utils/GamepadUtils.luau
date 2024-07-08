local v4 = {
    normalizeStickByDeadzone = function(v0, v1)
        local l_Magnitude_0 = v0.Magnitude;
        local v3 = v1 or 0.2;
        if l_Magnitude_0 < v3 then
            return Vector2.new(0, 0);
        else
            return ((l_Magnitude_0 - v3) / (1 - v3)) * v0.Unit;
        end;
    end
};
v4.rotateAndZoom = function(v5, v6, v7, v8, v9)
    local v10 = v4.normalizeStickByDeadzone(Vector2.new(v5.Position.X, v5.Position.Y));
    if v10 == Vector2.new(0, 0) then
        return ;
    else
        v7(0);
        if v8 and math.abs(v10.X) > 0.5 then
            v8((v6 * v10.X) * 2.0943951023931953);
        end;
        if v9 and math.abs(v10.Y) > 0.5 then
            v9((v6 * -v10.Y) * 10);
        end;
        return ;
    end;
end;
return v4;
