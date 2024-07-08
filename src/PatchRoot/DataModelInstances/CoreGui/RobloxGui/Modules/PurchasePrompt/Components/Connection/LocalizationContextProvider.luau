local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v1 = require(script.Parent.LocalizationContext);
return function(v2)
    return l_Roact_0.createElement(v1.Provider, {
        value = v2.localizationContext
    }, l_Roact_0.oneChild(v2[l_Roact_0.Children]));
end;
