local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v6 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v7 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v8 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v9 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v10 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local function v20(v12)
    local l_isVisible_0 = v12.isVisible;
    local l_DisplayOrder_0 = v12.DisplayOrder;
    local l_url_0 = v12.url;
    local l_title_0 = v12.title;
    local l_transitionAnimation_0 = v12.transitionAnimation;
    local v18 = v8(l_transitionAnimation_0);
    local v19 = true;
    if l_transitionAnimation_0 ~= nil then
        v19 = true;
        if l_transitionAnimation_0 ~= v7.None then
            v19 = v18 ~= nil;
        end;
    end;
    assert(v19, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    return v1.createElement(v6, {
        isVisible = l_isVisible_0, 
        DisplayOrder = l_DisplayOrder_0, 
        notificationData = l_HttpService_0:JSONEncode({
            url = l_url_0, 
            title = l_title_0, 
            animated = l_transitionAnimation_0 ~= v7.None, 
            transitionAnimation = v18
        }), 
        notificationType = v5.OPEN_YOUTUBE_VIDEO
    });
end;
if not v11() then
    return v20;
else
    return function(v21)
        if not l_default_0.isEnabled() then
            return v1.createElement(v20, v21);
        else
            return v1.createElement(v10, {
                url = v21.url, 
                title = v21.title, 
                transitionAnimation = v21.transitionAnimation, 
                windowType = v9.Dialog, 
                overlayProps = {
                    isVisible = v21.isVisible, 
                    DisplayOrder = v21.DisplayOrder
                }
            });
        end;
    end;
end;
