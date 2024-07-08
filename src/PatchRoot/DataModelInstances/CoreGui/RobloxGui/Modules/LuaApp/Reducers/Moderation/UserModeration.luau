local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v3 = require(l_LuaApp_0.Actions.Moderation.SetModerationStatus);
local v4 = require(l_LuaApp_0.Actions.Moderation.SetModerationDetail);
local v5 = require(l_CorePackages_0.Cryo);
return function(v6, v7)
    v6 = v6 or {};
    assert(v6, "");
    if v7.type == v3.name then
        v6 = {
            userModerated = v7.userModerated
        };
    end;
    if v7.type == v4.name then
        v6 = v5.Dictionary.join(v6, (v5.Dictionary.join(v6 or {}, {
            moderationDetail = v7.moderationDetail
        })));
    end;
    return v6;
end;
