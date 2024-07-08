local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v3 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v4 = require(l_Modules_0.LuaApp.PurchaseErrorLocalizationKeys);
return function(v5)
    return function(v6)
        v6:dispatch(v2({
            toastType = v1.PurchaseMessage, 
            toastMessage = v4[v3(v5)]
        }));
    end;
end;
