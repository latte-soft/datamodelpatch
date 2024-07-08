local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Actions.FetchingUser);
local v4 = require(l_Modules_0.LuaApp.Actions.AddUser);
return function(v5, v6)
    v5 = v5 or {};
    assert(v5, "");
    if v6.type == v3.name then
        return (v1.Set(v5, v6.userId, v6.status));
    else
        if v6.type == v4.name then
            v5 = v1.Set(v5, v6.user.id, v2.Done);
        end;
        return v5;
    end;
end;
