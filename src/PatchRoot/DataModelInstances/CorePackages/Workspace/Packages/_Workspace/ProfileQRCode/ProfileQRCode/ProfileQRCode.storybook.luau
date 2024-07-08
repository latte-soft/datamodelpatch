local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Dash);
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v6 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local v7 = require(l_script_FirstAncestor_0.Analytics);
v3.init(v6);
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
v2.setGlobalConfig({
    elementTracing = true
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
return {
    name = "ProfileQRCode", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v2, 
    mapDefinition = function(v11)
        return v4.join(v11, {
            controls = v4.join(v10, v11.controls)
        });
    end, 
    mapStory = function(v12)
        return function(v13)
            return v2.createElement(v7.Context.Provider, {
                value = {
                    fireEvent = function()
                    end
                }
            }, {
                Element = v2.createElement(l_AppStyleProvider_0, {
                    style = not not v13 and v9[v13.theme] or v9.Default
                }, {
                    Child = l_mockLocale_0(v12, v13)
                })
            });
        end;
    end
};
