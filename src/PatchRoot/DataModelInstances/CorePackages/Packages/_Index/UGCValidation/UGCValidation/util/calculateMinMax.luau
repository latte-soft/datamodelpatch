local function _(v0, v1, v2)
    if not v0 or not v1 then
        return v0 or v1;
    else
        return (Vector3.new(v2(v0.X, v1.X), v2(v0.Y, v1.Y), v2(v0.Z, v1.Z)));
    end;
end;
return function(v4, v5, v6, v7)
    local l_min_0 = math.min;
    local v9 = if not not v4 and v6 then Vector3.new(l_min_0(v4.X, v6.X), l_min_0(v4.Y, v6.Y), l_min_0(v4.Z, v6.Z)) else v4 or v6;
    local l_max_0 = math.max;
    if not v5 or not v7 then
        return v9, v5 or v7;
    else
        return v9, (Vector3.new(l_max_0(v5.X, v7.X), l_max_0(v5.Y, v7.Y), l_max_0(v5.Z, v7.Z)));
    end;
end;
