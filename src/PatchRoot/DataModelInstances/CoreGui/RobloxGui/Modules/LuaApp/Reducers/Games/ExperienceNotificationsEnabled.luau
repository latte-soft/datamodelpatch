local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit);
return function(v4, v5)
    v4 = v4 or {
        count = 0, 
        limit = 0
    };
    assert(v4, "");
    if v5.type == v2.name then
        return (v1.Dictionary.join(v4, {
            count = v5.count
        }));
    else
        if v5.type == v3.name then
            v4 = v1.Dictionary.join(v4, {
                limit = v5.limit
            });
        end;
        return v4;
    end;
end;
