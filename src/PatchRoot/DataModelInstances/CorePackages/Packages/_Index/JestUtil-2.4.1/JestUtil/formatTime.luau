local v0 = {};
local function _(v1)
    if v1 > 0 then
        return (math.floor(v1));
    else
        return (math.ceil(v1));
    end;
end;
local function _(v3, v4, v5)
    local v6 = math.max(#v3, v4);
    return ((v5 or " "):rep(v6) .. v3):sub(-v6);
end;
v0.default = function(v8, v9, v10)
    local v11 = v9 or -3;
    local v12 = v10 or 0;
    local v13 = {
        "n", 
        "\206\188", 
        "m", 
        ""
    };
    local v14 = 0;
    local v15 = v11 / 3;
    local v16 = math.max(v14, (math.min((if v15 > 0 then math.floor(v15) else math.ceil(v15) + #v13) - 1, #v13 - 1))) + 1;
    local v17 = "%s %ss";
    local v18 = tostring(v8);
    local v19 = math.max(#v18, v12);
    return v17:format(((" "):rep(v19) .. v18):sub(-v19), v13[v16]);
end;
return v0;
