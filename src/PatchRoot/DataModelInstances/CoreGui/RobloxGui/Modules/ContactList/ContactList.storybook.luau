local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
v3.init(require(l_CorePackages_0.Workspace.Packages.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
v1.setGlobalConfig({
    elementTracing = true, 
    propValidation = true
});
local v9 = {
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
local v10 = {
    language = "en-us"
};
local v11 = l_Localization_0.new("en-us");
local function v13(v12)
    return v2.Store.new(function()
        return v12;
    end, {}, {
        v2.thunkMiddleware
    });
end;
return {
    roact = v1, 
    mapDefinition = function(v14)
        return v4.join(v14, {
            controls = v4.join(v10, v14.controls or {})
        });
    end, 
    mapStory = function(v15)
        return function(v16)
            v11:SetLocale(v16.controls.language);
            return v1.createElement(v5.StoreProvider, {
                store = v13(v16.definition.state or {})
            }, {
                v1.createElement(l_AppStyleProvider_0, {
                    style = not not v16 and v9[v16.theme] or v9.Default
                }, {
                    v1.createElement(l_LocalizationProvider_0, {
                        localization = v11
                    }, {
                        Child = v1.createElement(v15, v16)
                    })
                })
            });
        end;
    end
};
