local l_default_0 = require(game:GetService("CorePackages").Workspace.Packages.WebViewProtocol).default;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
local v7 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v8 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper);
local v10 = v4.PureComponent:extend("BrowserServiceWrapper");
v10.didMount = function(v11)
    v11.connections = {
        l_BrowserService_0.BrowserWindowClosed:Connect(function()
            if v11.props.windowClosedCallback then
                v11.props.windowClosedCallback();
            end;
        end), 
        l_BrowserService_0.JavaScriptCallback:Connect(function(v12)
            if v11.props.javaScriptCallback then
                v11.props.javaScriptCallback(v12);
            end;
        end)
    };
    l_BrowserService_0:SendCommand((l_HttpService_0:JSONEncode({
        command = "open", 
        url = v11.props.url, 
        title = v11.props.title, 
        visible = v11.props.webViewVisible, 
        modal = v11.props.modal, 
        isGenericWebview = v11.props.isGenericWebview, 
        enableOverlayReplacement = v11.props.enableOverlayReplacement
    })));
end;
v10.didUpdate = function(v13, v14, _)
    if v14.webViewVisible ~= v13.props.webViewVisible then
        local v16 = {
            command = "config", 
            visible = v13.props.webViewVisible == true
        };
        if v13.props.ignoreBackNavigationDisabled ~= true then
            v16.backNavigationDisabled = v13.props.backNavigationDisableCounter > 0;
        end;
        l_BrowserService_0:SendCommand(l_HttpService_0:JSONEncode(v16));
    end;
end;
v10.willUnmount = function(v17)
    for _, v19 in ipairs(v17.connections) do
        v19:Disconnect();
    end;
    l_BrowserService_0:CloseBrowserWindow();
end;
v10.render = function(v20)
    return v4.createElement(v6, {
        isVisible = v20.props.isVisible, 
        displayOrder = v20.props.displayOrder, 
        backNavigationHandledByParent = v20.props.backNavigationHandledByParent
    });
end;
v10 = v5.connect(function(v21, _)
    return {
        backNavigationDisableCounter = v21.Navigation.backNavigationDisableCounter
    };
end)(v10);
if not v9() then
    return v10;
else
    return function(v23)
        if not l_default_0.isEnabled() then
            return v4.createElement(v10, v23);
        else
            return v4.createElement(v7, {
                url = v23.url, 
                title = v23.title, 
                isVisible = v23.webViewVisible, 
                windowType = if not v23.modal then v8.Default else v8.Dialog, 
                windowCloseCallback = v23.windowClosedCallback, 
                javaScriptCallback = v23.javaScriptCallback, 
                overlayProps = {
                    isVisible = v23.isVisible, 
                    DisplayOrder = v23.displayOrder
                }
            });
        end;
    end;
end;
