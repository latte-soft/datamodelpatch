local v0 = require(script.Parent.Parent.Parent.UIBloxConfig);
return {
    DarkTheme = if not v0.useNewThemeColorPalettes then require(script.DarkTheme) else require(script.DarkThemeNew), 
    LightTheme = if not v0.useNewThemeColorPalettes then require(script.LightTheme) else require(script.LightThemeNew)
};
