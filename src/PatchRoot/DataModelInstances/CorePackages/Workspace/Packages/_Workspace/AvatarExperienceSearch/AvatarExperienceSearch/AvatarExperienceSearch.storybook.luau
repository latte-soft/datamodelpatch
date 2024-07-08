local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(l_Parent_0.UIBlox);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.AppLocales).Localization;
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_Parent_0.Rodux);
v4.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_AppStyleProvider_0 = v4.App.Style.AppStyleProvider;
local function v11()
    return v9.Store.new(v9.createReducer({}, {}), nil, {
        v9.makeThunkMiddleware({})
    });
end;
local v12 = {
    Default = {
        themeName = "Dark", 
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
    name = "AvatarExperienceSearch", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    reactRoblox = v3, 
    mapStory = function(v13)
        return function(v14)
            return v2.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new("en-us")
            }, {
                AppStyleProvider = v2.createElement(l_AppStyleProvider_0, {
                    style = not not v14 and v12[v14.theme] or v12.Default
                }, {
                    StoreProvider = v2.createElement(v8.StoreProvider, {
                        store = v11()
                    }, {
                        DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, {
                            Child = v2.createElement(v13, v14)
                        })
                    })
                })
            });
        end;
    end
};
