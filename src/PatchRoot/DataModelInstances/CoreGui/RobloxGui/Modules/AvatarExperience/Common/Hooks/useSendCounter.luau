local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function()
    local v4 = v1(v2);
    return function(v5)
        v4.sendCounter(v3.Counter.PREFIX .. v5);
    end;
end;
