local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v5 = require(l_Modules_0.LuaApp.Components.NativeHandshakeWrapper);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
return require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(v7, _)
    return {
        shareTimeout = v7.getShareToAccountProviderTimeout()
    };
end)(function(v9)
    return v6({
        title = "Feature.SocialShare.Action.Redirect", 
        errorMessage = "Feature.SocialShare.Response.Error", 
        errorSubMessage = "Feature.SocialShare.Response.Error.Subtext"
    })(function(v10)
        return v3.createElement(v5, {
            isVisible = v9.isVisible, 
            DisplayOrder = v9.displayOrder, 
            notificationData = l_HttpService_0:JSONEncode(v9.data), 
            notificationType = v4.SDK_SHARE, 
            title = v10.title, 
            errorMessage = v10.errorMessage, 
            errorSubMessage = v10.errorSubMessage, 
            responseType = "SDKShare", 
            dispatchTimeout = v9.shareTimeout
        });
    end);
end);
