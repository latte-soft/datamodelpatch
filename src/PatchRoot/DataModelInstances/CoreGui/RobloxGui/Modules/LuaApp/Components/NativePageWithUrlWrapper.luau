local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v6 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v7 = require(l_Modules_0.LuaApp.mapTransitionAnimationToNativeString);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local function v25(v11)
    local l_isVisible_0 = v11.isVisible;
    local l_DisplayOrder_0 = v11.DisplayOrder;
    local l_url_0 = v11.url;
    local l_title_0 = v11.title;
    local l_titleKey_0 = v11.titleKey;
    local l_transitionAnimation_0 = v11.transitionAnimation;
    local l_notificationType_0 = v11.notificationType;
    local l_onClose_0 = v11.onClose;
    local v20 = v7(l_transitionAnimation_0);
    local v21 = true;
    if l_transitionAnimation_0 ~= nil then
        v21 = true;
        if l_transitionAnimation_0 ~= v6.None then
            v21 = v20 ~= nil;
        end;
    end;
    assert(v21, string.format("Unhandled transition animation: %q", (tostring(l_transitionAnimation_0))));
    local v22 = l_transitionAnimation_0 ~= v6.None;
    v21 = function(v23)
        return v1.createElement(v5, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationData = l_HttpService_0:JSONEncode({
                url = l_url_0, 
                title = v23, 
                animated = v22, 
                transitionAnimation = v20
            }), 
            notificationType = l_notificationType_0, 
            onClose = l_onClose_0
        });
    end;
    if l_titleKey_0 ~= nil and l_title_0 == nil then
        return v8({
            title = l_titleKey_0
        })(function(v24)
            return v21(v24.title);
        end);
    else
        return v21(l_title_0);
    end;
end;
if not v10() then
    return v25;
else
    return function(v26)
        if not l_default_0.isEnabled() then
            return v1.createElement(v25, v26);
        else
            return v1.createElement(v9, {
                url = v26.url, 
                title = v26.title, 
                titleKey = v26.titleKey, 
                searchParams = v26.searchParams, 
                transitionAnimation = v26.transitionAnimation, 
                windowCloseCallback = v26.onClose, 
                overlayProps = {
                    isVisible = v26.isVisible, 
                    DisplayOrder = v26.DisplayOrder
                }
            });
        end;
    end;
end;
