local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
return function(v3, v4)
    return v1.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = not not v4 and v4.withUiModeSupport, 
        withDarkTheme = if not v4 then nil else v4.withDarkTheme
    }, v3);
end;
