local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSelectedTopics);
local v7 = {};
local function v9(v8)
    return v8.AvatarExperience.Catalog.SortAndFilters.SelectedTopics or v7;
end;
return function()
    local v10 = l_useSelector_0(v9);
    local v11 = l_useDispatch_0();
    return v10, (v3.useCallback(function(v12)
        v11(v6(v12));
    end));
end;
