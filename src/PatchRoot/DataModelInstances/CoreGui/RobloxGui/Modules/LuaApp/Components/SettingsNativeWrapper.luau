local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("BrowserService");
local v4 = require(l_CorePackages_0.Logging);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactNavigation);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local v8 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v9 = require(l_Modules_0.LuaApp.Util.ExecuteJavaScriptInWebView);
local v10 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local l_GetFFlagLuaAppEnableCredentialsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppRenderSettingsAsModal);
local l_GetFIntLuaAppCredentialsProtocolTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v16 = v5.PureComponent:extend("SettingsNativeWrapper");
v16.defaultProps = {
    BrowserWrapperComponent = v10, 
    url = nil, 
    titleKey = nil, 
    isVisible = false, 
    windowClosedCallback = nil, 
    displayOrder = nil
};
local function _(v17)
    if (not (v17.moduleID == v8.Module.Navigation and v17.functionName == v8.Function.navigateToFeature) or not v17.params) or not v17.params.params then
        return nil;
    else
        return v17.params.params.feature;
    end;
end;
v16.render = function(v19)
    return v11({
        title = v19.props.titleKey
    })(function(v20)
        return v5.createElement(v19.props.BrowserWrapperComponent, {
            isVisible = v19.props.isVisible, 
            modal = not v13(), 
            title = v20.title, 
            webViewVisible = true, 
            displayOrder = v19.props.displayOrder, 
            url = v19.props.url, 
            isGenericWebview = true, 
            windowClosedCallback = v19.props.windowClosedCallback, 
            javaScriptCallback = function(v21)
                local v22 = l_HttpService_0:JSONDecode(v21);
                if l_GetFFlagLuaAppEnableCredentialsProtocol_0() and if ((v22.moduleID == v8.Module.Navigation and v22.functionName == v8.Function.navigateToFeature) and v22.params) and v22.params.params then v22.params.params.feature else nil == v8.Feature.CredentialsProtocolAvailable then
                    l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v23)
                        v9.Execute(v22.params.params.data.callId, (tostring(v23.isAvailable or false)));
                    end):catch(function()
                        v9.Execute(v22.params.params.data.callId, "false");
                    end);
                    return ;
                elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and if ((v22.moduleID == v8.Module.Navigation and v22.functionName == v8.Function.navigateToFeature) and v22.params) and v22.params.params then v22.params.params.feature else nil == v8.Feature.RegisterCredentials then
                    l_default_0:registerCredentials(l_default_0.CredentialsTypes.FIDO2, v22.params.params.data.creationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v24)
                        if v24 ~= nil then
                            v4.warn("Executing javascript on webview to return RegisterCredentialsResponse");
                            v9.Execute(v22.params.params.data.callId, (l_HttpService_0:JSONEncode(v24)));
                        end;
                    end):catch(function()
                        v9.Execute(v22.params.params.data.callId, "");
                    end);
                    return ;
                elseif l_GetFFlagLuaAppEnableCredentialsProtocol_0() and if ((v22.moduleID == v8.Module.Navigation and v22.functionName == v8.Function.navigateToFeature) and v22.params) and v22.params.params then v22.params.params.feature else nil == v8.Feature.GetCredentials then
                    l_default_0:getCredentials(l_default_0.CredentialsTypes.FIDO2, v22.params.params.data.authenticationOptionsJSON, l_GetFIntLuaAppCredentialsProtocolTimeout_0()):andThen(function(v25)
                        if v25 ~= nil then
                            v4.warn("Executing javascript on webview to return GetCredentialsResponse");
                            v9.Execute(v22.params.params.data.callId, (l_HttpService_0:JSONEncode(v25)));
                        end;
                    end):catch(function()
                        v9.Execute(v22.params.params.data.callId, "");
                    end);
                    return ;
                else
                    return ;
                end;
            end
        });
    end);
end;
return (v6.withNavigation(v16));
