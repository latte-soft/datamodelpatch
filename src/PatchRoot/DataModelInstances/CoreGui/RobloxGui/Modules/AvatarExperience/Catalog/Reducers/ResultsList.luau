local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_CorePackages_0.Cryo);
return v3.createReducer({}, {
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget).name] = function(v5, v6)
        return v4.Dictionary.join(v5, {
            [v6.searchUuid] = {
                focusedWidget = {
                    id = v6.id, 
                    active = true, 
                    title = v6.title or "", 
                    description = v6.description or ""
                }, 
                hideTopBar = true
            }
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget).name] = function(v7, v8)
        return v4.Dictionary.join(v7, {
            [v8.searchUuid] = {}
        });
    end, 
    [require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets).name] = function(_, _)
        return {};
    end
});
