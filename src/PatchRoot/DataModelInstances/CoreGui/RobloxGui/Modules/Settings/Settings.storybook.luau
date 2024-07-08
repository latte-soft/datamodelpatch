local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
v2.init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
v1.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
local v4 = {
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
return {
    roact = v1, 
    mapStory = function(v5)
        return function(v6)
            return v1.createElement(l_AppStyleProvider_0, {
                style = not not v6 and v4[v6.theme] or v4.Default
            }, {
                Child = v1.createElement(v5, v6)
            });
        end;
    end
};
