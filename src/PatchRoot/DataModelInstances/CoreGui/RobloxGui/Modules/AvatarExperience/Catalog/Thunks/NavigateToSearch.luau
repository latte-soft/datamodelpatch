local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v5 = require(l_Modules_0.LuaApp.SearchUuid);
local v6 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v11, v12)
    return function(v13)
        local v14 = v5();
        v13:dispatch(v6(v14, v7.SearchTypes.Catalog));
        local v15 = v2.join(v12 or {}, {
            sortAndFilters = v3.selectSortAndFilters(v13:getState())
        });
        v13:dispatch(v8(v14, v15));
        v9.navigateToSearch(v11, v14, v15);
    end;
end;
