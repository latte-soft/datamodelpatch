local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v9 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.Luobu.Constants);
local v12 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v13 = v4.PureComponent:extend("TencentHelpWrapper");
v13.validateProps = v5.strictInterface({
    guiService = v5.union(v5.Instance, v5.table), 
    linking = v5.table, 
    openId = v5.string, 
    userId = v5.string
});
v13.render = function(v14)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v16 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v16 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    if not v16 then
        v12(v14.props.linking, (string.format("%s?sign=%s&uid=%s&c1=%s", "https://www.700chat.com/xv/web/static/chat/index.html", "37ef9b97d27505cf7010cde71be4b531abd89bc57750c3c8ec20dfdeab0d5d2d38342d82206c7c73b17486525a9637055bb161", v14.props.openId, v14.props.userId)));
        return ;
    else
        v14:broadcastNotification();
        return nil;
    end;
end;
v13.broadcastNotification = function(v17)
    v17.props.guiService:BroadcastNotification(l_HttpService_0:JSONEncode({
        type = v11.TENCENT_SMART_HELP_CENTER
    }), v9.SDK_OPEN_URL);
end;
return (v7.connect(function(v18, _)
    return {
        userId = v18.LocalUserId, 
        openId = v18.Luobu.MSDKAuth.openId
    };
end)((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    linking = l_AppLinking_0
})(v13))));
