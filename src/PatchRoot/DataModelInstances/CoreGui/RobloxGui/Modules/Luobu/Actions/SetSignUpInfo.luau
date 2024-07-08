local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3, v4, v5, v6)
    v2.isType(v3, "string", "displayName");
    v2.isType(v4, "string", "voucher");
    v2.isType(v5, "string", "authMethod");
    v2.isType(v6, "string", "channelId");
    return {
        prefilledDisplayName = v3, 
        signUpVoucher = v4, 
        authMethod = v5, 
        channelId = v6
    };
end);
