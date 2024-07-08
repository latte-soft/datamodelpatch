local l_rshift_0 = bit32.rshift;
local l_log_0 = math.log;
local l_floor_0 = math.floor;
return function(v3)
    local v4 = l_rshift_0(v3, 0);
    if v4 == 0 then
        return 32;
    else
        return 31 - l_floor_0(l_log_0(v4) / 0.6931471805599453);
    end;
end;
