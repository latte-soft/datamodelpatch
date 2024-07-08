local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.Games.AddGameSorts);
local _ = require(l_Modules_0.LuaApp.Models.GameSort);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v2.name then
        local v6 = {};
        for _, v8 in pairs(v5.sorts) do
            v6[v8.name] = v8;
        end;
        v4 = v1.JoinDictionaries(v4, v6);
    end;
    return v4;
end;
