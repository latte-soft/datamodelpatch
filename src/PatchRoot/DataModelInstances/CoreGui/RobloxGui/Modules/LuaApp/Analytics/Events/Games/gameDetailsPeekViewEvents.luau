local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck);
return function(v3, v4, v5, v6, v7)
    v2.isType(v4, "string", "eventName");
    v2.isType(v5, "string", "universeId");
    v2.isType(v6, "string", "source");
    v2.isType(v7, "number", "index");
    if l_Players_0.LocalPlayer then
        v3:setRBXEventStream("GameDetailsPeekView", v4, {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            universeId = v5, 
            source = v6, 
            index = v7
        });
    end;
end;
