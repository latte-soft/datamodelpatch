local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.RoactCompat);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local v5 = require(l_Parent_0.UIBlox);
v5.init(v4);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
v2.setGlobalConfig({
    elementTracing = true
});
local v7 = {
    themeName = "Light", 
    fontName = "Gotham"
};
local v8 = {
    themeName = "Dark", 
    fontName = "Gotham"
};
local v9 = {
    Default = v8, 
    Light = v7, 
    Dark = v8
};
return {
    name = "TenFootUIGlobalNav", 
    storyRoots = {
        l_script_FirstAncestor_0.Stories
    }, 
    roact = v2, 
    mapStory = function(v10)
        return function(v11)
            return v3.createElement(l_AppStyleProvider_0, {
                style = not not v11 and v9[v11.theme] or v9.Default
            }, {
                Child = v3.createElement(v10, v11)
            });
        end;
    end
};
