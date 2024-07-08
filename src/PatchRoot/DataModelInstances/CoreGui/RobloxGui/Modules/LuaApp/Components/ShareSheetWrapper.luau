local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v4 = require(l_Modules_0.LuaApp.Components.NativePageWrapper);
return function(v5)
    return v2.createElement(v4, {
        isVisible = v5.isVisible, 
        DisplayOrder = v5.DisplayOrder, 
        notificationData = l_HttpService_0:JSONEncode(v5.data), 
        notificationType = v3.NATIVE_SHARE
    });
end;
