local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v5 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v9 = v3.PureComponent:extend("NativeViewProfileWrapper");
v9.render = function(v10)
    local l_isVisible_0 = v10.props.isVisible;
    local l_DisplayOrder_0 = v10.props.DisplayOrder;
    local l_url_0 = v10.props.url;
    local l_onClose_0 = v10.props.onClose;
    local function v16(v15)
        if not game:GetEngineFeature("SetWebViewTitle") then
            return v3.createElement(v4, {
                titleText = v15.titleText, 
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0, 
                notificationData = l_url_0, 
                notificationType = v5.VIEW_PROFILE, 
                onClose = l_onClose_0
            });
        else
            return v3.createElement(v4, {
                titleText = v15.titleText, 
                isVisible = l_isVisible_0, 
                DisplayOrder = l_DisplayOrder_0, 
                url = l_url_0, 
                notificationType = v5.VIEW_PROFILE, 
                onClose = l_onClose_0
            });
        end;
    end;
    return v6({
        titleText = "CommonUI.Features.Label.Profile"
    })(function(v17)
        return v16(v17);
    end);
end;
if not v8() then
    return v9;
else
    return function(v18)
        if not l_default_0.isEnabled() then
            return v3.createElement(v9, v18);
        else
            return v3.createElement(v7, {
                url = v18.url, 
                titleKey = "CommonUI.Features.Label.Profile", 
                windowCloseCallback = v18.onClose, 
                overlayProps = {
                    isVisible = v18.isVisible, 
                    DisplayOrder = v18.DisplayOrder
                }
            });
        end;
    end;
end;
