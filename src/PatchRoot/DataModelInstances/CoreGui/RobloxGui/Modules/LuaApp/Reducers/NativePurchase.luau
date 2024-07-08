local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
local v2 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
return function(v3, v4)
    local v5 = if v3 ~= nil then v3 else {};
    if v4.type == v1.name then
        return {
            nativeProductId = v4.nativeProductId, 
            purchaseStatus = v4.purchaseStatus
        };
    elseif v4.type == v2.name then
        return {};
    else
        return v5;
    end;
end;
