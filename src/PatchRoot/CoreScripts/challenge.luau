local v0, v1 = ...;
arg0 = v0;
arg1 = v1;
v0 = function(v2, v3)
    return v2 + v3;
end;
v1 = function(v4, v5)
    return v4 - v5;
end;
local function v8(v6, v7)
    return v7 - v6;
end;
local function v11(v9, v10)
    return (tonumber(tostring(v10 % 1000) .. tostring((math.abs(v9 % 1000)))));
end;
local function v14(v12, v13)
    return (tonumber(tostring(v13 % 1337) .. tostring((math.abs(v12 % 1337)))));
end;
local function v17(v15, v16)
    return (v15 % 1000) * (v16 % 1000);
end;
local function v20(v18, v19)
    return (v18 % 1337) * (v19 % 1337);
end;
local function v23(v21, v22)
    return ((v21 + v22) % 1000) * ((v21 - v22) % 1000);
end;
local v24 = {
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    8
};
local v25 = Random.new(5);
for _ = 1, 32 do
    local v27 = v25:NextInteger(1, 8);
    local v28 = v25:NextInteger(1, 8);
    local v29 = v24[v27];
    v24[v27] = v24[v28];
    v24[v28] = v29;
end;
local v30 = {
    [v24[1]] = v0, 
    [v24[2]] = v1, 
    [v24[3]] = v8, 
    [v24[4]] = v11, 
    [v24[5]] = v14, 
    [v24[6]] = v17, 
    [v24[7]] = v20, 
    [v24[8]] = v23
};
return ((function(v31, v32)
    local v33 = 393;
    local v34 = 1;
    for _ = 1, 16 do
        v33 = (v33 + v30[math.abs((v32 + v33) + v34) % 8 + 1](v33 + v31, v32)) % 10000000;
        v34 = v34 + 1;
    end;
    return v33;
end)(arg0, arg1));
