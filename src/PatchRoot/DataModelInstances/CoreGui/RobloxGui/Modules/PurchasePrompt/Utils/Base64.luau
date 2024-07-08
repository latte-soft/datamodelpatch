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
local v7 = v6.MakeEncoder();
local l_char_0 = string.char;
local l_concat_0 = table.concat;
local l_extract_0 = bit32.extract;
v6.Encode = function(v11, v12, v13)
    local v14 = v12 or v7;
    local v15 = {};
    local v16 = 1;
    local v17 = #v11;
    local v18 = v17 % 3;
    local v19 = {};
    for v20 = 1, v17 - v18, 3 do
        local v21, v22, v23 = v11:byte(v20, v20 + 2);
        local v24 = (v21 * 65536 + v22 * 256) + v23;
        local v25 = nil;
        if not v13 then
            v25 = l_char_0(v14[l_extract_0(v24, 18, 6)], v14[l_extract_0(v24, 12, 6)], v14[l_extract_0(v24, 6, 6)], v14[l_extract_0(v24, 0, 6)]);
        else
            v25 = v19[v24];
            if not v25 then
                v25 = l_char_0(v14[l_extract_0(v24, 18, 6)], v14[l_extract_0(v24, 12, 6)], v14[l_extract_0(v24, 6, 6)], v14[l_extract_0(v24, 0, 6)]);
                v19[v24] = v25;
            end;
        end;
        v15[v16] = v25;
        v16 = v16 + 1;
    end;
    if v18 == 2 then
        local v26, v27 = v11:byte(v17 - 1, v17);
        local v28 = v26 * 65536 + v27 * 256;
        v15[v16] = l_char_0(v14[l_extract_0(v28, 18, 6)], v14[l_extract_0(v28, 12, 6)], v14[l_extract_0(v28, 6, 6)], v14[64]);
    elseif v18 == 1 then
        local v29 = v11:byte(v17) * 65536;
        v15[v16] = l_char_0(v14[l_extract_0(v29, 18, 6)], v14[l_extract_0(v29, 12, 6)], v14[64], v14[64]);
    end;
    return l_concat_0(v15);
end;
return v6;
