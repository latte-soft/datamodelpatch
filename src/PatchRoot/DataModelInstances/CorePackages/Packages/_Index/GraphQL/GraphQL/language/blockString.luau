local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_String_0 = v0.String;
local v3 = nil;
local v4 = nil;
local _ = nil;
v4 = function(v6)
    local v7 = l_String_0.split(v6, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v8 = v3(v6);
    if v8 ~= 0 then
        for v9 = 2, #v7 do
            v7[v9] = l_String_0.slice(v7[v9], v8 + 1);
        end;
    end;
    local v10 = 0;
    while not (not (v10 < #v7) or not isBlank(v7[v10 + 1])) do
        v10 = v10 + 1;
    end;
    local v11 = #v7;
    while not (not (v10 < v11) or not isBlank(v7[(v11 - 1) + 1])) do
        v11 = v11 - 1;
    end;
    return l_Array_0.join(l_Array_0.slice(v7, v10 + 1, v11 + 1), "\n");
end;
isBlank = function(v12)
    for v13 = 1, #v12 do
        local v14 = string.sub(v12, v13, v13);
        if v14 ~= " " and v14 ~= "\t" then
            return false;
        end;
    end;
    return true;
end;
v3 = function(v15)
    local v16 = true;
    local v17 = true;
    local v18 = 0;
    local v19 = nil;
    local v20 = 1;
    local v21 = string.len(v15);
    while v20 <= v21 do
        local v22 = l_String_0.charCodeAt(v15, v20);
        if v22 == 13 and l_String_0.charCodeAt(v15, v20 + 1) == 10 then
            v20 = v20 + 1;
        end;
        if v22 == 10 then
            v16 = false;
            v17 = true;
            v18 = 0;
        elseif not (v22 ~= 9) or v22 == 32 then
            v18 = v18 + 1;
        else
            if (v17 and v16 ~= true) and (not (v19 ~= nil) or v18 < v19) then
                v19 = v18;
            end;
            v17 = false;
        end;
        v20 = v20 + 1;
    end;
    return not not v19 and v19 or 0;
end;
return {
    getBlockStringIndentation = v3, 
    dedentBlockStringValue = v4, 
    printBlockString = function(v23, v24, v25)
        local v26 = v24 or "";
        local v27 = not (v25 == nil) and v25;
        local v28 = string.find(v23, "\n") == nil;
        local v29 = true;
        if string.sub(v23, 1, 1) ~= " " then
            v29 = string.sub(v23, 1, 1) == "\t";
        end;
        local v30 = string.sub(v23, #v23, #v23) == "\"";
        local v31 = string.sub(v23, #v23, #v23) == "\\";
        local v32 = true;
        if v28 == true then
            v32 = (v30 or v31) or v27;
        end;
        local v33 = "";
        if v32 and (v28 and v29) ~= true then
            v33 = v33 .. "\n" .. v26;
        end;
        v33 = v33 .. (v26 ~= "" and string.gsub(v23, "\n", "\n" .. v26) or v23);
        if v32 then
            v33 = v33 .. "\n";
        end;
        return "\"\"\"" .. string.gsub(v33, "\"\"\"", "\\\"\"\"") .. "\"\"\"";
    end
};
