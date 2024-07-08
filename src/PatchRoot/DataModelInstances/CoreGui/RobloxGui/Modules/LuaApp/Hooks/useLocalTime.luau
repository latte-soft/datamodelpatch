local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
return function(v3, v4)
    local v5 = v1(v2);
    if v3 then
        local v6 = DateTime.fromIsoDate(v3);
        if v6 then
            return v6:FormatLocalTime(v4 or "l", (v5:GetLocale()));
        end;
    end;
    return nil;
end;
