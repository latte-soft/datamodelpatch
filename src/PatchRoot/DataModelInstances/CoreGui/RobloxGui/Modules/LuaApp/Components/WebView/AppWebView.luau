local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local v4 = require(script.Parent.WebView);
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEarlyIsFocused;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v9 = require(l_Modules_0.LuaApp.Services.AppWebView);
local v10 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local function _(v11, v12)
    return v11 or l_useLocalization_0({
        titleKey = v12
    }).titleKey;
end;
local function v17(v14)
    local v15 = v2.useRef(v14);
    v2.useEffect(function()
        v15.current = v14;
    end, {
        v14
    });
    v2.useEffect(function()
        return function()
            local l_current_0 = v15.current;
            if l_current_0 ~= nil then
                l_current_0();
            end;
        end;
    end, {});
end;
return function(v18)
    local v19 = l_useEarlyIsFocused_0();
    local l_goBack_0 = l_useNavigation_0().goBack;
    local v21 = v8(v9);
    local v22 = v18.title or l_useLocalization_0({
        titleKey = v18.titleKey
    }).titleKey;
    local v23 = v10(v18.transitionAnimation);
    v17(v18.windowCloseCallback);
    if not v19 then
        return nil;
    else
        return (v2.createElement(v4, l_Object_0.assign({}, v18, {
            webViewProtocol = v21, 
            title = v22, 
            transitionAnimation = v23, 
            windowCloseCallback = l_goBack_0
        })));
    end;
end;
