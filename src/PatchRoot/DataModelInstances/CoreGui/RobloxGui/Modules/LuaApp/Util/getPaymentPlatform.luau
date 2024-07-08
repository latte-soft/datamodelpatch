local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Modules_0.LuaApp.Util.getHasAmazonUserAgent);
local v3 = require(l_Modules_0.LuaApp.Util.getHasQuestUserAgent);
local v4 = require(l_Modules_0.LuaApp.Util.getPaymentFromPlatform);
return function()
    return v4(l_UserInputService_0:GetPlatform(), v2(), (v3()));
end;
