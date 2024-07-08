local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Dev.Roact);
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
local v7 = {
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
local v8 = {
    language = "en-us"
};
return {
    name = "FriendsMenu", 
    storyRoot = l_script_FirstAncestor_0, 
    roact = v5, 
    mapDefinition = function(v9)
        return v4.Dictionary.join(v9, {
            controls = v4.Dictionary.join(v8, v9.controls or {})
        });
    end, 
    mapStory = function(v10)
        return function(v11)
            return v5.createElement(l_AppStyleProvider_0, {
                style = not not v11 and v7[v11.theme] or v7.Default
            }, {
                Child = l_mockLocale_0(v10, v11)
            });
        end;
    end
};
