local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppHeaderBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dev.RoactCompat);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
local v5 = require(l_Parent_0.UIBlox);
v5.init(v4);
local l_AppStyleProvider_0 = v5.App.Style.AppStyleProvider;
local l_Constants_0 = v5.App.Style.Constants;
local l_Light_0 = l_Constants_0.ThemeName.Light;
local l_Dark_0 = l_Constants_0.ThemeName.Dark;
local l_Gotham_0 = l_Constants_0.FontName.Gotham;
v2.setGlobalConfig({
    elementTracing = true
});
local v11 = {
    Default = {
        themeName = l_Light_0, 
        fontName = l_Gotham_0
    }, 
    Light = {
        themeName = l_Light_0, 
        fontName = l_Gotham_0
    }, 
    Dark = {
        themeName = l_Dark_0, 
        fontName = l_Gotham_0
    }
};
local v12 = {
    Console = l_Constants_0.DeviceType.Console, 
    Desktop = l_Constants_0.DeviceType.Desktop
};
return {
    name = "AppHeaderBar", 
    storyRoots = {
        l_script_FirstAncestor_0.Stories
    }, 
    roact = v2, 
    mapStory = function(v13)
        return function(v14)
            local v15 = v11[v14.theme];
            return v3.createElement(l_AppStyleProvider_0, {
                style = {
                    themeName = v15.themeName, 
                    fontName = v15.fontName, 
                    deviceType = v12[v14.platform], 
                    settings = v14.settings
                }
            }, {
                Child = v3.createElement(v13, v14)
            });
        end;
    end
};
