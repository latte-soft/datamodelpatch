local l_script_FirstAncestor_0 = script:FindFirstAncestor("MessageToast");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local l_UIBlox_0 = v2.UIBlox;
l_UIBlox_0.init(v3);
local l_Roact_0 = v2.Roact;
local l_Dash_0 = v2.Dash;
local l_AppStyleProvider_0 = l_UIBlox_0.App.Style.AppStyleProvider;
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
l_Roact_0.setGlobalConfig({
    propValidation = true, 
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
    name = "MessageToast", 
    storyRoot = script, 
    roact = l_Roact_0, 
    mapDefinition = function(v11)
        return l_Dash_0.join(v11, {
            controls = l_Dash_0.join(v10, v11.controls or {})
        });
    end, 
    mapStory = function(v12)
        return function(v13)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = not not v13 and v9[v13.theme] or v9.Default
            }, {
                Child = l_mockLocale_0(v12, v13)
            });
        end;
    end
};
