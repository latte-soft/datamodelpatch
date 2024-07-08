local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_Roact_0 = v0.Roact;
local l_AppStyleProvider_0 = v0.UIBlox.App.Style.AppStyleProvider;
local v3 = {
    Default = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Light = {
        themeName = "Light", 
        fontName = "Gotham"
    }, 
    Dark = {
        themeName = "Dark", 
        fontName = "Gotham"
    }
};
return function(v4, v5)
    return l_Roact_0.createElement(l_AppStyleProvider_0, {
        style = not not v5 and v3[v5.theme] or v3.Default
    }, {
        Child = l_Roact_0.createElement(v4, v5)
    });
end;
