local l_script_FirstAncestor_0 = script:FindFirstAncestor("InviteLinkExpiredModal");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
v2.init(require(l_Parent_0.Dev.RobloxAppUIBloxConfig));
local l_mockLocale_0 = require(l_Parent_0.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v4.Roact;
local l_llama_0 = v4.llama;
local l_AppStyleProvider_0 = v2.App.Style.AppStyleProvider;
l_Roact_0.setGlobalConfig({
    propValidation = true, 
    elementTracing = true
});
local v8 = {
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
local v9 = {
    language = "en-us"
};
return {
    name = "InviteLinkExpiredModal", 
    storyRoot = script, 
    roact = l_Roact_0, 
    mapDefinition = function(v10)
        return l_llama_0.Dictionary.join(v10, {
            controls = l_llama_0.Dictionary.join(v9, v10.controls or {})
        });
    end, 
    mapStory = function(v11)
        return function(v12)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = not not v12 and v8[v12.theme] or v8.Default
            }, {
                Child = l_mockLocale_0(v11, v12)
            });
        end;
    end
};
