local v0 = require(script.Parent.Parent.Symbols.Symbol).named("FormattedParam");
local function _(v1)
    local v2 = false;
    if typeof(v1) == "table" then
        v2 = v1[v0] == true;
    end;
    return v2;
end;
local function _(v4)
    return {
        [v0] = true, 
        format = v4
    };
end;
local function _(v6, v7)
    local l_translations_0 = v6.translations;
    local l_fallbackTranslations_0 = v6.fallbackTranslations;
    if l_fallbackTranslations_0 ~= nil and l_translations_0[v7] == nil then
        return l_fallbackTranslations_0[v7];
    else
        return l_translations_0[v7];
    end;
end;
return {
    nestedKeyParam = function(v11)
        return {
            [v0] = true, 
            format = function(v12)
                local l_v11_0 = v11;
                local l_translations_1 = v12.translations;
                local l_fallbackTranslations_1 = v12.fallbackTranslations;
                if l_fallbackTranslations_1 ~= nil and l_translations_1[l_v11_0] == nil then
                    return l_fallbackTranslations_1[l_v11_0];
                else
                    return l_translations_1[l_v11_0];
                end;
            end
        };
    end, 
    getString = function(v16, v17, v18)
        assert(v16 ~= nil, "Must provide valid localization context");
        local l_translations_2 = v16.translations;
        local l_fallbackTranslations_2 = v16.fallbackTranslations;
        local v21 = if l_fallbackTranslations_2 ~= nil and l_translations_2[v17] == nil then l_fallbackTranslations_2[v17] else l_translations_2[v17];
        assert(v21 ~= nil, "Unable to find localization with key: " .. v17);
        if v21 and v18 ~= nil then
            for v22, v23 in pairs(v18) do
                local l_v23_0 = v23;
                local v25 = ("{%s}"):format(v22);
                local v26 = false;
                if typeof(v23) == "table" then
                    v26 = v23[v0] == true;
                end;
                if v26 then
                    l_v23_0 = v23.format(v16);
                end;
                do
                    local l_l_v23_0_0 = l_v23_0;
                    v21 = string.gsub(v21, v25, function()
                        return l_l_v23_0_0;
                    end);
                end;
            end;
        end;
        return v21;
    end
};
