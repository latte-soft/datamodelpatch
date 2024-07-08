local v6 = {
    MakeEncoder = function(v0, v1, v2)
        local v3 = {};
        for v4, v5 in pairs({
            [0] = "A"; 
            "B", 
            "C", 
            "D", 
            "E", 
            "F", 
            "G", 
            "H", 
            "I", 
            "J", 
            "K", 
            "L", 
            "M", 
            "N", 
            "O", 
            "P", 
            "Q", 
            "R", 
            "S", 
            "T", 
            "U", 
            "V", 
            "W", 
            "X", 
            "Y", 
            "Z", 
            "a", 
            "b", 
            "c", 
            "d", 
            "e", 
            "f", 
            "g", 
            "h", 
            "i", 
            "j", 
            "k", 
            "l", 
            "m", 
            "n", 
            "o", 
            "p", 
            "q", 
            "r", 
            "s", 
            "t", 
            "u", 
            "v", 
            "w", 
            "x", 
            "y", 
            "z", 
            "0", 
            "1", 
            "2", 
            "3", 
            "4", 
            "5", 
            "6", 
            "7", 
            "8", 
            "9", 
            v0 or "+", 
            v1 or "/", 
            v2 or "="
        }) do
            v3[v4] = v5:byte();
        end;
        return v3;
    end
};
v6.MakeDecoder = function(v7, v8, v9)
    local v10 = {};
    for v11, v12 in pairs(v6.MakeEncoder(v7, v8, v9)) do
        v10[v12] = v11;
    end;
    return v10;
end;
local v13 = v6.MakeEncoder();
local v14 = v6.MakeDecoder();
local l_char_0 = string.char;
local l_concat_0 = table.concat;
local l_extract_0 = bit32.extract;
v6.Encode = function(v18, v19, v20)
    local v21 = v19 or v13;
    local v22 = {};
    local v23 = 1;
    local v24 = #v18;
    local v25 = v24 % 3;
    local v26 = {};
    for v27 = 1, v24 - v25, 3 do
        local v28, v29, v30 = v18:byte(v27, v27 + 2);
        local v31 = (v28 * 65536 + v29 * 256) + v30;
        local v32 = nil;
        if not v20 then
            v32 = l_char_0(v21[l_extract_0(v31, 18, 6)], v21[l_extract_0(v31, 12, 6)], v21[l_extract_0(v31, 6, 6)], v21[l_extract_0(v31, 0, 6)]);
        else
            v32 = v26[v31];
            if not v32 then
                v32 = l_char_0(v21[l_extract_0(v31, 18, 6)], v21[l_extract_0(v31, 12, 6)], v21[l_extract_0(v31, 6, 6)], v21[l_extract_0(v31, 0, 6)]);
                v26[v31] = v32;
            end;
        end;
        v22[v23] = v32;
        v23 = v23 + 1;
    end;
    if v25 == 2 then
        local v33, v34 = v18:byte(v24 - 1, v24);
        local v35 = v33 * 65536 + v34 * 256;
        v22[v23] = l_char_0(v21[l_extract_0(v35, 18, 6)], v21[l_extract_0(v35, 12, 6)], v21[l_extract_0(v35, 6, 6)], v21[64]);
    elseif v25 == 1 then
        local v36 = v18:byte(v24) * 65536;
        v22[v23] = l_char_0(v21[l_extract_0(v36, 18, 6)], v21[l_extract_0(v36, 12, 6)], v21[64], v21[64]);
    end;
    return l_concat_0(v22);
end;
v6.EncodeUrl = function(v37, v38)
    return v6.ToUrlSafeBase64((v6.Encode(v37, nil, v38)));
end;
v6.Decode = function(v39, v40, v41)
    local v42 = v40 or v14;
    local v43 = nil;
    local v44 = nil;
    for v45, v46 in pairs(v42) do
        if v46 == 62 then
            v43 = v45;
        elseif v46 == 63 then
            v44 = v45;
        end;
    end;
    v39 = v39:gsub(("[^%%w%%%s%%%s%%=]"):format(l_char_0(v43), (l_char_0(v44))), "");
    local v47 = {};
    local v48 = {};
    local v49 = 1;
    local v50 = #v39;
    local v51 = v39:sub(-2) == "==" and 2 or (v39:sub(-1) == "=" and 1 or 0);
    local v52 = 1;
    local v53 = if v51 > 0 then v50 - 4 else v50;
    for v54 = v52, v53, 4 do
        local v55, v56, v57, v58 = v39:byte(v54, v54 + 3);
        local v59 = nil;
        if not v41 then
            local v60 = ((v42[v55] * 262144 + v42[v56] * 4096) + v42[v57] * 64) + v42[v58];
            v59 = l_char_0(l_extract_0(v60, 16, 8), l_extract_0(v60, 8, 8), (l_extract_0(v60, 0, 8)));
        else
            local v61 = ((v55 * 16777216 + v56 * 65536) + v57 * 256) + v58;
            v59 = v47[v61];
            if not v59 then
                local v62 = ((v42[v55] * 262144 + v42[v56] * 4096) + v42[v57] * 64) + v42[v58];
                v59 = l_char_0(l_extract_0(v62, 16, 8), l_extract_0(v62, 8, 8), (l_extract_0(v62, 0, 8)));
                v47[v61] = v59;
            end;
        end;
        v48[v49] = v59;
        v49 = v49 + 1;
    end;
    if v51 == 1 then
        local v63;
        v53, v63, v52 = v39:byte(v50 - 3, v50 - 1);
        local v64 = (v42[v53] * 262144 + v42[v63] * 4096) + v42[v52] * 64;
        v48[v49] = l_char_0(l_extract_0(v64, 16, 8), (l_extract_0(v64, 8, 8)));
    elseif v51 == 2 then
        local v65;
        v53, v65 = v39:byte(v50 - 3, v50 - 2);
        v48[v49] = l_char_0((l_extract_0(v42[v53] * 262144 + v42[v65] * 4096, 16, 8)));
    end;
    return l_concat_0(v48);
end;
v6.DecodeUrl = function(v66, v67)
    return v6.Decode(v6.FromUrlSafeBase64(v66), nil, v67);
end;
v6.ToUrlSafeBase64 = function(v68)
    return (string.gsub(string.gsub(string.gsub(v68, "+", "-"), "/", "_"), "=", ""));
end;
v6.FromUrlSafeBase64 = function(v69)
    v69 = v69:gsub("[^%w%-_]", "");
    return (string.gsub(string.gsub(v69 .. string.rep("=", (4 - #v69 % 4) % 4), "_", "/"), "-", "+"));
end;
return v6;
