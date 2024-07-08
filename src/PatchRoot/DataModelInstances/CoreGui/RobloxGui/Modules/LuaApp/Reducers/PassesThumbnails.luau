local v0 = require(game:GetService("CorePackages").Cryo);
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetPassesThumbnails);
return function(v2, v3)
    local v4 = v2 or {};
    if v3.type == v1.name then
        v4 = v0.Dictionary.join(v4, v3.passesThumbnails);
    end;
    return v4;
end;
