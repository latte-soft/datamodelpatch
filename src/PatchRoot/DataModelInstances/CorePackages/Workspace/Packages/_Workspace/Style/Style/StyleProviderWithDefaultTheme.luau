local l_script_FirstAncestor_0 = script:FindFirstAncestor("Style");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local l_Constants_0 = v4.App.Style.Constants;
local v7 = require(l_script_FirstAncestor_0.UiModeStyleProvider);
local v8 = {
    withUiModeSupport = true, 
    withDarkTheme = true
};
return function(v9)
    local v10 = v3.Dictionary.join(v8, v9);
    local _ = nil;
    return v2.createElement(if not v9.withUiModeSupport then l_AppStyleProvider_0 else v7, {
        style = {
            themeName = if not v10.withDarkTheme then l_Constants_0.ThemeName.Light else l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham
        }
    }, v10.children);
end;
