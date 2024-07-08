enc = function(v0)
    return (v0:gsub(".", function(v1)
        local v2 = "";
        local v3 = v1:byte();
        for v4 = 8, 1, -1 do
            v2 = v2 .. (v3 % 2 ^ v4 - v3 % 2 ^ (v4 - 1) > 0 and "1" or "0");
        end;
        return v2;
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v5)
        if #v5 < 6 then
            return "";
        else
            local v6 = 0;
            for v7 = 1, 6 do
                v6 = v6 + (v5:sub(v7, v7) == "1" and 2 ^ (6 - v7) or 0);
            end;
            return ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v6 + 1, v6 + 1);
        end;
    end) .. ({
        "", 
        "==", 
        "="
    })[#v0 % 3 + 1];
end;
dec = function(v8)
    return (string.gsub(v8, "[^" .. "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" .. "=]", ""):gsub(".", function(v9)
        if v9 == "=" then
            return "";
        else
            local v10 = "";
            local v11 = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):find(v9) - 1;
            for v12 = 6, 1, -1 do
                v10 = v10 .. (v11 % 2 ^ v12 - v11 % 2 ^ (v12 - 1) > 0 and "1" or "0");
            end;
            return v10;
        end;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(v13)
        if #v13 ~= 8 then
            return "";
        else
            local v14 = 0;
            for v15 = 1, 8 do
                v14 = v14 + (v13:sub(v15, v15) == "1" and 2 ^ (7 - v15) or 0);
            end;
            return (string.char(v14));
        end;
    end));
end;
safe_enc = function(v16, v17)
    if v17 == nil then
        v17 = true;
    end;
    local v18 = "";
    local v19 = {};
    while #v16 > 0 do
        table.insert(v19, v16:sub(1, 204798));
        v16 = v16:sub(204799);
    end;
    for v20, v21 in ipairs(v19) do
        if v17 then
            print(("[http] Encoding B64 chunk %s/%s"):format(v20, #v19));
        end;
        v18 = v18 .. enc(v21);
        wait();
    end;
    return v18;
end;
return {
    encode = safe_enc, 
    decode = dec
};
