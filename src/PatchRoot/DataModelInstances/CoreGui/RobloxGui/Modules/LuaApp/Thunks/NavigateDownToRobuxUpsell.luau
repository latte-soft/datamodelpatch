local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3, v4, v5, v6, v7, v8)
    return function(v9)
        v9:dispatch(v2({
            name = v1.RobuxUpsell, 
            detail = "", 
            extraProps = {
                triggerContext = v3, 
                priceInRobux = v4, 
                userRobux = v5, 
                itemName = v6, 
                itemIcon = v7, 
                purchaseItem = v8
            }
        }));
    end;
end;
