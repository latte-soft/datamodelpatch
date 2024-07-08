local function _(v0)
    return (v0 < 10 and "0" or "") .. v0;
end;
return function(v2)
    local v3 = math.floor((v2 - os.time()) + tick()) % 86400;
    local v4 = math.floor(v3 / 3600);
    v3 = v3 - v4 * 3600;
    local v5 = math.floor(v3 / 60);
    v3 = v3 - v5 * 60;
    local v6 = (v4 < 10 and "0" or "") .. v4;
    local v7 = (v5 < 10 and "0" or "") .. v5;
    local l_v3_0 = v3;
    return string.format("%s:%s:%s", v6, v7, (l_v3_0 < 10 and "0" or "") .. l_v3_0);
end;
