local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
return require(l_Modules_0.Common.Action)(script.Name, function(v2, v3, v4)
    v1.isType(v2, "table", "SetIAPProducts: robuxProducts");
    v1.isType(v3, "table", "SetIAPProducts: robuxPremiumProducts");
    v1.isType(v4, "table", "SetIAPProducts: subscriptionProducts");
    return {
        robux = v2, 
        premiumRobux = v3, 
        subscriptions = v4
    };
end);
