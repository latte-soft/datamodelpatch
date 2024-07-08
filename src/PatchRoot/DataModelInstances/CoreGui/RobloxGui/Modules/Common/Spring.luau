local l_exp_0 = math.exp;
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3)
    local v4 = setmetatable({}, v1);
    v4.f = v2;
    v4.p = v3;
    v4.v = v3 * 0;
    return v4;
end;
v1.update = function(v5, v6, v7)
    local v8 = (v5.f * 2) * 3.141592653589793;
    local l_p_0 = v5.p;
    local l_v_0 = v5.v;
    local v11 = v7 - l_p_0;
    local v12 = l_exp_0(-v8 * v6);
    local v13 = v7 + (l_v_0 * v6 - v11 * (v8 * v6 + 1)) * v12;
    local v14 = ((v8 * v6) * (v11 * v8 - l_v_0) + l_v_0) * v12;
    v5.p = v13;
    v5.v = v14;
    return v13;
end;
v1.reset = function(v15, v16)
    v15.p = v16;
    v15.v = v16 * 0;
end;
return v1;
