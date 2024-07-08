local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v7 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
return function(v8, v9)
    local v11 = l_useSelector_0(function(v10)
        return l_PerformFetch_0.GetStatus(v10, v6.GetItemDetailsKey(v8, v9));
    end);
    return (l_useSelector_0((v2.useCallback(function(v12)
        if v11 ~= v7.NotStarted then
            return v5(v12.AvatarExperience, v8, v9);
        else
            return nil;
        end;
    end, {
        v11
    }))));
end;
