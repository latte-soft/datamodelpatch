local v0 = {
    ["en-us"] = ",", 
    ["en-gb"] = ",", 
    ["es-mx"] = ",", 
    ["es-es"] = ".", 
    ["fr-fr"] = " ", 
    ["de-de"] = " ", 
    ["pt-br"] = ".", 
    ["zh-cn"] = ",", 
    ["zh-cjv"] = ",", 
    ["zh-tw"] = ",", 
    ["ko-kr"] = ",", 
    ["ja-jp"] = ",", 
    ["it-it"] = " ", 
    ["ru-ru"] = ".", 
    ["id-id"] = ".", 
    ["vi-vn"] = ".", 
    ["th-th"] = ",", 
    ["tr-tr"] = "."
};
local function v7(v1, v2)
    local v3 = string.format("%%1%s%%2", v2);
    local _ = nil;
    while true do
        local v5, v6 = string.gsub(v1, "^(-?%d+)(%d%d%d)", v3);
        v1 = v5;
        if not (v6 ~= 0) then
            break;
        end;
    end;
    return v1;
end;
return function(v8, v9)
    return (v7(v9, v0[v8] or ","));
end;
