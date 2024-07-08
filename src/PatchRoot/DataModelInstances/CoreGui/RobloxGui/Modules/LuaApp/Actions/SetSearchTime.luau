local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.LuaApp.ArgCheck);
return v2.makeActionCreator(script.Name, function(v4, v5)
    v3.isNonEmptyString(v4, "SetSearchTime: searchUuid");
    v3.isNonNegativeNumber(v5, "SetSearchTime: searchTime");
    return {
        searchUuid = v4, 
        searchTime = v5
    };
end);
