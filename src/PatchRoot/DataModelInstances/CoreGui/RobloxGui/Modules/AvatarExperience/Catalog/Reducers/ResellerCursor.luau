local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
return v3.createReducer({
    nextPageCursor = nil, 
    hasMoreRows = nil
}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor).name] = function(v5, v6)
        return v4.Dictionary.join(v5, {
            nextPageCursor = v6.cursor, 
            hasMoreRows = v6.cursor ~= nil
        });
    end
});
