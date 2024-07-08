local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v3 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
return v1(script.Name, function(v4, v5, v6)
    return {
        recommendations = {
            [v4.pageType] = v4
        }, 
        isAppend = if not v3() then v5 else nil, 
        omniResponseType = if not v3() then nil else v6
    };
end);
