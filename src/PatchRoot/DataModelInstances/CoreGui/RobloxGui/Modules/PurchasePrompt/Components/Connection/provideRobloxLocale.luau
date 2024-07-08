local l_Parent_0 = script.Parent.Parent.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Localization.getLocalizationContext);
local v4 = require(script.Parent.LocalizationContextProvider);
return function(v5)
    return l_Roact_0.createElement(v4, {
        localizationContext = v3(l_LocalizationService_0.RobloxLocaleId)
    }, {
        PurchasePromptApp = v5()
    });
end;
