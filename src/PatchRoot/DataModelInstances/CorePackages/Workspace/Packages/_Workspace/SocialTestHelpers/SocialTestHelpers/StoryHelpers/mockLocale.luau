local v0 = require(script:FindFirstAncestor("SocialTestHelpers").dependencies);
local l_Localization_0 = v0.RobloxAppLocales.Localization;
local l_LocalizationProvider_0 = v0.LocalizationProvider;
local l_Roact_0 = v0.Roact;
local v4 = l_Localization_0.new("en-us");
return function(v5, v6)
    if not ((not v6 or not v6.controls) or not v6.controls.langauge) then
        v4:SetLocale(v6.controls.language);
    end;
    return l_Roact_0.createElement(l_LocalizationProvider_0, {
        localization = v4
    }, {
        TestElement1 = l_Roact_0.createElement(v5, v6)
    });
end;
