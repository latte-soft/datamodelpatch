local l_Locales_0 = script.Parent.Locales;
return function(v1)
    local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v1);
    if l_l_Locales_0_FirstChild_0 ~= nil then
        return {
            locale = v1, 
            translations = require(l_l_Locales_0_FirstChild_0), 
            fallbackTranslations = require(l_Locales_0:FindFirstChild("en-us"))
        };
    else
        return {
            locale = "en-us", 
            translations = require((l_Locales_0:FindFirstChild("en-us")))
        };
    end;
end;
