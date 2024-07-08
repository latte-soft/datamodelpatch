local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetCurrentOmniSearchType);
local v2 = require(l_Modules_0.LuaApp.Constants);
return function(v3, v4)
    v3 = v3 or v2.SearchTypes.Games;
    if v4.type == v1.name then
        v3 = v4.searchType;
    end;
    return v3;
end;
