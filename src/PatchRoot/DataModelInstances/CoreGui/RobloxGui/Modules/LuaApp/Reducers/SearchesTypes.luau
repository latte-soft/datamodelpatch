local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
return v3.createReducer({}, {
    [require(l_Modules_0.LuaApp.Actions.SetSearchType).name] = function(v5, v6)
        return v4.Dictionary.join(v5, {
            [v6.searchUuid] = v6.searchType
        });
    end
});
