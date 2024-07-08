local v0 = require(script:FindFirstAncestor("Localization").Parent.React);
local v1 = require(script.Parent.LocalizationRoactContext);
return function(v2)
    return v0.createElement(v1.Provider, {
        value = v2.localization
    }, v2.children);
end;
