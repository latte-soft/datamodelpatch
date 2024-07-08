local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).StyleProviderWithDefaultTheme;
return function(v3, v4)
    return v1.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = not not v4 and v4.withUiModeSupport, 
        withDarkTheme = not v4 and true or v4.withDarkTheme
    }, v3);
end;
