local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.ItemType);
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Symbols.Symbol);
local v4 = require(script.Parent.KeyMappings);
local v5 = {
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
local v6 = v3.named("FormattedParam");
local function _(v7)
    local v8 = false;
    if typeof(v7) == "table" then
        v8 = v7[v6] == true;
    end;
    return v8;
end;
local function _(v10)
    return {
        [v6] = true, 
        format = v10
    };
end;
local function _(v12, v13)
    local l_translations_0 = v12.translations;
    local l_fallbackTranslations_0 = v12.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v13] == nil then
        return l_fallbackTranslations_0[v13];
    else
        return l_translations_0[v13];
    end;
end;
local function v23(v17, v18)
    local v19 = string.format("%%1%s%%2", v18);
    local _ = nil;
    while true do
        local v21, v22 = string.gsub(v17, "^(-?%d+)(%d%d%d)", v19);
        v17 = v21;
        if not (v22 ~= 0) then
            break;
        end;
    end;
    return v17;
end;
local v26 = {
    formatNumber = function(v24, v25)
        return (v23(v25, v5[v24.locale] or ","));
    end
};
v26.numberParam = function(v27)
    return {
        [v6] = true, 
        format = function(v28)
            return v26.formatNumber(v28, v27);
        end
    };
end;
v26.nestedKeyParam = function(v29)
    return {
        [v6] = true, 
        format = function(v30)
            local l_v29_0 = v29;
            local l_translations_1 = v30.translations;
            local l_fallbackTranslations_1 = v30.fallbackTranslations;
            if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v29_0] == nil then
                return l_fallbackTranslations_1[l_v29_0];
            else
                return l_translations_1[l_v29_0];
            end;
        end
    };
end;
v26.getKeyFromItemType = function(v34)
    local v35 = v1.isMember(v34);
    if not v35 then
        v35 = true;
        if typeof(v34) ~= "number" then
            v35 = typeof(v34) == "string";
        end;
    end;
    assert(v35, "provided item type " .. tostring(v34) .. " must be a number, string, or ItemType enum");
    local _ = nil;
    if v34 == v1.Bundle then
        return "CoreScripts.PurchasePrompt.ItemType.Bundle";
    else
        return v4.AssetTypeById[tostring(v34)];
    end;
end;
v26.getErrorKey = function(v37)
    assert(v2.isMember(v37), "provided value " .. tostring(v37) .. " is not a member of PurchaseError enum");
    return v4.PurchaseErrorKey[v37];
end;
v26.getString = function(v38, v39, v40)
    assert(v38 ~= nil, "Must provide valid localization context");
    local l_translations_2 = v38.translations;
    local l_fallbackTranslations_2 = v38.fallbackTranslations;
    local v43 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v39] == nil then l_fallbackTranslations_2[v39] else l_translations_2[v39];
    if v40 ~= nil then
        for v44, v45 in pairs(v40) do
            local l_v45_0 = v45;
            local v47 = ("{%s}"):format(v44);
            local v48 = false;
            if typeof(v45) == "table" then
                v48 = v45[v6] == true;
            end;
            if v48 then
                l_v45_0 = v45.format(v38);
            end;
            do
                local l_l_v45_0_0 = l_v45_0;
                v43 = string.gsub(v43, v47, function()
                    return l_l_v45_0_0;
                end);
            end;
        end;
    end;
    return v43;
end;
return v26;
