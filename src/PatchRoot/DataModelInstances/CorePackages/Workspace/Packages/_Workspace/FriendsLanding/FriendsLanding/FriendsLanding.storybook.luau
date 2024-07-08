local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.Logger);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_AppStyleProvider_0 = v2.UIBlox.App.Style.AppStyleProvider;
local l_Roact_0 = v2.Roact;
local l_UniversalAppPolicy_0 = v2.UniversalAppPolicy;
local l_llama_0 = v2.llama;
local l_mockLocale_0 = require(l_script_FirstAncestor_0.Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale;
local v8 = v2.Lumberyak.Logger.new();
v8:addSink({
    maxLevel = v8.Levels.fromString("info"), 
    log = function(_, v10, _)
        print(v10);
    end
});
v1:setParent(v8);
local v12 = {
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
local v13 = {
    language = "en-us"
};
return {
    mapDefinition = function(v14)
        return l_llama_0.Dictionary.join(v14, {
            controls = l_llama_0.Dictionary.join(v13, v14.controls or {})
        });
    end, 
    roact = l_Roact_0, 
    mapStory = function(v15)
        return function(v16)
            return l_Roact_0.createElement(l_AppStyleProvider_0, {
                style = not not v16 and v12[v16.theme] or v12.Default
            }, {
                l_Roact_0.createElement(l_UniversalAppPolicy_0.Provider, {
                    policy = {
                        function()
                            return {
                                getShowDisplayName = function()
                                    return v16.controls.getShowDisplayName;
                                end
                            };
                        end
                    }
                }, {
                    Child = l_mockLocale_0(v15, v16)
                })
            });
        end;
    end
};
