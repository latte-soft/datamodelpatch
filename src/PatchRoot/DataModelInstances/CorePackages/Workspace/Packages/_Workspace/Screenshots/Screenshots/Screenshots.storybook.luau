local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Dash);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.Dev.SocialTestHelpers);
local v5 = require(l_Parent_1.UIBlox);
local v6 = require(l_Parent_1.Dev.RobloxAppUIBloxConfig);
local v7 = require(l_Parent_0.Context.ShotsContext);
local l_mockLocale_0 = v4.StoryHelpers.mockLocale;
v5.init(v6);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
v3.setGlobalConfig({
    elementTracing = true
});
local v10 = {
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
local v11 = {
    language = "en-us"
};
return {
    name = "Screenshots", 
    storyRoot = l_Parent_0, 
    roact = v3, 
    mapDefinition = function(v12)
        return v2.join(v12, {
            controls = v2.join(v11, v12.controls)
        });
    end, 
    mapStory = function(v13)
        return function(v14)
            return v3.createElement(v7.Provider, {
                value = {
                    fireAnalyticsEvent = v2.noop
                }
            }, {
                Element = v3.createElement(l_AppStyleProvider_0, {
                    style = not not v14 and v10[v14.theme] or v10.Default
                }, {
                    Child = l_mockLocale_0(v13, v14)
                })
            });
        end;
    end
};
