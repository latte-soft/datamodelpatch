local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetIAPProducts);
return function(v1, v2)
    v1 = v1 or {
        Robux = {}, 
        PremiumRobux = {}, 
        Subscriptions = {}
    };
    assert(v1, "");
    if v2.type == v0.name then
        return {
            Robux = v2.robux, 
            PremiumRobux = v2.premiumRobux, 
            Subscriptions = v2.subscriptions
        };
    else
        return v1;
    end;
end;
