local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3)
    v2.isType(v3, "table", "noticeList");
    return {
        noticeList = v3
    };
end);
