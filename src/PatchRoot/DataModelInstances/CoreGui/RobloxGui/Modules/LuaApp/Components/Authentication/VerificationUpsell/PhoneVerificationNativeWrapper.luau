local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local _ = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactNavigation);
local v7 = require(l_Modules_0.LuaApp.Enum.JavascriptHybrid);
local v8 = require(l_Modules_0.LuaApp.Components.BrowserServiceWrapper);
local l_GetFFlagPhoneVerificationWebviewShouldBeFullscreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagPhoneVerificationWebviewShouldBeFullscreen;
local v10 = v5.PureComponent:extend("PhoneVerificationNativeWrapper");
v10.defaultProps = {
    BrowserWrapperComponent = v8, 
    closeCallback = nil
};
local function _(v11)
    if (not (v11.moduleID == v7.Module.Navigation and v11.functionName == v7.Function.navigateToFeature) or not v11.params) or not v11.params.params then
        return nil;
    else
        return v11.params.params.feature;
    end;
end;
local function _(v13)
    return if ((v13.moduleID == v7.Module.Navigation and v13.functionName == v7.Function.navigateToFeature) and v13.params) and v13.params.params then v13.params.params.feature else nil == v7.Feature.CloseContactMethodUpsellWebview;
end;
local function _(v15)
    return if ((v15.moduleID == v7.Module.Navigation and v15.functionName == v7.Function.navigateToFeature) and v15.params) and v15.params.params then v15.params.params.feature else nil == v7.Feature.CompletedContactMethodUpsellWebview;
end;
v10.init = function(v17)
    v17.isPhoneVerificationSuccessful = false;
end;
v10.render = function(v18)
    return v5.createElement(v18.props.BrowserWrapperComponent, {
        isVisible = true, 
        modal = not l_GetFFlagPhoneVerificationWebviewShouldBeFullscreen_0(), 
        webViewVisible = true, 
        displayOrder = v18.props.displayOrder, 
        url = v3.BASE_URL .. "phone-verification", 
        isGenericWebview = true, 
        javaScriptCallback = function(v19)
            local v20 = l_HttpService_0:JSONDecode(v19);
            if not (if ((v20.moduleID == v7.Module.Navigation and v20.functionName == v7.Function.navigateToFeature) and v20.params) and v20.params.params then v20.params.params.feature else nil == v7.Feature.CompletedContactMethodUpsellWebview) then
                if if ((v20.moduleID == v7.Module.Navigation and v20.functionName == v7.Function.navigateToFeature) and v20.params) and v20.params.params then v20.params.params.feature else nil == v7.Feature.CloseContactMethodUpsellWebview then
                    v18.props.navigation.goBack();
                end;
            else
                v18.isPhoneVerificationSuccessful = true;
                if v18.props.onSuccessCallback then
                    v18.props.onSuccessCallback();
                    return ;
                end;
            end;
        end
    });
end;
v10.willUnmount = function(v21)
    if v21.props.closeCallback then
        v21.props.closeCallback(v21.isPhoneVerificationSuccessful);
    end;
end;
return (v6.withNavigation(v10));
