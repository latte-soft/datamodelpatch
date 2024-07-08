local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Constants);
local v3 = require(l_Parent_1.Parent.Parent.UIBloxConfig);
local v4 = if not v3.useNewThemeColorPalettes then require(l_Parent_1.Validator.validateTheme) else require(l_Parent_1.Validator.validateThemeNew);
local v5 = {
    [v2.ThemeName.Dark:lower()] = if not v3.useNewThemeColorPalettes then require(l_Parent_0.DarkTheme) else require(l_Parent_0.DarkThemeNew), 
    [v2.ThemeName.Light:lower()] = if not v3.useNewThemeColorPalettes then require(l_Parent_0.LightTheme) else require(l_Parent_0.LightThemeNew)
};
return function(v6)
    local v7 = nil;
    if v6 ~= nil and #v6 > 0 then
        v7 = v5[v6:lower()];
    end;
    if v7 == nil then
        v7 = v5[v2.DefaultThemeName:lower()];
    end;
    assert(v4(v7));
    return v7;
end;
