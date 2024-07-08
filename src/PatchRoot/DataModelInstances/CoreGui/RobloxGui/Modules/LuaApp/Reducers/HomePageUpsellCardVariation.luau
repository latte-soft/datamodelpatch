local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetHomePageUpsellCardVariation);
return function(v1, v2)
    v1 = v1 or {
        upsellCardType = "", 
        titleTextOverride = "", 
        bodyTextOverride = ""
    };
    if v2.type == v0.name then
        v1 = {
            upsellCardType = v2.upsellCardType, 
            titleTextOverride = v2.titleTextOverride, 
            bodyTextOverride = v2.bodyTextOverride
        };
    end;
    return v1;
end;
