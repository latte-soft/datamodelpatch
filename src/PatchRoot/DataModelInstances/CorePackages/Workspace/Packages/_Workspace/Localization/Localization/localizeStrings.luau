local v0 = require(script:FindFirstAncestor("Localization").Parent.ArgCheck);
return function(v1, v2)
    local v3 = {};
    for v4, v5 in pairs(v2) do
        if typeof(v5) == "table" then
            if typeof(v5[1]) == "string" then
                local l_status_0, l_result_0 = pcall(function()
                    return v1:Format(v5[1], v5);
                end);
                v0.isEqual(l_status_0, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v4, v5[1]));
                v3[v4] = not not l_status_0 and l_result_0 or "";
            else
                error(string.format("%s[1] in stringsToBeLocalized must be a string, got %s instead", v4, (typeof(v5[1]))));
            end;
        elseif typeof(v5) == "string" then
            local l_status_1, l_result_1 = pcall(function()
                return v1:Format(v5);
            end);
            v0.isEqual(l_status_1, true, string.format("LocalizationConsumer finding value for translation key[%s]: %s", v4, v5));
            v3[v4] = not not l_status_1 and l_result_1 or "";
        else
            error(string.format("%s in stringsToBeLocalized must be a string or table, got %s instead", v4, (typeof(v5))));
        end;
    end;
    return v3;
end;
